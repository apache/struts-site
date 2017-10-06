---
layout: core-developers
title: Token Session Interceptor
---

# Token Session Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}
<p> <p>
 This interceptor builds off of the {@link TokenInterceptor}, providing advanced logic for handling invalid tokens.
 Unlike the normal token interceptor, this interceptor will attempt to provide intelligent fail-over in the event of
 multiple requests using the same session. That is, it will block subsequent requests until the first request is
 complete, and then instead of returning the <i>invalid.token</i> code, it will attempt to display the same response
 that the original, valid action invocation would have displayed if no multiple requests were submitted in the first
 place.
 </p>

 <p>
 <b>NOTE:</b> As this method extends off MethodFilterInterceptor, it is capable of
 deciding if it is applicable only to selective methods in the action class. See
 <code>MethodFilterInterceptor</code> for more info.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}
<p>
 <ul>

 <li>None</li>

 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}

##### Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}
<p> <p>
 There are no known extension points for this interceptor.
 </p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}

##### Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}

```xml

 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="tokenSession/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>

 <-- In this case, myMethod of the action class will not
        get checked for invalidity of token -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="tokenSession>
         <param name="excludeMethods">myMethod</param>
     </interceptor-ref name="tokenSession>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.TokenSessionStoreInterceptor {% endcomment %}
