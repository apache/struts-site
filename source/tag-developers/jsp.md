---
layout: default
title: JSP
parent:
  title: Tag Developers Guide
  url: index
---

# JSP
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The default configuration (`struts-default.xml`) configures the `Dispatcher Result` as the default result, which works 
well with JavaServer Pages. Any JSP 1.2+ container can work with Struts 2 JSP tags immediately.

## Getting Started

Because JSP support occurs through the `Dispatcher Result`, which is the default result type, you don't need to specify 
the type attribute when configuring `struts.xml`:

```xml
<action name="test" class="com.acme.TestAction">
    <result name="success">test-success.jsp</result>
</action>
```

Then in **test-success.jsp**:

```jsp
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>Hello</title>
</head>
<body>

Hello, <s:property value="name"/>

</body>
</html>
```

Where **name** is a property on your action. That's it!

## Servlet / JSP Scoped Objects

The following are ways to obtain Application scope attributes, Session scope attributes, Request scope attributes, 
Request parameters and framework Context scope parameters:

### Application Scope Attribute

Assuming there's an attribute with name `myApplicationAttribute` in the Application scope.

```jsp
<s:property value="%{#application.myApplicationAttribute}" />
```

### Session Scope Attribute

Assuming there's an attribute with name `mySessionAttribute` in the Session scope.

```jsp
<s:property value="%{#session.mySessionAttribute}" />
```

### Request Scope Attribute

Assuming there's an attribute with name `myRequestAttribute` in the Request scope.

```jsp
<s:property value="%{#request.myRequestAttribute}" />
```

### Request Parameter

Assuming there's a request parameter `myParameter` (e.g. [http://host/myApp/myAction.action?myParameter=one]).

```jsp
<s:property value="%{#parameters.myParameter}" />
```

### Context Scope Parameter

Assuming there's a parameter with the name `myContextParam` in our context.

```jsp
<s:property value="%{#myContextParam}" />
```

## Tag Support

See the [JSP Tags](jsp-tags) documentation for information on how to use the generic [Struts Tags](struts-tags) 
provided by the framework. 

## Exposing the ValueStack

There are a couple of ways to obtain [Access to ValueStack from JSPs](access-to-valuestack-from-jsps).
