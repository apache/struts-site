---
layout: plugin
title: Async Plugin
parent:
  url: index.html
  title: Plugins
---

# Async Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The Async plugin allows to implement actions as using
an [Asynchronous Processing](https://docs.oracle.com/javaee/7/tutorial/servlets012.htm)
available as from Servlet API 3. It's a thin layer over the Servlet async layer.

## Simple usage

The example code below shows how to implement and use async actions. Please check an async action example
in our [Showcase app](https://github.com/apache/struts/tree/master/apps/showcase/src/main/java/org/apache/struts2/showcase/async).

**Action**

```java
public class AsyncAction {

    public Callable<String> execute() throws InterruptedException {
        return new Callable<String>() {
            @Override
            public String call() throws Exception {
                waitForEvent();
                return "success";
            }
        };
    }

    private void waitForEvent() throws InterruptedException {
        Thread.sleep(40000);
    }
}
```

**struts.xml**

```xml
<action name="async" class="com.company.struts.AsyncAction">
    <result name="success" type="json"/>
</action>
```

**web.xml**

You must define the Struts Servlet to allow support Async actions.

```xml
<servlet>
    <servlet-name>strutsServlet</servlet-name>
    <servlet-class>org.apache.struts2.dispatcher.servlet.StrutsServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
    <async-supported>true</async-supported>
</servlet>

<servlet-mapping>
<servlet-name>strutsServlet</servlet-name>
<url-pattern>/</url-pattern>
</servlet-mapping>
```

## Customize timeout

**Action**

```java
public class AsyncAction {

    public Callable<String> execute() throws InterruptedException {
        return new AsyncAction(60000/*timeout*/, new Callable<String>() {
            @Override
            public String call() throws Exception {
                waitForEvent();
                return "success";
            }
        });
    }

    private void waitForEvent() throws InterruptedException {
        Thread.sleep(40000);
    }
}
```

## Serializing multiple async tasks

**Action**

```java
public class AsyncAction {

    public Callable<String> execute() throws InterruptedException {
        return new Callable<String>() {
            @Override
            public String call() throws Exception {
                waitForEvent1();
                return new Callable<String>() {

                    @Override
                    public String call() throws Exception {
                        waitForEvent2();
                        return "success";
                    }
                };
            }
        };
    }

    private void waitForEvent1() throws InterruptedException {
        Thread.sleep(40000);
    }

    private void waitForEvent2() throws InterruptedException {
        Thread.sleep(40000);
    }
}
```
