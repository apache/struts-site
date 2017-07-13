---
layout: default
title: Announcements
---
# Announcements
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2016.html">Announcements - 2016</a>
</p>

#### 17 July 2017 - Struts 2.5.12 General Availability {#a20170717}

The Apache Struts group is pleased to announce that Struts 2.5.12 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains fixes for the following potential security vulnerabilities:

 - [S2-047](/docs/s2-047.html)
   Possible DoS attack when using URLValidator
 - [S2-049](/docs/s2-049.html)
   A DoS attack is available for Spring secured actions,

Except the above this release also contains several improvements just to mention few of them:

 - `double` and `Double` are not validated with the same decimal separator
 - `ognl.MethodFailedException` when you do not enter a value for a field mapped to an int
 - `Double` Value Conversion with requestLocale=de
 - The `TextProvider` injection in `ActionSupport` isn't quite integrated into the framework's core DI
 - Struts2 raise `java.lang.ClassCastException` when Result type is `chain`
 - `@InputConfig` annotation is not working when integrating with spring aop
 - Validators do not work for multiple values
 - `BigDecimal` are not converted according context locale
 - `NullPointerException` when displaying a form without action attribute
 - Http Sessions forcefully created for all requests using I18nInterceptor with default Storage value.
 - `cssErrorClass` attribute has no effect on `label` tag
 - Why `JSONValidationInterceptor` return Status Code `400 BAD_REQUEST` instead of `200 SUCCESS`
 - @autowired does not work since Struts 2.3.28.1
 - Mixed content https to http when upgraded to 2.3.32 or 2.5.10.1
 - Upgrade from struts2-tiles3-plugin to struts2-tiles-plugin gives a NoSuchDefinitionException
 - Aspects are not executed when chaining AOPed actions
 - Duplicate hidden input field checkboxListHandler
 - The value of checkbox getted in server-side is "false" when no any checkbox been selected.
 - refactor file upload framework
 - `creditCard` validator available in Struts 1 missing in Struts 2
 - No easy way to have an empty interceptor stack if have default stack
 - `@TypeConversion` converter attribute to class
 - Convert `LocalizedTextUtil` into a bean with default implementation
 - NPE in `StrutsTilesContainerFactory` when resource isn't found
 - Buffer/Flush behaviour in `FreemarkerResult`
 - Struts2 should know and consider config time class of user's Actions
 - getters of exclude-sets in OgnlUtil should return immutable collections
 - Mark `site-graph` plugin as deprecated
 - Use `TextProviderFactory` instead of `TextProvider` as bean's dependency
 - Create `LocaleProviderFactory` and uses instead of `LocaleProvider`
 - Improve error logging in `DefaultDispatcherErrorHandler`
 - Make `jakarta-stream` multipart parser more extensible
 - Make Multipart parsers more extensible
 - Add proper validation if request is a multipart request
 - Make `SecurityMethodAccess` excluded classes & packages definitions immutable
 - Upgrade to Log4j2 2.8.2
 - Allow disable file upload support via an configurable option
 - Stop using `DefaultLocalizedTextProvider#localeFromString` static util method
 - Don't add `JBossFileManager` as a possible FileManager when not on JBoss
 - There is no `@LongRangeFieldValidator` annotation to support `LongRangeFieldValidator`
 - Upgrade to commons-lang 3.6
 - Update commons-fileupload

> Please read the [Version Notes](/docs/version-notes-2512.html) to find more details about performed bug fixes and improvements.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 9 July 2017 - Possible RCE in the Struts Showcase app in the Struts 1 plugin example in the Struts 2.3.x series {#a20170707}

A potential security vulnerability was reported in the Struts 1 plugin used in the Struts 2.3.x series.
It is possible to perform a Remote Code Execution attack if given construction exists in the vulnerable
application. Please read the security bulletin for more details and inspect your application.

 - [S2-048](/docs/s2-048.html)
   Possible RCE in the Struts Showcase app in the Struts 1 plugin example in Struts 2.3.x series

NOTE: Please notice that this vulnerability does not affect applications using Struts 2.5.x series 
or applications that do not use the Struts 1 plugin. Even if the plugin is available but certain code 
construction is not present, your application is safe.

#### 23 march 2017 - Struts Extras secure Multipart plugins General Availability - versions 1.1 {#a20170323}

The Apache Struts group is pleased to announce that the Apache Struts 2 Secure Jakarta Multipart parser plugin 1.1 
and Apache Struts 2 Secure Jakarta Stream Multipart parser plugin 1.1 are available as a "General Availability"
release. The GA designation is our highest quality grade.

These releases address one critical security vulnerability:

- Possible Remote Code Execution when performing file upload based on Jakarta Multipart parser
  [S2-045](/docs/s2-045.html), [S2-046](/docs/s2-046.html)

Those plugins were released to allow users running older versions of the Apache Struts secure their applications
in an easy way. You don't have to migrate to the latest version (which is still preferable) but by applying one of those 
plugins,  your application won't be vulnerable anymore.

Please read the [README](https://github.com/apache/struts-extras) for more details and supported Apache Struts versions.

**All developers are strongly advised to perform this action.**

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download those plugins from our [download](download.cgi#struts-extras) page.

#### 20 march 2017 - Struts Extras secure Multipart plugins General Availability {#a20170320}

The Apache Struts group is pleased to announce that the Apache Struts 2 Secure Jakarta Multipart parser plugin 
and Apache Struts 2 Secure Jakarta Stream Multipart parser plugin are available as a "General Availability"
release. The GA designation is our highest quality grade.

These releases address one critical security vulnerability:

- Possible Remote Code Execution when performing file upload based on Jakarta Multipart parser
  [S2-045](/docs/s2-045.html), [S2-046](/docs/s2-046.html)

Those plugins were released to allow users running older versions of the Apache Struts secure their applications in easy way.
You don't have to migrate to the latest version (which is still preferable) but by applying one of those plugins, 
your application won't be vulnerable anymore.

It is a drop-in installation, just select a proper jar file and copy it to `WEB-INF/lib` folder.
Please read the [README](https://github.com/apache/struts-extras) for more details and supported Apache Struts versions.

**All developers are strongly advised to perform this action.**

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download those plugins from our [download](download.cgi#struts-extras) page.

#### 7 march 2017 - Struts 2.5.10.1 General Availability {#a20170307}

The Apache Struts group is pleased to announce that Struts 2.5.10.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses one potential security vulnerability:

- Possible Remote Code Execution when performing file upload based on Jakarta Multipart parser - [S2-045](/docs/s2-045.html)

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 7 march 2017 - Struts 2.3.32 General Availability {#a20170307-2}

The Apache Struts group is pleased to announce that Struts 2.3.32 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses one potential security vulnerability:

- Possible Remote Code Execution when performing file upload based on Jakarta Multipart parser - [S2-045](/docs/s2-045.html)

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

#### 3 February 2017 - Struts 2.5.10 General Availability {#a20170203}

The Apache Struts group is pleased to announce that Struts 2.5.10 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - How to handle 404 when using wildcard instead of error 500 when the wildcard method doesn't exist
 - MessageStoreInterceptor must handle all redirects
 - `MaxMultiPartUpload` limited to 2GB (Long --> Integer)
 - `JSONValidationInterceptor` change static parameters names
 - `ServletDispatcherResult` can't handle parameters anymore
 - `TokenInterceptor` synchronized on `session.getId().intern()`
 - XSLT error during transformation
 - No default parameter defined for result `json` of type `org.apache.struts2.json.JSONResult`
 - `I18Interceptor` ignores session or cookie Locale after first lookup failure
 - `EmailValidator` does not accept new domain suffixes
 - `AnnotationValidationInterceptor` : `NullPointerException` when method is null
 - `struts.xml` include not loading in dependant jar files
 - `AnnotationValidationInterceptor` should consult `UnknownHandler` before throwing `NoSuchMethodException`
 - `ActionSupport.LOG` should be private
 - Remove `StrutsObjectFactory` and define `StrutsInterceptorFactory` instead
 - Make `OgnlValueStack` and `OgnlValueStackFactory` More Extensible
 - Make interceptor parameters dynamic
 - allow include other config files from classpath

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
