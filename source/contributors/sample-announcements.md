---
layout: default
title: Sample announcements
parent:
  title: Contributors Guide
  url: index.html
---

# Sample announcements
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Sample Struts Annotations Release/Quality Vote

```
Subject: [VOTE] Struts Annotations 1.0.x Vote
The Struts Annotations 1.0.x test build is now available as a Maven
artifact. It is a dependency of Struts 2.x.y.

If you have had a chance to review the test build, please respond with
a vote on its quality:

[ ] Leave at test build
[ ] Alpha
[ ] Beta
[ ] General Availability (GA)

Everyone who has tested the build is invited to vote. Votes by PMC members are considered binding. A vote passes 
if there are at least three binding +1s and more +1s than -1s.

The vote will remain open for at least 72 hours, longer upon request.
```

## Sample Test Build Announcement

> Test builds are only announced to the dev list. Announcements to the user list can only be made pursuant to a release 
> vote with the consent of the PMC.

```
The test build of Struts 2.0.3 is available.

No determination as to the quality ('alpha,' 'beta,' or 'GA') of Struts 2.0.3 has been made, and at this time it is 
simply a "test build".  We welcome any comments you may have, and will take all feedback into account if a quality vote 
is called for this build.

Release notes:
* [https://cwiki.apache.org/confluence/display/WW/Version+Notes+#.#.#]

Distribution:
* [https://dist.apache.org/repos/dist/dev/struts/#.#.#/]

Maven 2 staging repository:
* [https://repository.apache.org/content/groups/staging/]

We appreciate the time and effort everyone has put toward contributing code and documentation, posting to the mailing 
lists, and logging issues.
```

## Sample Release/Quality Vote

```
Subject: [VOTE] Struts #.#.# Vote
The Struts #.#.# test build is now available.

Release notes:
* [https://cwiki.apache.org/confluence/display/WW/Version+Notes+#.#.#]

Distribution:
* [https://dist.apache.org/repos/dist/dev/struts/#.#.#/]

Maven 2 staging repository:
* [https://repository.apache.org/content/groups/staging/]

Once you have had a chance to review the test build, please respond with a vote on its quality:

[ ] Leave at test build
[ ] Alpha
[ ] Beta
[ ] General Availability (GA)

Everyone who has tested the build is invited to vote. Votes by PMC members are considered binding. A vote passes if 
there are at least three binding +1s and more +1s than -1s.

The vote will remain open for at least 72 hours, longer upon request. A vote can be amended at any time to upgrade 
or downgrade the quality of the release based on future experience. If an initial vote designates the build as "Beta", 
the release will be submitted for mirroring and announced to the user list. Once released as a public beta, subsequent 
quality votes on a build may be held on the user list.

As always, the act of voting carries certain obligations. A binding vote not only states an opinion, but means that 
the voter is agreeing to help do the work
```

## Sample Release Announcement

```
Subject: [ANN] Struts #.#.# [GA | Beta] release available

The Apache Struts group is pleased to announce that Struts #.#.# is available as a "[Beta | General Availability]" 
release. [[The Beta designation indicates that we believe the distribution needs wider testing before being upgraded 
to a "General Availability" release. Your input is essential.] The GA designation is our highest quality grade.]

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications. The framework 
is designed to streamline the full development cycle, from building, to deploying, to maintaining applications over time.

[This release includes one important security fix:]

All developers are strongly advised to update existing Struts 2 applications to Struts #.#.#.

Struts #.#.# is available in a full distribution, or as separate library, source, example and documentation distributions, 
from the releases page.
* http://struts.apache.org/download.cgi#struts###

The release is also available from the central Maven repository under Group ID "org.apache.struts".

The #.#.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
* Java Servlet 2.4 and JavaServer Pages (JSP) 2.0
* Java 2 Standard Platform Edition (J2SE) 7

The release notes are available online at:
* https://cwiki.apache.org/confluence/display/WW/Version+Notes+#.#.#

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file a tracking ticket.appropriate, file a tracking ticket:
* https://issues.apache.org/jira/browse/WW

- The Apache Struts group.
```

## Fast-Tracking an Important Security Release

> When a serious security issue  arises, we should try to create a #.#.#.# branch from the last GA release, and apply 
> to that branch only the security patch.

- If the patch first applies to some other dependency, implore the other group to do the same, to avoid side-effects 
  from other changes.
- If the release manager would like to "fast track" a vote, so as to make a security fix available quickly, the preferred 
  procedure is to
  - Include the term "fast-track" in the subject, as in `[VOTE] Struts 2.0.9.1 quality (fast track)`
  - In the vote message, specify voting terms like:

```
The Struts #.#.#.# test build is now available.

(optional (in case of the presence of security bulletin)
It includes the latest security patches which fix two possible vulnerabilities:
* ...
* ...

For details and the rationale behind these changes, please consult the
corresponding security bulletins:
* https://cwiki.apache.org/confluence/display/WW/S2-XXX
* https://cwiki.apache.org/confluence/display/WW/S2-XXX

Please note that currently these bulletins and the release notes are
only visible to logged-in users with the struts-committer role. This is
a needed requirement to control disclosure until the actual release is
announced.
(/optional)

Release notes:
* [https://cwiki.apache.org/confluence/display/WW/Version+Notes+#.#.#.#]

Distribution:
* [https://dist.apache.org/repos/dist/dev/struts/#.#.#.#/]

Maven 2 staging repository:
* [https://repository.apache.org/content/groups/staging/]

Once you have had a chance to review the test build, please respond with a vote on its quality:

[ ] Leave at test build
[ ] Alpha
[ ] Beta
[ ] General Availability (GA)

Everyone who has tested the build is invited to vote. Votes by PMC members are considered binding. A vote passes 
if there are at least three binding +1s and more +1s than -1s.

This is a "fast-track" release vote. If we have a positive vote after 24 hours (at least three binding +1s and more +1s 
than -1s), the release may be submitted for mirroring and announced to the usual channels.

The website download link will include the mirroring timestamp parameter [1], which limits the selection of mirrors 
to those that have been refreshed since the indicated time and date. (After 24 hours, we *must* remove the timestamp
parameter from the website link, to avoid unnecessary server load.) In the case of a fast-track release, the email 
announcement will not link directly to <download.cgi>, but to <downloads.html>, so that we can control use of the timestamp 
parameter.

[1] <[http://apache.org/dev/mirrors.html#use|http://apache.org/dev/mirrors.html#use]>

- The Apache Struts group.
```

Please be sure to update [Security Bulletins](https://cwiki.apache.org/confluence/display/WW/Security+Bulletins) accordingly 
as described above.
