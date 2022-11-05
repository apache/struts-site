---
layout: plugin
title: Javatemplates Plugin
parent:
    url: index.html
    title: Plugins
---

# Javatemplates Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This plugin provides a faster Java implementation of tags in the "simple" theme.

## Installation

1. This plugin can be installed by copying the plugin jar into your application's /WEB-INF/lib directory. No other files need to be copied or created.
2. Set these properties in struts.xml:

```xml
<struts>
  <constant name="struts.ui.templateSuffix" value="java" />
  <constant name="struts.ui.theme" value="simple" />
</struts>
```

The plugin is a drop in replacement for the supported tags in the simple theme, so no other configuration is required.

## Supported tags

- `a` 
- `actionerror` 
- `actionmessage` 
- `checkbox` 
- `datetextfield` 
- `div` 
- `fielderror` 
- `file` 
- `form` 
- `head` 
- `hidden` 
- `label` 
- `password` 
- `select` 
- `reset` 
- `submit` 
- `textfield` 
- `textarea` 
- `token` 

## Performance benchmark

TODO
