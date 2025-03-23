---
layout: default
title: Reloading configuration
parent:
  title: Configuration Files
  url: configuration-files
---

# Reloading configuration

Struts allows for dynamic reloading of xml configuration file (ie, reloading actions.xml).
This allows you to reconfigure your action mapping during development. There may be a slight performance penalty, 
so this is not recommended for production use.

To enable this feature, add the following to your struts.properties file:

```
struts.configuration.xml.reload=true
```
