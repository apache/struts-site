---
layout: plugin
title: JUnit plugin
---

# JUnit plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The recommended way to test actions is to instantiate the action classes and test them. The _JUnit Plugin_  supports 
testing actions within a Struts invocation, meaning that a full request is simulated, and the output of the action can 
be tested.

## Struts actions (without Spring)

To test actions that do not use Spring, extend `StrutsTestCase`. The following example shows different ways of testing 
an action:
 
- Mapping:

```xml
<struts>
    <constant name="struts.objectFactory" value="spring"/>
    <package name="test" namespace="/test" extends="struts-default">
        <action name="testAction" class="org.apache.struts2.TestAction">
            <result type="freemarker">/template.ftl</result>
        </action>
    </package>
</struts>
```

- Action:

```java  
public class TestAction extends ActionSupport {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
```

- JUnit:

```java
package org.apache.struts2;

import org.apache.struts2.dispatcher.mapper.ActionMapping;

import java.util.HashMap;
import java.io.UnsupportedEncodingException;

import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.Action;

import javax.servlet.ServletException;

public class StrutsTestCaseTest extends StrutsTestCase {
    public void testGetActionMapping() {
        ActionMapping mapping = getActionMapping("/test/testAction.action");
        assertNotNull(mapping);
        assertEquals("/test", mapping.getNamespace());
        assertEquals("testAction", mapping.getName());
    }

    public void testGetActionProxy() throws Exception {
        //set parameters before calling getActionProxy
        request.setParameter("name", "FD");
        
        ActionProxy proxy = getActionProxy("/test/testAction.action");
        assertNotNull(proxy);

        TestAction action = (TestAction) proxy.getAction();
        assertNotNull(action);

        String result = proxy.execute();
        assertEquals(Action.SUCCESS, result);
        assertEquals("FD", action.getName());
    }

    public void testExecuteAction() throws ServletException, UnsupportedEncodingException {
        String output = executeAction("/test/testAction.action");
        assertEquals("Hello", output);
    }

    public void testGetValueFromStack() throws ServletException, UnsupportedEncodingException {
        request.setParameter("name", "FD");
        executeAction("/test/testAction.action");
        String name = (String) findValueAfterExecute("name");
        assertEquals("FD", name);
    }
}
```

## The template

If you use JSPs as the template engine you won't be able to test the action output outside the container. 
The [Embedded JSP Plugin](../embeddedjsp/) can be used to overcome this limitation and be able to use JSPs from 
the classpath and outside the container.

There are several utility methods and mock objects defined in StrutsTestCase which can be used to facilitate the testing:

- Methods:

|Method Name|Description|
|-----------|-----------|
|executeAction(String)|Pass the url for the action, and it will return the output of the action. This output **is not** the action result, like "success", but what would be written to the result stream. To use this the actions must be using a result type that can be read from the classpath, like FreeMarker, velocity, etc (if you are using the experimental Embedded JSP Plugin, you can use JSPs also)|
|getActionProxy(String)|Builds an action proxy that can be used to invoke an action, by calling execute() on the returned proxy object. The return value of execute() is the action result, like "success"|
|getActionMapping(String)|Gets an ActionMapping for the url|
|injectStrutsDependencies(object)|Injects Struts dependencies into an object (dependencies are marked with Inject)|
|findValueAfterExecute(String)|Finds an object in the value stack, after an action has been executed|
|applyAdditionalParams(ActionContext)|Can be overwritten in subclass to provide additional params and settings used during action invocation|
|createAction(Class)|Can be used to instantiate an action which requires framework's dependencies to be injected (e.g. extending ActionSupport requires inject some internal dependencies)|

- Fields:

|Field|Description|
|-----|-----------|
|MockHttpServletRequest request|The request that will be passed to Struts. Make sure to set parameters in this object before calling methods like getActionProxy|
|MockHttpServletResponse response|The response object passed to Struts, you can use this class to test the output, response headers, etc|
|MockServletContext servletContext|The servlet context object passed to Struts|

## Struts Actions using Spring

Make sure to add a dependency to the [Spring Plugin](../spring/) to your `pom.xml`:

```xml
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-spring-plugin</artifactId>
    <version>STRUTS_VERSION</version>
</dependency>
```

If you use Spring as the object factory, the `StrutsSpringTestCase` class can be used to write your JUnits. This class 
extends `StrutsTestCase` and has an `applicationContext` field of type `ApplicationContext`.

The Spring context is loaded from `classpath\*:applicationContext.xml` by default. To provide a different location, 
overwrite `getContextLocations`.
