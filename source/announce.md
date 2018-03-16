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
  Skip to: <a href="announce-2016.html">Announcements - 2017</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
