---
layout: core-developers
title: Namespace Configuration
---

# Namespace Configuration

The namespace attribute subdivides action configurations into logical modules, each with its own identifying prefix.
Namespaces avoid conflicts between action names. Each namespace can have its own "menu" or "help" action, each with 
its own implementation. While the prefix appears in the browser URI, the tags are "namespace aware", so the namespace 
prefix does not need to be embedded in forms and links.


> Struts 2 Namespaces are the equivalent of Struts Action 1 modules, but more convenient and flexible.

## Default Namespace

The default namespace is `""` - an empty string. The default namespace is used as a "catch-all" namespace. If an action 
configuration is not found in a specified namespace, the default namespace is also be searched. The local/global 
strategy allows an application to have global action configurations outside of the action element "extends" hierarchy.

The namespace prefix can be registered with Java declarative security, to ensure only authorized users can access 
the actions in a given namespace.

## Root Namespace

A root namespace `"/"` is also supported. The root is the namespace when a request directly under the context path is 
received. As with other namespaces, it will fall back to the default `""` namespace if a local action is not found.

## Namespace Example

```xml
<package name="default">
    <action name="foo" class="mypackage.simpleAction">
        <result name="success" type="dispatcher">greeting.jsp</result>
    </action>

    <action name="bar" class="mypackage.simpleAction">
        <result name="success" type="dispatcher">bar1.jsp</result>
    </action>
</package>

<package name="mypackage1" namespace="/">
    <action name="moo" class="mypackage.simpleAction">
        <result name="success" type="dispatcher">moo.jsp</result>
    </action>
</package>

<package name="mypackage2" namespace="/barspace">
    <action name="bar" class="mypackage.simpleAction">
        <result name="success" type="dispatcher">bar2.jsp</result>
    </action>
</package>
```

### How the Code Works

If a request for `/barspace/bar.action` is made, the `/barspace` namespace is searched for the `bar` action. 
If found, the `bar` action is executed, else it will fall back to the default namespace. In the Namespace Example, 
the `bar` action does exist in the `/barspace` namespace, so the `bar` action will be executed, and if "success" is 
returned, the request will be forwarded to `bar2.jsp`.

If a request is made to `/barspace/foo.action`, the namespace `/barspace` will be checked for action `foo`. 
If a local action is not found, the default namespace is checked. In the Namespace Example, there is no action `foo` 
in the namespace `/barspace`, therefore the default will be checked and `/foo.action` will be executed.

In the Namespace Example, if a request for `moo.action` is made, the root namespace `"/"` is searched for a `moo` 
action; if a root action is not found, the default namespace is checked. In this case, the `moo` action does exist 
and will be executed. Upon success, the request would be forwarded to `bar2.jsp`.

If a request is made for `/foo.action`, the root `"/"` namespace will be checked. If `foo` is found, the root action 
will be selected. Otherwise, the framework will check the default namespace. In the Namespace Example, the `foo` action 
does not exist in the root namespace, so the default namespace is  checked, and the default foo action is executed.

Namespace are not hierarchical like a file system path. There is one namespace level. For example if the URL 
`/barspace/myspace/bar.action` is requested, the framework will first look for namespace `/barspace/myspace`. 
If the action does not exist at `/barspace/myspace`, the search will immediately fall back to the default namespace `""`. 
The framework will not parse the namespace into a series of "folders". In the Namespace Example, the bar action 
in the default namespace would be selected.
