---
layout: plugin
title: Embedded JSP Plugin
parent:
    url: /plugins
    title: Plugins
---

# Embedded JSP Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The Embedded JSP plugin allows you to use JSPs from the classpath (from jar files).

## Introduction

JSPs are usually served from the file system. Using this plugin you can deploy JSPs inside jar files, which is sometimes desired, like when writing a plugin. 

### Wait...what?

The plugin containes a modified version of Jasper 6, which reads JSPs from the classpath, and generates the java code in memory (no .java file is written). The Java Compiler API is then used to compile the java source code into bytecode (in memory, no .class file is generated), and it is turned into a Servlet, which is cached for future use.

### About includes

Because the JSP files are read from the classpath, "includes" work differently than they do from the file system. Assume you want to include "Hello.jsp", when searching for that file in the classpath, multiple files might be found on different jars, like `somejar.jar!/Hello.jsp` and `otherjar.jar!/Hello.jsp`. That's why relative paths do not work in this plugin. Instead, create directory structures for the JSPs. For example, given 2 jsps under `org/myexample/jsps` in a jar file:

Who.jsp:

```jsp
Hello there, I am the Doctor.
```

Hello.jsp:

```jsp
<jsp:include page="org/myexample/jsps/Who.jsp" />
```

Mapping:

```xml
 <package name="example" namespace="/example" extends="embeddedjsp-default">
     <action name="HelloWorld" class="example.HelloWorld">
         <result type="embeddedJsp">org/myexample/jsps/Hello.jsp</result>
     </action>
 </package>
```

## Requirements

1. Java 6 or later

### Tomcat

Tested with Tomcat 6.0.20.

### Jetty

This plugin requires Jetty 7 to work. And the Tomcat libraries must be deployed with the application, adding this to your `pom.xml` should take care of that: 

```xml
<dependency>
     <groupId>org.apache.tomcat</groupId>
     <artifactId>jasper</artifactId>
     <version>6.0.18</version>
</dependency>
```

To use Jetty 7 with the maven plugin add this to your `pom.xml`:

```xml
<build>
    <plugins>
        <plugin>
             <groupId>org.mortbay.jetty</groupId>
             <artifactId>jetty-maven-plugin</artifactId>
        </plugin>
    </plugins>
</build>
```
