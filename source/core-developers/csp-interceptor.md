---
layout: default
title: CSP Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Content Security Policy Interceptor

## Description

Interceptor that implements Content Security Policy on incoming requests.

Content Security Policy (CSP) is an added layer of security that helps to detect and mitigate certain types of attacks, 
including Cross-Site Scripting (XSS) and data injection attacks. These attacks are used for everything from data theft, 
to site defacement, to malware distribution.

CSP can work in two modes, either **enforce** or **report**. In the report mode the `Content-Security-Policy-Report-Only`
header is sent and `Content-Security-Policy` header is used when using the enforce mode.

CSP is now supported by all major browsers.

[More information about CSP](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP).

## Parameters

- `enforcingMode` (default `false`) - When set to "true", the enforce mode has been enabled, and the provided policy 
  is going to be enforced.
- `reportUri` - an uri under, which the violations have to be reported.

## Examples

```xml
<action  name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="defaultStack">
        <param name="csp.enforcingMode">true</param>
        <param name="csp.reportUri">/csp-report.action</param>
    </interceptor-ref>
    <result name="success">good_result.ftl</result>
</action>
```
