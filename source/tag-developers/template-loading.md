---
layout: default
title: Tag Developers Guide (WIP)
---

# Template Loading


Templates are loaded first by searching the application and then by searching the classpath. If a template needs to be overridden, an edited copy can be placed in the application, so that is found first.

**(i) One for all**


> 

> 

> FreeMarker is the default templating engine. The FreeMarker templates are used regardless of what format the view may use. Internally, the JSP, FTL, Velocity tags are all rendered using FreeMarker.

> 

__Template and Themes__

Templates are loaded based the template directory and theme name (see [Selecting Themes](#PAGE_14016)). The template directory is defined by the 

~~~~~~~
struts.ui.templateDir
~~~~~~~
 property in _struts.properties_  (defaults to 

~~~~~~~
template
~~~~~~~
). If a tag is using the 

~~~~~~~
xhtml
~~~~~~~
 theme, the following two locations will be searched (in this order):

|In the application|/template/xhtml/template.ftl|
|------------------|-----------------------------|
|In the classpath|/template/xhtml/template.ftl|

 (!)  For performance reasons, you may want to prefer the first location, although the second one is more flexible. See _Performance Tuning_  for a discussion on this topic.

__Overriding Templates__

The default templates provided in the 

~~~~~~~
struts-core.jar
~~~~~~~
 should suit the needs of many applications. However, if a template needs to be modified, it's easy to plug in a new version. Extract the template you need to change from the 

~~~~~~~
struts-core.jar
~~~~~~~
, make the modifications, and save the updated copy to 

~~~~~~~
/template/$theme/$template.ftl
~~~~~~~
. If you are using the xhmtl theme and need to change how the select tags render, edit that template and save it to 

~~~~~~~
/template/xhtml/select.ftl
~~~~~~~
.

 (!)  It is easier and better to edit and override an existing template than provide a new one of your own.

__Altering Template Loading Behaviour__

It is possible to load template from other locations, like the file system or a URL. Loading templates from alternate locations can be useful not only for tags, but for custom results. For details, see the [FreeMarker](#PAGE_14078) documentation and consult the section on extending the FreeMarkerManager.

__Alternative Template Engines__

The framework provides for template rendering engines other than FreeMarker. (Though, there is rarely a need to use another system!)

**(!) Don't try this at home!**


> 

> 

> Alternative template engines are best left to advanced users with special needs!

> 

The framework supports three template engines, which can be controlled by the 

~~~~~~~
struts.ui.templateSuffix
~~~~~~~
 in _struts.properties_ .

|ftl (default)|[FreeMarker](#PAGE_14078)-based template engine|
|-------------|------------------------------------------------|
|vm|[Velocity](#PAGE_13894)-based template engine|
|jsp|[JSP](#PAGE_14141)-based template engine|

The only set of templates and themes provided in the distribution is for FreeMarker. In order to use another template engine, you must provide your own template and theme for that engine.



| Don't feel that you need to rewrite the templates to match your view format. If you need to customize the template, try copying and modifying the FreeMarker template first. Most changes should be obvious.

| 

