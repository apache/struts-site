---
layout: plugin
title: SiteMesh Plugin
---

# SiteMesh Plugin

> This plugin got marked as deprecated since Struts 2.6!

## About SiteMesh

> [SiteMesh](http://www.sitemesh.org/) is a web-page layout and decoration framework and web application integration 
> framework to aid in creating large sites consisting of many pages for which a consistent look/feel, navigation and layout scheme is required.

The Sitemesh plugin allows Sitemesh templates to access framework resources.

The framework stores all its value stack information as request attributes, meaning that if you wish to display data that is on the stack (or even the ActionContext), you can do so by using the normal tag libraries that come with the framework. That's it!

## Features

+ Can use Struts tags in Sitemesh decorator templates

+ Sitemesh decorators can be written in FreeMarker as well as Velocity and JSP

## Usage

From 2.2+ the new `com.opensymphony.sitemesh.webapp.SiteMeshFilter` filter and Struts `org.apache.struts2.dispatcher.ng.listener.StrutsListener` context listener must be added to `web.xml`, like:


```xml

<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
</filter> 
...
<listener>
    <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
</listener> 

```

## FreeMarker  and Velocity Decorators

The plugin provides an extension of the SiteMesh _Velocity_  and _FreeMarker_  servlets. These servlets provide the standard variables and _Struts Tags_  that you used to create views in your favourite template language.

### FreeMarker

From 2.2+ the recommended way to use Freemarker with Sitemesh is through the `org.apache.struts2.sitemesh.FreemarkerDecoratorServlet` servlet, which can be configured like this in `web.xml`:


```xml

<servlet>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.FreemarkerDecoratorServlet</servlet-class>
    <init-param>
 	<param-name>default_encoding</param-name>
 	<param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet> 

<servlet-mapping>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <url-pattern>*.ftl</url-pattern>
</servlet-mapping> 

```

### Velocity

From 2.2+ the recommended way to use Velocity with Sitemesh is through the `org.apache.struts2.sitemesh.VelocityDecoratorServlet` servlet, which can be configured like this in `web.xml`:


```xml

<servlet>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.VelocityDecoratorServlet</servlet-class>
    <init-param>
 	<param-name>default_encoding</param-name>
 	<param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet> 

<servlet-mapping>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <url-pattern>*.ftl</url-pattern>
</servlet-mapping> 

```

### Full integration with SiteMesh 2 + Freemarker 2.4.2 + Velocity 1.3 , including Struts 2 Tags, ValueStack, and FreemarkerManager statics.

Such configuration is available as from Struts 2.2.0, please refer to [WW-3296](https://issues.apache.org/jira/browse/WW-3296) for me details.


```xml

    <filter>
        <filter-name>struts-prepare</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
    </filter>

    <filter>
        <filter-name>sitemesh</filter-name>
        <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
    </filter>

    <filter>
        <filter-name>struts-execute</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts-prepare</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <filter-mapping>
        <filter-name>sitemesh</filter-name>
        <url-pattern>/*</url-pattern>
        <dispatcher>REQUEST</dispatcher>
        <dispatcher>FORWARD</dispatcher>
        <dispatcher>INCLUDE</dispatcher>
    </filter-mapping>

    <filter-mapping>
        <filter-name>struts-execute</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <servlet>
        <servlet-name>sitemesh-freemarker</servlet-name>
        <servlet-class>org.apache.struts2.sitemesh.FreemarkerDecoratorServlet</servlet-class>
        <init-param>
            <param-name>default_encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>sitemesh-freemarker</servlet-name>
        <url-pattern>*.ftl</url-pattern>
    </servlet-mapping>

    <servlet>
        <servlet-name>JspSupportServlet</servlet-name>
        <servlet-class>org.apache.struts2.views.JspSupportServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <listener>
        <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
    </listener>

```

## Example

Here is an example of how to configure the filter chains in `web.xml`:


```xml

<filter>
    <filter-name>struts-prepare</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
</filter>

<filter>
    <filter-name>struts-execute</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
</filter>


<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts-prepare</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>sitemesh</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>struts-execute</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<listener>
    <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
</listener>

<servlet>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.FreemarkerDecoratorServlet</servlet-class>
    <init-param>
        <param-name>default_encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>

<servlet>
    <servlet-name>sitemesh-velocity</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.VelocityDecoratorServlet</servlet-class>
    <init-param>
        <param-name>default_encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <url-pattern>*.ftl</url-pattern>
</servlet-mapping>

<servlet-mapping>
    <servlet-name>sitemesh-velocity</servlet-name>
    <url-pattern>*.vm</url-pattern>
</servlet-mapping>

```

Struts 2.1 web.xml filter chain example:


```xml

<filter>
    <filter-name>struts-prepare</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
</filter>

<filter>
    <filter-name>struts-execute</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
</filter>

<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.module.sitemesh.filter.PageFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts-prepare</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>sitemesh</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>struts-execute</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

```

You do not need the struts2-sitmesh-plugin if you are using JSP for your decorators.

Here are the only only changes needed to web.xml


```xml

<filter>
    <filter-name>struts2-prepare</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
</filter>

<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
</filter>

<filter>
    <filter-name>struts2-execute</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts2-prepare</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>sitemesh</filter-name>
    <url-pattern>/*</url-pattern>
    <dispatcher>REQUEST</dispatcher>
    <dispatcher>FORWARD</dispatcher>
    <dispatcher>INCLUDE</dispatcher>
</filter-mapping>

<filter-mapping>
    <filter-name>struts2-execute</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

```

## Settings

This plugin doesn't support any global settings.

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.
