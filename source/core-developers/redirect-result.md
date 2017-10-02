---
layout: core-developers
title: Redirect Result
---

# Redirect Result



{% snippet id=description|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult %}

####Parameters####



{% snippet id=params|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult %}

####Examples####



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.ServletRedirectResult %}



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