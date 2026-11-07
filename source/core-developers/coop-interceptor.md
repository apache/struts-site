---
layout: default
title: COOP Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Cross-Origin Opener Policy Interceptor

## Description

Interceptor that implements _Cross-Origin Opener Policy_ on incoming requests.

COOP is a security mitigation that lets developers isolate their resources against side-channel attacks and information 
leaks. The COOP response header allows a document to request a new browsing context group to better isolate itself 
from other untrustworthy origins. Separating browsing contexts is necessary because at least two types of attacks 
are possible when a document shares a browsing context group and possibly an operating system process with cross-origin documents:

- Cross-window attacks. A malicious document can open a victim document in a new window and later navigate the window 
  to a look-alike document to trick the user, or attempt to exploit postMessage vulnerabilities in the victim document.
- Process-wide attacks. Side channel and transient execution attacks like Spectre may provide an opportunity 
  to the malicious document to get access to sensitive data from the victim document, if they share an OS process.

The COOP header can have one of 3 values:
- `same-origin`
- `same-origin-allow-popups`
- `unsafe-none`
 
If the COOP values are the same, and the origins of the documents match the relationship declared in the COOP header 
value, documents can interact with each other. Otherwise, if at least one of the documents sets COOP, the browser 
will create a new browsing context group severing the link between the documents. Sites can use `same-origin-allow-popups` 
to allow popups they open to be in their browsing context group (unless the popup's own COOP prevents this).

COOP is now supported by all major browsers. [More information about COOP](https://web.dev/why-coop-coep/#coop).

## Parameters

- `exemptedPaths` - Comma-separated list of request paths the COOP header is not sent on. Each entry is compared exactly
  with the path of the request inside the web application: the servlet path plus the path info, without the context path
  and without the query string. Include the action extension, e.g. `/popup/callback.action`; if an action is reachable
  with several extensions, list each form. This field is empty by default.
- `mode` - The policy mode COOP should follow. Available modes are `same-origin`, `same-origin-allow-popups`, 
  `unsafe-none`. Default mode is `same-origin`.
- `disabled` - Set to `true` to skip the interceptor for an action. Default value is `false`.

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
                <param name="coop.exemptedPaths">/popup/callback.action</param>
                <param name="coop.mode">same-origin</param>
            </interceptor-ref>
        </interceptor-stack>
    </interceptors>
    <default-interceptor-ref name="appDefaultStack"/>
</package>
```
