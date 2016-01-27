---
layout: default
title: Announcements
---
# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2015.html">Announcements - 2015</a>
</p>

#### 26 January 2016 - Struts 2.5-BETA3 (BETA) {#a20160126}

The Apache Struts group is pleased to announce that Struts 2.5-BETA3 is available as a "BETA" release.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

This release contains several breaking changes and improvements just to mention few of them:

 - Dropped support for id and name - replaced with var, see WW-2069
 - Dedicated archive with a minimal set of dependencies was introduced, see WW-4570
 - It is possible to use multiple names when defining a result, see WW-4590
 - Rest plugin honors Accept header, see WW-4588
 - New result 'JSONActionRedirectResult' in json-plugin was defined, see WW-4591
 - Tiles plugin was upgrade to the latest Tiles 3 and tiles3-plugin was dropped, see WW-4584
 - JasperReports plugins was upgraded to JasperReport 6.0, see WW-4381
 - OGNL was upgraded to version 3.0.11 and it breaks access to properties as it follows Java Bean Specification,
   see WW-4207 and WW-3909
   - and then OGNL was upgraded to version 3.1.1, see WW-4561
   - and then OGNL was upgraded to version 3.2.1, see WW-4577

and many other improvements, please check the version notes

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments 
to the user list, and, if appropriate, file a tracking ticket.

<p class="pull-right">
  Skip to: <a href="announce-2015.html">Announcements - 2015</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
