---
layout: plugin
title: Java 8 Support Plugin
parent:
    url: /plugins
    title: Plugins
---

# Java 8 Support Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This plugin was dropped in Struts 2.5.5 as Struts Core is using ASM5 now which supports Java8.
Adds support for Java 8 - to allow use the latest features of the language with Struts actions.

## Usage

You must define it as a dependency in `pom.xml` and exclude the old version of ASM used with `xwork-core`, see a code snippet below:

```xml
<dependency>
    <groupId>org.apache.struts.xwork</groupId>
    <artifactId>xwork-core</artifactId>
    <exclusions>
        <exclusion>
            <groupId>asm</groupId>
            <artifactId>asm</artifactId>
        </exclusion>
        <exclusion>
            <groupId>asm</groupId>
            <artifactId>asm-commons</artifactId>
        </exclusion>
    </exclusions>
</dependency>
```

If you don't use Maven to manage the dependencies, please be sure to replace `asm.jar` and `asm-commons.jar` with appropriated ASM 5 versions.

## Supported Java 8 features

+ Lambda Expressions in actions when using them with the Convention plugin
