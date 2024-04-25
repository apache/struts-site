---
layout: default
title: Plugins Architecture
parent:
  url: index.html
  title: Plugins
---

# Plugins architecture
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Struts 2 plugins contain classes and configuration that extend, replace, or add to existing Struts framework
functionality. A plugin can be installed by adding its JAR file to the application's class path, in addition to the JAR
files to fulfill whatever dependencies the plugin itself may have. To configure the plugin, the JAR should contain
a `struts-plugin.xml` file and optionally a `struts-deferred.xml`, which follow the same format as an
ordinary `struts.xml` file.

Since a plugin can contain these xml files, they have the ability to:
 - Define new packages with results, interceptors, and/or actions
 - Override framework constants 
 - Introduce new extension point implementation classes

Whilst configuration from `struts-plugin.xml` is loaded prior to `struts.xml`, `struts-deferred.xml` is loaded after all
other configuration is loaded. This makes it useful for defining [plugin extension points](#plugin-ext).

Many popular but optional features of the framework are distributed as plugins. An application can retain all the
plugins provided with the distribution, or just include the ones it uses. Plugins can be used to organize application
code or to distribute code to third-parties.

Packages defined in a plugin can have parent packages that are defined in another plugin. Plugins may define
configuration elements with classes not contained in the plugin. Any classes not included in the plugin's JAR must be on
the application's classpath at runtime. As from Struts 2.3.5

The framework loads its default configuration first, then any `struts-plugin.xml` files found in others JARs on the
classpath, the "bootstrap" `struts.xml`, then finally any `struts-deferred.xml` files.

1. `struts-default.xml` (bundled in the Core JAR)
2. `struts-plugin.xml` (as many as can be found in other JARs)
3. `struts.xml` (provided by your application)
4. `struts-deferred.xml` (as many as can be found in other JARs)

Since the `struts.xml` file is loaded between `struts-plugin.xml` and before any potential plugin extension points
in `struts-deferred.xml`, it can make use of any resources provided by the plugins bundled with the distribution, or any
other plugins available to an application.

## Static resources

To include static resources in your plugins add them under "/static" in your jar. And include them in your page using 
"/static" as the path, like in the following example:

```ftl
<!-- Assuming /static/main.css is inside a plugin jar, to add it to the page: -->

<@s.url value="/static/main.css" var="css" />
<link rel="stylesheet" type="text/css" href="%{#css}" />
```

Read also [Static Content](../core-developers/static-content) and JavaDoc of [StaticContentLoader](https://struts.apache.org/maven/struts2-core/apidocs/org/apache/struts2/dispatcher/StaticContentLoader).

## Extension Points

Extension points allow a plugin to override a key class in the Struts framework with an alternate implementation. 
For example, a plugin could provide a new class to create Action classes or map requests to Actions.

The following extension points are available in Struts 2:

| Property                                | Description                                                                                                                                                                                  | Scope       | Type                                                             |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|------------------------------------------------------------------|
| struts.objectFactory                    | Creates actions, results, and interceptors                                                                                                                                                   | singleton   | com.opensymphony.xwork2.ObjectFactory                            |
| struts.objectFactory.actionFactory      | Dedicated factory used to create Actions, you can implement/extend existing one instead of defining new ObjectFactory                                                                        | singleton   | com.opensymphony.xwork2.factory.ActionFactory                    |
| struts.objectFactory.resultFactory      | Dedicated factory used to create Results, you can implement/extend existing one instead of defining new ObjectFactory                                                                        | singleton   | com.opensymphony.xwork2.factory.ResultFactory                    |
| struts.objectFactory.interceptorFactory | Dedicated factory used to create Interceptors, you can implement/extend existing one instead of defining new ObjectFactory                                                                   | singleton   | com.opensymphony.xwork2.factory.InterceptorFactory               |
| struts.objectFactory.converterFactory   | Dedicated factory used to create TypeConverters, you can implement/extend existing one instead of defining new ObjectFactory                                                                 | singleton   | com.opensymphony.xwork2.factory.ConverterFactory                 |
| struts.objectFactory.validatorFactory   | Dedicated factory used to create Validators, you can implement/extend existing one instead of defining new ObjectFactory                                                                     | singleton   | com.opensymphony.xwork2.factory.ValidatorFactory                 |
| struts.actionProxyFactory               | Creates the ActionProxy                                                                                                                                                                      | singleton   | com.opensymphony.xwork2.ActionProxyFactory                       |
| struts.objectTypeDeterminer             | Determines what the key and element class of a Map or Collection should be                                                                                                                   | singleton   | com.opensymphony.xwork2.util.ObjectTypeDeterminer                |
| struts.mapper.class                     | Determines the ActionMapping from a request and a URI from an ActionMapping                                                                                                                  | singleton   | org.apache.struts2.dispatcher.mapper.ActionMapper                |
| struts.multipart.parser                 | Parses a multipart request (file upload)                                                                                                                                                     | per request | org.apache.struts2.dispatcher.multipart.MultiPartRequest         |
| struts.freemarker.manager.classname     | Loads and processes Freemarker templates                                                                                                                                                     | singleton   | org.apache.struts2.views.freemarker.FreemarkerManager            |
| struts.velocity.manager.classname       | Loads and processes Velocity templates                                                                                                                                                       | singleton   | org.apache.struts2.views.velocity.VelocityManagerInterface       |
| struts.actionValidatorManager           | Main interface for validation managers (regular and annotation based).  Handles both the loading of configuration and the actual validation (since 2.1)                                      | singleton   | com.opensymphony.xwork2.validator.ActionValidatorManager         |
| struts.valueStackFactory                | Creates value stacks (since 2.1)                                                                                                                                                             | singleton   | com.opensymphony.xwork2.util.ValueStackFactory                   |
| struts.reflectionProvider               | Provides reflection services, key place to plug in a custom expression language (since 2.1)                                                                                                  | singleton   | com.opensymphony.xwork2.reflection.ReflectionProvider            |
| struts.reflectionContextFactory         | Creates reflection context maps used for reflection and expression language operations (since 2.1)                                                                                           | singleton   | com.opensymphony.xwork2.reflection.ReflectionContextFactory      |
| N/A                                     | All beans registered as PackageProvider implementations will be automatically included in configuration building (since 2.1)                                                                 | singleton   | com.opensymphony.xwork2.config.PackageProvider                   |
| struts.patternMatcher                   | Matches patterns, such as action names, generally used in configuration (since 2.1)                                                                                                          | singleton   | com.opensymphony.xwork2.util.PatternMatcher                      |
| struts.staticContentLoader              | Loads static resources (since 2.1)                                                                                                                                                           | singleton   | org.apache.struts2.views.dispatcher.DefaultStaticContentLoader   |
| struts.xworkConverter                   | Handles conversion logic and allows to load custom converters per class or per action                                                                                                        | singleton   | com.opensymphony.xwork2.conversion.impl.XWorkConverter           |
| struts.localeProviderFactory            | Allows provide custom LocaleProvider for whole application                                                                                                                                   | singleton   | com.opensymphony.xwork2.LocaleProviderFactory                    |
| struts.urlRenderer                      | Allows provide custom implementation of environment specific URL rendering/creating class                                                                                                    | singleton   | org.apache.struts2.components.UrlRenderer                        |
| struts.unknownHandlerManager            | Implementation of this interface allows handle logic of unknown Actions, Methods or Results                                                                                                  | singleton   | com.opensymphony.xwork2.UnknownHandlerManager                    |
| struts.view.urlHelper                   | Helper class used with URLRenderer to provide exact logic for building URLs                                                                                                                  | singleton   | org.apache.struts2.views.util.UrlHelper                          |
| struts.fileManagerFactory               | Used to create FileManager instance to access files on the File System as also to monitor if reload is needed, can be implemented / overwritten to meet specific an application server needs | singleton   | com.opensymphony.xwork2.FileManagerFactory                       |
| struts.converter.collection             | Converter used to convert any object to Collection and back                                                                                                                                  | singleton   | com.opensymphony.xwork2.conversion.impl.CollectionConverter      |
| struts.converter.array                  | Converter used to convert any object to Array and back                                                                                                                                       | singleton   | com.opensymphony.xwork2.conversion.impl.ArrayConverter           |
| struts.converter.date                   | Converter used to convert any object to Date and back                                                                                                                                        | singleton   | com.opensymphony.xwork2.conversion.impl.DateConverter            |
| struts.converter.number                 | Converter used to convert any object to Number and back                                                                                                                                      | singleton   | com.opensymphony.xwork2.conversion.impl.NumberConverter          |
| struts.converter.string                 | Converter used to convert any object to String and back                                                                                                                                      | singleton   | com.opensymphony.xwork2.conversion.impl.StringConverter          |
| struts.conversion.properties.processor  | Process Properties to create converters                                                                                                                                                      | singleton   | com.opensymphony.xwork2.conversion.ConversionPropertiesProcessor |
| struts.converter.file.processor         | Process {class}-conversion.properties file create converters                                                                                                                                 | singleton   | com.opensymphony.xwork2.conversion.ConversionPropertiesProcessor |
| struts.converter.annotation.processor   | Process TypeConversion annotation to create converters                                                                                                                                       | singleton   | com.opensymphony.xwork2.conversion.ConversionAnnotationProcessor |
| struts.converter.creator                | Creates user converters                                                                                                                                                                      | singleton   | com.opensymphony.xwork2.conversion.TypeConverterCreator          |
| struts.converter.holder                 | Holds user converters' instances                                                                                                                                                             | singleton   | com.opensymphony.xwork2.conversion.TypeConverterHolder           |
| struts.expression.parser                | Used to parse expressions like ${foo.bar} or %{bar.foo} but it is up tp the TextParser's implementation what kind of opening char to use (#, $, %, etc)                                      | singleton   | com.opensymphony.xwork2.util.TextParser                          |
| struts.excludedPatterns.checker         | Used across different interceptors to check if given string matches one of the excluded patterns                                                                                             | request     | com.opensymphony.xwork2.ExcludedPatternsChecker                  |
| struts.acceptedPatterns.checker         | Used across different interceptors to check if given string matches one of the accepted patterns                                                                                             | request     | com.opensymphony.xwork2.AcceptedPatternsChecker                  |
| struts.contentTypeMatcher               | Matches content type of uploaded files (since 2.3.22)                                                                                                                                        | singleton   | org.apache.struts2.util.ContentTypeMatcher                       |
| struts.localizedTextProvider            | Provides access to resource bundles used to localise messages (since 2.5.11)                                                                                                                 | singleton   | com.opensymphony.xwork2.LocalizedTextProvider                    |
| struts.date.formatter                   | Allow define a date formatter used by `<s:date/>` tag (since 6.0.0)                                                                                                                          | singleton   | org.apache.struts2.components.date.DateFormatter                 |
| struts.ognlGuard                        | Define a custom OgnlGuard implementation to block raw or compiled OGNL expressions (since 6.4.0)                                                                                             | singleton   | org.apache.struts2.ognl.OgnlGuard                                |
| struts.securityMemberAccess             | Define a custom SecurityMemberAccess implementation, used to restrict OGNL evaluations based on classes involved (since 6.4.0)                                                               | prototype   | com.opensymphony.xwork2.ognl.SecurityMemberAccess                |
| struts.compoundRootAccessor             | Define a custom CompoundRootAccessor implementation, used to resolve classes and manipulate the CompoundRoot (since 6.4.0)                                                                   | singleton   | com.opensymphony.xwork2.ognl.accessor.RootAccessor               |
| struts.methodAccessor                   | Define a custom MethodAccessor implementation, used to evaluate OGNL method calls (since 6.4.0)                                                                                              | singleton   | ognl.MethodAccessor                                              |

## Plugin Examples

Let's look at two similar but different plugins bundled with the core distribution.

### Sitemesh plugin

[SiteMesh](http://opensymphony.com/sitemesh/) is a popular alternative to Tiles. SiteMesh provides a common look-and-feel
to an application's pages by automatically wrapping a plain page with common elements like headers and menubars.

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

While the SiteMesh Plugin doesn't provide any new results, interceptors, or actions, or even extend any Struts integration 
points, it does need to know what settings have been enabled in the Struts framework. Therefore, its `struts-plugin.xml` looks like this:

{% comment %}start snippet lang=xml|https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=plugins/sitemesh/src/main/resources/struts-plugin.xml;hb=HEAD  {% endcomment %}

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!--
/*
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

The two bean elements, with the "static" flag enabled, tell Struts to inject the current settings and framework objects 
into static property setters on startup. This allows, for example, the FreeMarkerPageFilter class to get an instance 
of the Struts FreemarkerManager and the current encoding setting.

### Tiles plugin

[Tiles](http://struts.apache.org/struts-sandbox/tiles/index) is a popular alternative to SiteMesh. Tiles provides 
a common look-and-feel to an application's pages by breaking the page down into common fragments or "tiles".

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

## Developing new extension point

An extension point it's a name which will be used to locate other beans by the name and inject them into a given place.
Extension point isn't a bean, you cannot inject it. It's a bridge between your interface/class and the final implementation,
provided either by a plugin or by a user.

If needed you can define your own extension point. This can happen in two ways: either define it in the Struts Core,
or define the extension in the plugin you are developing.

### Extension point provided by the Core

First step is to name your extension point, basically we are using a pattern like follow:
```
struts.<component | functionallity>.<name of the extebsion point>
```

e.g.: `struts.date.formatter`.

Now you must provide an interface or a class as the extension point, it will be used by others to implement they own behaviour
of the extension point, e.g.: `org.apache.struts2.components.date.DateFormatter`.

The next step is to tie the name of the extension point with the interface/class. It happens in `StrutsBeanSelectionProvider`

by using `alias()` method as below:
```java
alias(DateFormatter.class, StrutsConstants.STRUTS_DATE_FORMATTER, builder, props, Scope.SINGLETON);
```

as you can see you must provide:
 - `Class<?>` class behind the extension point, which is used by users to implement the extension point
 - `String` a key, the name of the extension point
 - `ContainerBuilder` builder used to setup the Container
 - `Properties` additional properties when needed
 - `Scope` scope of the extension point, all the beans extneding the extension point must have the same scope

Having all that set, you can define where to use the extension point by injecting beans implementing it by using `@Inject`

```java
@Inject
public void setDateFormatter(DateFormatter dateFormatter) {
    this.dateFormatter = dateFormatter;
}
```

you can use `optional = true` if the implementation is not required, yet please remember to handle `null` in such case.

All the above steps have defined a new extension point, now you can implement a bean which will be _bridged_ throughout
the extension point with the `@Inject`. Just implement the interface/class used to define the extension point and define
the bean in `struts-default.xml`:

```java
public class DateTimeFormatterAdapter implements DateFormatter {

    @Override
    public String format(TemporalAccessor temporal, String format) {
        DateTimeFormatter dtf;
        Locale locale = ActionContext.getContext().getLocale();
        if (format == null) {
            dtf = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM)
                .withLocale(locale);
        } else {
            dtf = DateTimeFormatter.ofPattern(format, locale);
        }
        return dtf.format(temporal);
    }

}
```

```xml
<bean type="org.apache.struts2.components.date.DateFormatter" 
      name="dateTimeFormatter" 
      class="org.apache.struts2.components.date.DateTimeFormatterAdapter" 
      scope="singleton"/>
```

The `name` attribute it's of your choice, it just needs to be unique.

And the final step is to use the new bean with the extension point, this will happen in `default.properties`:

```
struts.date.formatter=dateTimeFormatter
```

and done!

If a user would like to provide its own implementation they just needs to implement the interface, define a bean 
in `struts.xml` with a name and then tie it to the extension point overriding the one provided by the framework:

```xml
<bean type="org.apache.struts2.components.date.DateFormatter" 
      name="myDateTimeFormatter" 
      class="com.company.date.MyDateTimeFormatterAdapter" 
      scope="singleton"/>
```

```
struts.date.formatter=myDateTimeFormatter
```

### Plugin-defined extension points {#plugin-ext}

It's very much like above except that the plugin must provide a `bean-selection` configuration option
in `struts-deferred.xml`. The `bean-selection` option represents an implementation of a
class `org.apache.struts2.config.AbstractBeanSelectionProvider`
with _no-arguments_ constructor:

```java
public class VelocityBeanSelectionProvider extends AbstractBeanSelectionProvider {

    @Override
    public void register(ContainerBuilder builder, LocatableProperties props) throws ConfigurationException {
        alias(VelocityManagerInterface.class, VelocityConstants.STRUTS_VELOCITY_MANAGER_CLASSNAME, builder, props);
    }

}
```

The class defines extension points by implementing `register()` method and using `alias()` method to register them.

And finally it must be added to the `struts-deferred.xml`:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
	"-//Apache Software Foundation//DTD Struts Configuration 2.6//EN"
	"http://struts.apache.org/dtds/struts-2.6.dtd">
    
<struts>
  ...
  
  <bean-selection name="velocityBeans" class="org.apache.struts2.views.velocity.VelocityBeanSelectionProvider"/>

</struts>
```

And now other plugins or user application can use the new extension point represented by `VelocityConstants.STRUTS_VELOCITY_MANAGER_CLASSNAME`. 

## Plugin Registry

> For a list of bundled plugins, see the [Plugin Reference Documentation](index). For more about bundled and third-party 
> plugins, visit the [Apache Struts Plugin Registry](http://cwiki.apache.org/S2PLUGINS/home).
