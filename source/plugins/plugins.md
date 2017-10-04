---
layout: default
title: Plugins
parent:
  url: index.html
  title: Plugins
---

# Plugins

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

```xml
<!-- Assuming /static/main.css is inside a plugin jar, to add it to the page: -->

<@s.url value="/struts/main.css" var="css" />
<link rel="stylesheet" type="text/css" href="%{#css}" />
```

Read also [StaticContentLoader JavaDoc](https://struts.apache.org/maven/struts2-core/apidocs/org/apache/struts2/dispatcher/StaticContentLoader.html).

## Extension Points

Extension points allow a plugin to override a key class in the Struts framework with an alternate implementation. For example, a plugin could provide a new class to create Action classes or map requests to Actions.

The following extension points are available in Struts 2:

{% comment %}start snippet id=extensionPoints|lang=html|javadoc=true|org.apache.struts2.config.DefaultBeanSelectionProvider {% endcomment %}


```html

 <table border="1" summary="">

   <tr>

     <th>Type</th>

     <th>Property</th>

     <th>Scope</th>

     <th>Description</th>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.ObjectFactory</td>

     <td>struts.objectFactory</td>

     <td>singleton</td>

     <td>Creates actions, results, and interceptors</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.factory.ActionFactory</td>

     <td>struts.objectFactory.actionFactory</td>

     <td>singleton</td>

     <td>Dedicated factory used to create Actions, you can implement/extend existing one instead of defining new ObjectFactory</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.factory.ResultFactory</td>

     <td>struts.objectFactory.resultFactory</td>

     <td>singleton</td>

     <td>Dedicated factory used to create Results, you can implement/extend existing one instead of defining new ObjectFactory</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.factory.InterceptorFactory</td>

     <td>struts.objectFactory.interceptorFactory</td>

     <td>singleton</td>

     <td>Dedicated factory used to create Interceptors, you can implement/extend existing one instead of defining new ObjectFactory</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.factory.ConverterFactory</td>

     <td>struts.objectFactory.converterFactory</td>

     <td>singleton</td>

     <td>Dedicated factory used to create TypeConverters, you can implement/extend existing one instead of defining new ObjectFactory</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.factory.ValidatorFactory</td>

     <td>struts.objectFactory.validatorFactory</td>

     <td>singleton</td>

     <td>Dedicated factory used to create Validators, you can implement/extend existing one instead of defining new ObjectFactory</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.ActionProxyFactory</td>

     <td>struts.actionProxyFactory</td>

     <td>singleton</td>

     <td>Creates the ActionProxy</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.util.ObjectTypeDeterminer</td>

     <td>struts.objectTypeDeterminer</td>

     <td>singleton</td>

     <td>Determines what the key and element class of a Map or Collection should be</td>

   </tr>

   <tr>

     <td>org.apache.struts2.dispatcher.mapper.ActionMapper</td>

     <td>struts.mapper.class</td>

     <td>singleton</td>

     <td>Determines the ActionMapping from a request and a URI from an ActionMapping</td>

   </tr>

   <tr>

     <td>org.apache.struts2.dispatcher.multipart.MultiPartRequest</td>

     <td>struts.multipart.parser</td>

     <td>per request</td>

     <td>Parses a multipart request (file upload)</td>

   </tr>

   <tr>

     <td>org.apache.struts2.views.freemarker.FreemarkerManager</td>

     <td>struts.freemarker.manager.classname</td>

     <td>singleton</td>

     <td>Loads and processes Freemarker templates</td>

   </tr>

   <tr>

     <td>org.apache.struts2.views.velocity.VelocityManager</td>

     <td>struts.velocity.manager.classname</td>

     <td>singleton</td>

     <td>Loads and processes Velocity templates</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.validator.ActionValidatorManager</td>

     <td>struts.actionValidatorManager</td>

     <td>singleton</td>

     <td>Main interface for validation managers (regular and annotation based).  Handles both the loading of

         configuration and the actual validation (since 2.1)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.util.ValueStackFactory</td>

     <td>struts.valueStackFactory</td>

     <td>singleton</td>

     <td>Creates value stacks (since 2.1)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.reflection.ReflectionProvider</td>

     <td>struts.reflectionProvider</td>

     <td>singleton</td>

     <td>Provides reflection services, key place to plug in a custom expression language (since 2.1)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.reflection.ReflectionContextFactory</td>

     <td>struts.reflectionContextFactory</td>

     <td>singleton</td>

     <td>Creates reflection context maps used for reflection and expression language operations (since 2.1)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.config.PackageProvider</td>

     <td>N/A</td>

     <td>singleton</td>

     <td>All beans registered as PackageProvider implementations will be automatically included in configuration building (since 2.1)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.util.PatternMatcher</td>

     <td>struts.patternMatcher</td>

     <td>singleton</td>

     <td>Matches patterns, such as action names, generally used in configuration (since 2.1)</td>

   </tr>

   <tr>

     <td>org.apache.struts2.views.dispatcher.DefaultStaticContentLoader</td>

     <td>struts.staticContentLoader</td>

     <td>singleton</td>

     <td>Loads static resources (since 2.1)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.impl.XWorkConverter</td>

     <td>struts.xworkConverter</td>

     <td>singleton</td>

     <td>Handles conversion logic and allows to load custom converters per class or per action</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.TextProvider</td>

     <td>struts.xworkTextProvider</td>

     <td>default</td>

     <td>Allows provide custom TextProvider for whole application</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.LocaleProvider</td>

     <td>struts.localeProvider</td>

     <td>singleton</td>

     <td>DEPRECATED! Allows provide custom TextProvider for whole application - instead this endpoint use <b>struts.localeProviderFactory</b></td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.LocaleProviderFactory</td>

     <td>struts.localeProviderFactory</td>

     <td>singleton</td>

     <td>Allows provide custom LocaleProvider for whole application</td>

   </tr>

   <tr>

     <td>org.apache.struts2.components.UrlRenderer</td>

     <td>struts.urlRenderer</td>

     <td>singleton</td>

     <td>Allows provide custom implementation of environment specific URL rendering/creating class</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.UnknownHandlerManager</td>

     <td>struts.unknownHandlerManager</td>

     <td>singleton</td>

     <td>Implementation of this interface allows handle logic of unknown Actions, Methods or Results</td>

   </tr>

   <tr>

     <td>org.apache.struts2.views.util.UrlHelper</td>

     <td>struts.view.urlHelper</td>

     <td>singleton</td>

     <td>Helper class used with URLRenderer to provide exact logic for building URLs</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.FileManagerFactory</td>

     <td>struts.fileManagerFactory</td>

     <td>singleton</td>

     <td>Used to create {@link FileManager} instance to access files on the File System as also to monitor if reload is needed,

     can be implemented / overwritten to meet specific an application server needs

     </td>

   <tr>

     <td>com.opensymphony.xwork2.conversion.impl.CollectionConverter</td>

     <td>struts.converter.collection</td>

     <td>singleton</td>

     <td>Converter used to convert any object to Collection and back</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.impl.ArrayConverter</td>

     <td>struts.converter.array</td>

     <td>singleton</td>

     <td>Converter used to convert any object to Array and back</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.impl.DateConverter</td>

     <td>struts.converter.date</td>

     <td>singleton</td>

     <td>Converter used to convert any object to Date and back</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.impl.NumberConverter</td>

     <td>struts.converter.number</td>

     <td>singleton</td>

     <td>Converter used to convert any object to Number and back</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.impl.StringConverter</td>

     <td>struts.converter.string</td>

     <td>singleton</td>

     <td>Converter used to convert any object to String and back</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.ConversionPropertiesProcessor</td>

     <td>struts.conversion.properties.processor</td>

     <td>singleton</td>

     <td>Process Properties to create converters</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.ConversionPropertiesProcessor</td>

     <td>struts.converter.file.processor</td>

     <td>singleton</td>

     <td>Process <class>-conversion.properties file create converters</class></td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.ConversionAnnotationProcessor</td>

     <td>struts.converter.annotation.processor</td>

     <td>singleton</td>

     <td>Process TypeConversion annotation to create converters</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.TypeConverterCreator</td>

     <td>struts.converter.creator</td>

     <td>singleton</td>

     <td>Creates user converters</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.conversion.TypeConverterHolder</td>

     <td>struts.converter.holder</td>

     <td>singleton</td>

     <td>Holds user converters' instances</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.util.TextParser</td>

     <td>struts.expression.parser</td>

     <td>singleton</td>

     <td>Used to parse expressions like ${foo.bar} or %{bar.foo} but it is up tp the TextParser's

         implementation what kind of opening char to use (#, $, %, etc)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.ExcludedPatternsChecker</td>

     <td>struts.excludedPatterns.checker</td>

     <td>request</td>

     <td>Used across different interceptors to check if given string matches one of the excluded patterns</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.AcceptedPatternsChecker</td>

     <td>struts.acceptedPatterns.checker</td>

     <td>request</td>

     <td>Used across different interceptors to check if given string matches one of the accepted patterns</td>

   </tr>

   <tr>

     <td>org.apache.struts2.util.ContentTypeMatcher</td>

     <td>struts.contentTypeMatcher</td>

     <td>singleton</td>

     <td>Matches content type of uploaded files (since 2.3.22)</td>

   </tr>

   <tr>

     <td>com.opensymphony.xwork2.LocalizedTextProvider</td>

     <td>struts.localizedTextProvider</td>

     <td>singleton</td>

     <td>Provides access to resource bundles used to localise messages (since 2.5.11)</td>

   </tr>

 </table>




```


{% comment %}end snippet id=extensionPoints|lang=html|javadoc=true|org.apache.struts2.config.DefaultBeanSelectionProvider {% endcomment %}

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
