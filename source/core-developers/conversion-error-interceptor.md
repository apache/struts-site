---
layout: default
title: Conversion Error Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Conversion Error Interceptor

Conversion Error Interceptor adds conversion errors from the ActionContext to the Action's field errors.

This interceptor adds any error found in the {@link ActionContext}'s conversionErrors map as a field error (provided that 
the action implements `ValidationAware`). In addition, any field that contains a validation error has its original value 
saved such that any subsequent requests for that value return the original value rather than the value in the action. 
This is important because if the value "abc" is submitted and can't be converted to an int, we want to display the original 
string ("abc") again rather than the int value (likely 0, which would make very little sense to the user).
 
> Note: Since 2.5.2, this interceptor extends `MethodFilterInterceptor`, therefore being able to deal with `excludeMethods` 
> / `includeMethods` parameters. See [Workflow Interceptor](default-workflow-interceptor) for documentation and 
> examples on how to use this feature.

This interceptor extends `ConversionErrorInterceptor` but only adds conversion errors from the ActionContext to the field 
errors of the action if the field value is not null, `""`, or `{""}` (a size 1 String array with only an empty String). 
See `ConversionErrorInterceptor` for more information, as well as the Type Conversion documentation.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no known extension points for this interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="conversionError"/>
     <result name="success">good_result.ftl</result>
 </action>
```
