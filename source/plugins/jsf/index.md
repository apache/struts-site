---
layout: plugin
title: JSF Plugin
---

# JSF Plugin

[JavaServer Faces](http://java.sun.com/j2ee/javaserverfaces) technology simplifies building user interfaces for JavaServer applications. Developers of various skill levels can quickly build web applications by: assembling reusable UI components in a page; connecting these components to an application data source; and wiring client-generated events to server-side event handlers.

The JSF Plugin provides support for JavaServer Faces components with no additional configuration.

The JSF support works by breaking up the JSF Licycle class into Struts Interceptors, one for each JSF phase.  When you include the `jsfStack` stack, you are ensuring the JSF page has its phases execute correctly.  At the end of the phases, the Struts Action itself is executed just like non-JSF pages.  The String return code of the Action is treated like any other Action as well.  Finally, the JSF "render" phase has been transformed into a Result.

JavaServer Faces also has a concept of an "action", which are generally executed in response to a button click.  The handling of the JSF action is preserved through the `jsfStack` Interceptor stack, but its String result code, rather than being applied against a JSF navigation rule, is treated as a Struts result code thereby keeping the navigation responsibility within Struts.

The limitations of this approach include:

1. Any custom Lifecycle class is ignored

2. Any custom NavigationHandler is delegated to only when a Struts 2 navigation option cannot be found

On the other hand, the rest of the JSF functionality, including PhaseListeners, components, multiple backing beans, etc. are preserved.  The Showcase example has a section demonstrating the JSF integration approach.

## Features

+ Allows JSF components on normal Struts pages

+ Requires no additional configuration

+ Allows the JSF lifecycle to be completely customized

+ Preserves most JSF framework features so even complex components should work out of the box

## Usage

The JSF plugin splits the JSF lifecycle into an optional Interceptor stack and Result, yet retains the page's Action and navigation. Therefore, to use a page with JSF components, you need to:

1. Add the `jsfStack` interceptor stack to your action definition.  This is easiest done by having your package extend `jsf-default`.

2. Add a `jsf` result associated with the name `success`You can still add additional interceptors and results, including those that don't use JSF at all.  In fact, the recommended approach is to use regular Struts results to handle inter-page navigation to avoid a common problem of JSF applications where every page request is a HTTP POST.

This approach brings an additional advantage to JSF - every page can have an Action to execute page setup code, and the same Action instance will be automatically available later in the JSF page's expression language as `action`.  This means any common page logic such as retrieving data from a database can remain in your Action, and having that instance available later in your JSF components means the JSF configuration file is completely optional.  The JSF configuration file, `faces-config.xml`, generally contains backing bean definitions and navigation rules, both of which can be solely handled by Struts.

### Example

The following is an example of a regular Struts Action 2 page definition:

**Regular JSF Action**

```xml
<action name="employee" class="org.apache.struts.action2.showcase.jsf.EmployeeAction">
    <interceptor-ref name="basicStack"/>
    <result name="success">employee.jsp</result>
    <result name="index" type="redirect-action">index</result>
</action>
```

This is the same action but as a JSF-enabled page:

**JSF-enabled Action**

```xml
<action name="employee" class="org.apache.struts.action2.showcase.jsf.EmployeeAction">
    <interceptor-ref name="basicStack"/>
    <interceptor-ref name="jsfStack"/>
    <result name="success" type="jsf" />
    <result name="index" type="redirect-action">index</result>
</action>
```

Notice the Action-based navigation remains, but now you can use a page with JSF components and have complete access to the JSF lifecycle. This even supports JSF components that post back to themselves or add PhaseListeners to provide advanced AJAX support.

### Settings

This plugin does not have any customizable settings.

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  No other files need to be copied or created.

## Resources

+ [Integrating Struts 2 + JSF + Facelets](http://raibledesigns.com/rd/entry/integrating_struts_2_jsf_facelets) (Matt Raible)
