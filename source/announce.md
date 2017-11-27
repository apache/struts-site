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

#### 23 November 2017 - Struts 2.5.14 General Availability {#a20171123}

The Apache Struts group is pleased to announce that Struts 2.5.14 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

- A class JSONWriter was converted into an interface with default implementation in DefaultJSONWriter class. If you were 
  using the class directly, you must update your code in other case it won't compile when using Struts 2.5.14.
- DefaultUrlHelper().buildUrl() not outputting port when used as parameter
- Not able to convert Spring object to the JSON response
- The if test can accidently incorrectly assign a new value to an object
- ObjectFactory constructor signature change breaks extensions
- Snippets in Struts documentation are missing
- I am migrating my struts 2.2.x to 2.5.13 and where all used struts taglibs and tags UI is breaking where i have not used bootstrap there and all working fine
- Default Multipart validation regex is invalid due to charset encoding
- Exception starting filter struts-prepare: Unable to load configuration. - interceptor - vfs
- createInstance method signature change of TextProviderFactory from merged xwork-core code inside struts2-core-2.5.13.jar which was present with xwork-core jar
- Struts2.5.13 can't run in java9 win10
- StringConverter from OGNL 3.1.15 in Struts 2.5.13
- Decimal converters should avoid loss of user's data caused by rounding
- Struts text tag doesn't print value from Stack
- No validations happening after upgrading to Struts 2.5.12
- Allow to use custom JSONwriter
- Implement Dependency Check in Maven build
- Fallback to ActionContext if container is null in ActionSupport
- Upgrade to the latest Jetty plugin in all examples
- Add missing header with license to all files reported by the Rat plugin
- Review available interceptors and document the missing ones
- Fetch docs from new locations
- Allow define only TextProvider instead of providing the whole TextProviderFactory
- HTML escaping on the text tag
- Upgrade FreeMarker to version 2.3.26-incubating
- Upgrade to Log4j2 2.9.1
- Upgrade com.fasterxml.jackson to version 2.8.2
- Upgrade net.sf.json-lib to version 2.4
- Upgrade Spring to version 4.1.9

> Please read the [Version Notes]({{ site.wiki_url }}Version+Notes+2.5.14) to find more details about performed bug fixes and improvements.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 07 September 2017 - Struts 2.3.34 General Availability {#a20170907}

The Apache Struts group is pleased to announce that Struts 2.3.34 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses two potential security vulnerabilities:

 - [S2-050](/docs/s2-050.html)
    A regular expression Denial of Service when using URLValidator (similar to S2-044 & S2-047)
 - [S2-051](/docs/s2-051.html)
   A remote attacker may create a DoS attack by sending crafted xml request when using the Struts REST plugin
 - [S2-052](/docs/s2-052.html)
   Possible Remote Code Execution attack when using the Struts REST plugin with XStream handler to handle XML payloads
 - [S2-053](/docs/s2-053.html)
   A possible Remote Code Execution attack when using an unintentional expression in Freemarker tag instead of string literals
   
Also this version resolves the following issues:    

 - Struts2 JSON Plugin: Send Map with Strings as Key to JSON Action is ignored, Numeric Keys will work and mapped
 - Threads get blocked due to unnecessary synchronization in OgnlRuntime Dependency
 - Upgrade to OGNL 3.0.21
 - Upgrade to struts-master 11
 - Improve RegEx used to validate URLs
 
Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

#### 05 September 2017 - Struts 2.5.13 General Availability {#a20170905}

The Apache Struts group is pleased to announce that Struts 2.5.13 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains fixes for the following potential security vulnerabilities:

 - [S2-050](/docs/s2-050.html)
    A regular expression Denial of Service when using URLValidator (similar to S2-044 & S2-047)
 - [S2-051](/docs/s2-051.html)
   A remote attacker may create a DoS attack by sending crafted xml request when using the Struts REST plugin
 - [S2-052](/docs/s2-052.html)
   Possible Remote Code Execution attack when using the Struts REST plugin with XStream handler to handle XML payloads

Except the above this release also contains several improvements just to mention few of them:

 - Struts2 JSON Plugin: Send Map with Strings as Key to JSON Action is ignored, Numeric Keys will work and mapped
 - NP with TextProvider and wildcardmapping
 - Threads get blocked due to unnecessary synchronization in OgnlRuntime
 - Default Multipart validation regex is invalid
 - Not fully initialized ObjectFactory tries to create beans
 - http://struts.apache.org/dtds/struts-2.5.dtd missing
 - Set a global resource bundle in class
 - Override TextProvider doesnot work in struts 2.5.12
 - Array-of-null parameters are converted to string "null"
 - JakartaStreamMultiPartRequest Should Honor "struts.multipart.maxSize"
 - Build Fails Due to Unused com.sun Import
 - Struts2.5.12 - NPE in DeligatingValidatorContext
 - Struts 2 Fails to Initialize with JRebel
 - Allow define more than one Action suffix
 - Remove jQuery from debugging interceptor views
 - update dependencies page on the struts site
 - Improve RegEx used to validate URLs
 - Make REST ContentHandlers configurable
 - expose Freemarker incompatible_improvements into FreemarkerManager and StrutsBeansWrapper
 - Upgrade Commons Collections to 3.2.2
 - Upgrade Commons IO to 2.5
 - Upgrade to ASM version 5.2
 - Upgrade to OGNL 3.1.15
 - Upgrade xstream to the latest version
 - Upgrade to struts-master 11

> Please read the [Version Notes](/docs/version-notes-2513.html) to find more details about performed bug fixes and improvements.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 09 August 2017 - S2-049 Security Bulletin update {#a20170809}

This is an update of the recently announced Security Bulletin - [S2-049](/docs/s2-049.html).

The bulletin was extended with an additional information when the potential vulnerability
can be present in your application. Please re-read the mentioned bulletin and apply required
actions if needed.

Please report any problems back to the [Struts Security](mailto:security@struts.apache.org) mailing list.

#### 07 July 2017 - Struts 2.3.33 General Availability {#a20170707}

The Apache Struts group is pleased to announce that Struts 2.3.33 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses two potential security vulnerabilities:

 - [S2-049](/docs/s2-049.html)
   A DoS attack is available for Spring secured actions
 - [S2-048](/docs/s2-048.html)
   Possible RCE in the Struts Showcase app in the Struts 1 plugin example in Struts 2.3.x series
   
Also this version resolves the following issues:    

 - `EmailValidator` does not accept new domain suffixes
 - Revision number still missing from `dojo.js` and `dojo.js.uncompressed.js`
 - Strange Behavior Parsing Action Requests

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

#### 06 July 2017 - Struts 2.5.12 General Availability {#a20170706}

The Apache Struts group is pleased to announce that Struts 2.5.12 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains fixes for the following potential security vulnerabilities:

 - [S2-047](/docs/s2-047.html)
   Possible DoS attack when using URLValidator
 - [S2-049](/docs/s2-049.html)
   A DoS attack is available for Spring secured actions

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
