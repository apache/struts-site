---
layout: default
title: Announcements
---
# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2016.html">Announcements - 2016</a>
</p>

#### 3 February 2016 - Struts 2.5.10 General Availability {#a20170203}

The Apache Struts group is pleased to announce that Struts 2.5.10 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - Included XSL files' URI not being resolved for actions with result `type="xslt"`, see WW-2561
 - `ConcurrentModificationException` using `s:iterator` (intermittent), see WW-3019
 - `ObjectFactory` reporting ERROR's when you attempt to set parameters on a Redirect result, see WW-3170
 - preselect values in `<s:optgroup>`, see WW-4367
 - File upload error message always in default language, see WW-4636
 - Can no longer clear parameter on a `<s:url>` tag, see WW-4701
 - List based parameters no longer work when there is only one value, see WW-4702
 - `NullPointerException` in `ActionSupport` when use `ModelDriven`, see WW-4703
 - Multiselect parameter behavior different between struts 2.5.5 and 2.5.1, see WW-4707 
 - Invalid field value for field "id", see WW-4709
 - Scope interceptor always resets because of `org.apache.struts2.dispatcher.HttpParameters`, see WW-4715
 - `focusElement` form attribute not working, see WW-4718
 - Portlet Issue with `I18Interceptor`, see WW-4722
 - Allow `<constant/>` value substitution in XML configuration, see WW-4698
 - Upgrade to latest OGNL version, see WW-4704
 - Add support for long type to `<s:date>` tag, see WW-4705
 - Disallow access to `HttpParameters.toMap`, see WW-4710
 - `<s:text/>` tag should not evaluate `defaultMessage` against a `ValueStack` by default, see WW-4711
 - `TextProviderHelper#getText()` should perform cleaning of `defaultMessage`, see WW-4712
 - Refactor file upload support to allow create virtual representation of `java.io.File`, see WW-4717
 - Move `DefaultClassFinder` into `Convention` plugin, see WW-4719
 - `HttpParameters` should behave like a `Map`, see WW-4720
 - Add support for `roundingMode` in `<s:number/>` tag, see WW-4721

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

<p class="pull-right">
  Skip to: <a href="announce-2016.html">Announcements - 2016</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
