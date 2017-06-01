---
layout: core-developers
title: struts.xml
---

# struts.xml

The core configuration file for the framework is the default (

~~~~~~~
struts.xml
~~~~~~~
) file and should reside on the classpath of the webapp (generally 

~~~~~~~
/WEB-INF/classes
~~~~~~~
)\.

+ The default file may include other configuration files as needed\.

+ A 

~~~~~~~
struts-plugin.xml
~~~~~~~
 file can be placed in a JAR and automatically plugged into an application, so that modules can be self\-contained and automatically configured\.
	

  + In the case of Freemarker and Velocity modules, the templates can also be loaded from the classpath, so the entire module can be plugged in as a single JAR\.
