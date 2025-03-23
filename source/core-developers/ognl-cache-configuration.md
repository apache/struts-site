---
layout: default
title: OGNL Cache Configuration
parent:
  title: Core Developers
  url: index
---

# OGNL Cache Configuration

The Struts framework provides two different OGNL caches, an expression cache and a BeanInfo cache.
Developers may set properties in [struts.xml](struts-xml) and/or [default.properties](default-properties) to 
configure certain behaviours for the OGNL caches.  The properties that can be set vary between Struts 
versions, referring to the configuration files in a given version should provide guidance in that respect.

The OGNL expression cache is enabled by default.  Developers can toggle that state via default.properties:
```
struts.ognl.enableExpressionCache=true
```
or
```
struts.ognl.enableExpressionCache=false
```
The same toggle is also available via struts.xml:
```
<constant name="struts.ognl.enableExpressionCache" value="true"/>
```
or
```
<constant name="struts.ognl.enableExpressionCache" value="false"/>
```

Disabling the OGNL expression cache can have a negative impact on performance, but 
disabling the cache can limit memory overhead for the application (a trade-off).

As of Struts 6.0.0, additional configuration properties have been made available to control the
OGNL cache configuration.  These include a configureable cache size limit, and activating
an LRU (Least Recently Used) cache mode.  The expression cache and BeanInfo cache can have
their properties set independently.  Both caches are standard caches with a high maximum
capacity by default.  The developer may override the default behaviour using the 
appropriate configuration properties.

Below are some examples of setting the cache configuration via default.properties:
```
### Set expression and BeanInfo caches to size 1250 with standard cache mode
struts.ognl.enableExpressionCache=true
struts.ognl.expressionCacheMaxSize=1250
struts.ognl.expressionCacheLRUMode=false
struts.ognl.beanInfoCacheMaxSize=1250
struts.ognl.beanInfoCacheLRUMode=false
```
```
### Set expression and BeanInfo caches to size 1000 with LRU cache mode
struts.ognl.enableExpressionCache=true
struts.ognl.expressionCacheMaxSize=1000
struts.ognl.expressionCacheLRUMode=true
struts.ognl.beanInfoCacheMaxSize=1000
struts.ognl.beanInfoCacheLRUMode=true
```

Below are some examples of setting the cache configuration via struts.xml:
```
<!-- Set expression and BeanInfo caches to size 1250 with standard cache mode -->
<constant name="struts.ognl.enableExpressionCache" value="true"/>
<constant name="struts.ognl.expressionCacheMaxSize" value="1250"/>
<constant name="struts.ognl.expressionCacheLRUMode" value="false"/>
<constant name="struts.ognl.beanInfoCacheMaxSize" value="1250"/>
<constant name="struts.ognl.beanInfoCacheLRUMode" value="false"/>
```
```
<!-- Set expression and BeanInfo caches to size 1000 with LRU cache mode -->
<constant name="struts.ognl.enableExpressionCache" value="true"/>
<constant name="struts.ognl.expressionCacheMaxSize" value="1000"/>
<constant name="struts.ognl.expressionCacheLRUMode" value="true"/>
<constant name="struts.ognl.beanInfoCacheMaxSize" value="1000"/>
<constant name="struts.ognl.beanInfoCacheLRUMode" value="true"/>
```

As of Struts 6.0.0, developers may choose to implement their own OGNL cache factories,
instead of using the default implementations, should they desire to.  The default 
implementations can be referenced to give an idea of how to implement a custom implementation.
For example, if a developer implements a CustomExpressionCacheFactory and CustomBeanInfoCacheFactory 
that both implement the OgnlCacheFactory interface, they could be installed via
a configuration in struts.xml:
```
<constant name="struts.ognl.expressionCacheFactory" value="some.package.CustomExpressionCacheFactory"/>
<constant name="struts.ognl.beanInfoCacheFactory" value="some.package.CustomBeanInfoCacheFactory"/>
```
If the developer wants the standard configuration properties for the caches to function, they will need
to implement equivalent methods to the ones the default implementation uses to populate those properties.

Beyond the configuration properties, in certain circumstances, developers may choose to utilize certain methods to 
interact with the OGNL caches.  Refer to the API documentation for [OgnlUtil](https://struts.apache.org/maven/struts2-core/apidocs/com/opensymphony/xwork2/ognl/OgnlUtil.html).
