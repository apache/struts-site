---
layout: default
title: Building Fast Track Release
parent:
  title: Creating and Signing a Distribution
  url: creating-and-signing-a-distribution
---

# Building fast track release
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Getting ready

Follow the same steps as for [Normal Release](building-normal-release)

Please be aware you should create a new Security Bulletin in secret, you should assign only `struts-committers` group 
to be visible for. If the release will fix a - hopefully yet undisclosed - security issue, you must update 
the [Security Bulletins](https://cwiki.apache.org/confluence/display/WW/Security+Bulletins) page. It also needs to be 
accessible only by members of the `struts-committers` group.

## Apply security patch

Apply and commit security patch.

## Next steps

Follow the same steps as for [Normal Release](building-normal-release)

- Prepare release
- Perform the release
- Jira stuff
- Vote on it
  Post a release/quality vote to the dev list (and **only** the dev list). The example mail is on [Sample announcements](sample-announcements)
  page. Include the term "fast-track" in the subject, as: [VOTE] Struts 2.0.9.1 quality (fast track).
  Please be aware this vote should be open only 24h! 
- Copy files
- Promote release
- Clean up old releases
- Wait for rsync
- Update site
- Post announcements
  Announce the release and the vulnerability. Typically, this will be sent to the reporter, the project's users list 
  (user@struts.a.o), the project's dev list (dev@struts.a.o), the project's announce list (announcements@struts.a.o), 
  security@apache.org, full-disclosure@lists.grok.org.uk and bugtraq@securityfocus.com.
  Samples are available at [Sample announcements](sample-announcements) page.

