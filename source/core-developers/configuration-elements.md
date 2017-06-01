---
layout: core-developers
title: Configuration Elements
---

# Configuration Elements

A web application uses a deployment descriptor to initialize resources like servlets  and taglibs\. The deployment descriptor is formatted as a XML  document and named 

~~~~~~~
web.xml
~~~~~~~
\. 

Likewise, the framework uses a configuration file to initialize its own resources\. These resources include:

+ _Interceptors_  that can preprocess and postprocess a request

+ _Action classes_  that can call business logic and data access code

+ _Results_  that can prepare views, like JavaServer Pages and FreeMarker templates

At runtime, there is a single configuration for an application\. Prior to runtime, the configuration is defined through one or more XML documents, including the default 

~~~~~~~
struts.xml
~~~~~~~
 document\. There are several elements that can be configured, including packages, namespaces, includes, actions, results, interceptors, and exceptions\.

(light\-on) See [struts\.xml](struts-xml.html) for a working example\.

## Administrative Elements

- [Bean Configuration](bean-configuration.html)
- [Constant Configuration](constant-configuration.html)
- [Package Configuration](package-configuration.html)
- [Namespace Configuration](namespace-configuration.html)
- [Include Configuration](include-configuration.html)

## Request Handling Elements

- [Interceptor Configuration](include-configuration.html)
- [Action Configuration](action-configuration.html)
  - [Wildcard Mappings](wildcard-mappings.html)
- [Result Configuration](result-configuration.html)
- [Unknown Handlers](unknown-handlers.html)

## Error Handling

- [Exception Configuration](exceptio-configuration.html)
