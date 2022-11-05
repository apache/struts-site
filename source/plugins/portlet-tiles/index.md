---
layout: plugin
title: Portlet Tiles Plugin
parent:
    url: index.html
    title: Plugins
---

# Portlet Tiles Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

> This plugin got marked as deprecated since Struts 2.6!

Tiles is a templating framework designed to easily allow the creation of web application pages with a consistent look and feel. It can be used for both page decorating and componentization.

## Features

+ Supports Tiles in Portlet environment

## Usage

The following steps must be taken in order to enable tiles support within your Struts2 Portlet application:

1. Include the struts-portlet-tiles-plugin as a dependency in your web application.  If you are using maven2, the dependency configuration will be similar to:


```xml

<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-portlet-tiles-plugin</artifactId>
  <version>${struts2.version}</version>
</dependency>

```

{:start="2"}
2. All package definitions which require tiles support must either extend the struts-portlet-tiles-default package or must register the _Tiles Result_  type definition dedicated for Portlets.


```xml

<result-types>
  <result-type name="tiles" class="org.apache.struts2.views.tiles.PortletTilesResult"/>
</result-types>

```

{:start="3"}
3. and dedicated action to support Tiles in portlet environment


```xml

<action name="tilesDirect" class="org.apache.struts2.portlet.dispatcher.DirectRenderFromEventAction">
    <result type="tiles" name="success">${location}</result>
</action>

```

{:start="4"}
4. Configure your actions to utilize a tiles definition:


```xml

<action name="sample" class="org.apache.struts2.tiles.example.SamplePortletAction" >
  <result name="success" type="tiles">tilesWorks</result>
</action>

```

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.
