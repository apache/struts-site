---
layout: default
title: Announcements 2018
---

# Announcements 2018
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2017.html">Announcements - 2017</a>
</p>

#### 14 November 2018 - Apache Struts 2.3.x End-Of-Life (EOL) Announcement {#a20181114}

The Apache Struts Project Team would like to inform you that the Struts 2.3.x web framework will reach 
its end of life in 6 months and won't be longer officially supported.

Please check the following reading to find more details.

 - [Apache Struts 2.3.x EOL Announcement](struts23-eol-announcement), including a detailed Q/A section

#### 15 October 2018 - Struts 2.3.36 General Availability {#a20181015-2}

The Apache Struts group is pleased to announce that Struts 2.3.36 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses one backward compatibility issue:

- [xml-validation fails since struts 2.5.17]({{ site.wiki_url }}/Version+Notes+2.3.36)

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

#### 15 October 2018 - Struts 2.5.18 General Availability {#a20181015-1}

The Apache Struts group is pleased to announce that Struts 2.5.18 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

 - `jar_cache` Some jar_cache******.tmp files are generated into a temporary directory(/tmp) during web service start
 - Struts 2.5.16 is creating jar_cache files in temp folder
 - MD5 and SHA1 should no longer be provided on download pages
 - xml-validation fails since struts 2.5.17
 
Internal Changes:

- XWorkList was moved into a com.opensymphony.xwork2.conversion.impl package as com.opensymphony.xwork2.util package is excluded 
  by the Internal Security Mechanism.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 22 August 2018 - CVE-2018-11776 Apache Struts 2.3 to 2.3.34 and 2.5 to 2.5.16 {#a20180822-0}

CVEID:CVE-2018-11776

PRODUCT:Apache Struts

VERSION:Apache Struts 2.3 to 2.3.34 and 2.5 to 2.5.16

PROBLEMTYPE:Remote Code Execution

REFERENCES:[S2-057]({{ site.wiki_url }}/S2-057)

DESCRIPTION:Man Yue Mo from the Semmle Security Research team was noticed that Apache Struts versions 2.3 to 2.3.34 and
2.5 to 2.5.16 suffer from possible Remote Code Execution when using results with no namespace and in same time, its 
upper action(s) have no or wildcard namespace. Same possibility when using url tag which doesn’t have value and action
set and in same time, its upper action(s) have no or wildcard namespace.

#### 22 August 2018 - Struts 2.5.17 General Availability {#a20180822-1}

The Apache Struts group is pleased to announce that Struts 2.5.17 is available as a "General Availability"
release. The GA designation is our highest quality grade.

In addition to critical overall proactive security improvements, this release addresses one potential security vulnerability:

- Possible Remote Code Execution when using results with no namespace and in same time, its upper action(s) have no or 
wildcard namespace. Same possibility when using url tag which doesn’t have value and action set. - [S2-057]({{ site.wiki_url }}/S2-057)

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 22 August 2018 - Struts 2.3.35 General Availability {#a20180822-2}

The Apache Struts group is pleased to announce that Struts 2.3.35 is available as a "General Availability"
release. The GA designation is our highest quality grade.

In addition to critical overall proactive security improvements, this release addresses one potential security vulnerability:

- Possible Remote Code Execution when using results with no namespace and in same time, its upper action(s) have no or 
wildcard namespace. Same possibility when using url tag which doesn’t have value and action set. - [S2-057]({{ site.wiki_url }}/S2-057)

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

#### 27 March 2018 - A crafted XML request can be used to perform a DoS attack when using the Struts REST plugin {#a20180327}

The Apache Security Struts Team recommends to immediately upgrade your Struts 2 based projects to use the latest released 
version of the Apache Struts. This is necessary to prevent your publicly accessible web site, which is using the Struts 
REST plugin and performing XML serialisation, from being exposed to possible DoS attack.

You can find more details in a Security Bulletin [S2-056](https://cwiki.apache.org/confluence/display/WW/S2-056)

All developers are strongly advised to perform this action.

#### 23 March 2018 - Immediately upgrade commons-fileupload to version 1.3.3 {#a20180323}

The Apache Struts Team recommends to immediately upgrade your Struts 2
based projects to use the latest released version of Commons
FileUpload library, which is currently 1.3.3. This is necessary to
prevent your publicly accessible web site from being exposed to
possible Remote Code Execution attacks (see \[1] \[2]).

This affects any Struts version prior to **2.5.12** \[3].

Your project is affected if it uses the built-in file upload mechanism
of Struts 2, which defaults to the use of commons-fileupload. The
updated commons-fileupload library is a drop-in replacement for the
vulnerable version. Deployed applications can be hardened by replacing
the commons-fileupload jar file in WEB-INF/lib with the fixed jar. For
Maven based Struts 2 projects, the following dependency needs to be
added:

```xml
<dependency>
  <groupId>commons-fileupload</groupId>
  <artifactId>commons-fileupload</artifactId>
  <version>1.3.3</version>
</dependency>
```

More details can be found here:

  1. [https://issues.apache.org/jira/browse/FILEUPLOAD-279](https://issues.apache.org/jira/browse/FILEUPLOAD-279)
  2. [https://nvd.nist.gov/vuln/detail/CVE-2016-1000031](https://nvd.nist.gov/vuln/detail/CVE-2016-1000031)
  3. [https://issues.apache.org/jira/browse/WW-4812](https://issues.apache.org/jira/browse/WW-4812)

All developers are strongly advised to perform this action.

#### 16 March 2018 - Struts 2.5.16 General Availability {#a20180316}

The Apache Struts group is pleased to announce that Struts 2.5.16 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

 - unclosed instantiation of PrintWriter
 - Http Sessions forcefully created for all requests using I18nInterceptor with default Storage value.
 - NotSerializableException - org.apache.struts2.dispatcher.StrutsRequestWrapper
 - NotSerializableException: com.opensymphony.xwork2.inject.ContainerImpl$ConstructorInjector when using ExecuteAndWait 
   interceptor
 - ClassCastException in JarEntryRevision
 - Dependency Mapping Exception When Using PrefixBasedActionProxyFactory
 - The converter() method of com.opensymphony.xwork2.conversion.annotations.TypeConversion is now deprecated. If this 
   method is removed in some next release, it will forbid to describe a converter by the name (id) of a Spring bean.
 - Conversion by annotation does not work
 - List of Boolean is not populated in Action class
 - JSONResult exception in struts2-json-plugin-2.5.14.1.jar
 - buttons with name="method:METHODNAME" sometimes ignore global-allowed-methods defined in struts.xml
 - Could not create JarEntryRevision for [zip:C:/.... unknown protocol c
 - NPE in I18nInterceptor$SessionLocaleHandler.read
 - JasperReportResult: NPE When Not Using SQL Connection
 - support JSR 303 Validation Groups in BeanValidation-Plugin
 - Debug tag should not display anything when not in dev mode
 - Allow using of Initializable interface on an implementation level
 - Allowed methods inheritance
 - Allow use Jackson XML bindings to serialise / deserialise XML
 - when using an custom array as a filed in struts 2 action form textfiled data from jsp page in not populating into 
   custom array but populating in String array or array list
 - Upgrade Spring to version 4.3.13
 - Update Log4j2 to 2.10.0

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.16) to find more details about performed bug fixes and improvements.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

<p class="pull-right">
  Skip to: <a href="announce-2017.html">Announcements - 2017</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
