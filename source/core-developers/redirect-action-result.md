---
layout: core-developers
title: Redirect Action Result
---

# Redirect Action Result



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult {% endcomment %}
<p> <p>
 This result uses the {@link ActionMapper} provided by the
 ActionMapperFactory to redirect the browser to a URL that invokes the
 specified action and (optional) namespace. This is better than the
 {@link ServletRedirectResult} because it does not require you to encode the
 URL patterns processed by the {@link ActionMapper} in to your struts.xml
 configuration files. This means you can change your URL patterns at any point
 and your application will still work. It is strongly recommended that if you
 are redirecting to another action, you use this result rather than the
 standard redirect result.
 </p>

 <p>
 See examples below for an example of how request parameters could be passed
 in.
 </p></p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult {% endcomment %}


See [ActionMapper](action-mapper.html) for more details

| 

####Parameters####



{% comment %}start snippet id=params|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult {% endcomment %}
<p>
 <ul>
 <li><b>actionName (default)</b> - The name of the action that will be
 redirected to.</li>
 <li><b>namespace</b> - Used to determine which namespace the action is in
 that we're redirecting to.  If namespace is null, the default will be the
 current namespace.</li>
 <li><b>suppressEmptyParameters</b> - Optional boolean (defaults to false) that
 can prevent parameters with no values from being included in the redirect
 URL.</li>
 <li><b>parse</b> - Boolean, true by default.  If set to false, the actionName
 param will not be parsed for Ognl expressions.</li>
 <li><b>anchor</b> - Optional.  Also known as "fragment" or colloquially as
 "hash".  You can specify an anchor for a result.</li>
 </ul>
</p>
{% comment %}end snippet id=params|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult {% endcomment %}

####Examples####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult {% endcomment %}

```xml
 <package name="public" extends="struts-default">
     <action name="login" class="...">
         <!-- Redirect to another namespace -->
         <result type="redirectAction">
             <param name="actionName">dashboard</param>
             <param name="namespace">/secure</param>
         </result>
     </action>
 </package>

 <package name="secure" extends="struts-default" namespace="/secure">
     <-- Redirect to an action in the same namespace -->
     <action name="dashboard" class="...">
         <result>dashboard.jsp</result>
         <result name="error" type="redirectAction">error</result>
     </action>

     <action name="error" class="...">
         <result>error.jsp</result>
     </action>
 </package>

 <package name="passingRequestParameters" extends="struts-default" namespace="/passingRequestParameters">
    <!-- Pass parameters (reportType, width and height) -->
    <!--
    The redirectAction url generated will be :
    /genReport/generateReport.action?reportType=pie&width=100&height=100#summary
    -->
    <action name="gatherReportInfo" class="...">
       <result name="showReportResult" type="redirectAction">
          <param name="actionName">generateReport</param>
          <param name="namespace">/genReport</param>
          <param name="reportType">pie</param>
          <param name="width">100</param>
          <param name="height">100</param>
          <param name="empty"></param>
          <param name="suppressEmptyParameters">true</param>
          <param name="anchor">summary</param>
       </result>
    </action>
 </package>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult {% endcomment %}



~~~~~~~
<!--
	Example of "anchor" param usage in conjunction with "redirectAction" result-type.

	Generated URL: /displayReport.action#SUMMARY
-->

<action name="displayReport">
	<result>/jsp/displayReport.jsp</result>
</action>

<action name="financeReport" class="com.mycompany.reports.FinanceReportAction"> 
	<result name="input">/jsp/index.jsp</result>            
	<result name="success" type="redirectAction">
		<param name="actionName">displayReport</param>
		<param name="parse">false</param>
		<param name="anchor">SUMMARY</param>
	</result>
</action>

~~~~~~~
