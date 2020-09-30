---
layout: default
title: Building Struts Master
parent:
  title: Creating and Signing a Distribution
  url: creating-and-signing-a-distribution
---

# Building Struts Annotations
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Obtain a fresh check out of struts annotations

```
git clons https://gitbox.apache.org/repos/asf/struts-annotations.git
```

or you can just fetch & pull the latest changes

## Prepare release

```
mvn release:prepare
```

Use the following pattern for the tag name: `STRUTS_ANNOTATIONS_[VERSION]`

## Perform release

```
mvn release:perform
```

Log in to [Nexus](http://repository.apache.org/) and **close** the staging repository.

## Send a VOTE email

A sample template is at [Sample announcements](sample-announcements) page (and DO wait for the 72 hours period)

## Promote release

If the Vote passed log in again to [Nexus](http://repository.apache.org/) and **promote** the repository - it will be 
automatically synced with Maven Central Repository.
