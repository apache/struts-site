---
layout: default
title: Servlet Config Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Servlet Config Interceptor

An interceptor which sets action properties based on the interfaces an action implements. For example, if the action
implements `ParameterAware` then the action context's parameter map will be set on it.

This interceptor is designed to set all properties an action needs if it's aware of servlet parameters, the servlet 
context, the session, etc. Interfaces that it supports are:
 
 - `ServletContextAware`
 - `ServletRequestAware`
 - `ServletResponseAware`
 - `ParameterAware` - deprecated since 2.5.4, please use `HttpParametersAware`
 - `HttpParametersAware`
 - `RequestAware`
 - `SessionAware`
 - `ApplicationAware`
 - `PrincipalAware`

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no known extension points for this interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="servletConfig"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```
