---
layout: default
title: Announcements 2019
---

# Announcements 2019
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2018.html">Announcements - 2018</a>
</p>

#### 15 August 2019 - Security Advice: Announcing corrected affected version ranges in historic Apache Struts security bulletins and CVE entries {#a20190815}

The Apache Struts Security team would like to announce that a number of historic [Struts Security Bulletins](https://cwiki.apache.org/confluence/display/WW/Security+Bulletin) and related CVE database entries contained incorrect affected release version ranges.

The issue was reported by Christopher Fearon and the Black Duck Research Team within the Synopsys Cybersecurity Research Center. The reporting entity conducted thorough investigations on this matter, leading to a report to the Apache Struts Security Team. The Apache Struts Security Team worked with the reporters to cross-check said issues and map them to affected Apache Struts General Availability (GA) releases.

This effort led to the issue of Struts Security Bulletin S2-058, referencing 15 historic Struts Security Bulletins and [respective CVE entries](https://github.com/CVEProject/cvelist/pull/2423/files) that have been updated to reflect corrections in affected GA version ranges as well as minimum GA versions to contain appropriate fixes for the issues at hand.

The full Security Bulletin can be found here:

[Apache Struts Security Buletin S2-058](https://cwiki.apache.org/confluence/display/WW/S2-058)

The Struts Security Team stresses that while the reporters reference more affected issues and resulting affected version ranges, the Struts Security Bulletins only cover GA versions designated for production use. This led to less corrected Security Bulletins and CVE entries compared to the number of covered issues in the original report.
 
It is very important to understand that while the individual listed bulletins contain updated minimum fix versions, it is strongly recommended to update to the version recommended by the latest Security Bulletin, which is [S2-057](https://cwiki.apache.org/confluence/display/WW/S2-057) by the time of this announcement. Following this advice, the recommended minimum Struts versions to operate in production are Struts 2.3.35 or Struts 2.5.17.

The Apache Struts Security Team would like to thank the reporters for their efforts and their practice of responsible disclosure, as well as their help while investigating the report and coordinating public disclosure.


#### 14 January 2019 - Struts 2.5.20 General Availability {#a20190114}

The Apache Struts group is pleased to announce that Struts 2.5.20 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

- s:include tag fails with truncated content in certain circumstances
- NullPointerException in DefaultStaticContentLoader#findStaticResource
- Fixing flaky test in Jsr168DispatcherTest and Jsr286DispatcherTest
- Static files like css and js files in struts-core not properly served
- Race condition reloading config results in actions not found
- Setting Struts2 <s:select> options Css Class
- Enhancement for s:set tag to improve tag body whitespace control.
- Add support for Java 11
- Upgraded commons-fileupload to version 1.4
- Update multiple Struts 2.5.x libraries to more recent versions
- Update OGNL versions for 2.6 and 2.5.x builds
 
Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-ga) page.

#### 30 December 2018 - Struts 2.3.37 General Availability {#a20181230}

The Apache Struts group is pleased to announce that Struts 2.3.37 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses one backward compatibility issue:

- Struts 2.3.36 - InvalidPathException: Illegal char <:> on JDK 9,10,11 on windows
- Error when upgrading to struts2.3.35
- Upgraded commons-fileupload to version 1.4

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this action.**

The 2.3.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 6.

Should any issues arise with your use of any version of the Struts framework, please post your comments
to the user list, and, if appropriate, file a tracking ticket.

You can download this version from our [download](download.cgi#struts-23x) page.

<p class="pull-right">
  Skip to: <a href="announce-2018.html">Announcements - 2018</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
