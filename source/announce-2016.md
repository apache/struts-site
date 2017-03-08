---
layout: default
title: Announcements 2016
---
# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2015.html">Announcements - 2015</a>
</p>

#### 19 December 2016 - Struts 2.5.8 General Availability {#a20161219}

The Apache Struts group is pleased to announce that Struts 2.5.8 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release addresses one potential security vulnerability:

- Possible DoS attack when using URLValidator - [S2-044](/docs/s2-044.html)

Also this release contains several breaking changes and improvements just to mention few of them:

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

#### 21 October 2016 - Struts 2.5.5 General Availability {#a20161021}

The Apache Struts group is pleased to announce that Struts 2.5.5 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - webconsole can always be accessed, see WW-4601
 - Space character and includeParams, see WW-4628
 - Empty <s:param name="p1" value=""/> is being supressed, see WW-4631
 - remove ASM 3 from struts2, see WW-4646
 - SMI do not work with JSON plugin, see WW-4649
 - Concurrency issue in addDefaultResourceBundle, see WW-4652
 - Action parameters should be included when building the URL to action, see WW-4654
 - StreamResult closes outputstream early, see WW-4662
 - NullPointerException when displaying a form without action attribute, see WW-4663
 - ParametersInterceptor excludeParams only applies to first instance of params interceptor in paramsPrepareParamsStack, see WW-4667
 - URL validator is case sensitive, see WW-4671
 - Select box does not pre-select chosen values, see WW-4675
 - Tiles-Plugin unable to load tiles definition XML, see WW-4679
 - Missing brackets in checkbox.ftl of css_xhtml template, see WW-4681
 - Move Struts Archetypes to dedicated project, see WW-4316
 - Add dedicated class to represent Http Parameters, see WW-4572
 - ParametersInterceptor should check collection index to against DOS, see WW-4620
 - Move example portlet-app into struts-examples, see WW-4660
 - Upgrade JFreeChart plugin to the latest version of JFreeChart, see WW-4670
 - StrutsPrepareAndExecuteFilter should check for response commited status, see WW-4674
 - ConversionErrorInterceptor to extend MethodFilterInterceptor, see WW-4676
 - I18N Interceptor automatically validates Locale, see WW-4677
 - Upgrade Tiles to 3.0.7 GA version, see WW-4680
 - Allow directly accessing I18N keys from Tiles defintions, see WW-4685
 - Merge two existing I18NInterceptors into one, see WW-4686
 - Exclude "java.ext.dirs" when scanning for actions, see WW-4688
 - CycleDetector - use enum instead of String constants, see WW-4689
 - Upgrade Commons Collections to 4.1, see WW-4695
 - Upgrade to Log4j 2.7, see WW-4696
 - Warn about excluded action/method only when DMI is disabled, see WW-4697

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 18 October 2016 - Struts 2.3.31 General Availability {#a20161018}

The Apache Struts group is pleased to announce that Struts 2.3.31 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release addresses two potential security vulnerabilities:

- Possible path traversal in the Convention plugin [S2-042](/docs/s2-042.html)
- Using the Config Browser plugin in production [S2-043](/docs/s2-043.html)

Also this release contains several breaking changes and improvements just to mention few of them:

- webconsole can always be accessed, see WW-4601
- Space character and includeParams,see WW-4628
- ParametersInterceptor excludeParams only applies to first instance of params interceptor in paramsPrepareParamsStack,see WW-4667
- Select box does not pre-select chosen values,see WW-4675
- StrutsPrepareAndExecuteFilter should check for response committed status,see WW-4674
- Allow directly accessing I18N keys from Tiles definitions,see WW-4685

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

#### 7 July 2016 - Struts 2.5.2 General Availability {#a20160707}

The Apache Struts group is pleased to announce that Struts 2.5.2 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Struts 2.5.2 release contains several improvements just to mention few of them:

 - SecurityMemberAccess exclude class design issue, see WW-4645
 - Json deserialization does not work in 2.5.1, see WW-4650
 - Negative number is considered an arithmetic expression, see WW-4651
 - Wildcard redirect and path `/static/`, see WW-4656
 - Upgrade commons-fileupload to the latest version, see WW-4648
 - Cleans up logic in `StreamResult` and update docs, see WW-4655

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 7 July 2016 - Struts 2.3.30 General Availability {#a20160707-2}

The Apache Struts group is pleased to announce that Struts 2.3.30 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - Pre-evaluation of "name" attribute stopped working, see WW-4641
 - Unable to retrieve `s:hidden` field values, see WW-4642
 - SecurityMemberAccess exclude class design issue, see WW-4645
 - Negative number is considered an arithmetic expression, see WW-4651
 - Upgrade commons-fileupload to the latest version, see WW-4648

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-2330) page.

#### 18 June 2016 - Struts 2.5.1 General Availability {#a20160618}

The Apache Struts group is pleased to announce that Struts 2.5.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release addresses one potential security vulnerability:

  - [S2-041](/docs/s2-041.html)
    Possible DoS attack when using URLValidator

Also all security patches applied to version Struts 2.3.29 were also applied to this version (just in case).

This release contains several improvements just to mention few of them:

 - contentType override ignored for JSONInterceptor - see WW-4558
 - MessageStorePreResultListener does not store messages for 3rd-party RedirectResult subclasses - see WW-4618
 - EmailValidator flags .cat emails as invalid - see WW-4626
 - SMI cannot be disabled - see WW-4632
 - Centre alignment does not seem to work in Velocity tags - see WW-4634
 - Unable to process Jar entry (javassist-3.20.0-GA.jar) - see WW-4637
 - Strict Method Invocation breaks Action-Less Results - see WW-4643
 - When method is not allowed throw exception with meaningful message - see WW-4640
 - update struts2 bom - see WW-4644

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 17 June 2016 - Struts 2.3.29 General Availability with Security Fixes Release {#a20160617}

The Apache Struts group is pleased to announce that Struts 2.3.29 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release addresses these potential security vulnerabilities:

  - [S2-035](/docs/s2-035.html)
    Action name clean up is error prone

  - [S2-036](/docs/s2-036.html)
    Forced double OGNL evaluation, when evaluated on raw user input in tag attributes,
    may lead to remote code execution (similar to S2-029)

  - [S2-037](/docs/s2-037.html)
    Remote Code Execution can be performed when using REST Plugin.

  - [S2-038](/docs/s2-038.html)
    It is possible to bypass token validation and perform a CSRF attack

  - [S2-039](/docs/s2-039.html)
    Getter as action method leads to security bypass

  - [S2-040](/docs/s2-040.html)
    Input validation bypass using existing default action method.

  - [S2-041](/docs/s2-041.html)
    Possible DoS attack when using URLValidator

This release contains several breaking changes and improvements just to mention few of them:

 - Json result type breaks
 - MessageStorePreResultListener doesn't store messages for 3rd-party RedirectResult subclasses
 - Multiple tiles.xml in web.xml
 - New Tiles version can not find tiles*.xml files in sub-directories
 - EmailValidator flags .cat emails as invalid
 - Struts2 JSON Plugin: messages in fieldsErrors are serialized twice since jdk1.7_80
 - Tile definition Inheritance/overriding is broken in Struts2 tiles plugin 2.3.28+
 - `<s:submit>` generates a value attribute for type=image which violates W3C
 - ClassCastException while generating report using Struts 2.3.28 and jasperreports 4.5.1

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 1 June 2016 - Two security vulnerabilities reported {#a20160601}

Two potential security vulnerabilities were reported which were already addressed in the latest Apache Struts 2 versions.
Those reports just added other vectors of attack.

 - [S2-033](/docs/s2-033.html)
   Remote Code Execution can be performed when using REST Plugin with ! operator when Dynamic Method Invocation is enabled

 - [S2-034](/docs/s2-034.html)
   OGNL cache poisoning can lead to DoS vulnerability

Please read carefully the Security Bulletins and take suggested actions. The simplest way to avoid those vulnerabilities
in your application is to upgrade the Apache Struts to latest available version in 2.3.x series or to the Apache Struts 2.5.

You can download those versions from our [download](download.cgi#struts-ga) page.

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

You can download this version from our [download](download.cgi#struts-ga) page.

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

You can download this version from our [download](download.cgi#struts-ga) page.

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

You can download these versions from our [download](download.cgi#prior-releases) page.

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
