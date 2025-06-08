---
layout: default
title: Exception handling
parent:
    title: Getting started
    url: index.html
---

# Exception Handling
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The code for this tutorial, **exception-handling**, is available for checkout at [struts-examples](https://github.com/apache/struts-examples).

## Introduction

In this tutorial we'll explore how to enable the Struts 2 framework to handle any uncaught exceptions generated 
by a web application. Struts 2 provides robust exception handling, including the ability to automatically log any 
uncaught exceptions and redirect the user to an error web page.

The [Struts 2 user mailing list](http://struts.apache.org/mail) is an excellent place to get help. If you are having 
a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find 
an answer to your problem, post a question on the mailing list.

## Global Exception Handling

Using the Struts 2 framework you can specify in the struts.xml how the framework should handle uncaught exceptions. 
The handling logic can apply to all actions (global exception handling) or to a specific action. Let's first discuss
how to enable global exception handling.

To enable global exception handling you need to add two nodes to `struts.xml`: `global-exception-mapping` 
and `global-results`. For example examine the `struts.xml` from the exception-handling project.

```xml
<global-results>
    <result name="securityerror">/securityerror.jsp</result>
    <result name="error">/error.jsp</result>
</global-results>

<global-exception-mappings>
    <exception-mapping exception="org.apache.struts.register.exceptions.SecurityBreachException" result="securityerror" />
    <exception-mapping exception="java.lang.Exception" result="error" />
</global-exception-mappings>
```

The global exception mapping node tells the Struts framework what to do if an uncaught exception of the type specified 
(or a child of that type) is thrown by the application. For example if a SecurityBreachException is thrown but 
not caught, the Struts 2 Action class will return a result of `securityerror`. All other uncaught exceptions will cause 
the Struts 2 Action class to return a result of "error".

The global results mapping node relates the result value to a specific view page. For example the result `securityerror`
will cause the framework to redirect the user's browser to the `securityerror.jsp` view page.

## Exception Handling Per Action

If you need to handle an exception in a specific way for a certain action you can use the exception-mapping node within 
the action node.

```xml
<action name="actionspecificexception" class="org.apache.struts.register.action.Register" method="throwSecurityException">
   <exception-mapping exception="org.apache.struts.register.exceptions.SecurityBreachException" result="login" />
   <result>/register.jsp</result>
   <result name="login">/login.jsp</result>
</action>
```

The above action node from the example application's struts.xml file specifies that if the method `throwSecurityException`
throws an uncaught exception of type `SecurityBreachException` the Struts 2 framework should return a result of login. 
The login result will cause the user's browser to be redirected to login.jsp.

You can see that an action-specific exception mapping will take precedence if the same exception is also mapped globally.

## Logging Exceptions

You can configure the Struts 2 framework to log any uncaught exceptions. To enable logging of the exceptions being 
handled by the Struts 2 framework you must specify some parameter values in struts.xml. If you examine 
the [ExceptionMappingInterceptor class API](https://struts.apache.org/maven/struts2-core/apidocs/com/opensymphony/xwork2/interceptor/ExceptionMappingInterceptor) 
there are three parameter values you can set to enable logging (logEnabled), the log level to use (logLevel), 
and the log category (logCategory) to specify in the log message.

To set these parameter values for all actions that use a specific stack of interceptors in a package include
the following in struts.xml just after the opening package node.

```xml
<interceptors>
    <interceptor-stack name="appDefaultStack">
        <interceptor-ref name="defaultStack">
            <param name="exception.logEnabled">true</param>
            <param name="exception.logLevel">ERROR</param>
        </interceptor-ref>
    </interceptor-stack>
</interceptors>

<default-interceptor-ref name="appDefaultStack" />
```

The above interceptors node configures a new stack of Struts 2 interceptors named `appDefaultStack`. This stack 
of interceptors is based upon the defaultStack of interceptors (which are the Struts 2 interceptors that execute 
by default whenever an Action class method is called by the Struts 2 framework).

The ExceptionMappingInterceptor is one of the Struts 2 interceptors that is part of the default stack. In the definition 
of the struts defaultStack, the ExceptionMappingInterceptor is given the name of exception. By specifying a param node 
with the name of exception.logEnabled and a value of true, I'm setting the logEnabled parameter of the ExceptionMappingInterceptor class to true.

Now when the application throws an uncaught exception, the Struts 2 framework will handle it and will also write
an entry to the log that includes the stack trace. In the example above, I've set the level to log these exceptions 
to be ERROR.

In the example applications, the logging is just to the Servlet container's console (see the `log4j2.xml` file for 
the log settings).

## Display Exception Information In Browser

You can display information about the exception in the browser if you want by using s:property tags with a value 
of exception and exceptionStack. For example in error.jsp is this markup.

```html
<h4>The application has malfunctioned.</h4>

<p>Please contact technical support with the following information:</p> 

<h4>Exception Name: <s:property value="exception" /> </h4>

<h4>Exception Details: <s:property value="exceptionStack" /></h4> 
```

When the exception interceptor is triggered it adds to the fields available for display the exception message 
and the exception's stack trace.

## Summary

Struts 2 provides an easy to use configuration for handling uncaught exceptions and redirecting users to appropriate 
view pages. You can configure exception handling to be global for all actions or to just for a specific action. 
You can also enable the Struts 2 framework to log the uncaught exceptions.

|Return to [Message resource files](message-resource-files)|or|onward to [Debugging Struts](debugging-struts)|
