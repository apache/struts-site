---
layout: default
title: Announcements
---

# Announcements

<p class="pull-right">
  Skip to: <a href="announce-2013.html">Announcements - 2013</a>
</p>

#### <span id="a20140302"> 2 March 2014 - Struts 2.3.16.1 General Availability Release - Security Fix Release

The Apache Struts group is pleased to announce that Struts 2.3.15.2 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework is designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Two security issues were solved with this release:

  - [S2-020](http://struts.apache.org/release/2.3.x/docs/s2-020.html) ClassLoader manipulation
    via request parameters
  - [S2-020](http://struts.apache.org/release/2.3.x/docs/s2-020.html) Commons FileUpload library was upgraded
    to version 1.3.1 to prevent DoS attacks

All developers are strongly advised to perform this action.

#### <span id="a20140221"> 21 February 2014 - Immediately upgrade commons-fileupload to version 1.3.1

The Apache Struts Team recommends to immediately upgrade your Struts 2
based projects to use the latest released version of Commons
FileUpload library, which is currently 1.3.1. This is necessary to
prevent your publicly accessible web site from being exposed to
possible DoS attacks (see \[1] \[2]).

Your project is affected if it uses the built-in file upload mechanism
of Struts 2, which defaults to the use of commons-fileupload. The
updated commons-fileupload library is a drop-in replacement for the
vulnerable version. Deployed applications can be hardened by replacing
the commons-fileupload jar file in WEB-INF/lib with the fixed jar. For
Maven based Struts 2 projects, the following dependency needs to be
added:

    <dependency>
      <groupId>commons-fileupload</groupId>
      <artifactId>commons-fileupload</artifactId>
      <version>1.3.1</version>
    </dependency>

More details can be found here:

  1. <a href="http://commons.apache.org/proper/commons-fileupload/changes-report.html#a1.3.1">
      http://commons.apache.org/proper/commons-fileupload/changes-report.html#a1.3.1</a>
  2. <a href="http://mail-archives.apache.org/mod_mbox/www-announce/201402.mbox/%3C52F373FC.9030907@apache.org%3E">
      http://mail-archives.apache.org/mod_mbox/www-announce/201402.mbox/%3C52F373FC.9030907@apache.org%3E</a>

All developers are strongly advised to perform this action.

<p class="pull-right">
  Skip to: <a href="announce-2013.html">Announcements - 2013</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
