---
layout: default
title: Alias Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Alias Interceptor

The aim of this Interceptor is to alias a named parameter to a different named parameter. By acting as the glue between 
actions sharing similar parameters (but with different names), it can help greatly with action chaining.

Action's alias expressions should be in the form of `#{ "name1" : "alias1", "name2" : "alias2" }`. This means that assuming 
an action (or something else in the stack) has a value for the expression named `name1` and the action this interceptor 
is applied to has a setter named `alias1`, `alias1` will be set with the value from `name1`.

## Parameters

 - `aliasesKey` (optional) - the name of the action parameter to look for the alias map (by default this is aliases

## Extending the Interceptor

This interceptor does not have any known extension points.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <!-- The value for the foo parameter will be applied as if it were named bar -->
     <param name="aliases">#{ 'foo' : 'bar' }</param>

     <interceptor-ref name="alias"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```
