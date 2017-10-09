---
layout: core-developers
title: Postback Result
---

# Postback Result

## Description



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.result.PostbackResult {% endcomment %}
<p> <p>

 A result that renders the current request parameters as a form which

 immediately submits a <a href="http://en.wikipedia.org/wiki/Postback">postback</a>

 to the specified destination.

 </p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.result.PostbackResult {% endcomment %}

## Parameters



{% comment %}start snippet id=params|javadoc=true|url=org.apache.struts2.result.PostbackResult {% endcomment %}
<p> <ul>

     <li>location - http location to post the form</li>

     <li>prependServletContext (true|false) -  when location is relative, controls if to add Servlet Context, default "true"</li>

     <li>actionName - action name to post the form (resolved as an expression)</li>

     <li>namespace - action's namespace to use (resolved as an expression)</li>

     <li>method - actions' method to use (resolved as an expression)</li>

     <li>cache (true|false) - when set to true adds cache control headers, default "true"</li>

     <li>parse (true|false) - when set to true actionName, namespace and method are parsed, default "true"</li>

 </ul>
</p>
{% comment %}end snippet id=params|javadoc=true|url=org.apache.struts2.result.PostbackResult {% endcomment %}

## Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.PostbackResult {% endcomment %}


```xml

 <action name="registerThirdParty" >

   <result type="postback">https://www.example.com/register</result>

 </action>



 <action name="registerThirdParty" >

   <result type="postback">

     <param name="namespace">/secure</param>

     <param name="actionName">register2</param>

   </result>

 </action>


```


{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.PostbackResult {% endcomment %}
