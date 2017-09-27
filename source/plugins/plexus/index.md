---
layout: plugin
title: Plexus Plugin
---

# Plexus Plugin

> The Plexus Plugin is experimental. Feedback is appreciated!

While [Plexus](http://plexus.codehaus.org/) is similar to other inversion-of-control (IoC) or dependency injection frameworks such as the Spring Framework, it's fully-fledged container supports many more features.

The Plexus plugin enables Struts Actions, Interceptors, and Results to be created and injected by [Plexus](http://plexus.codehaus.org/).

This plugin provides an [ObjectFactory](/core-developers/object-factory.html) implementation that tries to create Struts Action, Interceptor, and Result classes as Plexus objects.

## Features

+ Allows Actions, Results, and Interceptors to be created and managed by Plexus

## Usage

To use the plugin, when configuring Struts Actions, Interceptors, or Results in `struts.xml`, set the `class` attribute to contain the Plexus object id, rather than the actual Java class.  This will allow Plexus to create the object and inject any dependencies also managed by Plexus.

### Example

**A simple Action using a Plexus id**

```xml
<action name="myAction" class="myPlexusId">
  <result>myAction.jsp</result>
</action>
```

### Settings

The following settings can be customized.  See the [developer guide](/core-developers/configuration-files.html).

|Setting|Description|Default|Possible Values|
|-------|-----------|-------|---------------|
|struts.objectFactory|The name or class name of the ObjectFactory implementation to use|plexus|plexus, struts, or any class that extends ObjectFactory|

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.
