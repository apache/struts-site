---
layout: default
title: Prepare Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Prepare Interceptor

This interceptor calls `prepare()` on actions which implement `Preparable`. This interceptor is very useful for any 
situation where you need to ensure some logic runs before the actual execute method runs.

A typical use of this is to run some logic to load an object from the database so that when parameters are set they can 
be set on this object. For example, suppose you have a User object with two properties: `id` and `name`. Provided that 
the params interceptor is called twice (once before and once after this interceptor), you can load the User object using
the `id` property and then when the second params interceptor is called the parameter `user.name` will be set, as desired, 
on the actual object loaded from the database. See the example for more info.

> Note: Since XWork 2.0.2, this interceptor extends `MethodFilterInterceptor`, therefore being able to deal with 
> `excludeMethods` / `includeMethods` parameters. See [Workflow Interceptor](default-workflow-interceptor)
> for documentation and examples on how to use this feature.
 
> Update: Added logic to execute a `prepare<MethodName>` and conditionally the a general `prepare()` Method, depending 
> on the `alwaysInvokePrepare` parameter/property which is by default `true`. This allows us to run some logic based 
> on the method name we specify in the `com.opensymphony.xwork2.ActionProxy`. For example, you can specify a `prepareInput()`
> method that will be run before the invocation of the input method.

In `PrepareInterceptor` applies only when action implements `Preparable`
 1. if the action class have `prepare<MethodName>()`, it will be invoked
 2. else if the action class have `prepareDo<MethodName>()`, it will be invoked
 3. no matter if 1] or 2] is performed, if `alwaysInvokePrepare` property of the interceptor is `true` (which is by 
   default `true`), `prepare()` will be invoked.

## Parameters

 - `alwaysInvokePrepare` - Default to true. If true, prepare will always be invoked, otherwise it will not.

## Extending the Interceptor

 There are no known extension points to this interceptor.

## Examples

```xml
 <!-- Calls the params interceptor twice, allowing you to
       pre-load data for the second time parameters are set -->
  <action name="someAction" class="com.examples.SomeAction">
      <interceptor-ref name="params"/>
      <interceptor-ref name="prepare"/>
      <interceptor-ref name="basicStack"/>
      <result name="success">good_result.ftl</result>
  </action>
```
