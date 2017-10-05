---
layout: core-developers
title: Timer Interceptor
---

# Timer Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}
<p> This interceptor logs the amount of time in milliseconds. In order for this interceptor to work properly, the
 logging framework must be set to at least the <tt>INFO</tt> level.
 This interceptor relies on the <a href="http://jakarta.apache.org/commons/logging/">Commons Logging API</a> to
 report its execution-time value.
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}
<p>
 <ul>

 <li>logLevel (optional) - what log level should we use (<code>trace, debug, info, warn, error, fatal</code>)? - defaut is <code>info</code></li>

 <li>logCategory (optional) - If provided we would use this category (eg. <code>com.mycompany.app</code>).
 Default is to use <code>com.opensymphony.xwork2.interceptor.TimerInterceptor</code>.</li>

 </ul>

 The parameters above enables us to log all action execution times in our own logfile.

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}
<p> This interceptor can be extended to provide custom message format. Users should override the
 <code>invokeUnderTiming</code> method.
</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}

```xml
 <!-- records only the action's execution time -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="timer"/>
     <result name="success">good_result.ftl</result>
 </action>

 <!-- records action's execution time as well as other interceptors-->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="timer"/>
     <interceptor-ref name="completeStack"/>
     <result name="success">good_result.ftl</result>
 </action>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.TimerInterceptor {% endcomment %}
