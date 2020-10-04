---
layout: default
title: Client Side Validation
parent:
    title: Validation
    url: validation.html
---

# Client Side Validation
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Basics

The framework adds support for client-side validation on top of the standard validation framework.

Client-side validation can be enabled on a per-form basis by specifying `validate="true"` in the _form_ tag.

```jsp
<s:form name="test" action="javascriptValidation" validate="true">
  ...
</s:form>
```

If a `name` for the form is not given, the action mapping name will be used as the form name. Otherwise, a correct 
`action` and `namespace` attributes must be provided to the `<saf:form>` tag.

## Referencing "submitProfile" in the "/user" namespace

```jsp
<s:form namespace="/user" action="submitProfile" validate="true">
  ...
</s:form>
```

Technically, the form's action attribute can refer to a "path" that includes the namespace and action as a URI. 
But, client-side validation **requires** that the action name and namespeact to be set separately.

## Won't work with client-side validation!

```jsp
<s:form action="/user/submitProfile.action" validate="true">
  ...
</s:form>

```

All the usual [validation configuration](validation) steps apply to client-side validation. Client-side validation 
uses the same validation rules as server-side validation. If server-side validation doesn't work, then client-side 
validation won't work either.

## The left hand doesn't know ...

> The required attribute on many _Struts Tags_ is not integrated with client-side validation! The tag attribute is used 
> by certain themes (like xhtml) to put a visual marker (usually '*') next to the field. The tag doesn't know 
> if the validation system actually "requires" the field or not.

## Client Side Validation Types

There are two styles of client side validation.

|[Pure JavaScript Client Side Validation](pure-java-script-client-side-validation)|Used by the _xhtml theme_ and _css_xhtml theme_|
|-----------------------------------------------------|--------------------------------------------------|
|[AJAX Client Side Validation](ajax-client-side-validation)|Used by the _ajax theme_ |
