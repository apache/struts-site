---
layout: default
title: Client Side Validation
parent:
  title: Validation
  url: validation
---

# Client Side Validation
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Basics

Since Struts 7.4.0, the [html5 theme](../tag-developers/html5-theme) can derive HTML5 constraint-validation
attributes (`required`, `minlength`, `maxlength`, `pattern`, `min`, `max`) directly from a field's
server-side [validators](validation), so the browser rejects obviously-invalid input before the form is
even submitted. This replaces the older, generated-JavaScript validator used by the _xhtml theme_ and
_css_xhtml theme_, which is now deprecated — see [Pure JavaScript Client Side Validation
(deprecated)](#pure-javascript-client-side-validation-deprecated) below.

There is also [AJAX Client Side Validation](ajax-client-side-validation), which runs the full server-side
validation stack (including visitor validators and `validate()`) over AJAX and is unaffected by any of this.

## HTML5 Constraint Validation

### Enabling it

HTML5 constraint validation is off by default. Turn it on with the `struts.ui.html5.constraints` constant:

```properties
struts.ui.html5.constraints=true
```

It only has an effect on fields rendered with the `html5` theme (see [Using the HTML5
theme](../tag-developers/html5-theme#using-the-html5-theme)). There is no per-form opt-in attribute —
unlike the deprecated JavaScript validator, this feature does not use `<s:form validate="true">`. Once the
constant is on and a field's theme is `html5`, its validators are consulted automatically.

> The constant defaults to `false` so existing `html5`-theme forms keep rendering unchanged. The default is
> expected to flip to `true` in a future major release, tracked by
> [WW-5696](https://issues.apache.org/jira/browse/WW-5696).

### The governing rule: never false-reject

The mapping is deliberately conservative. A constraint is emitted only when the browser cannot reject
input the server would have accepted. If the browser rejected something the server allows, the user would
be stuck with a form that will not submit and no explanation why. Being conservative simply costs a field
its client-side check — that's a harmless, quiet failure mode, so the mapping always chooses it over the
alternative.

The clearest consequence of this rule: **Struts never sets or changes an input's `type`.** A field stays
whatever `type` the developer gave it. In particular:

- Switching a field to `type="number"` would reject a value like `1234,50`, which the framework's
  locale-aware numeric conversion happily accepts in a comma-decimal locale.
- The browsers' `email` and `url` input grammars don't match `EmailValidator` and `UrlValidator`.

So `min`/`max` range constraints are only ever added to a control the developer *already* made numeric
(`type="number"` or `type="range"`) — Struts will never promote a plain text field into one just because
an `int` or `double` validator is attached to it.

### Mapping table

| Validator | Emits | Condition |
|---|---|---|
| `requiredstring` | `required` | on text-entry controls (`text`, `search`, `tel`, `password`, `email`, `url`) and `textarea` |
| `required` | `required` | only on `radio` and `file` |
| `stringlength` | `minlength` / `maxlength` | on text-entry or `textarea`, and only if the validator has `trim="false"`; each attribute is added only if actually configured |
| `regex` | `pattern` | on text-entry controls only, and only if `caseSensitive="true"`, `trim="false"`, the regex is ECMAScript-safe (see below), and the validator is not an `email` or `creditcard` validator (both extend `RegexFieldValidator` but carry grammars the browser does not share) |
| `int`, `short`, `long` | `min` / `max` | only when the control is already `type="number"` or `type="range"` |
| `double` | `min` / `max` | same as above; only inclusive bounds are emitted — exclusive bounds have no HTML equivalent and are omitted |
| `date` | — | nothing yet; temporal `min`/`max` is deferred to a future release |
| `email`, `url`, `creditcard` | — | never emitted |
| `fieldexpression`, `expression`, `conversion`, visitor validators | — | never emitted |
| any validator carrying a message | `data-msg-<validatorType>` | always added, including for validators that emit no constraint attribute at all |

Two of these conditions are easy to miss and sharply limit how often `required`, `minlength`/`maxlength`,
and `pattern` actually show up:

**`required` is split across two validators, and they don't behave alike.** `requiredstring` fails on
null, empty, and (by default) blank values, so it is strictly stricter than the browser's `required` — safe
to emit on any text-entry control. Plain `required`, however, only fails on a null value, an empty array,
or an empty collection. That means an empty text input (which submits `""`, not nothing), a `select` with
an empty-valued option, and an **unticked checkbox** (`CheckboxInterceptor` substitutes the parameter
`"false"` for it) all pass server-side validation while a browser `required` attribute would block them.
Only `radio` and `file` controls omit their parameter entirely when left empty, so those are the only two
control types where plain `required` agrees with the server — which is why the table above emits `required`
for the `required` validator on those two types alone.

**Both `minlength`/`maxlength` and `pattern` need `trim="false"`, which is not the default.** Both
`StringLengthFieldValidator.trim` and `RegexFieldValidator.trim` default to `true`, so the server measures
or matches the field's *trimmed* value while the HTML attribute constrains the *raw* one. A `stringlength`
validator with `maxLength="4"` accepts `"abcd "` — it trims to four characters, which is within the limit —
but a browser enforcing `maxlength="4"` would stop the user typing the fifth character at all. Likewise, a
`regex` of `[a-z]+` accepts `"abc "` server-side (it trims to `"abc"` first) while the browser, matching the
raw value, blocks it. Because of this, `minlength`/`maxlength` and `pattern` are only ever emitted
for validators explicitly configured with `trim="false"` — which most existing `stringlength` and `regex`
validators are not. In practice, expect both to show up rarely until applications start setting
`trim="false"` deliberately for fields where it's safe.

**ECMAScript-safe** means the regex uses only constructs that mean the same thing in Java's regex engine
and in the browser's: literals, `\d`/`\w` and their negations, character classes without POSIX or Unicode
property syntax, grouping, alternation, anchors, and bounded quantifiers. Notably, **`\s` and `\S` are
excluded** — Java's `\s` is ASCII-only by default while ECMAScript's `\s` covers the wider Unicode
whitespace set, so a pattern like `^\S+$` would accept a value containing a non-breaking space server-side
and reject it in the browser. Any regex using a construct outside this allowlist simply gets no `pattern`
attribute at all — it is never rejected loudly, it just quietly doesn't get a client-side check.

### `data-msg-*` attributes

Every validator carrying a message — even one that emits no HTML constraint attribute at all — adds a
`data-msg-<validatorType>` attribute (for example `data-msg-email`, `data-msg-regex`) holding the
validator's fully resolved, internationalized message. **Struts ships no JavaScript that reads these.**
They exist purely as a hook: an application can write its own script to read `data-msg-*` and show
whichever messages it wants, in whatever way it wants, including for validators (like `email` or
`creditcard`) that never get a native browser check.

### `requiredLabel` is unrelated to the `required` attribute

This is a common point of confusion: the `requiredLabel` tag attribute only controls whether a visual
marker (usually `*`) is drawn next to a field's label. It has no connection to the HTML `required`
attribute described above, and setting `requiredLabel="true"` does not make a field required in the
browser — the two are decided completely independently.

### Extension point: `HtmlConstraintProvider`

The mapping above is implemented by `StrutsHtmlConstraintProvider`, the default implementation of the
`HtmlConstraintProvider` interface, registered under the `struts.htmlConstraintProvider` constant:

```properties
struts.htmlConstraintProvider=struts
```

An application that wants a less conservative mapping — for example, treating an `email` validator as
`type="email"`, or emitting `pattern` for case-insensitive regexes by rewriting them — can register its own
`HtmlConstraintProvider` implementation under this constant instead of the default. This is the escape
hatch for every limitation described above: the framework's own mapping stays deliberately conservative,
but nothing stops an application from replacing it with one that fits its own validators and locales.

## Pure JavaScript Client Side Validation (deprecated)

> **Deprecated since Struts 7.4.0 ([WW-5694](https://issues.apache.org/jira/browse/WW-5694)), removed in
> Struts 8.0.0 ([WW-5696](https://issues.apache.org/jira/browse/WW-5696)).** New applications should use
> the [html5 theme's constraint validation](#html5-constraint-validation) described above instead.

The `<s:form validate="true">` attribute enables an older client-side validation mechanism, used by the
_xhtml theme_ and _css_xhtml theme_. It uses 100% client-side JavaScript, generated from the same
validation configuration used server-side, to try to reject bad input before the form is submitted:

```jsp
<s:form name="test" action="javascriptValidation" validate="true">
  ...
</s:form>
```

If a `name` for the form is not given, the action mapping name is used as the form name. Otherwise, a
correct `action` and `namespace` attribute must be provided to the `<s:form>` tag — client-side validation
requires the action name and namespace to be resolvable separately, so a form whose `action` is given as a
full URI (for example `<s:form action="/user/submitProfile.action" validate="true">`) will not get
client-side validation, even though the form still works.

Because the validation logic is repeated in generated JavaScript, only a subset of validators is
supported (`required`, `requiredstring`, `stringlength`, `regex`, `email`, `url`, `int`, `double`), it is
not available for visitor validators at all, and — being a separate implementation of each validator's
logic — some values the JavaScript accepts may still be rejected server-side, or vice versa. This is one of
the reasons it is being replaced: the html5 theme's constraint validation above is derived directly from
the real validators, rather than reimplementing them in JavaScript.

## Example

See [Client Validation example](client-validation-example) for a complete, though now-deprecated, example
of the JavaScript-based client-side validation described above.
