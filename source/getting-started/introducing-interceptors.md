---
layout: default
title: Introducing Interceptors
parent:
    title: Getting started
    url: index.html
---

# Introducing Interceptors
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The example code for this tutorial, **interceptors**, is available at [struts-examples](https://github.com/apache/struts-examples)

## Introduction

So far our tutorials have not delved into the inner workings of the Struts 2 framework. But in this tutorial we'll 
introduce a key set of classes the Struts 2 framework relies upon to do most of the work whenever an Action is executed. 
In this tutorial's example project there is a register link that is mapped in the Struts XML configuration file (`struts.xml`) 
to the execute method of class Register. Before that execute method is called much work is done behind the scenes 
by the Struts 2 framework. For example:

1. Handling any exceptions generated
2. Converting the String request parameters to the Register class's instance fields where the name values match
3. Calling the validate method and/or the external XML validation

After the execute method is completed more work must be done

1. Handling any exceptions generated
2. Converting the `Register` class's instance fields to String values for display in the view page
3. Forwarding to the correct view page depending on the result String returned by the execute method

The above list of tasks are not complete - several other tasks are done before and after the execution of the Action.

The benefit of using Struts 2 is all this work happens automatically. You can focus on the logic of the controller 
(the Struts 2 ActionSupport class), the Service layer, the data access layer, your domain models, etc.

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are 
having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find 
an answer to your problem, post a question on the mailing list.

## Introducing Interceptors

The tasks that are done by the Struts 2 framework before and after an Action is executed are done by Struts 2 interceptors. 
Interceptors are standard Java classes included in the Struts 2 core jar which are executed in a specific order.

In our example application there is a package node in struts.xml. The package node has an attribute of extends with 
a value of "struts-default." The value "struts-default" identifies to the framework the specific stack of interceptors 
that will be executed before and after the Actions in that package.

If you want to learn more about the inner workings of interceptors, what interceptors belong to the struts default stack, 
and what are all the interceptors included with Struts 2, visit [Understanding Interceptors](../core-developers/interceptors.html) .

Sometime the Struts 2 default stack of interceptors are not exactly what you need for a particular action. You may want 
to use interceptors that are not part of the Struts 2 default stack. For an individual Action or for the entire 
package of Actions, you can specify a different stack of interceptors that the Action or package should use. Below is 
how you would specify that the register Action should use both the [logger](../core-developers/logging-interceptor.html) 
and [timer](../core-developers/timer-interceptor.html) interceptors in addition to the interceptors provided by the default stack.

**Specify Specific Interceptors For An Action**

```xml
<action name="register" class="org.apache.struts.register.action.Register" method="execute">
    <interceptor-ref name="timer" />
    <interceptor-ref name="logger" />
    <interceptor-ref name="defaultStack">
        <param name="exception.logEnabled">true</param>
        <param name="exception.logLevel">ERROR</param>
    </interceptor-ref>
    <result name="success">thankyou.jsp</result>
    <result name="input">register.jsp</result>
</action>
```

The logger interceptor logs the start and end of the execution of an Action. The timer interceptor logs the amount 
of time (in milliseconds) for execution of the Action. These two interceptors used together can provide developers 
useful feedback.

In the code example above note the three interceptor-ref nodes. Each one has a value for the name attribute. For the register 
Action we are instructing the framework to use the `timer`, `logger`, and `defaultStack` interceptors. The `defaultStack` 
are all the interceptors normally executed for an Action.

How did I know to use the value of timer for the name attribute and even that there is a timer interceptor? 
On the [Interceptors](../core-developers/interceptors.html) web page in the Struts 2 documentation are a list of interceptors 
that come with the Struts 2 framework and what the name value is for each interceptor.

How did I know that the timer interceptor isn't part of the defaultStack of interceptors already? Again on the Interceptors 
documentation web page is a list of which interceptors belong to the `defaultStack`.

Note the param nodes. These nodes are used to provide a value to the setLogEnabled and setLogLevel methods 
of the [Exception Interceptor](../core-developers/exception-interceptor.html). Providing the values of true and ERROR 
will cause the Struts 2 framework to log any exceptions not caught by the application's code and to log those exceptions 
at the ERROR level.

## Run The Example

In the example application follow the README instructions to build, deploy, and run the application. View the output 
sent to the JVM console to see the log messages generated by the logger and timer interceptors. You should see log messages 
similar to the following:

```
INFO: Starting execution stack for action //register
Nov 20, 2010 9:55:48 AM com.opensymphony.xwork2.util.logging.jdk.JdkLogger info
INFO: Finishing execution stack for action //register
Nov 20, 2010 9:55:48 AM com.opensymphony.xwork2.util.logging.jdk.JdkLogger info
INFO: Executed action /register!execute took 177 ms.
```

If you wanted to have the logger and timer interceptors executed for all Actions in a package you would use 
the following in `struts.xml`:

**Specify Specific Interceptors For A Package**

```xml
<package name="basicstruts2" extends="struts-default" > 
    <interceptors> 
        <interceptor-stack name="appDefault"> 
            <interceptor-ref name="timer" /> 
            <interceptor-ref name="logger" /> 
            <interceptor-ref name="defaultStack" /> 
        </interceptor-stack> 
    </interceptors>          

    <default-interceptor-ref name="appDefault" /> 

    <!-- rest of package omitted --> 

</package> 
```

In the code above we use the interceptors node to define a new stack of interceptors that includes the `timer`, `logger`, 
and `defaultStack` interceptors. We give this new interceptor stack a name of appDefault. Then we use the `default-interceptor-ref` 
node to specify that for all Actions defined inside this package node the `appDefault` stack of interceptors are to be used. 
Thus the `timer` and `logger` interceptor will be executed for each Action in this package.

Note that in both examples we are still executing all the other interceptors by including the defaultStack as one 
of the `interceptor-ref` nodes. When you specify what interceptors you want to use for an Action or a package then only 
those interceptors are executed. So if in the example we had left out the `interceptor-ref` for `defaultStack` only 
the `logger` and `timer` interceptors would have executed.

## Create Your Own Interceptor

In addition to specifying your own stack of interceptors, you can also write your own new interceptor and add it to 
the stack that is executed. The Struts [Writing Interceptors](../core-developers/writing-interceptors.html) guide explains 
how to do this. For example, you could create your own interceptor to handle authentication and authorization.

## Summary

Interceptors provide the Struts 2 framework with both power and flexibility. Developers may add additional interceptors 
(either ones provided by Struts 2 or ones they create) to the stack of interceptors executed when an Action class is called.

|Return to [Annotations](annotations.html)|or|onward to [Unit Testing](unit-testing.html)|
