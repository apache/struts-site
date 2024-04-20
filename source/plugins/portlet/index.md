---
layout: default
title: Portlet Plugin
parent:
    url: ../
    title: Plugins
---

# Portlet Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

> This plugin got marked as deprecated since Struts 2.6!

## Documentation

The Portlet Plugin is used for developing JSR286 portlets using Struts 2.

### portlet-class

To use the Struts 2 Portlet framework, use **_org.apache.struts2.portlet.dispatcher.Jsr286Dispatcher_** as the portlet class in your portlet.xml file:

**portlet.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>

<portlet-app id="my-portlet-app"
	xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0"
	xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">

    <portlet id="MyPortlet">
        <description xml:lang="EN">My Portlet</description>
        <portlet-name>MyPortlet</portlet-name>
        <display-name xml:lang="EN">my-portlet</display-name>
    
        <portlet-class>org.apache.struts2.portlet.dispatcher.Jsr286Dispatcher</portlet-class>
        
        <!-- SNIP -->

    </portlet>
</portlet-app>
```

### Portlet Init Parameters

Below is the init-param elements that you can set up in _portlet.xml_  for configuring the portlet mode -> xwork namespace mappings for the portlet. Basically, you can think of the different portlet modes as different sub-applications, so it can be useful to set up the `struts.xml` configuration with different namespaces for the different portlets and modes:

|Key|Description|Default|
|---|-----------|-------|
|portletNamespace|The namespace for the portlet in the action configuration. This namespace is prepended to all action lookups, and makes it possible to host multiple portlets in the same portlet application. If this parameter is set, the complete namespace will be _/portletNamespace/modeNamespace/actionName_ |The default namespace.|
|viewNamespace|The namespace in the xwork config for the view portlet mode.|The default namespace.|
|editNamespace|The namespace in the xwork config for the edit portlet mode.|The default namespace.|
|helpNamespace|The namespace in the xwork config for the help portlet mode.|The default namespace.|
|defaultViewAction|Name of the action to use as default for the view portlet mode, when no action name is present.|default|
|defaultEditAction|Name of the action to use as default for the edit portlet mode, when no action name is present.|default|
|defaultHelpAction|Name of the action to use as default for the help portlet mode, when no action name is present.|default|

e.g.

**portlet.xml**

```xml
<init-param>
    <!-- Portlet namespace -->
    <name>portletNamespace</name>
    <value>/portletA</value>
</init-param>
<init-param>
    <!-- The base namespace of the view portlet mode -->
    <name>viewNamespace</name>
    <value>/view</value>
</init-param>
<init-param>
    <!-- The default action to invoke in view mode -->
    <name>defaultViewAction</name>
    <value>index</value>
</init-param>
```

This snippet from `portlet.xml` will set up the portlet with a namespace of _/portletA/_. This means that all requests to this portlet will get the namespace prepended when looking up the action. In addition, the \_view_  portlet mode will map to the _/view_  namespace, so a request for action `myAction` will resolve to the namespace and action _/portletA/view/myAction_ . It also means that if no action is requested, the default action of `index` will be used for the request.

### web.xml

If you want to access to expose the value stack through request attributes (e.g. if you want to use regular JSTL tags to access values in the stack), you have to configure the dispatcher servlet in your web application descriptor:

**web.xml**

```xml
<servlet id="Struts2PortletDispatcherServlet">
    <servlet-name>Struts2PortletDispatcherServlet</servlet-name>
    <servlet-class>org.apache.struts2.portlet.dispatcher.DispatcherServlet</servlet-class>
</servlet>
```

**If you're only using Struts 2 tags, configuring the dispatcher servlet is optional**

### Portlet Phases

The portlet specification describes that a portlet request cycle can consist of two phases, an _event_  phase and a _render_  phase. In case of an _event_  in the portlet, it will always execute before the _render_  phase. The _event_  phase is typically for changing the state of the application. In a portlet, this is typically when a form is submitted. The _render_  phase will then prepare and dispatch to the view. It's recommended that you set up the result from an action that is executed in the _event_  phase to point to another action that is executed in the _render_  phase, which again is responsible for dispatching to the actual view.

### Portlet Result Dispatching

The _struts-portlet-default_  package defines a special default Result Type, which is responsible for performing the result logic of an Action execution. Typically, this involves including a JSP for rendering, or preparing a render action if one is configured for the current event action.

This result type has three main modes of execution.

+ If the Action is executed in the render phase, it will perform a PortletRequestDispatcher.include(req, res) to the resource specified in the _location_  attribute.

+ If the Action is executed in the event phase, and the result is an action mapping, it will set a render parameter on the ActionResponse to indicate which Action should be executed in the render phase. This follows good web application design, which promotes the use of a redirect after an event, which in this case means that an Action executed in the event phase will be followed by a redirect to an Action executed in the render phase.

+ If the Action is executed in the event phase, and the result is not an action mapping, the result will prepare a special Action called "renderDirect" (specified in the _struts-portlet-default_  package) whose sole purpose is to render the specified web resource (usually a JSP).

#### redirectAction

The action executed in event mode can pass render parameters to the next action to execute in render mode through parameters using the _redirectAction_  result type:

**struts.xml**

```xml
<result type="redirectAction" name="success">
    <param name="actionName">displayCart</param>
    <param name="userId">${userId}</param>  
    <!-- If you want to redirect to a different portlet mode, use the portletMode parameter 
    <param name="portletMode">view</param>
    -->
</result>
```

This will set up a _render parameter_  called _userId_  with the value of the _userId_  property on the value stack.

You can also use the _portletMode_  parameter to change to a different portlet mode.

### s:url and s:form tags

URLs in a portlet is handled quite different than for a regular web application. There's no such thing as "extension", there's simply an action name and a namespace, and they have to be specified using the respective tag attributes. URLs using the _value_  attribute will be encoded as a resource URL and is only suitable for additional resources such as images and style sheets.

Example:

|Servlet|Portlet|
|-------|-------|
|\<s:url value="hello.action"/\>|\<s:url action="hello"/\>|
|\<s:url value="style.css"/\>|\<s:url value="style.css"/\>|

In addition, there are some additional tag attributes that are portlet specific. These are:

|Name|Description|
|----|-----------|
|portletMode|The resulting portlet mode of the url|
|windowState|The resulting window state of the url|
|portletUrlType|Specifies if this is a _render_  or an _action_  url|

Typical usage for the _portletUrlType_  is if you have a _delete_  link that removes something from a database. To ensure this is done in the event phase, as recommended by the portlet specification (since it is a change of state), the url can use this attribute, e.g. \<s:url action="deleteEntry" portletUrlType="action"/\>

### Security

Basically the Struts2 Portlet Plugin doesn't support different auth level in the same portlet. If you want to achieve that you must create two separated portlets and configure access level with portlet engine for each of them.

### Other resources

+ [Struts 2 Portlet Tutorial](struts-2-portlet-tutorial)
+ [JSR168 Specification](http://jcp.org/aboutJava/communityprocess/final/jsr168/index)
+ [JSR286 Specification](http://jcp.org/aboutJava/communityprocess/final/jsr286/index)
