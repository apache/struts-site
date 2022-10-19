---
layout: default
title: Redirect Action Result
parent:
    title: Result types
    url: result-types
---

# Redirect Action Result

This result uses the `ActionMapper` provided by the `ActionMapperFactory` to redirect the browser to a URL that invokes 
the specified action and (optional) namespace. This is better than the `ServletRedirectResult` because it does not require 
you to encode the URL patterns processed by the `ActionMapper` in to your struts.xml configuration files. This means 
you can change your URL patterns at any point and your application will still work. It is strongly recommended that if you 
are redirecting to another action, you use this result rather than the standard redirect result.

See examples below for an example of how request parameters could be passed in.

See [ActionMapper](action-mapper) for more details

## Parameters

- `actionName` (default) - The name of the action that will be redirected to.
- `namespace` - Used to determine which namespace the action is in that we're redirecting to. If namespace is null, 
  the default will be the current namespace.
- `suppressEmptyParameters` - Optional boolean (defaults to false) that can prevent parameters with no values from being
  included in the redirect URL.
- `parse` - Boolean, true by default. If set to false, the actionName param will not be parsed for OGNL expressions.
- `anchor` - Optional. Also known as "fragment" or colloquially as "hash". You can specify an anchor for a result.

## Examples

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
   /genReport/generateReport.action?reportType=pie&amp;width=100&amp;height=100#summary
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

```xml
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
```
