---
layout: core-developers
title: Token Interceptor
---

# Token Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}
<p> <p>
 Ensures that only one request per token is processed. This interceptor can make sure that back buttons and double
 clicks don't cause un-intended side affects. For example, you can use this to prevent careless users who might double
 click on a "checkout" button at an online store. This interceptor uses a fairly primitive technique for when an
 invalid token is found: it returns the result <b>invalid.token</b>, which can be mapped in your action configuration.
 A more complex implementation, {@link TokenSessionStoreInterceptor}, can provide much better logic for when invalid
 tokens are found.
 </p>

 <p>
 <b>Note:</b> To set a token in your form, you should use the <b>token tag</b>. This tag is required and must be used
 in the forms that submit to actions protected by this interceptor. Any request that does not provide a token (using
 the token tag) will be processed as a request with an invalid token.
 </p>

 <p>
 <b>Internationalization Note:</b> The following key could be used to internationalized the action errors generated
 by this token interceptor
 </p>

 <ul>
    <li>struts.messages.invalid.token</li>
 </ul>

 <p>
 <b>NOTE:</b> As this method extends off MethodFilterInterceptor, it is capable of
 deciding if it is applicable only to selective methods in the action class. See
 <code>MethodFilterInterceptor</code> for more info.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}
<p>
 <ul>

 <li>None</li>

 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}
<p> <p>
 While not very common for users to extend, this interceptor is extended by the {@link TokenSessionStoreInterceptor}.
 The {@link #handleInvalidToken}  and {@link #handleValidToken} methods are protected and available for more
 interesting logic, such as done with the token session interceptor.
 </p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}

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

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.TokenInterceptor {% endcomment %}

