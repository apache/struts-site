---
layout: default
title: Parameters Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Parameter Remover Interceptor

This is interceptor allows parameters (matching one of the `paramNames` value) to be removed from the parameter map 
if they match a certain value (matching one of the `paramValues` value), before they are set on the action. A typical 
usage would be to want a dropdown/select to map onto a boolean value on an action. The select had the options none, 
yes and no with values -1, true and false. The true and false would map across correctly. However the -1 would be set to false.

This was not desired as one might needed the value on the action to stay null. This interceptor fixes this by preventing 
the parameter from ever reaching the action.

## Parameters

 - `paramNames` - a comma separated value indicating the parameter name whose param value should be considered that if 
   they match any of the comma separated value from `paramValues` attribute, shall be removed from the parameter map such 
   that they will not be applied to the action
 - `paramValues` - a comma separated value indicating the parameter value that if matched shall have its parameter be 
   removed from the parameter map such that they will not be applied to the action

## Extending the Interceptor

There are no obvious extensions to the existing interceptor.

## Examples

```xml
<action name="sample" class="org.martingilday.Sample">
    <interceptor-ref name="paramRemover">
        <param name="paramNames">aParam,anotherParam</param>
        <param name="paramValues">--,-1</param>
    </interceptor-ref>
    <interceptor-ref name="defaultStack" />
    ...
</action>
```
