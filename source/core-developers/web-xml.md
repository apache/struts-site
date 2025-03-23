---
layout: default
title: web.xml
parent:
  title: Core Developers
  url: index
---

# web.xml
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The `web.xml` web application descriptor file represents the core of the Java web application, so it is appropriate 
that it is also part of the core of the Struts framework. In the `web.xml` file you can use one of the two options:
1. Configure `org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter` which acts as a central 
  point of initializing the Struts framework and handles all requests.
2. Use combination of `org.apache.struts2.dispatcher.filter.StrutsPrepareFilter` and `org.apache.struts2.dispatcher.filter.StrutsExecuteFilter`
  to support custom integration with other frameworks like Sitemesh.

## Simple Example

Configuring `web.xml` for the framework is a matter of adding a filter and filter-mapping.

**Filter Example (web.xml)**

```xml
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee 
         http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd"
         version="3.1">

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <!-- ... -->

</web-app>
```

See [SiteMesh Plugin](../plugins/sitemesh/) for an example on when to use separate Filters for prepare and execution phase.

## Custom mapping

The above approach is a preferred way of enabling support for Struts in your web application. Yet you can have more
specific requirements and use more specific mapping like presented below:

```xml
<web-app ...>

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>*.action</url-pattern>
    </filter-mapping>

</web-app>
```

In such case only requests ending with `.action` will be directed by a Servlet container to be handled by Struts filter.
This can impact serving static content provided by Struts and you will have to define additional mapping to support it:

```xml
<web-app ...>

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>*.action</url-pattern>
    </filter-mapping>

    <filter-mapping>
        <filter-name>struts2</filter-name>
        <url-pattern>/static/*</url-pattern>
    </filter-mapping>

</web-app>
```

## Exclude specific URLs

In the example above we've mapped the Struts 2 dispatcher to `/*`, so Struts has a crack at all incoming requests. 
This is because Struts serves static content from its jar files, including Dojo JavaScript files (if using 2.0, 
or the Dojo plugin in 2.1+) and FreeMarker templates for the Struts tags that produce HTML.

If we change the filter mapping to something else, for example `/*.html`, we must take this into account and extract 
the content that would normally be served from the Struts jar files, or some other solution.

Since Struts 2.1.7, you are able to provide a comma separated list of patterns for which when matching against 
the request URL the Filter will just pass by. This is done via the configuration option `struts.action.excludePattern`, 
for example in your struts.xml:

```xml
<struts>
    <constant name="struts.action.excludePattern" value=".*unfiltered.*,.*\.nofilter"/>
    ...

</struts>
```

Read more in [Static content](static-content).

## Taglib Example

Typically, configuring a taglib is neither required nor recommended. The taglib is included in `struts-core.jar`, and 
the container will discover it automatically.

> If, for some reason, a taglib configuration is needed within web.xml, extract the TLD file from the `struts-core.jar`
`META-INF` folder, and add a `taglib` element to the `web.xml`.

```xml
<web-app ...>
    <!-- ... --> 

    <taglib>
       <taglib-uri>/s</taglib-uri>
       <taglib-location>/WEB-INF/struts-tags.tld</taglib-location>
    </taglib>
</web-app>
```

## Custom FileManager and FileManagerFactory implementations

If there is a need to support an App Server's specific file system (eg. VFS in JBoss), you can implement your own 
version of FileManager. But it must be registered at "the beginning" to support bootstrap of the whole framework.

To register your own FileManger you can do it with `<init-param/>` as below:

```xml
<filter>
     <filter-name>struts2</filter-name>
     <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
     <init-param>
         <param-name>struts.fileManager</param-name>
         <param-value>com.company.MyFileManager</param-value>
     </init-param>
</filter>
```

You can as well register your own FileManagerFactory with `<init-param/>`, see example:

```xml
<filter>
     <filter-name>struts2</filter-name>
     <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
     <init-param>
         <param-name>struts.fileManagerFactory</param-name>
         <param-value>com.company.MyFileManagerFactory</param-value>
     </init-param>
</filter>
```

Take a look on default implementations - `DefaultFileManager.java` and `DefaultFileManagerFactory.java` to understand how and why.

## Custom configuration provider

It is possible to use your custom `ConfigurationProvider` to programmatically configure your application. To do this use 
`configProviders` (it can be a comma-separated list of class names) `<init-param/>` as below:

```xml
<filter>
     <filter-name>struts2</filter-name>
     <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
     <init-param>
         <param-name>configProviders</param-name>
         <param-value>com.company.MyConfigurationProvider</param-value>
     </init-param>
</filter>
```

See [Configuration Provider & Configuration](configuration-provider-and-configuration) for more details.
