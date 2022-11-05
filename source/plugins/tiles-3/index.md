---
layout: plugin
title: Tiles 3 Plugin
parent:
    url: /plugins
    title: Plugins
---

# Tiles 3 Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

> This plugin was dropped in Struts 2.5, instead please use [Tiles Plugin](../tiles) which was extended and upgraded to Tiles 3.

> Tiles is a templating framework designed to easily allow the creation of web application pages with a consistent look 
> and feel. It can be used for both page decorating and componentization. This is the first release of the plugin!

The Tiles 3 plugin allows actions to return Tiles 3 pages.

## Features

+ Supports Tiles in Freemarker, JSP, and Velocity - more testing is needed.

## Usage

The following steps must be taken in order to enable Tiles 3 support within your Struts2 application:

1. Include the struts-tiles3-plugin as a dependency in your web application, do not include the old struts2-tiles-plugin! If you are using maven3, the dependency configuration will be similar to:


```xml
<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-tiles3-plugin</artifactId>
  <version>${version.tiles}</version>
  <scope>compile</scope>
</dependency>

```

{:start="2"}
2. Register the tiles listener.


```xml
<listener>
    <listener-class>org.apache.tiles.extras.complete.CompleteAutoloadTilesListener</listener-class>
</listener>

```

{:start="3"}
3. All package definitions which require tiles support must either extend the tiles-default package or must register the [Tiles 3 Result](https://cwiki.apache.org/confluence/pages/createpage.action?spaceKey=WW&title=Tiles+3+Result&linkCreation=true&fromPageId=30750969) type definition.


```xml
<result-types>
  <result-type name="tiles" class="org.apache.struts2.views.tiles.TilesResult"/>
</result-types>

```

{:start="4"}
4. Configure your actions to utilize a tiles definition:


```xml
<action name="sample" class="org.apache.struts2.tiles.example.SampleAction" >
  <result name="success" type="tiles">tilesWorks</result>
</action>

```

## Example

TBD

## Settings

This plugin does inherits settings from [Tiles configuration](http://tiles.apache.org/config-reference).

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory. No other files need to be copied or created.
