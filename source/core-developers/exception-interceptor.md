---
layout: default
title: Exception Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Exception Interceptor

This interceptor forms the core functionality of the exception handling feature. Exception handling allows you to map 
an exception to a result code, just as if the action returned a result code instead of throwing an unexpected exception. 
When an exception is encountered, it is wrapped with an `ExceptionHolder` and pushed on the stack, providing easy access 
to the exception from within your result.

> Note: While you can configure exception mapping in your configuration file at any point, the configuration will not 
> have any effect if this interceptor is not in the interceptor stack for your actions. It is recommended that you make 
> this interceptor the first interceptor on the stack, ensuring that it has full access to catch any exception, even 
> those caused by other interceptors.

## Parameters

 - `logEnabled` (optional) - should exceptions also be logged? (boolean true|false)
 - `logLevel` (optional) - what log level should we use (`trace, debug, info, warn, error, fatal`)? - default is `debug`
 - `logCategory` (optional) - if provided we would use this category (eg. `com.mycompany.app`). Default is to use 
   `com.opensymphony.xwork2.interceptor.ExceptionMappingInterceptor`.

The parameters above enables us to log all thrown exceptions with stacktrace in our own logfile, and present a friendly 
webpage (with no stacktrace) to the end user.

## Extending the Interceptor

If you want to add custom handling for publishing the Exception, you may override `#publishException(com.opensymphony.xwork2.ActionInvocation, ExceptionHolder)`. 
The default implementation pushes the given `ExceptionHolder` on a value stack. A custom implementation could add additional 
logging etc.

## Examples

```xml
 <struts>
     <package name="default" extends="xwork-default">
         <global-results>
             <result name="error" type="freemarker">error.ftl</result>
         </global-results>

         <global-exception-mappings>
             <exception-mapping exception="java.lang.Exception" result="error"/>
         </global-exception-mappings>

         <action name="test">
             <interceptor-ref name="exception"/>
             <interceptor-ref name="basicStack"/>
             <exception-mapping exception="com.acme.CustomException" result="custom_error"/>
             <result name="custom_error">custom_error.ftl</result>
             <result name="success" type="freemarker">test.ftl</result>
         </action>
     </package>
 </struts>
```