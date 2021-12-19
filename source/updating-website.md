---
layout: default
title: Updating the website
---

# Updating the website
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## The setup

The whole website is available in a dedicated Git [repository](https://gitbox.apache.org/repos/asf?p=struts-site.git), 
you can also use a Github [mirror](https://github.com/apache/struts-site).

The `master` branch contains the current source code of the website, any changes should be applied to this branch, 
also any Pull Request should be opened against this branch as well.

We are using Jekyll and mix of Markdown pages with raw Html pages, where Markdown is a preferred option.

> WARN: do not manually change the `asf-site` or `ast-staging` branches, they will be automatically updated
> by a CI server. 

The whole build of the website is orchestrated by [.asf.yaml](http://s.apache.org/asfyaml), please refer to the docs
for more details. The main build of the website is performed by [a buildbot job](https://ci2.apache.org/#/builders/7),
the staging site is build and deployed by 
[a Jenkins job](https://builds.apache.org/job/Struts/job/Struts-staged-site/) - buildbot doesn't support staging site deployment yet.  

## Applying a change

If you are a contributor, and the change is small you can push it directly to the `master` branch. In any other case
please open a Pull Request. The Pull Request will be automatically build and deployed to the [staging site](https://struts.staged.apache.org/).

You can then review your changes before applying them to the `master` branch.

## Deploying JavaDocs

There is a dedicated [Jenkins job](https://builds.apache.org/job/Struts/job/Struts-site-javadocs/) which is
used to update the JavaDocs based on the latest release. If you have a proper privileges you can start the job
and provide a Git tag of the latest release, eg. `STRUTS_2_5_22`. Based on the tag, Jenkins will generate a proper
JavaDocs and deploy them directly into the website. You can verify them by using this [link](https://struts.staged.apache.org/maven/struts2-core/apidocs/index).
