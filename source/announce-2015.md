---
layout: default
title: Announcements 2015
---

# Announcements 2015

<p class="pull-right">
  Skip to: <a href="announce-2014.html">Announcements - 2014</a>
</p>

#### 1 October 2015 - Struts 2.5-BETA2 (BETA) {#a20151001}

The Apache Struts group is pleased to announce that Struts 2.5-BETA2 is available as a "BETA" release.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - New security option was added - Strict Method Invocation (also known as Strict DMI), see WW-4540
 - Add support for latest stable AngularJS in Maven archetype, see WW-4522   

and many other improvements, please check the version notes

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments 
to the user list, and, if appropriate, file a tracking ticket.

#### 24 September 2015 - Struts 2.3.24.1 General Availability with Security Fix Release {#a20150924}

The Apache Struts group is pleased to announce that Struts 2.3.24.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

One medium security issue was solved with this release:

  - [S2-026](/docs/s2-026.html)
    Special `top` object can be used to access Struts' internals

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework,
please post your comments to the user list, and, if appropriate, file a tracking ticket.

#### 26 August 2015 - Security Bulletin S2-025 {#a20150826}

The Apache Struts group is pleased to announce that a new security bulletin was published - 
[S2-025](/docs/s2-025.html)

Thanks to Taki Uchiyama from JPCERT/CC who reported two potential XSS vulnerabilities available 
in older versions of The Apache Struts 2. Please read the mentioned security bulletin for more details
and also reading our [Security guideline](/docs/security.html) will help you secure your application 

#### 31 July 2015 - Struts 2.5-BETA1 (BETA) {#a20150731}

The Apache Struts group is pleased to announce that Struts 2.5-BETA1 is available as a "BETA"
release.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - XWork source was merged into Struts Core source, it means that there be no more xwork artifact nor dedicated jar
 - OGNL was upgraded to version 3.0.11 and it breaks access to properties as it follows Java Bean Specification, see WW-4207 and WW-3909
 - Spring dependency for tests and spring plugin was upgraded to version 4.1.6, see WW-4510.
 - Struts2 internal logging api was marked as deprecated and was replaced with new Log4j2 api as logging layer, see WW-4504.
 - Struts2 is now build with JDK7, see WW-4503.
 - New plugin to support bean validation is now part of the distribution, see WW-4505.
 - Deprecated plugins are now removed from the distribution and are not longer supported anymore:
   - Dojo Plugin
   - Codebehind Plugin
   - JSF Plugin
   - Struts1 Plugin

and many other improvements, please check the version notes

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework,
please post your comments to the user list, and, if appropriate, file a tracking ticket.

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
