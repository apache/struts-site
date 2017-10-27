---
layout: default
title: Logger Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Logging Interceptor

This interceptor logs the start and end of the execution an action (in English-only, not internationalized).

> Note: This interceptor will log at _INFO_ level.

## Parameters

There are no parameters for this interceptor.

## Extending the Interceptor

There are no obvious extensions to the existing interceptor.

## Examples

```xml
 <!-- prints out a message before and after the immediate action execution -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="logger"/>
     <result name="success">good_result.ftl</result>
 </action>

 <!-- prints out a message before any more interceptors continue and after they have finished -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="logger"/>
     <interceptor-ref name="completeStack"/>
     <result name="success">good_result.ftl</result>
 </action>

```