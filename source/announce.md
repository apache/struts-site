---
layout: default
title: Announcements
---
# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2014.html">Announcements - 2014</a>
</p>

#### 7 May 2015 - Struts 2.3.24 General Availability {#a20150507}

The Apache Struts group is pleased to announce that Struts 2.3.24 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several fixes and improvements just to mention few of them:

 - security fix from 2.3.20.1 is included
 - fixed flow in `DefaultActionInvocation` and when using the Convention Plugin
 - defined new plugin to support Java 8, check Java 8 Support Plugin
 - fixed problem with `style` attribute
 - fixed problem with converting values from `ActionContext`
 - converters are again applied to values coming from the context
 - `struts.ognl.allowStaticMethodAccess` works again
 - fixed memory leak in CDI plugin
 - fixed problem with hidden field which silently drops `label` attribute
 - fixed parameters encoding in `ServletRedirectAction` before checking for valid URI
 - `css_xhtml` hidden input adding table row markup
 - FreeMarker was upgraded to the latest available version - 2.3.22
 - support for Log4j2 was added 

and many other improvements, please check the version notes

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework,
please post your comments to the user list, and, if appropriate, file a tracking ticket.

#### 6 May 2015 - Struts 2.3.20.1 General Availability with Security Fix Release {#a20150506}

The Apache Struts group is pleased to announce that Struts 2.3.20.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

One medium security issue was solved with this release:

  - [S2-024](/docs/s2-024.html)
    Wrong `excludeParams` overrides those defined in `DefaultExcludedPatternsChecker`

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework,
please post your comments to the user list, and, if appropriate, file a tracking ticket.

<p class="pull-right">
  Skip to: <a href="announce-2014.html">Announcements - 2014</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
