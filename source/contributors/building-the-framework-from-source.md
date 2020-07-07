---
layout: default
title: Building the Framework from Source
parent:
    title: Contributors Guide
    url: index.html
---

# Building the Framework from Source
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Why Build?

Most developers will never need to build the framework from source. The distribution package contains everything 
a developer needs to get started and become productive with the framework. For more on how to go to work with 
the distributed binaries right away, see _Ready, Set, Go\!_ . However, there are situations when someone will want 
to build the framework from scratch. You may want to try out new tweaks and patches, or you might want to try writing 
your own tweak or patch.

> If you just want to use the latest development build, perhaps because a patch you need has been applied, you can 
> also [download a nightly build](http://ci.apache.org/projects/struts/nightlies/).

## Getting the Sources

The source code for the framework is available as a distribution you can download directly and from the source code repository.

## Distribution

The distributions of the framework contain all sources, as well as all needed libraries for building JARs and running. 
Distributions can be downloaded from the [Apache Struts project](../../downloads)

## Repository (Git)

Use [Git](https://git-scm.com/) to checkout the source code.

```
> cd Projects\Apache\
> git clone https://gitbox.apache.org/repos/asf/struts.git 
```

## Building with Maven

The default build environment is Maven. You can either install Maven 3 or use Maven Wrapper delivered with the source code.
Change to your framework home directory: 

```
cd Projects\Apache\struts
```

and run Maven

```
mvn clean install
```

or run using Maven Wrapper

```
./mvnw clean install
```

That will take care of the basic maven build. There is a bunch more that you can do. Checkout out [Building with Maven](building-with-maven) 
for more information.

## JDK/JRE Compatibility

The framework requires JDK 1.8 to build.
