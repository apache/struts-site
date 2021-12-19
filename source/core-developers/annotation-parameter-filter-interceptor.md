---
layout: default
title: Annotation Parameter Filter Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Annotation Parameter Filter Interceptor

Annotation based version of [Parameter Filter Interceptor](parameter-filter-interceptor).

This interceptor must be placed in the stack before the [Parameters Interceptor](parameters-interceptor). 
When a parameter matches a field that is marked {@link Blocked} then it is removed from the parameter map.

If an action class is marked with `BlockByDefault` then all parameters are removed unless a field on the Action exists 
and is marked with `Allowed`.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no obvious extensions to the existing interceptor.

## Examples

```xml
<action name="exampleAction" class="com.examples.ExampleAction">
    <interceptor-ref name="annotationParameterFilter"/>
    <interceptor-ref name="defaultStack"/>
    <result name="success">example.jsp</result>
</action>
```
