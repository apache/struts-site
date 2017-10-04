---
layout: core-developers
title: Static Parameters Interceptor
---

# Static Parameters Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}
<p>
 This interceptor populates the action with the static parameters defined in the action configuration. If the action
 implements {@link Parameterizable}, a map of the static parameters will be also be passed directly to the action.
 The static params will be added to the request params map, unless "merge" is set to false.

 <p> Parameters are typically defined with <param> elements within xwork.xml.</p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}
<p>
 <ul>

 <li>None</li>

 </ul>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}
<p>
 <p>There are no extension points to this interceptor.</p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="staticParams">
          <param name="parse">true</param>
          <param name="overwrite">false</param>
     </interceptor-ref>
     <result name="success">good_result.ftl</result>
 </action>
```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.StaticParametersInterceptor {% endcomment %}
