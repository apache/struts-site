---
layout: default
title: Announcements 2024
---

# Announcements 2024
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2023">Announcements - 2023</a>
</p>

#### 19 December 2024 - Apache Struts version 7.0.0 General Availability {#a20241219}

The Apache Struts group is pleased to announce that Apache Struts version 7.0.0 is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Please read the [Migration Guide]({{ site.wiki_url }}/Struts+6.x.x+to+7.x.x+migration) to find more details about 
how to adopt a new version.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+7.0.0) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this upgrade.**

The 7.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Java 17 and JakartaEE.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 10 December 2024 - CVE-2024-53677 File upload logic is flawed {#a20241210}

The Apache Struts group recommends upgrading to Apache Struts version 6.4.0 at least and migrating to 
the [new file upload](core-developers/action-file-upload) mechanism to mitigate potential security
vulnerability when using deprecated [FileUploadInterceptor](core-developers/file-upload-interceptor). 

> Please read the Security Bulletin [S2-067](https://cwiki.apache.org/confluence/display/WW/S2-067) to find more 
> details about this security vulnerability

**All developers are strongly advised to perform this upgrade.**

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download the latest version from our [download](download.cgi#struts-ga) page.

#### 17 November 2024 - Apache Struts version 6.7.0 General Availability {#a20241117}

The Apache Struts group is pleased to announce that Apache Struts version 6.7.0 is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

A lot of classes have been marked as deprecated because of relocation of them into a new package. All classes from 
package `com.opensymphony.xwork2`  will be moved into `org.apache.struts2` in Struts 7 and this deprecation can help you 
adapt to incoming changes. Please be aware that we are dropping support for DWR and Sitemesh plugins. 
In the case of DWR there is no more active development nor support for JakartaEE. 
Sitemesh can be integrated directly with the framework, please check [sitemesh3](https://github.com/apache/struts-examples/tree/master/sitemesh3) example.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.7.0) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 18 October 2024 - Apache Struts version 6.6.1 General Availability {#a20241018}

The Apache Struts group is pleased to announce that Apache Struts version 6.6.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This version contains a lot of proactive security improvements, which should make your application hard to compromise.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.6.1) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 10 August 2024 - Apache Struts version 6.6.0 General Availability {#a20240810}

The Apache Struts group is pleased to announce that Apache Struts version 6.6.0 is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This version contains a lot of proactive security improvements, which should make your application hard to compromise.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.6.0) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 21 July 2024 - Apache Struts version 7.0.0-M9 {#a20240721}

The Apache Struts group is pleased to announce that Apache Struts version 7.0.0-M9 is available as a Test Build.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+7.0.0-M9) to find more details about performed
> bug fixes and improvements.

**This is a test build not ready to be used in production environments!**

The 7.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
JakartaEE Servlet API 6.0.0, JakartaEE JSP API 3.0, and Java 17.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

#### 20 April 2024 - Apache Struts version 7.0.0-M6 {#a20240420}

The Apache Struts group is pleased to announce that Apache Struts version 7.0.0-MS is available as a Test Build.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+7.0.0-M6) to find more details about performed
> bug fixes and improvements.

**This is a test build not ready to be used in production environments!**

The 7.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
JakartaEE Servlet API 6.0.0, JakartaEE JSP API 3.0, and Java 17.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

#### 19 April 2024 - Apache Struts version 6.4.0 General Availability {#a20240419}

The Apache Struts group is pleased to announce that Apache Struts version 6.4.0 is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This version contains a lot of proactive security improvements, which should make your application hard to compromise. 

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.4.0) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

<p class="pull-right">
  Skip to: <a href="announce-2023">Announcements - 2023</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart">Kickstart FAQ</a>
</p>
