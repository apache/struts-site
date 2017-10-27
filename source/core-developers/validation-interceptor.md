---
layout: default
title: Validation Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Validation Interceptor

This interceptor runs the action through the standard validation framework, which in turn checks the action against any 
validation rules (found in files such as `ActionClass-validation.xml`) and adds field-level and action-level error 
messages (provided that the action implements `ValidationAware`). This interceptor is often one of the last (or second 
to last) interceptors applied in a stack, as it assumes that all values have already been set on the action.

This interceptor does nothing if the name of the method being invoked is specified in the `excludeMethods` parameter. 
`excludeMethods` accepts a comma-delimited list of method names. For example, requests to `foo!input.action<`
and `foo!back.action` will be skipped by this interceptor if you set the `excludeMethods` parameter to `input, back`.
 
The workflow of the action request does not change due to this interceptor. Rather, this interceptor is often used 
in conjunction with the `workflow` interceptor.

> NOTE: As this method extends off MethodFilterInterceptor, it is capable of deciding if it is applicable only to selective 
methods in the action class. See `MethodFilterInterceptor` for more info.

## Parameters

 - `alwaysInvokeValidate` - Defaults to true. If true validate() method will always be invoked, otherwise it will not.
 - `programmatic` - Defaults to true. If true and the action is `Validateable` call `validate()`, and any method that 
   starts with `validate`.
 - `declarative` - Defaults to true. Perform validation based on xml or annotations.

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
 
 <-- in the following case myMethod of the action class will not
        get validated -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation">
         <param name="excludeMethods">myMethod</param>
     </interceptor-ref>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>
 
 <-- in the following case only annotated methods of the action class will
        be validated -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation">
         <param name="validateAnnotatedMethodOnly">true</param>
     </interceptor-ref>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>
```
