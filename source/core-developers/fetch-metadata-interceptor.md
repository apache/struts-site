---
layout: default
title: Fetch Metadata Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Fetch Metadata Interceptor

## Description

An interceptor that implements Fetch Metadata on incoming requests used to protect against CSRF, XSSI, and cross-origin information leaks. Uses a default Resource Isolation Policy to programmatically reject cross-origin requests.

A Resource Isolation Policy is a strong defense in-depth mechanism that prevents the resources on a server from being requested by external websites. This policy can be enabled either for all endpoints of the application and  endpoints that are meant to be loaded in a cross-site context can be exempted from the policy.

The browser provides information about the context of an HTTP request in a set of `Sec-Fetch-*` headers. This allows the server processing the request to make decisions on whether the request should be accepted or rejected based on the preferred resource isolation policy. Struts provides a default Resource Isolation Policy that rejects cross-origin requests that aren't top level navigations.

```
Sec-Fetch-Site == 'cross-site' AND (Sec-Fetch-Mode != 'navigate'/'nested-navigate' OR method NOT IN [GET, HEAD])
```

Refer to [Implementing a Resource Isolation Policy](https://web.dev/fetch-metadata/#implementing-a-resource-isolation-policy) for further information on implementing effective Resource Isolation Policies.
Fetch Metadata is supported in all major browsers

## Parameters

- `exemptedPaths` - Set of opt out endpoints that are meant to serve cross-site traffic. Paths should contain leading slashes and must be relative. This field is empty by default.

## Examples

```xml
<interceptor name="fetchMetadata" class="org.apache.struts2.interceptor.FetchMetadataInterceptor"/>

<action  name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="defaultStack">
    <interceptor-ref name="fetchMetadata">
            <param name="exemptedPaths">/path1,/path2,/path3 <param>
    <interceptor-ref>
    <result name="success">good_result.ftl</result>
</action>
```
