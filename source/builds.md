---
layout: default
title: Source Code and Builds
---

# Source Code and Builds
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

As a convenience to developers who are helping to create and maintain the Apache Struts framework,
public access to the live source code repository is available. This is our one-and-only development repository.
Accordingly, the source may not always compile or be in a release-ready state.

*Access at your own risk!*

NOTE: The full source code is provided with each [release](/download.cgi). If you simply want to build
your own copy of the product, use the source code provided with an approved release, rather than the development head.

Read-only access to the Apache Struts source repository is available through both
[web browser](https://gitbox.apache.org/repos/asf?p=struts.git;a=summary) and
[Git client](http://git-scm.com/) interfaces.

With the [Git client](http://git-scm.com/) installed, obtaining a working copy of the Struts codebase is as simple as

```
> git clone https://gitbox.apache.org/repos/asf/struts.git
```

or from GitHub

```
> git clone https://github.com/apache/struts.git
```

For more about using version control systems at Apache, see the ASF's
[Source Code Repositories](http://www.apache.org/dev/#version-control) page.

## Building Apache Struts

If you are building Apache Struts from source, we recommend that you install and use
[Apache Maven 3.](http://maven.apache.org) During the build process, Maven will automatically acquire
whatever external JARs your system may need. (Of course, you can still use your build system of choice to build
your own applications!)

With Maven installed, building a Struts codebase is as simple as

```
> mvn install
```

or

```
> mvn -DskipAssembly=true install
```

Maven will automatically download any dependencies as needed.

For more about using Maven to build Struts 2, see
[Building the framework from source](/docs/building-the-framework-from-source) in the
[Struts 2 Contributors Guide.](/docs/contributors-guide)

For more about using Maven to build Struts 1, see our [Maven wiki page.](http://wiki.apache.org/struts/StrutsMaintenanceMaven)

## Nightly Builds

As part of our continuous integration practice, we also make available each morning the
[latest stable development build.](https://nightlies.apache.org/x1/dist/struts/)

*Again: Use at your own risk!*

If you do **not** plan to contribute to the development of the framework, then you probably want to download a
[release](releases)

NOTE: The Struts 2 nightly build is not fully operational. We suggest that contributors checkout
the [source code](#SourceCode) instead.

## Test Builds
            
As we prepare for a new release, the project group may create interim *test builds*. When test builds are available,
we post them [here](https://dist.apache.org/repos/dist/dev/struts/) in binary, source and library distributions.
Library distributions include any external dependencies needed to use a product with your application.

You can also use Maven to test the builds, all you have to do is to configure a Staging repository in `~/.m2/settings.xml`
file like this:

```xml
<settings>
    ...
    <profiles>
        <profile>
            <id>local</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <repositories>
                <repository>
                    <id>apache-pre-release</id>
                    <url>https://repository.apache.org/content/repositories/staging/</url>
                    <layout>default</layout>
                </repository>
            </repositories>
        </profile>
    </profiles>
</settings>
```

or add the Staging repository in the project's POM:

```xml
<repositories>
    <repository>
        <id>apache-pre-release</id>
        <url>https://repository.apache.org/content/repositories/staging/</url>
        <layout>default</layout>
    </repository>
</repositories>
```

A test build is made available so that it can be reviewed for quality by the Apache Struts development group.
When a build is judged "ready for prime time", it is promoted to "General Availability" status and may be
made the "Best Available" release. If the group feels that a build requires more testing, then it may be marked
as "Beta" release. When a test build is upgraded to "Beta" or "GA" by a vote of the project members,
we make the distribution available as a formal [release](releases).

## Maven Snapshots

When a distribution is first made available, it is rated as a development build or "snapshot". Later, the quality
of the distribution may be upgraded to "Beta" or "General Availability", based on feedback from the community,
and then made available through the Maven Central and other public Maven repositories. To obtain an early distribution 
via Maven, specify the ASF Snapshot repository in the project's POM.

```xml
<repositories>
    <repository>
        <id>apache.snapshots</id>
        <name>ASF Maven 2 Snapshot</name>
        <url>https://repository.apache.org/content/groups/snapshots/</url>
    </repository>
</repositories>
```


## Licensing of Apache Struts Builds

Apache Struts 2 source code and documentation is licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file included in any distribution for additional information
regarding copyright ownership. The ASF licenses the source code and documentation files in our Apache Struts distribution
to you under the Apache License, Version 2.0 (the "License"); you may not use the Apache Struts product except in compliance
with the License.

You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0]

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
specific language governing permissions and limitations under the License.

Next: [Release Guidelines](release-guidelines)
