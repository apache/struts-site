---
layout: default
title: Token Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Token Interceptor

Ensures that only one request per token is processed. This interceptor can make sure that back buttons and double clicks 
don't cause un-intended side affects. For example, you can use this to prevent careless users who might double click on 
a "checkout" button at an online store. This interceptor uses a fairly primitive technique for when an invalid token is 
found: it returns the result `invalid.token`, which can be mapped in your action configuration.
A more complex implementation, {@link TokenSessionStoreInterceptor}, can provide much better logic for when invalid 
tokens are found.

> Note: To set a token in your form, you should use the <b>token tag</b>. This tag is required and must be used 
> in the forms that submit to actions protected by this interceptor. Any request that does not provide a token (using
> the token tag) will be processed as a request with an invalid token.

Internationalization Note: The following key could be used to internationalized the action errors generated by this 
token interceptor:
 
 - `struts.messages.invalid.token`

> NOTE: As this method extends off MethodFilterInterceptor, it is capable of deciding if it is applicable only 
> to selective methods in the action class. See `MethodFilterInterceptor` for more info.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

While not very common for users to extend, this interceptor is extended by the `TokenSessionStoreInterceptor`.
The `#handleInvalidToken`  and `#handleValidToken` methods are protected and available for more interesting logic, 
such as done with the token session interceptor.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="token"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>

 <-- In this case, myMethod of the action class will not
        get checked for invalidity of token -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="token">
        <param name="excludeMethods">myMethod</param>
     </interceptor-ref name="token"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```