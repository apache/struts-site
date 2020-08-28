---
layout: default
title: COOP Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Fetch Metadata Interceptor

## Description

Interceptor that implements Cross-Origin Opener Policy on incoming requests.

COOP is a security mitigation that lets developers isolate their resources against side-channel attacks and information leaks. The COOP response header allows a document to request a new browsing context group to better isolate itself from other untrustworthy origins. Separating browsing contexts is necessary because at least two types of attacks are possible when a document shares a browsing context group and possibly an operating system process with cross-origin documents:

- Cross-window attacks. A malicious document can open a victim document in a new window and later navigate the window to a look-alike document to trick the user, or attempt to exploit postMessage vulnerabilities in the victim document.
- Process-wide attacks. Side channel and transient execution attacks like Spectre may provide an opportunity to the malicious document to get access to sensitive data from the victim document, if they share an OS process.

The COOP header can have one of 3 values: `same-origin`, `same-origin-allow-popups`, `unsafe-none`.  If the COOP values are the same, and the origins of the documents match the relationship declared in the COOP header value, documents can interact with each other. Otherwise if at least one of the documents sets COOP, the browser will create a new browsing context group severing the link between the documents. Sites can use `same-origin-allow-popups` to allow popups they open to be in their browsing context group (unless the popup's own COOP prevents this).

COOP is now supported by all major browsers.


[More information about COOP](https://web.dev/why-coop-coep/#coop).

## Parameters

- `exemptedPaths` - Set of opt out endpoints that are meant to serve cross-site traffic. Paths should contain leading slashes and must be relative. This field is empty by default.
- `mode` - The policy mode COOP should follow. Available modes are `same-origin`, `same-origin-allow-popups`, `unsafe-none`. Default mode is `same-origin`.

## Examples

```xml
<interceptor name="coop" class="org.apache.struts2.interceptor.CoopInterceptor"/>

<action  name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="defaultStack">
    <interceptor-ref name="coop">
            <param name="exemptedPaths">/path1,/path2,/path3 <param>
            <param name="mode">same-origin<param>
    <interceptor-ref>
    <result name="success">good_result.ftl</result>
</action>
```