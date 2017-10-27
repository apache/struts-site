---
layout: default
title: Static Parameters Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Static Parameters Interceptor

This interceptor populates the action with the static parameters defined in the action configuration. If the action 
implements `Parameterizable`, a map of the static parameters will be also be passed directly to the action. The static 
params will be added to the request params map, unless `merge` is set to false.

Parameters are typically defined with `<param>` elements within `struts.xml.`

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no extension points to this interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="staticParams">
          <param name="parse">true</param>
          <param name="overwrite">false</param>
     </interceptor-ref>
     <result name="success">good_result.ftl</result>
 </action>
```
