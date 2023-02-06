---
layout: default
title: Core Developers Guide
---

# Core Developers Guide

Struts 2 processes requests using three core types: [interceptors](interceptor-configuration), [actions](action-configuration)
and [results](result-configuration). Each may be configured via XML or annotations.

## Developing Applications with Struts 2

- [Nutshell](nutshell)
- [AJAX](ajax)
- [Dependency Injection](dependency-injection)
- [Debugging](debugging)
- [Development Mode](development-mode)

## Configuration

- [Configuration by Convention](../plugins/convention/)
- [Annotations](annotations)
- [Configuration Elements](configuration-elements)
  - [Actions](action-configuration), [Wildcard Mappings](wildcard-mappings), [Beans](bean-configuration), [Constants](constant-configuration)
  - [Exceptions](exception-configuration), [Includes](include-configuration), [Interceptors](interceptor-configuration)
  - [Namespaces](namespace-configuration), [Packages](package-configuration), [Results](result-configuration)
  - [Unknown Handlers](unknown-handlers), [Dispatcher](dispatcher)
- [Configuration Files](configuration-files)
  - [web.xml](web-xml)
  - [struts.xml](struts-xml)
  - [default.properties](default-properties)
  - [struts-default.xml](struts-default-xml)
  - [velocity.properties](velocity-properties)
  - [struts-default.vm](struts-default-vm)
- [OGNL Cache Configuration](ognl-cache-configuration)
- [Application Servers](application-servers)
- [Performance Tuning](performance-tuning)
- [Security](../security/)
- [Testing Actions](../plugins/junit/)
  - [(arsenalist)](https://depressedprogrammer.wordpress.com/2007/06/18/unit-testing-struts-2-actions-spring-junit/)
  - [(rosa)](http://fassisrosa.blogspot.com/2006/11/unit-testing-struts-20\)
- [Interceptors](interceptors)
  - [Writing Interceptors](writing-interceptors)
  - [Excluding Parameters](parameters-interceptor)
- Actions
  - [Model Driven](model-driven)
  - [Action Chaining](action-chaining)
  - [ActionEventListener](action-event-listener)
- Results
  - [Result Types](result-types)
  - [DispatcherListener](dispatcher-listener)
  - [PreResultListener](pre-result-listener)
- [Validation](validation)
- [Localization](localization)
  - [Formatting Dates and Numbers](formatting-dates-and-numbers)
- [Type Conversion](type-conversion)
- [Static Content](static-content)
- Portlets
  - [Tutorial] - export https://cwiki.apache.org/confluence/display/WW/Struts+2+Portlet+Tutorial
  - [Configuration/Documentation] - export https://cwiki.apache.org/confluence/display/WW/Portlet+Plugin
- [Logging](logging)
- [Accessing application, session, request objects](accessing-application-session-request-objects)
- [Big Picture](big-picture)
    - [ObjectFactory](object-factory)
    - [Action Mapper](action-mapper)
    - [Action Proxy & ActionProxy Factory](action-proxy-and-actionproxy-factory)
    - [Configuration Provider & Configuration](configuration-provider-and-configuration)
- [FAQs](../faq/)
  - [Struts 2 Maven Archetypes](../maven-archetypes/)
  - [Cookbook]
