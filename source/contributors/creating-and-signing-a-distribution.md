---
layout: default
title: Creating and Signing a Distribution
parent:
  title: Contributors Guide
  url: index.html
---

#Creating and Signing a Distribution
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## How to prepare a normal release ?

- create a Version Notes page and start adding important changes to it
- create a filter in JIRA with `Fix Version` pointing to the release version you want to prepare
- review JIRA issues and re-organise them, move the `Fix Version` to the next release or `Future`, mark what should be 
  solved in the release you're working on

## How to prepare a fast track release ?

- keep all the information confidential as possible, communicate throughout security@struts.a.o group
- restrict access to all the related pages created in Confluence to struts-committers group only, they can be made 
  public available after a fix or workaround has been released

## What do you want to build ?

Depends on what you want to achieve, please select topic from the list below:

- [One time steps](one-time-steps) - before you start preparing a distribution
- [Sample announcements](sample-announcements) - announcements used to communicate the achievement
- [Building Struts Master](#PAGE_27839549) - how to release Struts Master
- [Building Struts Annotations](#PAGE_27832965) - when you want to prepare a new distribution of Struts Annotations (if something changed)
- [Building Struts 2 - Normal release](#PAGE_27832970) - the most common used path
- [Building Struts 2 - Fast track release](#PAGE_27834014) - how to prepare a fast track release with important security patch
