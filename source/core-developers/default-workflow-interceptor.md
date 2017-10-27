---
layout: default
title: Default Workflow Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Default Workflow Interceptor

An interceptor that makes sure there are not validation, conversion or action errors before allowing the interceptor 
chain to continue. If a single FieldError or ActionError (including the ones replicated by the Message Store Interceptor 
in a redirection) is found, the INPUT result will be triggered.

This interceptor does not perform any validation.

This interceptor does nothing if the name of the method being invoked is specified in the `excludeMethods` parameter. 
`excludeMethods` accepts a comma-delimited list of method names. For example, requests to `foo!input.action` and 
`foo!back.action` will be skipped by this interceptor if you set the `excludeMethods` parameter to `input, back`.

> Note: As this method extends off MethodFilterInterceptor, it is capable of deciding if it is applicable only to selective 
> methods in the action class. This is done by adding param tags for the interceptor element, naming either a list of excluded 
> method names and/or a list of included method names, whereby `includeMethods` overrides `excludedMethods`. A single * 
> sign is interpreted as wildcard matching all methods for both parameters. `MethodFilterInterceptor` for more info.

This interceptor also supports the following interfaces which can implemented by actions:
 - `ValidationAware` - implemented by ActionSupport class
 - `ValidationWorkflowAware` - allows changing result name programmatically
 - `ValidationErrorAware` - notifies action about errors and also allow change result name
 
You can also use `InputConfig` annotation to change result name returned when validation errors occurred.

In `DefaultWorkflowInterceptor` applies only when action implements `com.opensymphony.xwork2.Validateable`
 1. if the action class have `validate{MethodName}()`, it will be invoked
 2. else if the action class have `validateDo{MethodName}()`, it will be invoked
 3. no matter if 1] or 2] is performed, if `alwaysInvokeValidate` property of the interceptor is `true` (which is by 
   default `true`), `validate()` will be invoked.

## Parameters

 - `inputResultName` - Default to "input". Determine the result name to be returned when an action / field error is found.

## Extending the Interceptor

There are no known extension points for this interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>

 <-- In this case myMethod as well as mySecondMethod of the action class
        will not pass through the workflow process -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow">
         <param name="excludeMethods">myMethod,mySecondMethod</param>
     </interceptor-ref name="workflow">
     <result name="success">good_result.ftl</result>
 </action>

 <-- In this case, the result named "error" will be used when
        an action / field error is found -->
 <-- The Interceptor will only be applied for myWorkflowMethod method of action
        classes, since this is the only included method while any others are excluded -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow">
        <param name="inputResultName">error</param>
         <param name="excludeMethods">*</param>
         <param name="includeMethods">myWorkflowMethod</param>
     </interceptor-ref>
     <result name="success">good_result.ftl</result>
 </action>
```
