---
layout: default
title: CookieProvider Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Cookie Provider Interceptor

Allows actions to send cookies to client, action must implement `CookieProvider` interface. You must reference this 
interceptor in your default stack or in action's stack, see example below.

This interceptor clears the HttpSession.

## Parameters

 - `addCookiesToResponse` - this method applies cookie created by action to response

## Extending the Interceptor

There are no obvious extensions to the existing interceptor.

## Examples

```xml
 <action ... >
   <interceptor-ref name="defaultStack"/>
   <interceptor-ref name="cookieProvider"/>
   ...
 </action>

```
