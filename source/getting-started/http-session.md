---
layout: getting-started
title: Http Session
---

# HTTP Session
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The example code for this tutorial, http_session, is available at [https://github.com/apache/struts-examples].

## Introduction

Your Struts 2 application may need to access the HTTP session object. Struts 2 provides an interface, 
[SessionAware]({{ site.apidocs }}/org/apache/struts2/interceptor/SessionAware.html), that your Action class 
should implement to obtain a reference to the HTTP session object.

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are 
having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find 
an answer to your problem, post a question on the mailing list.

## SessionAware Interface

The SessionAware interface has one method, setSession, that your Action class will need to override. In the example 
application (see above), the HelloWorldAction class implements the SessionAware interface and includes this code:

**HelloWorldAction.java setSession Method**

```java
private Map<String, Object> userSession ;

public void setSession(Map<String, Object) session) {
   userSession = session ;
}
```

The Struts 2 framework has an interceptor that will inject the HTTP session object into the Action class by calling 
the `setSession` method.

## Using the HTTP Session Object In The Action Class

The example application keeps track of how many times the user clicks on a Hello link or submits the hello form. 
It stores this count in the HTTP session object in the increaseHelloCount method.

**HelloWorldAction.java increaseHelloCount Method**

```java
private void increaseHelloCount() {
    Integer helloCount = (Integer) userSession.get(HELLO_COUNT);

    if (helloCount == null ) {
        helloCount = 1;
    } else {
        helloCount++;
    }

    userSession.put(HELLO_COUNT, helloCount);
}
```

When the increaseHelloCount method is called from within the execute method, the userSession object is a reference 
to the HTTP session object injected by the Struts 2 framework. So any objects stored in the HTTP session can be retrieved 
using the userSession object and any objects stored in the userSession object will be stored in the HTTP session object.

## Accessing HTTP Session Objects In The View

Struts 2 provides an easy way to get an object stored in the HTTP session from within the view page. In the example 
application is `HelloWorld.jsp` with this markup:

**HelloWorld.jsp Get helloCount Value From HTTP Session**

```html
    <p>I've said hello to you <s:property value="#session.helloCount" /> times!</p>
```

The `s:property` tag's value attribute has a value of `#session.helloCount`. The "#" before the word session tells 
the Struts framework to look in the session scope for a key of "helloCount" (which is the value of the String constant 
`HELLO_COUNT` referenced in method `increaseHelloCount`). Struts will get the object mapped to `helloCount` key and 
then call that object's toString method to determine what to display in the view page.

## Best Practices When Using SessionAware

Using SessionAware does introduce a potential security vulnerability that you should mitigate by also following these 
practices in the Action class that implements the SessionAware interface.

1. Do not have a public `Map<String, Object> getSession` method in the Action class. You only need a public void 
  `setSession` method to implement the `SessionAware` interface.
2. Also have the Action class implement the [ParameterNameAware interface]({{ site.apidocs }}/com/opensymphony/xwork2/interceptor/ParameterNameAware.html) 
  and override its acceptableParameterName method:

**HelloWorldAction.java acceptableParameterName Method**

```java
public boolean acceptableParameterName(String parameterName) {
    boolean allowedParameterName = true ;

    if ( parameterName.contains("session")  || parameterName.contains("request") ) {
        allowedParameterName = false ;
    } 

    return allowedParameterName;
}
```

This method will be called by the Struts 2 framework for each parameter in the request scope. By returning false if 
the parameter name contains "session" we are telling the Struts 2 framework to ignore that parameter. This will prevent 
a malicious user from trying to hack the HTTP session object.

Instead of having each action that implements SessionAware also implement the ParameterNameAware interface you can tell t
he params interceptor to exclude specific request attributes for all actions in a package. In struts.xml configure 
the `struts-default` set of interceptors as follows:

**struts.xml configure params interceptor**

```xml
<package name="basicstruts2" extends="struts-default">
    <interceptors>
        <interceptor-stack name="appDefault">
            <interceptor-ref name="defaultStack">
                <param name="exception.logEnabled">true</param>
                <param name="exception.logLevel">ERROR</param>
                <param name="params.excludeParams">dojo..*,^struts..*,^session..*,^request..*,^application..*,^servlet(Request|Response)..*,parameters...*</param>
            </interceptor-ref>
        </interceptor-stack>
    </interceptors>

    <default-interceptor-ref name="appDefault" />
    ...
</package>
```

The above code will ensure that every action in the "basicstruts2" package that implements the SessionAware interface 
will exclude from processing parameters that starts with the strings provided in the `params.excludeParams` node.

The example project includes both methods for mitigating the SessionAware security vulnerability.

> Note the same issue exists if you implement the ServletRequestAware interface, which is why the above method returns 
> false if the parameter name contains "request".

## Summary

When your Action class needs to access the HTTP session object implement the SessionAware interface and override 
the `setSession` method. Be sure to also implement the `ParameterNameAware` interface and override 
the `acceptableParameterName` method to mitigate a potential security vulnerability. If you have multiple actions 
that implement `SessionAware` then consider modifying the params interceptor's `excludeParams` value as part of your 
Struts 2 package setup.

|Return to [Unit Testing](unit-testing.html)|or|onward to [Preparable Interface](preperable-interface.html)|
