---
layout: default
title: Fetch Metadata Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Fetch Metadata Interceptor

## Description

An interceptor that implements Fetch Metadata on incoming requests used to protect against CSRF, XSSI, and cross-origin 
information leaks. Uses a default Resource Isolation Policy to programmatically reject cross-origin requests.

A Resource Isolation Policy is a strong defense in-depth mechanism that prevents the resources on a server from being 
requested by external websites. The interceptor is part of the `defaultStack` and is enabled by default; endpoints
that are meant to be loaded in a cross-site context can be exempted from the policy.

The browser provides information about the context of an HTTP request in a set of `Sec-Fetch-*` headers. This allows 
the server processing the request to make decisions on whether the request should be accepted or rejected based 
on the preferred resource isolation policy. Struts provides a default _Resource Isolation Policy_ that rejects 
_cross-site_ requests that aren't simple top level navigations:

```
Sec-Fetch-Site == 'cross-site' AND (Sec-Fetch-Mode != 'navigate' OR method NOT IN [GET, HEAD] OR Sec-Fetch-Dest IN [object, embed])
```

Requests without a `Sec-Fetch-Site` header and `same-origin`, `same-site` and `none` requests are always accepted.

Refer to [Implementing a Resource Isolation Policy](https://web.dev/fetch-metadata/#implementing-a-resource-isolation-policy) 
for further information on implementing effective Resource Isolation Policies. Fetch Metadata is supported in all major browsers.

## Cross-site form posts

Since Struts 7.5.0 and 6.13.0 cross-site `POST` navigations are rejected with `403`.
{:.alert .alert-info}

Flows where another site posts the user's browser back to your application are affected, for example:

- a SAML assertion consumer service or an OpenID Connect `form_post` response,
- a payment gateway returning the user to the shop.

Exempt the endpoints receiving these requests, either by path with `exemptedPaths` or per action with the `disabled`
parameter, see the examples below.

## Parameters

- `exemptedPaths` - Comma-separated list of request paths the policy is not applied to. Each entry is compared exactly
  with the path of the request inside the web application: the servlet path plus the path info, without the context path
  and without the query string. Include the action extension, e.g. `/saml/acs.action`; if an action is reachable with
  several extensions, list each form. This field is empty by default.
- `disabled` - Set to `true` to skip the interceptor for an action. Default value is `false`.

Before Struts 7.5.0 and 6.13.0 `exemptedPaths` was compared with the context path of the application, so an entry
naming a request path had no effect and an entry equal to the context path disabled the interceptor for the whole
application. Use `disabled` if you relied on the latter.
{:.alert .alert-warning}

When `struts.mapper.action.prefix.enabled` is set to `true` (it is `false` by default), a request to an exempted path
can use the `action:` parameter prefix to execute another action in the same namespace.

## Examples

Exempt selected paths for every action using the stack:

```xml
<package name="default" extends="struts-default">
    <interceptors>
        <interceptor-stack name="appDefaultStack">
            <interceptor-ref name="defaultStack">
                <param name="fetchMetadata.exemptedPaths">/saml/acs.action,/payment/return.action</param>
            </interceptor-ref>
        </interceptor-stack>
    </interceptors>
    <default-interceptor-ref name="appDefaultStack"/>
</package>
```

Disable the interceptor for a single action:

```xml
<action name="acs" class="com.examples.SamlAssertionConsumerAction">
    <interceptor-ref name="defaultStack">
        <param name="fetchMetadata.disabled">true</param>
    </interceptor-ref>
    <result name="success">good_result.ftl</result>
</action>
```
