---
layout: core-developers
title: struts-default.xml
---

# struts-default.xml

A base configuration file named 

~~~~~~~
struts-default.xml
~~~~~~~
 is included in the 

~~~~~~~
struts2.jar
~~~~~~~
 file\. This file is automatically included into 

~~~~~~~
struts.xml
~~~~~~~
 file to provide the standard configuration settings without having to copy them\.



| To exclude the struts\-default\.xml or to provide your own version, see the struts\.configuration\.files setting in [struts.properties](struts-properties.html)\.

| 

The contents of struts\-default\.xml are here:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/struts-default.xml}
~~~~~~~

This file defines all of the default bundled results and interceptors and many interceptor stacks which you can use either as\-is or as a basis for your own application\-specific interceptor stacks\. **Notice the name of the package is "struts\-default"**\.