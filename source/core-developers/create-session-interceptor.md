---
layout: core-developers
title: Create Session Interceptor
---

# Create Session Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}
<p>
 <p>
 This interceptor creates the HttpSession if it doesn't exist, also SessionMap is recreated and put in ServletActionContext.
 </p>

 <p>
 This is particular useful when using the <@s.token> tag in freemarker templates.
 The tag <b>do</b> require that a HttpSession is already created since freemarker commits
 the response to the client immediately.
 </p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}
<p>
 <ul>
 <li>None</li>
 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}
<p>
 <ul>
  <li>None</li>
 </ul>

</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}

```xml

 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="createSession"/>
     <interceptor-ref name="defaultStack"/>
     <result name="input">input_with_token_tag.ftl</result>
 </action>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.CreateSessionInterceptor {% endcomment %}
