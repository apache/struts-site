---
layout: core-developers
title: Redirect Result
---

# Redirect Result



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult {% endcomment %}
<p> <p>
 Calls the {@link HttpServletResponse#sendRedirect(String) sendRedirect}
 method to the location specified. The response is told to redirect the
 browser to the specified location (a new request from the client). The
 consequence of doing this means that the action (action instance, action
 errors, field errors, etc) that was just executed is lost and no longer
 available. This is because actions are built on a single-thread model. The
 only way to pass data is through the session or with web parameters
 (url?name=value) which can be OGNL expressions.
 </p></p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult {% endcomment %}

####Parameters####



{% comment %}start snippet id=params|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult {% endcomment %}
<p> 
 <ul>
 
 <li><b>location (default)</b> - the location to go to after execution.</li>
 
 <li><b>parse</b> - true by default. If set to false, the location param will
 not be parsed for Ognl expressions.</li>
 
 <li><b>anchor</b> - Optional.  Also known as "fragment" or colloquially as 
 "hash".  You can specify an anchor for a result.</li>
 </ul>
 
 <p>
 This result follows the same rules from {@link StrutsResultSupport}.
 </p>
 </p>
{% comment %}end snippet id=params|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult {% endcomment %}

####Examples####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult {% endcomment %}

```xml
 <!--
   The redirect URL generated will be:
   /foo.jsp#FRAGMENT
 -->
 <result name="success" type="redirect">
   <param name="location">foo.jsp</param>
   <param name="parse">false</param>
   <param name="anchor">FRAGMENT</param>
 </result>
```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult {% endcomment %}



~~~~~~~
<package name="passingRequestParameters" extends="struts-default" namespace="/passingRequestParameters">
   <-- Pass parameters (reportType, width and height) -->
   <!--
   The redirect url generated will be - the namespace of current acction will be appended as location doesn't start with "/":
   /passingRequestParameters/generateReport.jsp?reportType=pie&width=100&height=100#summary
   -->
   <action name="gatherReportInfo" class="...">
      <result name="showReportResult" type="redirect">
         <param name="location">generateReport.jsp</param>
         <param name="reportType">pie</param>
         <param name="width">100</param>
         <param name="height">100</param>
         <param name="parse">false</param>
         <param name="anchor">summary</param>
      </result>
   </action>
</package>

~~~~~~~
