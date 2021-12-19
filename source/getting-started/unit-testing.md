---
layout: default
title: Unit testing
parent:
    title: Getting started
    url: index.html
---

# Unit Testing
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The example code for this tutorial, **unit-testing**, is available at [struts-examples](https://github.com/apache/struts-examples)

## Introduction

Struts 2 supports running unit tests of methods in the Struts Action class with the [Struts 2 JUnit plugin](../plugins/junit/). 
The JUnit plugin allows you to test methods of an Action class from within the Struts 2 framework. The Struts Servlet 
-filter and interceptors fire just as if your application was running on a Servlet container.

The [Struts 2 user mailing list](http://struts.apache.org/mail) is an excellent place to get help. If you are having 
a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer 
to your problem, post a question on the mailing list.

## Setup

The Struts 2 JUnit plugin jar file must be on your application's class path. In the example application (see info above) 
the `pom.xml` includes a dependency for the `struts2-junit-plugin`. There are numerous transitive dependencies, including 
to JUnit and the Spring framework.

## Writing A Unit Test

In the example application, the Register Action class includes using the validate method. This method is automatically 
executed by the Struts 2 framework prior to the execute method. Additionally, this method needs the values from the user's 
input on the form to already have been provided to the instance fields of the Action class (this work is done by another 
Struts 2 interceptor). So it would be difficult to test the validate method without the overall Struts 2 framework running.

To use the Struts 2 plugin to ensure the Strut 2 framework runs as part of the test, you need to have your JUnit test 
class extend StrutsTestCase (see RegisterTest class in the example application).

Note that the Struts 2 JUnit plugin can be used to design unit tests of other Action class methods such as the input method 
and also to test methods of a custom interceptor you add to the interceptor stack. Also in this example, the test is 
for validation performed in the [validate method](form-validation) . But the same type of test would work if the validation 
was done using [XML file validation](form-validation-using-xml).

To test the validate method we want Struts to call the Struts action that will cause the Action class's validate and execute 
methods to be run. In the example application this action is register.

**struts.xml**

```xml
<action name="register" class="org.apache.struts.register.action.Register" method="execute">
    <result name="success">/thankyou.jsp</result>
    <result name="input">/register.jsp</result>
</action>
```

Remember the validate method will be called automatically by the framework before calling the execute method. If validation 
fails the Struts framework will return `input`. If there are no validation errors then the framework will call the execute 
method and return whatever String the execute method returns.

## Test Validation Should Pass

For our first test we'll test that there should be no validation errors. In the normal flow of this application the user 
would first enter the form data shown on the register.jsp page.

![Screen shot 2012-02-17 at 2.46.54 PM.png](attachments/att28017281_Screen shot 2012-02-17 at 2.46.54 PM.png)

The input fields for the form have the following name values: `personBean.firstName`, `personBean.lastName`, 
`personBean.email`, and `personBean.age`. When the user fills out those fields Struts will take the values and provide 
them to the appropriate set methods of the `personBean` object. So as part of the test I need to simulate the user filling 
out these form fields. The StrutsTestCase provides a request object (of type `MockHttpServletRequest`) that I can use 
to set these values in the request scope.

**testExecuteValidationPasses method from RegisterTest class**

```java
@Test
public void testExecuteValidationPasses() throws Exception {
    request.setParameter("personBean.firstName", "Bruce");
    request.setParameter("personBean.lastName", "Phillips");
    request.setParameter("personBean.email", "bphillips@ku.edu");
    request.setParameter("personBean.age", "19");

    ActionProxy actionProxy = getActionProxy("/register.action");
    Register action = (Register) actionProxy.getAction() ;

    assertNotNull("The action is null but should not be.", action);

    String result = actionProxy.execute();

    assertEquals("The execute method did not return " + ActionSupport.SUCCESS + " but should have.", ActionSupport.SUCCESS, result);
}
```

The first statements in the test method use the request object to set the values of any request parameters. These simulate 
the values the user would enter into the form fields. Note how the first argument to setParameter is the same as the value 
of the name attribute in the Struts textfield tag in the register.jsp page.

In this test I'm providing good data for each form field as I want to ensure my validation doesn't register an error if 
the user provides correct information.

I then call the getActionProxy method with the argument of "/register.action" and then the getAction method to get a reference 
to the Struts action class for this test. This will ensure that the Struts 2 JUnit plugin will know which Action class 
should  be used--the class associated with the register action in the struts.xml. In this case that class is the Register class.

The assertNotNull test ensures that argument to getActionProxy reference an Action class identified in struts.xml. It's 
a way of checking that you've correctly setup struts.xml for this action.

After that I can call actionProxy.execute(). This causes the Struts 2 framework to go through its normal process of Servlet 
filter and interceptors for the action identified by the actionProxy (in this case that is the register.action). The validate 
method of class Register will get called and if it doesn't create any field or action errors then Struts 2 will call 
the `execute` method. In this example, the execute method should return `success`.

So in the next statement, I check that success was returned.

## Test Validation Should Fail

To test that validation should fail, I just need to have a test method that doesn't provide input for a form field. 
For example, in the validate method of the Register Action class, is a test to ensure the user has entered some information 
for the personBean.firstName input field. In the test method I would just not use the request object to set a parameter 
for that field.

**testExecuteValidationFailsMissingFirstName method from RegisterTest class**

```java
@Test
public void testExecuteValidationFailsMissingFirstName() throws Exception {
    //request.setParameter("personBean.firstName", "Bruce");
    request.setParameter("personBean.lastName", "Phillips");
    request.setParameter("personBean.email", "bphillips@ku.edu");
    request.setParameter("personBean.age", "19");
    
    ActionProxy actionProxy = getActionProxy("/register.action");
    Register action = (Register) actionProxy.getAction() ;
    
    assertNotNull("The action is null but should not be.", action);
    
    String result = actionProxy.execute();
    
    assertEquals("The execute method did not return " + ActionSupport.INPUT + " but should have.", ActionSupport.INPUT, result);
}
```

In the last assertEquals statement my test checks that the Struts 2 framework returned `input` as that is what the Struts 2 
framework will return if the validation adds a field or action error.

## Summary

There is much more you can do with the Struts 2 JUnit plugin to help you test the methods of your Action class in conjunction 
with the Struts 2 framework. If your Struts 2 application uses Spring to inject dependencies into the Action class then 
the Struts 2 JUnit Plugin has a StrutsSpringTestCase that your test class should extend. Please read [Testing Actions](../plugins/junit/) 
to learn more.

|Return to [Introducing Interceptors](introducing-interceptors)|or|onward to [HTTP Session](http-session)|
