---
layout: default
title: Create Session Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Clear Session Interceptor

This interceptor clears the HttpSession.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no obvious extensions to the existing interceptor.

## Examples

```xml
<action name="exampleAction" class="com.examples.ExampleAction">
    <interceptor-ref name="clearSession"/>
    <interceptor-ref name="defaultStack"/>
    <result name="success">example.jsp</result>
</action>
```
