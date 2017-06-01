---
layout: core-developers
title: struts.properties
---

# struts.properties

 (ok)  All properties can also be set using [Constant Configuration](#PAGE_29602) in an XML configuration file\.

The framework uses a number of properties that can be changed to fit your needs\. To change any of these properties, specify the property key and value in an 

~~~~~~~
struts.properties
~~~~~~~
 file\. The properties file can be locate anywhere on the classpath, but it is typically found under 

~~~~~~~
/WEB-INF/classes
~~~~~~~

The list of properties can be found in 

~~~~~~~
struts-default.properties
~~~~~~~
 (inside 

~~~~~~~
struts2.jar
~~~~~~~
)\.

**struts\-default\.properties**


> \{snippet:lang=none|id=complete\_file|url=struts2/core/src/main/resources/org/apache/struts2/default\.properties\}

