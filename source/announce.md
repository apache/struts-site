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

#### 13 August 2020 - Security Advice: Announcing CVE-2019-0230 (Possible RCE) and CVE-2019-0233 (DoS) security issues {#a20200813}

Two new [Struts Security Bulletins](https://cwiki.apache.org/confluence/display/WW/Security+Bulletin) have been issued for Struts 2 by the Apache Struts Security Team:

* [S2-059](https://cwiki.apache.org/confluence/display/ww/s2-059) - Forced double OGNL evaluation, when evaluated on raw user input in tag attributes, may lead to remote code execution (CVE-2019-0230)
* [S2-060](https://cwiki.apache.org/confluence/display/ww/s2-060) - Access permission override causing a Denial of Service when performing a file upload (CVE-2019-0233)

Both issues affect Apache Struts in the version range 2.0.0 - 2.5.20. The current version 2.5.22, which was released in November 2019, is not affected.

[CVE-2019-0230](https://cwiki.apache.org/confluence/display/ww/s2-059) has been reported by Matthias Kaiser, Apple Information Security.
By design, Struts 2 allows developers to utilize forced double evaluation for certain tag attributes.
When used with unvalidated, user modifiable input, malicious OGNL expressions may be injected.
In an ongoing effort, the Struts framework includes mitigations for limiting the impact of injected expressions, but Struts before 2.5.22 left an attack vector open which is addressed by this report.
**However, we continue to urge developers building upon Struts 2 to [not use `%{...}` syntax referencing unvalidated user modifiable input in tag attributes ](https://struts.apache.org/security/#use-struts-tags-instead-of-raw-el-expressions), since this is the ultimate fix for this class of vulnerabilities.**

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
