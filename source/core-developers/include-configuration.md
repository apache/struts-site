---
layout: default
title: Include Configuration
parent:
    title: Core Developers
    url: index
---

# Include Configuration

A popular strategy is "divide and conquer". The framework lets you apply "divide and conquer" to configuration files 
using the `<include .../>` element.

```xml
<!DOCTYPE struts PUBLIC
  "-//Apache Software Foundation//DTD Struts Configuration 6.0//EN"
  "https://struts.apache.org/dtds/struts-6.0.dtd">
<struts>
    <include file="Home.xml"/>
    <include file="Hello.xml"/>
    <include file="Simple.xml"/>
    <include file="/util/POJO.xml"/>
    <include file="/com/initech/admin/admin-struts.xml"/>
</struts>
```
Each included file must be in the same format as `struts.xml`, including the `DOCTYPE`. The include files can be placed 
anywhere on the classpath and should be referred to by that path by the "file" attribute.

In a large-team environment, the include files can be used to organize different modules of the application that are 
being developed by different team members. 
