---
layout: core-developers
title: Redirect Action Result
---

# Redirect Action Result



~~~~~~~
{% snippet id=description|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult %}
~~~~~~~


See [ActionMapper](action-mapper.html) for more details

| 

####Parameters####



~~~~~~~
{% snippet id=params|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult %}
~~~~~~~

####Examples####



~~~~~~~
{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.result.ServletActionRedirectResult %}
~~~~~~~



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
