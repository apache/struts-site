---
layout: plugin
title: TestNG Plugin
---

# TestNG Plugin

The TestNG plugin provides integration with the popular [TestNG](http://testng.org) unit testing framework.

This plugin provides a base `StrutsTestCase` class that can subclassed for tests that work on Struts 2 components.  

> This plugin is only available with Struts 2.1.1 or later

## Features

+ Base test class that starts up a full Struts 2 instance

+ Great for testing how configuration is loaded and Struts 2 components are used

## Usage

First, include the plugin your POM (if using Maven 2) under the test scope:


```xml

<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-testng-plugin</artifactId>
  <version>STRUTS_2_VERSION</version>
  <scope>test</scope>
</dependency>

```

If you are not using Maven 2 to build and test your code, ensure the plugin jar and its dependencies (spring-mock and testng) are in the testing classpath.

Now, your unit tests can subclass the `StrutsTestCase` class, which handles starting and stopping the Struts 2 framework:


```java

public class MyTest extends StrutsTestCase {
 // testing code
}

```

## Settings

This plugin doesn't support any global settings.

## Installation

This plugin is meant to be used during unit testing, and not during runtime.  Therefore, include it in your build's classpath, but do not deploy it to `WEB-INF/lib` in your Struts 2 application.
