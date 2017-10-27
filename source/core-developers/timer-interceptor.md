---
layout: default
title: Timer Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Timer Interceptor

**DEPRECATED**

This interceptor logs the amount of time in milliseconds. In order for this interceptor to work properly, the logging 
framework must be set to at least the `INFO` level.  This interceptor relies on the [Commons Logging API](http://jakarta.apache.org/commons/logging/) 
to report its execution-time value.

## Parameters

 - `logLevel` (optional) - what log level should we use (`trace, debug, info, warn, error, fatal`)? - default is `info`
 - `logCategory` (optional) - If provided we would use this category (eg. `com.mycompany.app`).
   Default is to use `com.opensymphony.xwork2.interceptor.TimerInterceptor`.

The parameters above enables us to log all action execution times in our own logfile.

## Extending the Interceptor

This interceptor can be extended to provide custom message format. Users should override the `invokeUnderTiming` method.

## Examples

```xml
 <!-- records only the action's execution time -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="completeStack"/>
     <interceptor-ref name="timer"/>
     <result name="success">good_result.ftl</result>
 </action>

 <!-- records action's execution time as well as other interceptors-->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="timer"/>
     <interceptor-ref name="completeStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```
