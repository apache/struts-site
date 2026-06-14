# Struts 7.2.0 Content Audit Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Document the 7.2.0 `@StrutsParameter` authorization expansion (chaining, cookies, JSON/REST) and the new JSON deserialization limits on the Struts website.

**Architecture:** Pure content edits to five existing Markdown pages under `source/`. `struts-parameter-annotation.md` becomes the hub for the authorization story; the interceptor/plugin pages each gain a focused section and cross-link back to it. No `_config.yml`, `announce-*`, or `releases.md` changes (announcement is out of scope).

**Tech Stack:** Jekyll 4.2, Kramdown Markdown. Verification by `grep` plus a final `jekyll build`.

**Source of truth (verified against the `STRUTS_7_2_0` tag):**
- `struts.chaining.requireAnnotations=false` (`core/.../default.properties`)
- `struts.json.maxElements=10000`, `maxDepth=64`, `maxLength=2097152`, `maxStringLength=262144`, `maxKeyLength=512`, `writer=struts`, `reader=struts` (`plugins/json/.../struts-plugin.xml`)

**Conventions:** All commands run from repo root `/Users/lukaszlenart/Projects/Apache/struts-site`. Commit messages use the `docs:` type and end with the `Co-Authored-By` trailer per repo convention.

---

### Task 1: Chaining Interceptor — opt-in `@StrutsParameter` enforcement (WW-5631)

**Files:**
- Modify: `source/core-developers/chaining-interceptor.md` (insert between the copy-constants `### Example` block and `## Parameters`)

- [ ] **Step 1: Add the Parameter Authorization section**

Use Edit. `old_string`:

```
<constant name="struts.xwork.chaining.copyErrors" value="true"/>
```

(the existing one-line code block, then the `## Parameters` heading follows). Insert a new section immediately before `## Parameters`. Replace this anchor:

```
```

## Parameters
```

with:

````
```

## Parameter Authorization

By default the Chaining Interceptor copies **all** properties of the objects on
the value stack into the target action, regardless of any `@StrutsParameter`
annotation. To restrict copying to annotated properties only, set the global
constant:

```xml
<constant name="struts.chaining.requireAnnotations" value="true"/>
```

When enabled (default is `false`):

- Only properties whose target setters carry [`@StrutsParameter`](struts-parameter-annotation.html)
  are copied; rejected properties are skipped and logged at `WARN`.
- Authorization uses the same `ParameterAuthorizer` service as the
  [Parameters Interceptor](parameters-interceptor.html), keeping semantics consistent.
- The behaviour is **fail-closed**: if the target action cannot be introspected,
  no properties are copied.
- This is a **global** constant only — there is no per-interceptor override.

## Parameters
````

- [ ] **Step 2: Verify the content is present**

Run: `grep -n "struts.chaining.requireAnnotations" source/core-developers/chaining-interceptor.md`
Expected: one match inside the new `## Parameter Authorization` section.

- [ ] **Step 3: Commit**

```bash
git add source/core-developers/chaining-interceptor.md
git commit -m "docs: document chaining interceptor @StrutsParameter enforcement (WW-5631)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 2: Cookie Interceptor — `@StrutsParameter` authorization (WW-5627)

**Files:**
- Modify: `source/core-developers/cookie-interceptor.md` (insert a new section after the `CookiesAware` paragraph at line 24, before `## Parameters`)

- [ ] **Step 1: Add the Parameter Authorization section**

Use Edit. `old_string`:

```
The action could implement `CookiesAware` in order to have a `Map` of filtered cookies set into it.

## Parameters
```

`new_string`:

```
The action could implement `CookiesAware` in order to have a `Map` of filtered cookies set into it.

## Parameter Authorization

Cookie values are injected through the same `@StrutsParameter` authorization path
as the [Parameters Interceptor](parameters-interceptor.html) (previously the
interceptor wrote directly to the value stack and bypassed authorization).

> **Behaviour change in 7.2.0:** when annotation enforcement is active (the
> default `struts.parameters.requireAnnotations=true`), cookies will only populate
> setters marked with [`@StrutsParameter`](struts-parameter-annotation.html).
> Applications that relied on cookies populating un-annotated setters must either
> add the annotation to those setters or stop using `cookiesName=*`.
{:.alert .alert-warning}

## Parameters
```

- [ ] **Step 2: Verify the content is present**

Run: `grep -n "Behaviour change in 7.2.0" source/core-developers/cookie-interceptor.md`
Expected: one match inside the new `## Parameter Authorization` section.

- [ ] **Step 3: Commit**

```bash
git add source/core-developers/cookie-interceptor.md
git commit -m "docs: document cookie interceptor @StrutsParameter authorization (WW-5627)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 3: StrutsParameter annotation — authorization hub (WW-5626/5631/5627)

**Files:**
- Modify: `source/core-developers/struts-parameter-annotation.md` (insert a new section after the intro at line 13, before `## Usage`)

- [ ] **Step 1: Add the "Where authorization applies" section**

Use Edit. `old_string`:

```
Why it matters: by default (when annotations are required), Struts will only inject request parameters into fields or setter methods that have this annotation. This prevents attackers from setting values on fields you didn't intend to expose.

## Usage
```

`new_string`:

```
Why it matters: by default (when annotations are required), Struts will only inject request parameters into fields or setter methods that have this annotation. This prevents attackers from setting values on fields you didn't intend to expose.

## Where authorization applies

As of Struts 7.2.0 the `@StrutsParameter` authorization is enforced across every
channel that can populate an action from request data:

- [Parameters Interceptor](parameters-interceptor.html) — request parameters
  (default, governed by `struts.parameters.requireAnnotations`).
- [Chaining Interceptor](chaining-interceptor.html) — value-stack copying during
  action chaining (opt-in via `struts.chaining.requireAnnotations`).
- [Cookie Interceptor](cookie-interceptor.html) — cookie values.
- [JSON](../../plugins/json) and [REST](../../plugins/rest) plugins — per-property
  authorization performed during deserialization, so unauthorized fields are never set.

## Usage
```

- [ ] **Step 2: Verify the content is present**

Run: `grep -n "Where authorization applies" source/core-developers/struts-parameter-annotation.md`
Expected: one match for the new section heading.

- [ ] **Step 3: Commit**

```bash
git add source/core-developers/struts-parameter-annotation.md
git commit -m "docs: make @StrutsParameter page the authorization hub (WW-5626/5631/5627)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 4: JSON plugin — deserialization limits and per-property authorization (WW-5618/5626)

**Files:**
- Modify: `source/plugins/json/index.md` (insert after the `### Accepting JSON` block, before `## JSON RPC` at line 565)

- [ ] **Step 1: Add the Deserialization limits + authorization section**

Use Edit. `old_string`:

```
Please be aware that those are scoped params per stack, which means, once set it will be used by actions in scope of this stack.

## JSON RPC
```

`new_string`:

````
Please be aware that those are scoped params per stack, which means, once set it will be used by actions in scope of this stack.

### Deserialization limits

To guard against malicious or oversized payloads, JSON deserialization enforces
the following limits. Each can be set globally as a constant or per-interceptor as
a `<param>` (following the same pattern as the fileUpload interceptor):

| Constant | Default | Controls |
|----------|---------|----------|
| `struts.json.maxElements` | `10000` | Maximum number of elements in a single JSON array or object |
| `struts.json.maxDepth` | `64` | Maximum nesting depth of the JSON structure |
| `struts.json.maxLength` | `2097152` (2 MB) | Maximum length of the JSON input |
| `struts.json.maxStringLength` | `262144` (256 KB) | Maximum length of an individual JSON string value |
| `struts.json.maxKeyLength` | `512` | Maximum length of a JSON object key |

```xml
<constant name="struts.json.maxLength" value="1048576"/>
```

The reader and writer implementations are also pluggable via
`struts.json.reader` and `struts.json.writer` (both default to `struts`).

### Parameter authorization

JSON deserialization enforces the [`@StrutsParameter`](../../core-developers/struts-parameter-annotation.html)
annotation **per property, during deserialization** — unauthorized fields are
never set on the target object. Annotate the action properties that may be
populated from the JSON request body.

## JSON RPC
````

- [ ] **Step 2: Verify the content is present**

Run: `grep -nE "struts.json.maxElements|per property, during deserialization" source/plugins/json/index.md`
Expected: two matches (the limits table row and the authorization paragraph).

- [ ] **Step 3: Commit**

```bash
git add source/plugins/json/index.md
git commit -m "docs: document JSON deserialization limits and per-property authorization (WW-5618/5626)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 5: REST plugin — authorization-aware content type handlers (WW-5626)

**Files:**
- Modify: `source/plugins/rest/index.md` (append a paragraph to the end of the `### Custom ContentTypeHandlers` section, before `### Settings` at line 316)

- [ ] **Step 1: Add the authorization note**

Use Edit. `old_string`:

```
```xml
<constant name="struts.rest.handlerOverride.xml" value="myXml"/>
```

### Settings
```

`new_string`:

```
```xml
<constant name="struts.rest.handlerOverride.xml" value="myXml"/>
```

As of Struts 7.2.0 the built-in content type handlers enforce the
[`@StrutsParameter`](../../core-developers/struts-parameter-annotation.html)
annotation per property during deserialization. Custom handlers that need the
same property-level authorization should implement
`AuthorizationAwareContentTypeHandler` (which extends `ContentTypeHandler` with
authorization callbacks) instead of `ContentTypeHandler` directly.

### Settings
```

- [ ] **Step 2: Verify the content is present**

Run: `grep -n "AuthorizationAwareContentTypeHandler" source/plugins/rest/index.md`
Expected: one match in the `### Custom ContentTypeHandlers` section.

- [ ] **Step 3: Commit**

```bash
git add source/plugins/rest/index.md
git commit -m "docs: note AuthorizationAwareContentTypeHandler in REST plugin (WW-5626)

Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>"
```

---

### Task 6: Build verification

**Files:** none (verification only)

- [ ] **Step 1: Build the site**

Run: `bundle exec jekyll build --trace`
Expected: build completes with no errors; the five modified pages are present under `target/` (or the configured destination).

If `bundle` is unavailable locally, instead run the Docker build per `CLAUDE.md`
(`./docker-arm64-serve.sh`) and confirm the pages render. Note in the PR which
method was used.

- [ ] **Step 2: Confirm cross-links resolve**

Run: `grep -rn "struts-parameter-annotation.html" source/core-developers/chaining-interceptor.md source/core-developers/cookie-interceptor.md`
Expected: one match in each file.

Run: `grep -rn "core-developers/struts-parameter-annotation.html" source/plugins/json/index.md source/plugins/rest/index.md`
Expected: one match in each file.

- [ ] **Step 3: No announcement files touched**

Run: `git diff --name-only main...HEAD`
Expected: only the five `source/...` doc files and the `docs/superpowers/` spec/plan files appear — **no** `_config.yml`, `announce-*`, or `releases.md`.

---

## Self-Review

**Spec coverage:**
- WW-5631 → Task 1 ✓
- WW-5627 → Task 2 ✓
- WW-5626 → Tasks 3 (hub), 4 (JSON), 5 (REST) ✓
- WW-5618 → Task 4 ✓
- Hub page (WW-5626/5631/5627) → Task 3 ✓
- Out-of-scope items (WW-5576/5603/5635/5632 + internal) → intentionally excluded per spec ✓
- Announcement mechanics excluded → verified in Task 6 Step 3 ✓

**Placeholder scan:** No TBD/TODO; every edit shows the exact Markdown. ✓

**Type/name consistency:** Constant names (`struts.chaining.requireAnnotations`,
`struts.json.max*`, `struts.json.reader/writer`), the class
`AuthorizationAwareContentTypeHandler`, and the cross-link target
`struts-parameter-annotation.html` are used identically across all tasks. ✓
