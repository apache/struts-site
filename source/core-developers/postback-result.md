---
layout: core-developers
title: Postback Result
parent:
    title: Result types
    url: result-types
---

# Postback Result

## Description

A result that renders the current request parameters as a form which immediately submits 
a [postback](http://en.wikipedia.org/wiki/Postback) to the specified destination.

## Parameters

- location - http location to post the form
- prependServletContext (true|false) -  when location is relative, controls if to add Servlet Context, default "true"
- actionName - action name to post the form (resolved as an expression)
- namespace - action's namespace to use (resolved as an expression)
- method - actions' method to use (resolved as an expression)
- cache (true|false) - when set to true adds cache control headers, default "true"
- parse (true|false) - when set to true actionName, namespace and method are parsed, default "true"

## Examples

```xml
<action name="registerThirdParty" >
    <result type="postback">https://www.example.com/register</result>
</action>

<action name="registerThirdParty" >
    <result type="postback">
        <param name="namespace">/secure</param>
        <param name="actionName">register2</param>
    </result>
</action>
```
