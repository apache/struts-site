---
layout: default
title: Announcements 2020
---

# Announcements 2020
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2019.html">Announcements - 2019</a>
</p>

#### 08 December 2020 - Potential RCE when using forced evaluation - CVE-2020-17530 {#a20201208}

The Apache Struts Security team would like to announce that forced OGNL evaluation, when evaluated on raw user input 
in tag attributes, may lead to remote code execution.

**Problem**

Some of the tag's attributes could perform a double evaluation if a developer applied forced OGNL evaluation 
by using the `%{...}` syntax. Using forced OGNL evaluation on untrusted user input can lead to a Remote Code Execution 
and security degradation.

**Solution**

Avoid using forced OGNL evaluation on untrusted user input, and/or upgrade to Struts 2.5.26 which checks if expression 
evaluation won't lead to the double evaluation.

Please read our Security Bulletin [S2-061](https://cwiki.apache.org/confluence/display/WW/S2-061) for more details.

This vulnerability was identified by:
- Alvaro Munoz - pwntester at github dot com
- Masato Anzai of Aeye Security Lab, inc.

**All developers are strongly advised to perform this action.**

#### 06 December 2020 - Struts 2.5.26 General Availability {#a20201206}

The Apache Struts group is pleased to announce that Struts 2.5.26 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

 - Junit plugin does not push ACTION_MAPPING into the context resulting in NPE
 - Struts2 StaticParametersInterceptor's addParametersToContext method is not working as expected
 
> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.26) to find more details about performed 
> bug fixes and improvements.
 
**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list, 
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 28 September 2020 - Struts 2.5.25 General Availability {#a20200928}

The Apache Struts group is pleased to announce that Struts 2.5.25 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

 - Package Level Properties in Global Results
 - AbstractMatcher adds values to the map passed into replaceParameters
 - Minor bug in single file upload example of the Showcase application
 - Unable to set long pathname variables
 - s:set with empty body
 - AliasInterceptor doesn't properly handle Parameter.Empty
 - Improve build behaviour on JDK9+
 - Update multiple Struts 2.5.x libraries / Maven build plugin versions
 - Upgrade OSGi to the latest version
 
> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.25) to find more details about performed 
> bug fixes and improvements.
 
**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list, 
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 13 August 2020 - Security Advice: Announcing CVE-2019-0230 (Possible RCE) and CVE-2019-0233 (DoS) security issues {#a20200813}

Two new [Struts Security Bulletins](https://cwiki.apache.org/confluence/display/WW/Security+Bulletin) have been issued for Struts 2 by the Apache Struts Security Team:

* [S2-059](https://cwiki.apache.org/confluence/display/ww/s2-059) - Forced double OGNL evaluation, when evaluated on raw user input in tag attributes, may lead to remote code execution (CVE-2019-0230)
* [S2-060](https://cwiki.apache.org/confluence/display/ww/s2-060) - Access permission override causing a Denial of Service when performing a file upload (CVE-2019-0233)

Both issues affect Apache Struts in the version range 2.0.0 - 2.5.20. The current version 2.5.22, which was released in November 2019, is not affected.

[CVE-2019-0230](https://cwiki.apache.org/confluence/display/ww/s2-059) has been reported by Matthias Kaiser, Apple Information Security.
By design, Struts 2 allows developers to utilize forced double evaluation for certain tag attributes.
When used with unvalidated, user modifiable input, malicious OGNL expressions may be injected.
In an ongoing effort, the Struts framework includes mitigations for limiting the impact of injected expressions, but Struts before 2.5.22 left an attack vector open which is addressed by this report.
**However, we continue to urge developers building upon Struts 2 to [not use `%{...}` or `${...}` syntax referencing unvalidated user modifiable input in tag attributes ](https://struts.apache.org/security/#use-struts-tags-instead-of-raw-el-expressions), since this is the ultimate fix for this class of vulnerabilities.**

[CVE-2019-0233](https://cwiki.apache.org/confluence/display/ww/s2-060) has been reported by Takeshi Terada of Mitsui Bussan Secure Directions, Inc.
In Struts before 2.5.22, when a file upload is performed to an Action that exposes the file with a getter, an attacker may manipulate the request such that the working copy of the uploaded file or even the container temporary upload directory may be set to read-only access. As a result, subsequent actions on the file or file uploads in general will fail with an error.

Both issues are already fixed in Apache Struts [2.5.22](https://cwiki.apache.org/confluence/display/WW/Version+Notes+2.5.22), which was released in November 2019.

**We strongly recommend all users to [upgrade](download.cgi#struts-ga) to Struts 2.5.22, if this has not been done already.**

The Apache Struts Security Team would like to thank the reporters for their efforts and their practice of responsible disclosure, as well as their help while investigating the report and coordinating public disclosure.


<p class="pull-right">
  Skip to: <a href="announce-2019.html">Announcements - 2019</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
