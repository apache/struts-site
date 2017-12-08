---
layout: default
title: Release Guidelines
---

# Release Guidelines
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This document describes the Apache Struts release process and our [coding conventions](#Coding),
which are applicable to all subprojects. Both stable and development releases are
[available for download.](downloads.html)

## Release Process

A [point release](http://commons.apache.org/releases/versioning.html) should be made before and after
any product change that is not a "fully-compatible change" (see link). This includes moving a dependency from
an internal package to an external product, including products distributed through the Apache Commons.
We should place any fully-compatible changes in the hands of the community before starting on a change that
is only "interface" or "external-interface" compatible.

Additional remarks:

- Every committer is encouraged to participate in the release process, either as the release manager or a
  helper. Committers may also share the release manager role.
- The release process can seem daunting when you review it for the first time. But, essentially, it breaks
  down into four phases of just a few steps each:
  - **Rolling** - Issues, dependencies, release notes, JAR manifest, licenses, copyrights,
    and build (using the release target).
  - **Testing** - JUnit, Cactus, web apps (for all "supported" containers).
  - **Voting** - Upload test build to internal directory, post majority vote on DEV list as to release
    grade: Alpha, Beta, General Availability.
  - **Distributing** - Checksum, sign, mirror, update download page, announce.
- Committers are **required** to post a release plan before tagging the repository and should wait
  the traditional 72 hours before proceeding.
- A checklist format can be used for the [release plan](http://wiki.apache.org/struts/StrutsReleasePlans),
  to help step through the process. The plan may be maintained in the repository or on the
  [Struts wiki](http://wiki.apache.org/struts/).
- Our dependencies on external JARs (including Commons JARs) should be in line with our own release status.
  Our nightly build can be dependant on another nightly build. Our beta can be dependant on another beta (or
  "release candidate"), but should avoid a dependance on a nightly build. Our General Availability release
  may only have dependencies on other GA, final, or stable releases.
- Use your own discretion as to detail needed by the Release Notes. A high-level description of the changes
  is more important than providing uninterpreted detail. At a minimum, new features and deprecations should be
  summarized, since these are commonly asked questions. Ideally, the release notes should be maintained,
  continuously for the nightly build so that we they do not need to be assembled at the last minute.
- Try building the distribution under prior version of J2SE, if possible, to ensure that we are still
  backwardly-compatible. But, our distributions should be built using the **latest production release of J2SE**,
  to take advantage of all available compiler enhancements.
- If you have multiple J2SE versions configured, run the JUnit and Cactus tests using the same configuration
  that will be used to build the distribution.
- There is a "release" target in the buildfile that will zip and tar the distribution. Before uploading the
  distribution, extract the sample web applications and deploy the WARs under each of the "supported"
  containers (if you can). Play test each application under each container to be sure they operate
  nominally.
- The test build can be posted to the internal distribution directory (svn.apache.org/struts/) and
  announced to the Struts DEV and PMC lists (only!). Do not announce a test build on any other Apache lists or
  link to it from an Apache website.
- If the test build is voted to Alpha, Beta, or GA status, the release can announced to the User list and
  linked from the website.
- Any formal release may be submitted for mirroring. All GA releases **must** be mirrored.
- After announcing a release, remember to update the Downloads and Announcements pages. If the release is
  to be mirrored, wait at least 24 hours after submittal before making public announcements (as stated in the
  [Apache Mirroring guidelines](https://www.apache.org/dev/mirrors.html).
- If a serious flaw if found in a test build or release, it may be withdrawn by a majority vote of the PMC and
  removed from ASF distribution channels.

## Coding Conventions and Guidelines

Source code and documentation contributed to the Struts repositories should observe the:
- The ["Code Conventions for the Java Programming Language"](http://www.oracle.com/technetwork/java/codeconvtoc-136057.html),
  as published by Oracle.

## Clarifications
- First, "Observe the style of the original". Resist the temptation to make stylistic changes for their own
  sake. But, if you must reformat code, commit style changes separately from code changes. Either change
  the style, commit, and then change the code, or vice-versa.
- Set editors to replace tabs with spaces and do not trim trailing spaces. Tabs confound the version
  control alerts. Trimming trailing spaces creates unnecessary changes.
- Specify imported classes (do not use _.*_).
- Write all if/else statements as full blocks with each clause within braces, unless the entire statement fits
  on the same line.
- Use `FIXME:` and `TODO:` tokens to mark follow up notes in code. You may also
  include your Apache username and the date.
- Omit `@author` tags.
- `@since` to document changes between Struts versions, as in `@since Struts 2.1.`
- Wrap lines of code and JavaDoc at column 78. You can include a "comment rule" in the source to help with
  this.
- Please do your best to provide high-quality Javadocs for all source code elements. Package overviews
  (aka "Developer Guides") are also encouraged.
- When working on a bugfix, please first write a test case that proves the bug exists, and then use the test
  to prove the bug is fixed. =:0)
- When working on an enhancement, please feel free to use test-driven design and write the test first `<head-slap/>`
- As files are updated from year to year, the copyright on each file should be extended to include the current
  year. *You do not need to change the copyright year unless you change the file.*  Every source file should
  include the ASF copyright notice and current Apache License and copyright.
- Provide high-level API compatibility for any changes made within the same major release series (#.x.x).
  Changes which adversely affect compatibility should be slotted for the next major release series (++#.x.x).
- Our favorite books about programming are
  [Design Patterns](http://www.amazon.com/exec/obidos/ISBN=0201633612/apachesoftwar-20/),
  [Refactoring](http://www.amazon.com/exec/obidos/ISBN=0201485672/apachesoftwar-20/),
  and [Code Complete](http://www.amazon.com/exec/obidos/ISBN=0735619670/apachesoftwar-20/)
- Our favorite book about open source development is the
  [The Cathedral and the Bazaar](http://www.amazon.com/exec/obidos/ISBN=1565927249/apachesoftwar-20/)
- Our favorite science fiction author is
  [Robert Heinlein](http://www.nitrosyncretic.com/rah/),
  [TANSTAAFL](http://jargon.net/jargonfile/t/TANSTAAFL.html),
  (Except on Friday, when we favor [Douglas Adams](http://news.bbc.co.uk/1/hi/uk/1326657.stm)).

Next: [PMC Charter](bylaws.html)
