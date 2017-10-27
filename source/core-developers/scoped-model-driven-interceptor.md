---
layout: default
title: Scoped Model Driven Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Scoped Model Driven Interceptor

An interceptor that enables scoped model-driven actions.

This interceptor only activates on actions that implement the `ScopedModelDriven` interface. If detected, it will 
retrieve the model class from the configured scope, then provide it to the Action.
  
## Parameters
 
 - `className` - The model class name.  Defaults to the class name of the object returned by the `getModel()` method.
 - `name` - The key to use when storing or retrieving the instance in a scope.  Defaults to the model class name.
 - `scope` - The scope to store and retrieve the model.  Defaults to 'request' but can also be 'session'.
 
## Extending the Interceptor

There are no known extension points for this interceptor.

## Examples

```xml
 <-- Basic usage -->
 <interceptor name="scopedModelDriven" class="com.opensymphony.interceptor.ScopedModelDrivenInterceptor" />
 
 <-- Using all available parameters -->
 <interceptor name="gangsterForm" class="com.opensymphony.interceptor.ScopedModelDrivenInterceptor">
      <param name="scope">session</param>
      <param name="name">gangsterForm</param>
      <param name="className">com.opensymphony.example.GangsterForm</param>
  </interceptor>
```
