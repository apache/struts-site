---
layout: core-developers
title: web.xml
---

# web.xml


The 

~~~~~~~
web.xml
~~~~~~~
 web application descriptor file represents the core of the Java web application, so it is appropriate that it is also part of the core of the Struts framework\. In the 

~~~~~~~
web.xml
~~~~~~~
 file, Struts defines its FilterDispatcher, the Servlet Filter class that initializes the Struts framework and handles all requests\. This filter can contain initialization parameters that affect what, if any, additional configuration files are loaded and how the framework should behave\.

####Simple Example####

Configuring 

~~~~~~~
web.xml
~~~~~~~
 for the framework is a matter of adding a filter and filter\-mapping\.

**Filter Example (web\.xml)**


~~~~~~~
<web-app id="MyStrutsApp" version="2.4" 
	xmlns="http://java.sun.com/xml/ns/j2ee" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

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

~~~~~~~

#####Changed filter package in Struts \>= 2\.5#####

As from Struts 2\.5 all filters were moved to top package, if you are using older version you must use the old package, see example:


~~~~~~~
<web-app id="WebApp_9" version="2.4" 
	xmlns="http://java.sun.com/xml/ns/j2ee" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>
    ...
~~~~~~~

#####Changed Filter Structure in Struts \>= 2\.1\.3#####

 To split up the the dispatcher phases, FilterDispatcher is deprecated since Struts 2\.1\.3\. If working with older versions, you need to use


~~~~~~~
    ...
    <filter>
        <filter-name>struts2</filter-name>
        <filter-class>org.apache.struts2.dispatcher.FilterDispatcher</filter-class>
    ...

~~~~~~~

 See _SiteMesh Plugin_  for an example on when to use seperate Filters for prepare and execution phase

#####Exclude specific URLs#####

 In the example above we've mapped the Struts 2 dispatcher to 

~~~~~~~
/*
~~~~~~~
, so Struts 2 has a crack at all incoming requests\. This is because Struts 2 serves static content from its jar files, including Dojo JavaScript files (if using S2\.0, or the Dojo plugin in S2\.1\+) and FreeMarker templates for the Struts 2 tags that produce HTML\.

If we change the filter mapping to something else, for example 

~~~~~~~
/*.html
~~~~~~~
, we must take this in to account and extract the content that would normally be served from the Struts 2 jar files, or some other solution\.

Since Struts 2\.1\.7, you are able to provide a comma seperated list of patterns for which when matching against the
 request URL the Filter will just pass by\. This is done via the configuration option struts\.action\.excludePattern, for example in your struts\.xml

 


~~~~~~~
<struts>
    <constant name="struts.action.excludePattern" value=".*unfiltered.*,.*\\.nofilter"/>
    ...

</struts>
~~~~~~~

####Taglib Example####

Typically, configuring a taglib is neither required nor recommended\. The taglib is included in 

~~~~~~~
struts-core.jar
~~~~~~~
, and the container will discover it automatically\.

 (ok)  If, for some reason, a taglib configuration is needed within web\.xml, extract the TLD file from the 

~~~~~~~
struts-core.jar
~~~~~~~


~~~~~~~
META-INF
~~~~~~~
 folder, and add a 

~~~~~~~
taglib
~~~~~~~
 element to the 

~~~~~~~
web.xml
~~~~~~~
\.


~~~~~~~
    <!-- ... -->
    </welcome-file-list>

    <taglib>
       <taglib-uri>/s</taglib-uri>
       <taglib-location>/WEB-INF/struts-tags.tld</taglib-location>
    </taglib>
</web-app>

~~~~~~~

####Custom FileManager and FileManagerFactory implementations####

If there is a need to support an App Server's specific file system (eg\. VFS in JBoss), you can implement your own version of FileManager\. But it must be registered at "the beginning" to support bootstrap of the whole framework\.

To register your own FileManger you can do it with \<init\-param/\> as below:


~~~~~~~
<filter>
     <filter-name>struts2</filter-name>
     <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
     <init-param>
         <param-name>struts.fileManager</param-name>
         <param-value>com.company.MyFileManager</param-value>
     </init-param>
</filter>

~~~~~~~

You can as well register your own FileManagerFactory with \<init\-param/\>, see example:


~~~~~~~
<filter>
     <filter-name>struts2</filter-name>
     <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>
     <init-param>
         <param-name>struts.fileManagerFactory</param-name>
         <param-value>com.company.MyFileManagerFactory</param-value>
     </init-param>
</filter>

~~~~~~~

Take a look on default implementations \- DefaultFileManager\.java and DefaultFileManagerFactory\.java to understand how and why\.

####Custom configuration provider####

It is possible to use your custom 

~~~~~~~
ConfigurationProvider
~~~~~~~
 to programmatically configure your application\. To do this use 

~~~~~~~
configProviders
~~~~~~~
 (it can be a comma\-separated list of class names) 

~~~~~~~
<init-param/>
~~~~~~~
 as below:


~~~~~~~
<filter>
     <filter-name>struts2</filter-name>
     <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
     <init-param>
         <param-name>configProviders</param-name>
         <param-value>com.company.MyConfigurationProvider</param-value>
     </init-param>
</filter>
~~~~~~~

See [Configuration Provider & Configuration](configuration-provider-and-configuration.html) for more details.

 
