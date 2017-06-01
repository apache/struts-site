---
layout: core-developers
title: Reloading configuration
---

# Reloading configuration

Struts allows for dynamic reloading of xml configuration file (ie, reloading actions\.xml)\.

This allows you to reconfigure your action mapping during development\. There may be a slight performance penalty, so this is not recommended for production use\.

In order to enable this feature, add the following to your struts\.properties file:


~~~~~~~

struts.configuration.xml.reload=true

~~~~~~~
