---
layout: plugin
title: Spring Plugin
parent:
    url: index.html
    title: Plugins
---

# Spring Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

[Spring](http://www.springframework.org) is a lightweight container, providing centralized, automated configuration 
and wiring of your application objects, using a technique called "Dependency Injection".

The Spring Plugin works by overriding the Struts [ObjectFactory](/core-developers/object-factory) to enhance 
the creation of core framework objects. When an object is to be created, it uses the `class` attribute in 
the Struts configuration to correspond to the `id` attribute in the Spring configuration. If not found, the class will 
try to be created as usual, then be autowired by Spring. In the case of Actions, Spring 2's 
[bean scope feature](http://www.springframework.org/docs/reference/beans.html#beans-factory-scopes) can be used to scope 
an Action instance to the session, application, or a custom scope, providing advanced customization above 
the default per-request scoping.

> Remember:
> **registering Actions with Spring is not required**. The Spring alternative is there if you need it, but the framework 
> will automatically create Actions objects from the action mappings. But, if you want to use Spring to inject your Actions, 
> the option is there.

## Features

- Allow Actions, Interceptors, and Results to be created by Spring
- Struts-created objects can be autowired by Spring after creation
- Provides two interceptors that autowire actions, if not using the Spring ObjectFactory

## Usage

To enable Spring integration, simply include struts2-spring-plugin-x-x-x.jar in your application.

If you are using more than one object factory, (for example, by including both the Spring and Plexus plugins in your application) 
you will need to set the struts.objectFactory property in [default.properties](/core-developers/default-properties)
or in one of several XML files via [Constant Configuration](/core-developers/constant-configuration):

**struts.properties**

```text
struts.objectFactory = spring
```

**struts.xml**

```xml
<struts>
  <constant name="struts.objectFactory" value="spring" />
  ... 
</struts>

```

## Autowiring

The framework enables "autowiring" by default. (Autowiring means to look for objects defined in Spring with the same 
name as your object property). To change the wiring mode, modify the `spring.autowire` property.

**Wiring Mode**

```text
struts.objectFactory.spring.autoWire = type
```

The `autowire` property can be set to several options.

|option|description|
|----|---------|
|name|Auto-wire by matching the name of the bean in Spring with the name of the property in your action. **This is the default**|
|type|Auto-wire by looking for a bean registered with Spring of the same type as the property in your action. This requires you to have only one bean of this type registered with Spring|
|auto|Spring will attempt to auto-detect the best method for auto-wiring your action|
|constructor|Spring will auto-wire the parameters of the bean's constructor|
|no|Turn off externally defined autowiring. Annotation-driven injection and injection based on Springs *Aware-interfaces still applies|

By default, the framework will at least try to use Spring to create all its objects. If the object cannot be created by Spring, then the framework will create the object itself.

Enabling Spring integration for other application objects is a two-step process.

1. Configure the Spring listener

**web.xml**

```xml
<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>

```

{:start="2"}
2. Register your objects via the Spring configuration

**applicationContext.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
<beans default-autowire="autodetect">
    <bean id="personManager" class="com.acme.PersonManager" scope="prototype"/>
    ...
</beans>

```

More applicationContext configuration files needed?

Since the Spring integration uses a standard Listener, it can be configured to support configuration files other than 
applicationContext.xml. Adding the following to your web.xml will cause Spring's ApplicationContext to be initialized 
from all files matching the given pattern:

```xml
<!-- Context Configuration locations for Spring XML files -->
 <context-param>
     <param-name>contextConfigLocation</param-name>
     <param-value>/WEB-INF/applicationContext-*.xml,classpath*:applicationContext-*.xml</param-value>
 </context-param>
``` 

See the Spring documentation for a full description of this parameter.

## Initializing Actions from Spring

Normally, in `struts.xml` you specify the class for each Action. When using the default SpringObjectFactory, the framework 
will ask Spring to create the Action and wire up dependencies as specified by the default auto-wire behavior.

We **strongly** recommend that you find declarative ways of letting Spring know what to provide for your actions. 
This includes making your beans able to be autowired by either naming your dependent properties on your action the same 
as the bean defined in Spring which should be provided (to allow for name-based autowiring), or using autowire-by-type 
and only having one of the required type registered with Spring. It also can include using JDK5 annotations to declare 
ransactional and security requirements rather than having to explicitly set up proxies in your Spring configuration. 
If you can find ways to let Spring know what it needs to do for your action without needing any explicit configuration 
in the Spring applicationContext.xml, then you won't have to maintain this configuration in both places.

However, sometimes you might want the bean to be completely managed by Spring. This is useful, for example, if you wish 
to apply more complex AOP or Spring-enabled technologies, such as Acegi, to your beans. To do this, all you have to do 
is configure the bean in your Spring `applicationContext.xml` and then _change_ the class attribute from your Action 
in the `struts.xml` to use the bean name defined in Spring instead of the class name.

Your `struts.xml` file would then have the Action class attributes changed.

**struts.xml**

```xml
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>
    <include file="struts-default.xml"/>

    <package name="default" extends="struts-default">
        <action name="foo" class="com.acme.Foo">
            <result>foo.ftl</result>
        </action>
    </package>

    <package name="secure" namespace="/secure" extends="default">
        <action name="bar" class="bar">
            <result>bar.ftl</result>
        </action>
    </package>
</struts>

```

Where you have a Spring bean defined in your `applicationContext.xml` named "bar". Note that the `com.acme.Foo` 
Action did not need to be changed, because it can be autowired.

A typical spring configuration for bar could look as following.

**applicationConext.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
<beans default-autowire="autodetect">
    <bean id="bar" class="com.my.BarClass" singleton="false"/>
    ...
</beans>
```

To use session-scoped components with Spring and Struts, see the [Spring Session Components Workarounds](spring-session-components-workarounds) analysis.

## Class Reloading

The Spring plugin can be configured to automatically reload classes that change in the file system. This feature will 
enable code changes to be "hot deployed" without having to restart the web container. To enable this feature follow 
these steps:

1. Set "struts.devMode" to "true"
2. Set "struts.class.reloading.watchList" to a comma separated list of directories, or jar files (absolute or relative paths)
3. Add this to web.xml:

```xml
<context-param>
   <param-name>contextClass</param-name>
   <param-value>org.apache.struts2.spring.ClassReloadingXMLWebApplicationContext</param-value>
</context-param>
```

{:start="4"}
4. Add Apache Commons JCI FAM to the classpath. If you are using maven, add this to pom.xml

```xml
   <dependency>
       <groupId>org.apache.commons</groupId>
       <artifactId>commons-jci-fam</artifactId>
       <version>1.0</version>
   </dependency> 

```

Letting the reloading class loader handle all the classes can lead to ClassCastException(s) because instances of the same 
classes loaded by different class loaders can not be assigned to each other. To prevent this problem we suggest 
that `struts.class.reloading.acceptClasses` is used to limit the classes loaded by the reloading class loader, 
so only actions are handled by it. This constant supports a comma separated list of regular expressions:

```xml
<constant name="struts.class.reloading.acceptClasses" value="com.myproject.example.actions..*" />

```

> This feature is experimental, and **should never** be used in production systems.

## Settings

The following settings can be customized. See the [developer guide](/core-developers/configuration-files).

|Setting|Description|Default|Possible Values|
|-------|-----------|-------|---------------|
|struts.objectFactory.spring.autoWire|The autowire strategy|name|name,type,auto, or constructor|
|struts.objectFactory.spring.autoWire.alwaysRespect|Whether the autowire strategy should always be used, or if the framework should try to guess the best strategy based on the situation|false for backwards-compatibility|true or false|
|struts.objectFactory.spring.useClassCache|Whether to have Spring use its class cache or not|true|true or false|
|struts.class.reloading.watchList|List of jar files or directories to watch for changes|null|Comma separated list of absolute or relative paths to jars or directories|
|struts.class.reloading.acceptClasses|List of regular expressions of accepted class names|null|Comma separated list of regular expressions of classes that will be loaded by the reloading class loader(we suggest to add regular expressions so only action classes are handled by the reloading class loader)|
|struts.class.reloading.reloadConfig|Reload the runtime configuration (action mappings, results etc) when a change is detected in one of the watched directories|false|true or false|
|DEPRECATED: struts.objectFactory.spring.enableAopSupport|Uses different logic to construct beans to allow support AOP, it uses an old approach to create a bean, switch this flag if you have problems with Spring beans and AOP|false|true or false|

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory. No other files need to be copied or created.
