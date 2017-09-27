---
layout: plugin
title: Tiles Plugin
---

# Tiles Plugin

Tiles is a templating framework designed to easily allow the creation of web application pages with a consistent look and feel. It can be used for both page decorating and componentization.

The Tiles plugin allows actions to return Tiles pages.


## Features

+ Supports Tiles in Freemarker, JSP, and Velocity

+ Provides annotations to keep tiles.xml short and put definitons into actions

## Usage

The following steps must be taken in order to enable tiles support within your Struts2 application:

1. Include the struts-tiles-plugin as a dependency in your web application. If you are using maven2, the dependency configuration will be similar to:


```xml
<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-tiles-plugin</artifactId>
  <version>${version.tiles}</version>
</dependency>

```

{:start="2"}
2. Register the tiles listener. This listener will typically either be the standard tiles listener (org.apache.tiles.listener.TilesListener) or the Struts2 replacement (org.apache.struts2.tiles.TilesListener). The latter provides tighter integration with Struts features such as freemarker integration.


```xml
<listener>
  <listener-class>org.apache.struts2.tiles.StrutsTilesListener</listener-class>
</listener>

```

{:start="3"}
3. All package definitions which require tiles support must either extend the tiles-default package or must register the [Tiles Result](https://cwiki.apache.org/confluence/pages/createpage.action?spaceKey=WW&title=Tiles+Result&linkCreation=true&fromPageId=27401) type definition.


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

{:start="5"}
5. Instead of xml configuration you can use annotations


```java
@Result(name = "success", type="tiles")
@TilesDefinition(extend = "fooLayout", putAttributes = {
    @TilesPutAttribute(name = "header", value = "/WEB-INF/tiles/header.jsp"),
    @TilesPutAttribute(name = "body", value = "/WEB-INF/tiles/body.ftl")
})
public class FooAction extends ActionSupport {
```

{:start="6"}
6. You have to define Tiles Definitons in a tiles.xml file. That can be placed in `resources` or in `WEB-INF`.


```xml
<!DOCTYPE tiles-definitions PUBLIC
        "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"
        "http://tiles.apache.org/dtds/tiles-config_3_0.dtd">

<tiles-definitions>

    <definition name="fooLayout" template="/WEB-INF/tiles/layout.jsp">
        <put-attribute name="title" value="Tiles Sample"/>
        <put-attribute name="header" value=".header"/>
        <put-attribute name="body" value=".bodyp"/>
    </definition>

    <definition name="tilesWorks" extends="fooLayout">
        <put-attribute name="header" value="/WEB-INF/tiles/header.jsp"/>
        <put-attribute name="body" value="/WEB-INF/tiles/body.jsp"/>
    </definition>

</tiles-definitions>
```

As from Struts 2.3.28, the plugin automatically loads all Tiles definitions matching the following pattern tiles*.xml - you don't have to specify them via org.apache.tiles.definition.DefinitionsFactory.DEFINITIONS_CONFIG in web.xml, but you can use this option if your application is going to work in restricted servlet environment e.g. Google AppEngine. In such case, definitions will be read from provided init-param.

### Accessing Struts attributes

As from Struts version 2.5.3 it's possible accessing defined values on a `ValueStack` using `S2` prefix when defining an expression in tiles definition, e.g.:

```xml
<definition name="home" extends="logged-in">
  <put-attribute name="title" expression="S2:actionProperty"/>
  <put-attribute name="body" value="/WEB-INF/tiles/home.jsp"/>
</definition>
```

In such case Tiles will delegate evaluation of the expression to Struts and `ValueStack` will be examined to evaluate the expression.

### I18N

Instead of defining new tiles definitions per supported language (i.e.: `tiles.xml`, `tiles_de.xml`, `tiles_pl.xml`) you can use `I18N` prefix to evaluate provided expression as a key in Struts resource bundles. 


```xml
<definition name="home" extends="logged-in">
  <put-attribute name="title" expression="I18N:home.title"/>
  <put-attribute name="body" value="/WEB-INF/tiles/home.jsp"/>
</definition>
```

## Example

This example shows a Tiles layout page using Struts tags:

{% snippet lang=jsp|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=apps/showcase/src/main/webapp/WEB-INF/tiles/layout.jsp;hb=HEAD %}

Please check [tiles](https://github.com/apache/struts-examples/tree/master/tiles) example in [struts-examples](https://github.com/apache/struts-examples/tree/master/tiles) project.

## Settings

This plugin does inherits settings from [Tiles configuration](http://tiles.apache.org/config-reference.html).

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory. No other files need to be copied or created.
