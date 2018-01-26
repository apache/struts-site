---
layout: default
title: Plugins
parent:
  url: index.html
  title: Plugins
---

# Plugins
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Struts 2 plugins contain classes and configuration that extend, replace, or add to existing Struts framework functionality. A plugin can be installed by adding its JAR file to the application's class path, in addition to the JAR files to fulfill whatever dependencies the plugin itself may have. To configure the plugin, the JAR should contain a `struts-plugin.xml` file, which follows the same format as an ordinary `struts.xml` file.

Since a plugin can contain the `struts-plugin.xml` file, it has the ability to:

+ Define new packages with results, interceptors, and/or actions

+ Override framework constants

+ Introduce new extension point implementation classes

Many popular but optional features of the framework are distributed as plugins. An application can retain all the plugins provided with the distribution, or just include the ones it uses. Plugins can be used to organize application code or to distribute code to third-parties.

Packages defined in a plugin can have parent packages that are defined in another plugin. Plugins may define configuration elements with classes not contained in the plugin. Any classes not included in the plugin's JAR must be on the application's classpath at runtime. As from Struts 2.3.5

The framework loads its default configuration first, then any plugin configuration files found in others JARs on the classpath, and finally the "bootstrap" `struts.xml`.

1. `struts-default.xml` (bundled in the Core JAR)

2. `struts-plugin.xml` (as many as can be found in other JARs)

3. `struts.xml` (provided by your application)

Since the `struts.xml` file is always loaded last, it can make use of any resources provided by the plugins bundled with the distribution, or any other plugins available to an application.

## Static resources

To include static resources in your plugins add them under "/static" in your jar. And include them in your page using "/struts" as the path, like in the following example:

```ftl
<!-- Assuming /static/main.css is inside a plugin jar, to add it to the page: -->

<@s.url value="/struts/main.css" var="css" />
<link rel="stylesheet" type="text/css" href="%{#css}" />
```

Read also [StaticContentLoader JavaDoc](https://struts.apache.org/maven/struts2-core/apidocs/org/apache/struts2/dispatcher/StaticContentLoader.html).

## Extension Points

Extension points allow a plugin to override a key class in the Struts framework with an alternate implementation. For example, a plugin could provide a new class to create Action classes or map requests to Actions.

The following extension points are available in Struts 2:

|Type|Property|Scope|Description|
|----|--------|-----|-----------|
|ObjectFactory|struts.objectFactory|singleton|Creates actions, results, and interceptors|
|factory.ActionFactory|struts.objectFactory.actionFactory|singleton|Dedicated factory used to create Actions, you can implement/extend existing one instead of defining new ObjectFactory|
|factory.ResultFactory|struts.objectFactory.resultFactory|singleton|Dedicated factory used to create Results, you can implement/extend existing one instead of defining new ObjectFactory|
|factory.InterceptorFactory|struts.objectFactory.interceptorFactory|singleton|Dedicated factory used to create Interceptors, you can implement/extend existing one instead of defining new ObjectFactory|
|factory.ConverterFactory|struts.objectFactory.converterFactory|singleton|Dedicated factory used to create TypeConverters, you can implement/extend existing one instead of defining new ObjectFactory|
|factory.ValidatorFactory|struts.objectFactory.validatorFactory|singleton|Dedicated factory used to create Validators, you can implement/extend existing one instead of defining new ObjectFactory|
|ActionProxyFactory|struts.actionProxyFactory|singleton|Creates the ActionProxy|
|util.ObjectTypeDeterminer|struts.objectTypeDeterminer|singleton|Determines what the key and element class of a Map or Collection should be|
|dispatcher.mapper.ActionMapper|struts.mapper.class|singleton|Determines the ActionMapping from a request and a URI from an ActionMapping|
|dispatcher.multipart.MultiPartRequest|struts.multipart.parser|per request|Parses a multipart request (file upload)|
|views.freemarker.FreemarkerManager|struts.freemarker.manager.classname|singleton|Loads and processes Freemarker templates|
|views.velocity.VelocityManager|struts.velocity.manager.classname|singleton|Loads and processes Velocity templates|
|validator.ActionValidatorManager|struts.actionValidatorManager|singleton|Main interface for validation managers (regular and annotation based).  Handles both the loading of configuration and the actual validation (since 2.1)|
|util.ValueStackFactory|struts.valueStackFactory|singleton|Creates value stacks (since 2.1)|
|reflection.ReflectionProvider|struts.reflectionProvider|singleton|Provides reflection services, key place to plug in a custom expression language (since 2.1)|
|reflection.ReflectionContextFactory|struts.reflectionContextFactory|singleton|Creates reflection context maps used for reflection and expression language operations (since 2.1)|
|config.PackageProvider|N/A|singleton|All beans registered as PackageProvider implementations will be automatically included in configuration building (since 2.1)|
|util.PatternMatcher|struts.patternMatcher|singleton|Matches patterns, such as action names, generally used in configuration (since 2.1)|
|views.dispatcher.DefaultStaticContentLoader|struts.staticContentLoader|singleton|Loads static resources (since 2.1)|
|conversion.impl.XWorkConverter|struts.xworkConverter|singleton|Handles conversion logic and allows to load custom converters per class or per action|
|TextProvider|struts.xworkTextProvider|default|Allows provide custom TextProvider for whole application|
|LocaleProvider|struts.localeProvider|singleton|DEPRECATED! Allows provide custom TextProvider for whole application - instead this endpoint use <b>struts.localeProviderFactory</b>|
|LocaleProviderFactory|struts.localeProviderFactory|singleton|Allows provide custom LocaleProvider for whole application|
|components.UrlRenderer|struts.urlRenderer|singleton|Allows provide custom implementation of environment specific URL rendering/creating class|
|UnknownHandlerManager|struts.unknownHandlerManager|singleton|Implementation of this interface allows handle logic of unknown Actions, Methods or Results|
|views.util.UrlHelper|struts.view.urlHelper|singleton|Helper class used with URLRenderer to provide exact logic for building URLs|
|FileManagerFactory|struts.fileManagerFactory|singleton|Used to create FileManager instance to access files on the File System as also to monitor if reload is needed, can be implemented / overwritten to meet specific an application server needs|
|conversion.impl.CollectionConverter|struts.converter.collection|singleton|Converter used to convert any object to Collection and back|
|conversion.impl.ArrayConverter|struts.converter.array|singleton|Converter used to convert any object to Array and back|
|conversion.impl.DateConverter|struts.converter.date|singleton|Converter used to convert any object to Date and back|
|conversion.impl.NumberConverter|struts.converter.number|singleton|Converter used to convert any object to Number and back|
|conversion.impl.StringConverter|struts.converter.string|singleton|Converter used to convert any object to String and back|
|conversion.ConversionPropertiesProcessor|struts.conversion.properties.processor|singleton|Process Properties to create converters|
|conversion.ConversionPropertiesProcessor|struts.converter.file.processor|singleton|Process \<class\>-conversion.properties file create converters|
|conversion.ConversionAnnotationProcessor|struts.converter.annotation.processor|singleton|Process TypeConversion annotation to create converters|
|conversion.TypeConverterCreator|struts.converter.creator|singleton|Creates user converters|
|conversion.TypeConverterHolder|struts.converter.holder|singleton|Holds user converters' instances|
|util.TextParser|struts.expression.parser|singleton|Used to parse expressions like ${foo.bar} or %{bar.foo} but it is up tp the TextParser's implementation what kind of opening char to use (#, $, %, etc)|
|ExcludedPatternsChecker|struts.excludedPatterns.checker|request|Used across different interceptors to check if given string matches one of the excluded patterns|
|AcceptedPatternsChecker|struts.acceptedPatterns.checker|request|Used across different interceptors to check if given string matches one of the accepted patterns|
|util.ContentTypeMatcher|struts.contentTypeMatcher|singleton|Matches content type of uploaded files (since 2.3.22)|
|LocalizedTextProvider|struts.localizedTextProvider|singleton|Provides access to resource bundles used to localise messages (since 2.5.11)|

> Same packages org.apache.struts2 and com.opensymphony.xwork2 are refactored from Type.

## Plugin Examples

Let's look at two similar but different plugins bundled with the core distribution.

### Sitemesh plugin

[SiteMesh](http://opensymphony.com/sitemesh/) is a popular alternative to Tiles. SiteMesh provides a common look-and-feel to an application's pages by automatically wrapping a plain page with common elements like headers and menubars.

The `sitemesh-plugin.jar` contains several classes, a standard JAR manifest, and a plugin configuration file.

````text
 + META-INF/
   + manifest.mf
 + org
   + apache
     + struts2
       + sitemesh
         + FreeMarkerPageFilter.class
         + TemplatePageFilter.class
         + VelocityPageFilter.class
 + struts-plugin.xml
````

While the SiteMesh Plugin doesn't provide any new results, interceptors, or actions, or even extend any Struts integration points, it does need to know what settings have been enabled in the Struts framework. Therefore, its `struts-plugin.xml` looks like this:

{% comment %}start snippet lang=xml|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/sitemesh/src/main/resources/struts-plugin.xml;hb=HEAD  {% endcomment %}

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!--
/*
 * $Id$
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<!DOCTYPE struts PUBLIC
	"-//Apache Software Foundation//DTD Struts Configuration 2.5//EN"
	"http://struts.apache.org/dtds/struts-2.5.dtd">
    
<struts>
    <bean class="org.apache.struts2.sitemesh.FreemarkerPageFilter" static="true" optional="true"/>
    <bean class="org.apache.struts2.sitemesh.VelocityPageFilter" static="true" optional="true"/>
</struts>

```

{% comment %}end snippet lang=xml|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/sitemesh/src/main/resources/struts-plugin.xml;hb=HEAD  {% endcomment %}

The two bean elements, with the "static" flag enabled, tell Struts to inject the current settings and framework objects into static property setters on startup. This allows, for example, the FreeMarkerPageFilter class to get an instance of the Struts FreemarkerManager and the current encoding setting.

### Tiles plugin

[Tiles](http://struts.apache.org/struts-sandbox/tiles/index.html) is a popular alternative to SiteMesh. Tiles provides a common look-and-feel to an application's pages by breaking the page down into common fragments or "tiles".

The `tiles-plugin.jar` contains several classes, a standard JAR manifest, and a configuration file.

```text
 + META-INF/
   + manifest.mf
 + org
   + apache
     + struts2
       + tiles
         + StrutsTilesListener.class
         + StrutsTileUtilImpl.class
       + views
         + tiles
           + TilesResult.class
   + struts-plugin.xml
```

Since the Tiles Plugin does need to register configuration elements, a result class, it provides a `struts-plugin.xml` file.

## Plugin Registry

> For a list of bundled plugins, see the [Plugin Reference Documentation](plugin-developers.html). For more about bundled and third-party plugins, visit the [Apache Struts Plugin Registry](http://cwiki.apache.org/S2PLUGINS/home.html).
