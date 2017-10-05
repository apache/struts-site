---
layout: core-developers
title: Cookie Interceptor
---

# Cookie Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}
<p>
 <p>
 The aim of this interceptor is to set values in the stack/action based on cookie name/value
 of interest.
 </p>

 <p>
 If an asterisk is present in cookiesName parameter, it will be assume that
 all cookies name are to be injected into struts' action, even though
 cookiesName is comma-separated by other values, e.g. (cookie1,*,cookie2).
 </p>

 <p>
 If cookiesName is left empty it will assume that no cookie will be injected
 into Struts' action.
 </p>

 <p>
 If an asterisk is present in cookiesValue parameter, it will assume that all
 cookies name irrespective of its value will be injected into Struts' action so
 long as the cookie name matches those specified in cookiesName parameter.
 </p>

 <p>
 If cookiesValue is left empty it will assume that all cookie that match the cookieName
 parameter will be injected into Struts' action.
 </p>

 <p>
 The action could implement {@link CookiesAware} in order to have a {@link Map}
 of filtered cookies set into it.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}

Parameters


{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}
<p>
 <ul>
      <li>cookiesName (mandatory) - Name of cookies to be injected into the action. If more
                                                                 than one cookie name is desired it could be comma-separated.
                                                                 If all cookies name is desired, it could simply be *, an asterik.
                                                                 When many cookies name are comma-separated either of the cookie
                                                        that match the name in the comma-separated list will be qualified.</li>
     <li>cookiesValue (mandatory) - Value of cookies that if its name matches cookieName attribute
                                                         and its value matched this, will be injected into Struts'
                                                         action. If more than one cookie name is desired it could be
                                                         comma-separated. If left empty, it will assume any value would
                                                         be ok. If more than one value is specified (comma-separated)
                                                         it will assume a match if either value is matched.</li>
     <li>acceptCookieNames (optional) - Pattern used to check if name of cookie matches the provided patter, to </li>
 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}

Extending the Interceptor


{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}
<p>
 <ul>
     <li>
         populateCookieValueIntoStack - this method will decide if this cookie value is qualified
         to be populated into the value stack (hence into the action itself)
     </li>
     <li>
         injectIntoCookiesAwareAction - this method will inject selected cookies (as a java.util.Map)
         into action that implements {@link CookiesAware}.
     </li>
 </ul>

</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}

Examples


{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}

```xml

 <!--
   This example will inject cookies named either 'cookie1' or 'cookie2' whose
   value could be either 'cookie1value' or 'cookie2value' into Struts' action.
 -->
 <action ... >
    <interceptor-ref name="cookie">
        <param name="cookiesName">cookie1, cookie2</param>
        <param name="cookiesValue">cookie1value, cookie2value</param>
    </interceptor-ref>
    ....
 </action>


 <!--
      This example will inject cookies named either 'cookie1' or 'cookie2'
     regardless of their value into Struts' action.
 -->
 <action ... >
   <interceptor-ref name="cookie">
      <param name="cookiesName">cookie1, cookie2</param>
      <param name="cookiesValue">*</param>
   <interceptor-ref>
   ...
 </action>


 <!--
      This example will inject cookies named either 'cookie1' with value
      'cookie1value' or 'cookie2' with value 'cookie2value' into Struts'
      action.
 -->
 <action ... >
   <interceptor-ref name="cookie">
      <param name="cookiesName">cookie1</param>
      <param name="cookiesValue">cookie1value</param>
   </interceptor-ref>
   <interceptor-ref name="cookie">
      <param name="cookiesName"<cookie2</param>
     <param name="cookiesValue">cookie2value</param>
   </interceptor-ref>
   ....
 </action>

 <!--
    This example will inject any cookies regardless of its value into
    Struts' action.
  -->
 <action ... >
   <interceptor-ref name="cookie">
      <param name="cookiesName">*</param>
      <param name="cookiesValue">*</param>
   </interceptor-ref>
    ...
 </action>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.CookieInterceptor {% endcomment %}
