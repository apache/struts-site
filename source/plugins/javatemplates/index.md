---
layout: plugin
title: Javatemplates Plugin
---

# Javatemplates Plugin

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

+ _a_ 
+ _actionerror_ 
+ _actionmessage_ 
+ _checkbox_ 
+ _datetextfield_ 
+ _div_ 
+ _fielderror_ 
+ _file_ 
+ _form_ 
+ _head_ 
+ _hidden_ 
+ _label_ 
+ _password_ 
+ _select_ 
+ _reset_ 
+ _submit_ 
+ _textfield_ 
+ _textarea_ 
+ _token_ 

## Performance benchmark

TODO
