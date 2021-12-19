---
layout: core-developers
title: Configuration Provider & Configuration
---

# Configuration Provider & Configuration

The ConfigurationProvider interface describes the framework's configuration. By default, the framework loads its 
configurations via an XML document by using the `StrutsXmlConfigurationProvider`. The provider can be configured 
through a Dispatcher's [DispatcherListener](dispatcher-listener).

## Example

```java
 static {
   Dispatcher.addDispatcherListener(new DispatcherListener() {
     ....
     public void dispatcherInitialized(Dispatcher du) {
         ConfigurationManager confManager = du.getConfigurationManager();
         confManager.addConfigurationProvider( ... );
     }
     ....
   });
 }
```

## Configuration provider

`ConfigurationProvider` is the basic piece of configuration used to tie all the options together in `ConfigurationManager`. 
There is few different implementations that are already used internally by the Apache Struts:

- `XmlConfigurationProvider` - proprietary XWork implementation which are using `xwork.xml` file as source of configuration
- `StrutsXmlConfigurationProvider` - primary configuration provider, represents `struts.xml` and `struts-plugin.xml` files
- `PropertiesConfigurationProvider` - used to load `struts.properties`
-`ServletContextAwareConfigurationProvider` - marking interface allowing to inject `ServletContext` into provider

To inject your custom configuration provider use `configProviders` `<init-param/>` in [web.xml](web-xml)
