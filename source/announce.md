---
layout: default
title: Announcements
---
# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2015.html">Announcements - 2015</a>
</p>

#### 9 May 2016 - Struts 2.5 General Availability {#a20160509}

The Apache Struts group is pleased to announce that Struts 2.5 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - XWork source was merged into Struts Core source, it means that there be no more xwork artifact nor dedicated jar
 - Spring dependency for tests and spring plugin was upgraded to version 4.1.6, see WW-4510.
 - Struts2 internal logging api was marked as deprecated and was replaced with new Log4j2 api as logging layer, see WW-4504.
 - Struts2 is now build with JDK7, see WW-4503.
 - New plugin to support bean validation is now part of the distribution, see WW-4505.
 - Deprecated plugins are now removed from the distribution and are not longer supported anymore.
   - Dojo Plugin
   - Codebehind Plugin
   - JSF Plugin
   - Struts1 Plugin
 - New security option was added - Strict Method Invocation (also known as Strict DMI), see WW-4540
 - Added support for latest stable AngularJS in Maven archetype, see WW-4522
 - Dropped support for id and name - replaced with var, see WW-2069
 - Dedicated archive with a minimal set of dependencies was introduced, see WW-4570
 - It is possible to use multiple names when defining a result, see WW-4590
 - Rest plugin honors Accept header, see WW-4588
 - New result 'JSONActionRedirectResult' in json-plugin was defined, see WW-4591
 - Tiles plugin was upgrade to the latest Tiles 3 and tiles3-plugin was dropped, see WW-4584
 - JasperReports plugins was upgraded to JasperReport 6.0, see WW-4381
 - OGNL was upgraded to version 3.1.4 and it breaks access to properties as it follows Java Bean Specification, see WW-4207 and WW-3909
 - Annotations to configure Tiles, see WW-4594 and Tiles Plugin

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.html#struts-ga) page.

#### 19 April 2016 - Struts 2.3.28.1 General Availability with Security Fixes Release {#a20160419}

The Apache Struts group is pleased to announce that Struts 2.3.28.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release addresses two potential security vulnerabilities:

  - [S2-031](/docs/s2-031.html)
    Possible RCE vulnerability in `XSLTResult` was fixed.

  - [S2-032](/docs/s2-032.html)
    Prevents execution of chained expressions based on new `isSequence` flag introduce in appropriated OGNL versions.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.html#struts-ga) page.

#### 19 April 2016 - Struts 2.3.20.3 & 2.3.24.3 General Availability with Security Fixes Release {#a20160419-1}

The Apache Struts group is pleased to announce that Struts 2.3.20.3 & Struts 2.3.24.3 are available as a "General Availability"
releases. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

These releases address three potential security vulnerabilities:

  - [S2-029](/docs/s2-029.html)
    Forced double OGNL evaluation, when evaluated on raw user input in tag attributes, may lead to remote code execution.

  - [S2-031](/docs/s2-031.html)
    Possible RCE vulnerability in `XSLTResult` was fixed.

  - [S2-032](/docs/s2-032.html)
    Prevents execution of chained expressions based on new `isSequence` flag introduce in appropriated OGNL versions.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download these versions from our [download](download.html#prior-releases) page.

#### 18 March 2016 - Struts 2.3.28 General Availability with Security Fix Release {#a20160318}

The Apache Struts group is pleased to announce that Struts 2.3.28 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release addresses three potential security vulnerabilities:

  - [S2-028](/docs/s2-028.html)
    Possible XSS vulnerability in pages not using UTF-8 was fixed.

  - [S2-029](/docs/s2-029.html)
    Forced double OGNL evaluation, when evaluated on raw user input in tag attributes, may lead to remote code execution.

  - [S2-030](/docs/s2-030.html)
    I18NInterceptor narrows selected locale to those available in JVM to reduce possibility of another XSS vulnerability.

**All developers are strongly advised to perform this action.**


This release contains several breaking changes and improvements just to mention few of them:

 - New Configurationprovider type was introduced - ServletContextAwareConfigurationProvider, see WW-4410
 - Setting status code in HttpHeaders isn't ignored anymore, see WW-4545
 - Spring BeanPostProcessor(s) are called only once to constructed objects., see WW-4554
 - OGNL was upgraded to version 3.0.13, see WW-4562
 - Tiles 2 Plugin was upgraded to latest available Tiles 2 version, see WW-4568
 - A dedicated assembly with minimal set of jars was defined, see WW-4570
 - Struts2 Rest plugin properly handles JSESSIONID with DMI, see WW-4585
 - Improved the Struts2 Rest plugin to honor Accept header, see WW-4588
 - MessageStoreInterceptor was refactored to use PreResultListener to store messages, see WW-4605
 - A new annotation was added to support configuring Tiles - @TilesDefinition, see WW-4606

and many other improvements, please check the version notes

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

#### 26 January 2016 - Struts 2.5-BETA3 (BETA) {#a20160126}

The Apache Struts group is pleased to announce that Struts 2.5-BETA3 is available as a "BETA" release.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - Dropped support for id and name - replaced with var, see WW-2069
 - Dedicated archive with a minimal set of dependencies was introduced, see WW-4570
 - It is possible to use multiple names when defining a result, see WW-4590
 - Rest plugin honors Accept header, see WW-4588
 - New result 'JSONActionRedirectResult' in json-plugin was defined, see WW-4591
 - Tiles plugin was upgrade to the latest Tiles 3 and tiles3-plugin was dropped, see WW-4584
 - JasperReports plugins was upgraded to JasperReport 6.0, see WW-4381
 - OGNL was upgraded to version 3.0.11 and it breaks access to properties as it follows Java Bean Specification,
   see WW-4207 and WW-3909
   - and then OGNL was upgraded to version 3.1.1, see WW-4561
   - and then OGNL was upgraded to version 3.2.1, see WW-4577

and many other improvements, please check the version notes

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments 
to the user list, and, if appropriate, file a tracking ticket.

<p class="pull-right">
  Skip to: <a href="announce-2015.html">Announcements - 2015</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
