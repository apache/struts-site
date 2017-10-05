---
layout: core-developers
title: CookieProvider Interceptor
---

# CookieProvider Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}
<p> Allows actions to send cookies to client, action must implement {@link CookieProvider}
 You must reference this interceptor in your default stack or in action's stack, see example below.

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}

Parameters


{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}
<p>
 none

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}

Extending the Interceptor


{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}
<p>
 <ul>
     <li>addCookiesToResponse - this method applies cookie created by action to response</li>
 </ul>

</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}

Examples


{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}

```xml

 <action ... >
   <interceptor-ref name="defaultStack"/>
   <interceptor-ref name="cookieProvider"/>
   ...
 </action>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.CookieProviderInterceptor {% endcomment %}
