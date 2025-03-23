---
layout: default
title: Dependency Injection
parent:
  title: Core Developers
  url: index
---

# Dependency Injection

Dependency injection removes the responsibility for object creation and object linking from the objects themselves 
to a factory. The factory is often provided by an Inversion of Control (IoC) container. For an overview 
of Inversion of Control containers, and the Dependency Injection pattern, please see 
[Martin Fowler's article](http://www.martinfowler.com/articles/injection).


Internally, the framework uses its own dependency injection container that is very similar to Google Guice. Both were 
originally developed by [Bob Lee](http://blog.crazybob.org/). Plugins are available to integrate applications with other 
IoC containers (e.g., _Spring Plugin_, _Plexus Plugin_ ). An application can even use a local copy of Google Guice 
for dependency injection needs. 

> Actions can still be instantiated via Spring configuration by way of the _Spring Plugin_, but Spring is entirely optional.
