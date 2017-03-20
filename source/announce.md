---
layout: default
title: Announcements
---
# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2016.html">Announcements - 2016</a>
</p>

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

It is a drop-in installation, just select a proper jar gile and copy it to `WEB-INF/lib` folder.
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
