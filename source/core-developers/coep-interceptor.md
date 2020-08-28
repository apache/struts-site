---
layout: default
title: COEP Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Fetch Metadata Interceptor

## Description

Interceptor that implements Cross-Origin Embedder Policy on incoming requests.

COEP prevents the document from loading any framed documents which don't opt-in by setting the COEP header. (`Cross-Origin-Embedder-Policy: require-corp`). This provides protection for documents that don't restrict framing. A document that doesn't set COEP cannot be framed by another document with COEP. All descendents of a document with COEP will also enforce the same restrictions.

COEP is now supported by all major browsers.



[More information about COEP](https://web.dev/why-coop-coep/#coep).

## Parameters

- `exemptedPaths` - Set of opt out endpoints that are meant to serve cross-site traffic. Paths should contain leading slashes and must be relative. This field is empty by default.
- `enforcingMode` - Boolean variable allowing the user to let COEP operate in `enforcing`, which blocks both resource and reports violations, or `report-only` mode, which only reports violations. Default value for field is `false`.
- `disabled` - Boolean variable disabling and enabling COEP. Default value for field is `false`.

## Examples

```xml
<interceptor name="coep" class="org.apache.struts2.interceptor.CoepInterceptor"/>

<action  name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="defaultStack">
    <interceptor-ref name="coep">
            <param name="exemptedPaths">/path1,/path2,/path3 <param>
            <param name="enforcingMode">false<param>
            <param name="disabled">false</param>
    <interceptor-ref>
    <result name="success">good_result.ftl</result>
</action>
```
