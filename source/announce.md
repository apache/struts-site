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
