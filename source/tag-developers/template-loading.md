---
layout: default
title: Tag Developers Guide
---

# Template Loading
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Templates are loaded first by searching the application and then by searching the classpath. If a template needs to be 
overridden, an edited copy can be placed in the application, so that is found first.

**One for all**

> FreeMarker is the default templating engine. The FreeMarker templates are used regardless of what format the view may 
> use. Internally, the JSP, FTL, Velocity tags are all rendered using FreeMarker.

## Template and Themes

Templates are loaded based the template directory and theme name (see [Selecting Themes](selecting-themes)). 
The template directory is defined by the `struts.ui.templateDir` property in `struts.xml` (defaults to `template`). 
If a tag is using the `xhtml` theme, the following two locations will be searched (in this order):

|In the application|`/template/xhtml/template.ftl`|
|In the classpath|`/template/xhtml/template.ftl`|

> For performance reasons, you may want to prefer the first location, although the second one is more flexible. 
> See [Performance Tuning](../core-developers/performance-tuning) for a discussion on this topic.

## Overriding Templates

The default templates provided in the `struts2-core.jar` should suit the needs of many applications. However, 
if a template needs to be modified, it's easy to plug in a new version. Extract the template you need to change from 
the `struts2-core.jar`, make the modifications, and save the updated copy to `/template/$theme/$template.ftl`. 
If you are using the `xhtml` theme and need to change how the select tags render, edit that template and save it to
`/template/xhtml/select.ftl`.

> It is easier and better to edit and override an existing template than provide a new one of your own.

## Altering Template Loading Behaviour

It is possible to load template from other locations, like the file system or a URL. Loading templates from alternate 
locations can be useful not only for tags, but for custom results. For details, see the [FreeMarker](freemarker) 
documentation and consult the section on extending the FreeMarkerManager.

## Alternative Template Engines

The framework provides for template rendering engines other than FreeMarker. (Though, there is rarely a need to use 
another system!)

**Don't try this at home!**

> Alternative template engines are best left to advanced users with special needs!

The framework supports three template engines, which can be controlled by the `struts.ui.templateSuffix` in 
`struts.xml`.

|ftl (default)|[FreeMarker](freemarker)-based template engine|
|vm|[Velocity](velocity)-based template engine|
|jsp|[JSP](jsp)-based template engine|

The only set of templates and themes provided in the distribution is for FreeMarker. In order to use another template 
engine, you must provide your own template and theme for that engine.

> Don't feel that you need to rewrite the templates to match your view format. If you need to customize the template, 
> try copying and modifying the FreeMarker template first. Most changes should be obvious.
