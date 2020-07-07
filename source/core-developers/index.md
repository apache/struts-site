---
layout: default
title: Core Developers Guide
---

# Core Developers Guide

Struts 2 processes requests using three core types: [interceptors](interceptor-configuration.html), [actions](action-configuration.html), and [results](result-configuration.html). 
Each may be configured via XML or annotations.

## Developing Applications with Struts 2

- [Nutshell](nutshell.html)
- [AJAX](ajax.html)
- [Dependency Injection](dependency-injection.html)
- [Debugging](debugging.html)
- [Development Mode](development-mode.html)

## Configuration

- [Configuration by Convention](../plugins/convention/)
- [Annotations](annotations.html)
- [Configuration Elements](configuration-elements.html)
  - [Actions](action-configuration.html), [Wildcard Mappings](wildcard-mappings.html), [Beans](bean-configuration.html), [Constants](constant-configuration.html)
  - [Exceptions](exception-configuration.html), [Includes](include-configuration.html), [Interceptors](interceptor-configuration.html)
  - [Namespaces](namespace-configuration.html), [Packages](package-configuration.html), [Results](result-configuration.html)
  - [Unknown Handlers](unknown-handlers.html), [Dispatcher](dispatcher.html)
- [Configuration Files](configuration-files.html)
  - [web.xml](web-xml.html)
  - [struts.xml](struts-xml.html)
  - [default.properties](default-properties.html)
  - [struts-default.xml](struts-default-xml.html)
  - [velocity.properties](velocity-properties.html)
  - [struts-default.vm](struts-default-vm.html)
- [Application Servers](application-servers.html)
- [Performance Tuning](performance-tuning.html)
- [Security](../security/)
- [Testing Actions](../plugins/junit/)
  - [(arsenalist)](https://depressedprogrammer.wordpress.com/2007/06/18/unit-testing-struts-2-actions-spring-junit/)
  - [(rosa)](http://fassisrosa.blogspot.com/2006/11/unit-testing-struts-20\.html)
- [Interceptors](interceptors.html)
  - [Writing Interceptors](writing-interceptors.html)
  - [Excluding Parameters](parameters-interceptor.html)
- Actions
  - [Model Driven](model-driven.html)
  - [Action Chaining](action-chaining.html)
  - [ActionEventListener](action-event-listener.html)
- Results
  - [Result Types](result-types.html)
  - [DispatcherListener](dispatcher-listener.html)
  - [PreResultListener](pre-result-listener.html)
- [Validation](validation.html)
- [Localization](localization.html)
  - [Formatting Dates and Numbers](formatting-dates-and-numbers.html)
- [Type Conversion](type-conversion.html)
- [Static Content](static-content.html)
- Portlets
  - [Tutorial] - export https://cwiki.apache.org/confluence/display/WW/Struts+2+Portlet+Tutorial
  - [Configuration/Documentation] - export https://cwiki.apache.org/confluence/display/WW/Portlet+Plugin
- [Logging](logging.html)
- [Accessing application, session, request objects](accessing-application-session-request-objects.html)
- [Big Picture](big-picture)
    - [ObjectFactory](object-factory)
    - [Action Mapper](action-mapper.html)
    - [Action Proxy & ActionProxy Factory](action-proxy-and-actionproxy-factory.html)
    - [Configuration Provider & Configuration](configuration-provider-and-configuration)
- [FAQs](../faq/)
  - [Struts 2 Maven Archetypes](../maven-archetypes/)
  - [Cookbook]
