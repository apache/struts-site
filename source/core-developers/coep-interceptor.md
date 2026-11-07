---
layout: default
title: COEP Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Cross-Origin Embedder Policy Interceptor

## Description

Interceptor that implements Cross-Origin Embedder Policy on incoming requests.

COEP prevents the document from loading any framed documents which don't opt-in by setting the COEP header:

```
Cross-Origin-Embedder-Policy: require-corp
```

This provides protection for documents that don't restrict framing. A document that doesn't set COEP cannot be framed 
by another document with COEP. All descendents of a document with COEP will also enforce the same restrictions.

COEP is now supported by all major browsers. [More information about COEP](https://web.dev/why-coop-coep/#coep).

## Parameters

- `exemptedPaths` - Comma-separated list of request paths the COEP header is not sent on. Each entry is compared exactly
  with the path of the request inside the web application: the servlet path plus the path info, without the context path
  and without the query string. Include the action extension, e.g. `/embed/widget.action`; if an action is reachable
  with several extensions, list each form. This field is empty by default.
- `enforcingMode` - Boolean variable allowing the user to let COEP operate in `enforcing`, which blocks both resource 
   and reports violations, or `report-only` mode, which only reports violations. Default value for field is `false`.
- `disabled` - Boolean variable disabling and enabling COEP. Default value for field is `false`.

Before Struts 7.5.0 and 6.13.0 `exemptedPaths` was compared with the context path of the application, so an entry
naming a request path had no effect and an entry equal to the context path disabled the interceptor for the whole
application. Use `disabled` if you relied on the latter.
{:.alert .alert-warning}

## Examples

```xml
<package name="default" extends="struts-default">
    <interceptors>
        <interceptor-stack name="appDefaultStack">
            <interceptor-ref name="defaultStack">
                <param name="coep.exemptedPaths">/embed/widget.action</param>
                <param name="coep.enforcingMode">false</param>
            </interceptor-ref>
        </interceptor-stack>
    </interceptors>
    <default-interceptor-ref name="appDefaultStack"/>
</package>
```
