---
layout: default
title: Announcements 2022
---

# Announcements 2022
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2021">Announcements - 2021</a>
</p>

#### 22 January 2022 - Struts 2.5.29 General Availability {#a20220122}

The Apache Struts group is pleased to announce that Struts 2.5.29 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Bugs:
 - [WW-5117] - %{id} evaluates different for data-* and value attribute
 - [WW-5160] - Template not found for name "Empty{name='templateDir'}/simple/hidden.ftl"
 - [WW-5163] - Error executing FreeMarker template

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.29) to find more details about performed
> bug fixes and improvements.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 02 January 2022 - Struts 2.5.28.3 General Availability {#a20220102}

The Apache Struts group is pleased to announce that Struts 2.5.28.3 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses Log4j vulnerability [CVE-2021-44832](https://logging.apache.org/log4j/2.x/security.html#CVE-2021-44832)
by using the latest Log4j ver. 2.12.4 (Java 1.7 compatible).

**Please note, that the Apache Struts itself depends on the `log4j-api` package only, it's users' responsibility 
to use a proper version of the log4j-core package!**

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.28.3) to find more details about performed
> bug fixes and improvements.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

<p class="pull-right">
  Skip to: <a href="announce-2021.html">Announcements - 2021</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
