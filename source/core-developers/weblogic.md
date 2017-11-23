---
layout: core-developers
title: WebLogic
---

# WebLogic


When deploying to WebLogic, some developers report problems with the framework locating resources, especially with Velocity\. For more about WebLogic and Velocity, see the [Velocity website](http://wiki\.apache\.org/jakarta\-velocity/VelocityAndWeblogic)^[http://wiki\.apache\.org/jakarta\-velocity/VelocityAndWeblogic]\.

| 

To deploy to WebLogic, the common approach is to create and deploy an unexpanded WAR to the WebLogic deployment directory\. With WL 8\.x, the deployment directory is typically at \<bea\_home\>/user\_projects/domains/mydomain/\.

> 

## Adding an struts\-velocity\.properties Configuration File

+ In the `struts.properties` file (usually kept in the `WEB-INF/classes` directory), add an entry that specifies a Velocity configuation file\.
	

  + 

**struts\.properties**


~~~~~~~

struts.velocity.configfile = struts-velocity.properties

~~~~~~~

+ Create the corresponding Velocity properties file ("struts\-velocity\.properties"), preferably in the same location as the `struts.properties` file\.

+ Copy into the Velocity properties file the contents of the `velocity.properties` file that is the the SAF 

~~~~~~~
velocity-dep.jar
~~~~~~~
\.

+ In your new `struts-velocity.properties` file, find he section titled  "

~~~~~~~
T E M P L A T E  L O A D E R S
~~~~~~~
", and change this section as so:



~~~~~~~

===========================================
resource.loader = class

file.resource.loader.description = Velocity File Resource Loader
file.resource.loader.class = org.apache.velocity.runtime.resource.loader.FileResourceLoader
file.resource.loader.path = .
file.resource.loader.cache = false
file.resource.loader.modificationCheckInterval = 2

class.resource.loader.class = org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader
class.resource.loader.cache = true
===========================================

~~~~~~~

+ Redeploy a fresh WAR to WebLogic\.

## NPE when using Struts 2 Jasper Reports plugin

When using mentioned plugin in Weblogic 11g you can get NullPointerException within Struts 2\. To solve the problem you must enable the "Archived Real Path" global property in Weblogic admin console \> configuration \> Web Applications\. It's because JasperReportsResult determines the report directory base on servletContext\.getRealPath(finalLocation)\.

## Convention based application doesn't work

When you deployed an application that base on the Convention Plugin and you get an error messages that says:


~~~~~~~

There is no Action mapped for namespace / and action name xxxxxx

~~~~~~~

create struts\.properties file in WEB\-INF/classes folder (in the expanded application's folder or in the source code) with below statements:


~~~~~~~

#struts convention property modifications for Weblogic
struts.convention.action.includeJars=.*?/yourwebapp.*?jar(!/)?
struts.convention.action.fileProtocols=jar,zip

~~~~~~~

Thanks to Amit who the first published solution on his [blog](http://tech\-architecture\.blogspot\.com/2009/02/getting\-struts\-21\-to\-work\-in\-weblogic\.html)^[http://tech\-architecture\.blogspot\.com/2009/02/getting\-struts\-21\-to\-work\-in\-weblogic\.html]
