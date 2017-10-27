---
layout: default
title: Debugging Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Debugging Interceptor

Provides several different debugging screens to provide insight into the data behind the page.

This interceptor only is activated when `devMode` is enabled in `struts.xml`. The `debug` parameter is removed from 
the parameter list before the action is executed. All operations occur before the natural Result has a chance to execute.

## Parameters

 - `xml` - Dumps the parameters, context, session, and value stack as an XML document.
 - `console` - Shows a popup 'OGNL Console' that allows the user to test OGNL expressions against the value stack. 
   The XML data from the `xml` mode is inserted at the top of the page.
 - `command` - Tests an OGNL expression and returns the string result. Only used by the OGNL console.
 - `browser` Shows field values of an object specified in the `object` parameter (`#context` by default). 
   When the `object` parameters is set, the `#` character needs to be escaped to `%23`. Like `debug=browser&object=%23parameters`

## Example

http://localhost:8080/Welcome.action?debug=xml
