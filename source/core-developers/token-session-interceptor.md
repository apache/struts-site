---
layout: default
title: Token Session Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Token Session Interceptor

This interceptor builds off of the [Token Interceptor](token-interceptor.html), providing advanced logic for handling 
invalid tokens. Unlike the normal token interceptor, this interceptor will attempt to provide intelligent fail-over 
in the event of multiple requests using the same session. That is, it will block subsequent requests until the first 
request is complete, and then instead of returning the <i>invalid.token</i> code, it will attempt to display the same 
response that the original, valid action invocation would have displayed if no multiple requests were submitted 
in the first place.

> NOTE: As this method extends off MethodFilterInterceptor, it is capable of deciding if it is applicable only 
> to selective methods in the action class. See `MethodFilterInterceptor` for more info.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no known extension points for this interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="tokenSession"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>

 <!-- In this case, myMethod of the action class will not
        get checked for invalidity of token -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="tokenSession">
         <param name="excludeMethods">myMethod</param>
     </interceptor-ref>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```
