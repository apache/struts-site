---
layout: core-developers
title: Servlet Config Interceptor
---

# Servlet Config Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}
<p> <p>
 An interceptor which sets action properties based on the interfaces an action implements. For example, if the action
 implements {@link ParameterAware} then the action context's parameter map will be set on it.
 </p>

 <p>This interceptor is designed to set all properties an action needs if it's aware of servlet parameters, the
 servlet context, the session, etc. Interfaces that it supports are:
 </p>

 <ul>

 <li>{@link ServletContextAware}</li>

 <li>{@link ServletRequestAware}</li>

 <li>{@link ServletResponseAware}</li>

 <li>{@link ParameterAware} - deprecated since 2.5.4, please use {@link HttpParametersAware}</li>

 <li>{@link HttpParametersAware}</li>

 <li>{@link RequestAware}</li>

 <li>{@link SessionAware}</li>

 <li>{@link ApplicationAware}</li>

 <li>{@link PrincipalAware}</li>

 </ul>
</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}
<p>
 <ul>

 <li>None</li>

 </ul>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}
<p>
 <p>There are no known extension points for this interceptor.</p>
</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="servletConfig"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.ServletConfigInterceptor {% endcomment %}
