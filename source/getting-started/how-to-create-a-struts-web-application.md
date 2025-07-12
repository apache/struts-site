---
layout: default
title: How to create a Struts web application
parent:
    title: Getting started
    url: index
---

# How To Create A Struts Web Application
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This tutorial walks through installing the framework and creating a simple application.

While the Struts framework is simple to use, creating non-trivial applications assumes a working knowledge 
of many J2EE technologies, including:

 - Java
 - Filters, JSP, and Tag Libraries
 - JavaBeans
 - HTML and HTTP
 - Web Containers (such as Tomcat)
 - XML

> For more about supporting technologies, see the [Key Technologies Primer](../primer). 

## Java Requirements

Struts 7 requires Jakarta Servlet API 6 or higher and Java 17 or higher.
In case of Struts 6, it requires Servlet API 2.5 or higher and Java 8 or higher.

> Note: This guide focuses on Struts 7.

## Our First Application

To get started using Struts we will create a web application using Maven to manage the artifact dependencies.
You can checkout all the example applications from the Struts GitHub repository 
at [struts-examples](https://github.com/apache/struts-examples).

## Create Struts Web Application Using Maven To Manage Artifacts and To Build The Application

> This tutorial assumes you know how to create a Java web application that uses Maven to manage artifacts and build 
the web application archive (war) file.

### Step 1 - Create A Java Web Application

In your Java IDE create a Java web application with a project name of `basic_struts` that follows the standard Maven
project folder structure. In your `pom.xml` include the following:

**pom.xml build node**

```xml
<build>
    <finalName>basic-struts</finalName>
</build>
```

##### to run the application using maven, add the jetty maven-plugin to your pom.xml

**pom.xml jetty plugin**

```xml
<build>
    ...   
    <plugins>
        <plugin>
            <groupId>org.eclipse.jetty</groupId>
            <artifactId>jetty-maven-plugin</artifactId>
            <version>${jetty-plugin.version}</version>
            <configuration>
                <webApp>
                    <contextPath>/${project.artifactId}</contextPath>
                </webApp>
                <stopKey>CTRL+C</stopKey>
                <stopPort>8999</stopPort>
                <scan>10</scan>
            </configuration>
        </plugin>
    </plugins>
</build>
```
The above plugin will enable you to run the application using `mvn jetty:run`

### Step 2 - Add index.jsp

Our next step is to add a simple `index.jsp` to this web application. Create an `index.jsp` under `src/main/webapp`
with a title of __Basic Struts Application - Welcome__ and in the body add an h1 heading of __Welcome To Struts!__

**index.jsp**

```jsp
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Basic Struts Application - Welcome</title>
  </head>
  <body>
    <h1>Welcome To Struts!</h1>
  </body>
</html>
```

Run `mvn jetty:run` to run the application.

In a web browser go to [http://localhost:8080/basic-struts/index.jsp](http://localhost:8080/basic-struts/index.jsp).
You should see the following:

![basic_struts2_maven_jsp.png](attachments/basic_struts2_maven_jsp.png)

### Step 3 - Add Struts Jar Files To Class Path

Now that we know we have a working Java web application, let's add the minimal required Struts framework Jar files 
to our web application's class path. In `pom.xml` add the following dependency node:

**pom.xml dependency node**

```xml
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-core</artifactId>
    <version>${struts2.version}</version>
</dependency>
```

Of course replace the `${struts2.version}` with the current Struts version (or define within pom `properties`). 
Maven will get the `struts2-core` jar and the other jar files struts2-core requires (transitive dependencies). 

Beginning with Struts version 2.2.3 you do not need to specify a separate dependency node for javassist.
{:.alert .alert-info}

### Step 4 - Add Logging

To see what's happening under the hood, the example application for this tutorial uses log4j2. 
Setup a `log4j2.xml` configuration in the `src/main/resources` folder which contains the following

**log4j2.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration>
    <Appenders>
        <Console name="STDOUT" target="SYSTEM_OUT">
            <PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n"/>
        </Console>
    </Appenders>
    <Loggers>
        <Logger name="org.apache.struts2" level="debug"/>
        <Root level="warn">
            <AppenderRef ref="STDOUT"/>
        </Root>
    </Loggers>
</Configuration>
```

Note the above log4j2 configuration specifies the console as the log target.

You'll need to add a dependency node for log4j2 to the pom:

**pom.xml log4j dependency node**

```xml
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <version>${log4j2.version}</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-api</artifactId>
    <version>${log4j2.version}</version>
</dependency>
```

Using both `log4j-core` and `log4j-api` allows to use [the latest version of Log4j2](//logging.apache.org/log4j/2.x/maven-artifacts) without a clash with version provided by the framework. 

Optionally, if using maven bom "bill of materials" in `dependencyManagement` section for both Struts and log4j2,
`pom.xml` will look like. Note that this way you can omit `version` line for every used module,
and all `struts2-*` and `log4j-*` modules are managed to be of the same version.
The `struts2-bom` is available since version 2.3.20 of Struts.

```xml
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <java.version>17</java.version>

    <struts2.version>7.0.3</struts2.version>
    <log4j2.version>2.25.1</log4j2.version>
</properties>

<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.apache.struts</groupId>
            <artifactId>struts2-bom</artifactId>
            <version>${struts2.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
        <dependency>
            <groupId>org.apache.logging.log4j</groupId>
            <artifactId>log4j-bom</artifactId>
            <version>${log4j2.version}</version>
            <scope>import</scope>
            <type>pom</type>
        </dependency>
    </dependencies>
</dependencyManagement>

<dependencies>
<!-- Struts -->
    <dependency>
        <groupId>org.apache.struts</groupId>
        <artifactId>struts2-core</artifactId>
    </dependency>
    
    <dependency>
        <groupId>org.apache.logging.log4j</groupId>
        <artifactId>log4j-core</artifactId>
    </dependency>
</dependencies>
```

### Step 5 - Add Struts Servlet Filter

To enable the Struts framework to work with your web application you need to add a Servlet filter class and filter 
mapping to `web.xml`. Below is how the `web.xml` may look after adding the filter and filter-mapping nodes. 
`web.xml` is to be under `src/main/webapp/WEB-INF` folder.

**web.xml Servlet Filter**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app id="WebApp_ID" version="6.0"
         xmlns="https://jakarta.ee/xml/ns/jakartaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd">

    <display-name>Form Tags</display-name>
    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

</web-app>
```

For more information about configuring the deployment descriptor for Struts see [Core Developers Guide / web.xml page](/core-developers/web-xml). 
> Note: the url-pattern node value is `/*` meaning the Struts filter will be applied to all URLs for this web application.

### Step 6 - Create struts.xml

Struts can use either an XML configuration file or annotations (or both) to specify the relationship between a URL, 
a Java class, and a view page (such as `index.jsp`). For our basic Struts application, we'll use a minimal xml 
configuration. Note the file name is `struts.xml` and it should be in the `src/main/resources` folder (`struts.xml` 
must be on the web application's root class path).

**struts.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE struts PUBLIC
        "-//Apache Software Foundation//DTD Struts Configuration 6.0//EN"
        "https://struts.apache.org/dtds/struts-6.0.dtd">
<struts>

    <constant name="struts.devMode" value="true" />

    <package name="basicstruts2" extends="struts-default">
        <action name="index">
            <result>/index.jsp</result>
        </action>
    </package>

</struts>
```

This minimal Struts configuration file tells the framework that if the URL ends in `index.action` to redirect 
the browser to `index.jsp`.

For more information about the struts.xml configuration file see [struts.xml](../core-developers/struts-xml)

### Step 7 - Build and Run the Application

Run `mvn jetty:run` to run the web-application using the jetty maven-plugin.

View the console where you should see numerous debug messages that tell you the Struts framework is being included 
in the `basic-struts2` web application.

Open a web browser and go to [http://localhost:8080/basic-struts/index.action](http://localhost:8080/basic-struts/index.action) 
(note that's `index.action` not `index.jsp` at the end of the URL). You should see the same web page as when going to 
[http://localhost:8080/basic-struts/index.jsp](http://localhost:8080/basic-struts/index.jsp). 
View the log  messages written to the console and you should find several that discuss `index.action` and `index.jsp`:

**Struts Log Messages**

```
...
2017-04-17 11:16:01,084 DEBUG [qtp1723848804-22] DefaultActionProxy (DefaultActionProxy.java:89) - Creating an DefaultActionProxy for namespace [/] and action name [index]
...
2017-04-17 11:16:01,172 DEBUG [qtp1723848804-22] result.ServletDispatcherResult (ServletDispatcherResult.java:131) - Forwarding to location: /index.jsp
...
```

## Getting Help

The [Struts user mailing list](/mail) is an excellent place to get help. If you are having a problem getting 
this Basic Struts application to work search the Struts mailing list. If you don't find an answer to your problem, 
post a question on the mailing list.  

|Return to [Getting started](index)|or|onward to [Hello World using Struts](hello-world-using-struts)|
