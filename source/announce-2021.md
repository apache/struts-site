---
layout: default
title: Announcements 2021
---

# Announcements 2021
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2020">Announcements - 2020</a>
</p>

#### 12 December 2021 - Security Advice on Log4j 2.15.0 {#a20211212-2}

The Apache Struts Security team would like to announce that all the users using the latest Struts 2.5.x series 
should upgrade [Log4j](https://logging.apache.org/log4j/2.x/) library to the  latest **2.15.0** version which addresses 
the Remote-Code-Execution vulnerability **CVE-2021-44228**. 

This version of Log4j requires Java 8, while Apache Struts 2.5.x series is still using Java 1.7 and because
of that we cannot prepare a new patched 2.5.x version. Yet, in most cases this is a drop-in upgrade as Log4j 2.15.0 
maintains binary compatibility with previous releases - once you are running on Java 8. In case you are not able 
to upgrade Log4j, please use one of  the described mitigations.

More information can be found [here](https://logging.apache.org/log4j/2.x/#News).

#### 12 December 2021 - Struts 2.5.28 General Availability {#a20211212}

The Apache Struts group is pleased to announce that Struts 2.5.28 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

- [WW-5149] - labelposition attribute broken in Struts 2.5.27

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.28) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 16 November 2021 - Struts 2.5.27 General Availability {#a20211116}

The Apache Struts group is pleased to announce that Struts 2.5.27 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

- PostbackResult uses wrong regex range
- `%{id}` evaluates different for data-* and value attribute
- Blocking Threads in retrieving text from resource bundle
- Contention when injecting `Scope.SINGLETON` instances
- CheckboxTag value missing for labelposition
- forbidden name attribute values (size, clone...?) in `<s:textfield>` using the default theme
- ID param not being set
- Make labelposition deprecated
- Make class attribute deprecated
- Fix the compilation alarms of deprecated methods
- OGNL long conversion
- Upgrade XStream to version 1.4.16

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.27) to find more details about performed
> bug fixes and improvements.

**All developers are strongly advised to perform this action.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 19 February 2021 - Struts Security Impact Levels {#a20210219}

The Apache Struts Security team would like to announce [Security Impact Levels](https://cwiki.apache.org/confluence/display/WW/Security+Bulletins#SecurityBulletins-Securityimpactlevels)
which will be used to rate any future Security Bulletins. We also updated the current Security Bulletins to match
the levels. Below is the list of the updated bulletins with a new Maximum security rating.

- [S2-060](https://cwiki.apache.org/confluence/display/WW/S2-060)
  Medium -> Moderate
- [S2-056](https://cwiki.apache.org/confluence/display/WW/S2-056)
  Medium -> Moderate
- [S2-055](https://cwiki.apache.org/confluence/display/WW/S2-055)
  High -> Important
- [S2-054](https://cwiki.apache.org/confluence/display/WW/S2-054)
  Medium -> Moderate
- [S2-051](https://cwiki.apache.org/confluence/display/WW/S2-051)
  Medium -> Moderate
- [S2-049](https://cwiki.apache.org/confluence/display/WW/S2-049)
  High -> Important
- [S2-048](https://cwiki.apache.org/confluence/display/WW/S2-048)
  High -> Important
- [S2-042](https://cwiki.apache.org/confluence/display/WW/S2-042)
  High -> Important
- [S2-040](https://cwiki.apache.org/confluence/display/WW/S2-040)
  Medium -> Moderate
- [S2-039](https://cwiki.apache.org/confluence/display/WW/S2-039)
  Medium -> Moderate
- [S2-038](https://cwiki.apache.org/confluence/display/WW/S2-038)
  Medium -> Moderate
- [S2-037](https://cwiki.apache.org/confluence/display/WW/S2-037)
  High -> Important
- [S2-036](https://cwiki.apache.org/confluence/display/WW/S2-036)
  Medium -> Moderate
- [S2-033](https://cwiki.apache.org/confluence/display/WW/S2-033)
  High -> Important
- [S2-032](https://cwiki.apache.org/confluence/display/WW/S2-032)
  High -> Important
- [S2-031](https://cwiki.apache.org/confluence/display/WW/S2-031)
  Medium -> Moderate
- [S2-026](https://cwiki.apache.org/confluence/display/WW/S2-026)
  High -> Important
- [S2-024](https://cwiki.apache.org/confluence/display/WW/S2-024)
  Medium -> Moderate
- [S2-023](https://cwiki.apache.org/confluence/display/WW/S2-023)
  Medium -> Moderate
- [S2-022](https://cwiki.apache.org/confluence/display/WW/S2-022)
  Medium -> Moderate
- [S2-021](https://cwiki.apache.org/confluence/display/WW/S2-021)
  High -> Important
- [S2-016](https://cwiki.apache.org/confluence/display/WW/S2-016)
  Highly Critical -> Critical
- [S2-015](https://cwiki.apache.org/confluence/display/WW/S2-015)
  Highly Critical -> Critical
- [S2-014](https://cwiki.apache.org/confluence/display/WW/S2-014)
  Highly Critical -> Critical
- [S2-013](https://cwiki.apache.org/confluence/display/WW/S2-013)
  Highly Critical -> Critical
- [S2-012](https://cwiki.apache.org/confluence/display/WW/S2-012)
  Moderately Critical -> Important

**All developers are strongly advised to read about new Security Impact Levels.**

<p class="pull-right">
  Skip to: <a href="announce-2020.html">Announcements - 2020</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
