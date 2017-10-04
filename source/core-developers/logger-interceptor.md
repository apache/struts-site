---
layout: core-developers
title: Logger Interceptor
---

# Logger Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}
<p> <p>
 This interceptor logs the start and end of the execution an action (in English-only, not internationalized).
 <br>
 <b>Note:</b>: This interceptor will log at <tt>INFO</tt> level.
 </p></p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}
<p> There are no parameters for this interceptor.</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}
<p> There are no obvious extensions to the existing interceptor.</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}

```xml
 <!-- prints out a message before and after the immediate action execution -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="logger"/>
     <result name="success">good_result.ftl</result>
 </action>

 <!-- prints out a message before any more interceptors continue and after they have finished -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="logger"/>
     <interceptor-ref name="completeStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.LoggingInterceptor {% endcomment %}
