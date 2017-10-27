---
layout: default
title: Create Session Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Create Session Interceptor

This interceptor creates the HttpSession if it doesn't exist, also SessionMap is recreated and put in ServletActionContext.

This is particular useful when using the <@s.token> tag in freemarker templates. The tag **do** require that 
a HttpSession is already created since freemarker commits the response to the client immediately.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no obvious extensions to the existing interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="createSession"/>
     <interceptor-ref name="defaultStack"/>
     <result name="input">input_with_token_tag.ftl</result>
 </action>
```
