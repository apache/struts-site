---
layout: default
title: Dispatcher Result
parent:
    title: Core Developers Guide
    url: index.html
---

# Dispatcher Result

Includes or forwards to a view (usually a jsp). Behind the scenes Struts will use a `RequestDispatcher`, where 
the target servlet/JSP receives the same request/response objects as the original servlet/JSP. Therefore, you can pass 
data between them using `request.setAttribute()` - the Struts action is available.

There are three possible ways the result can be executed:

- If we are in the scope of a JSP (a PageContext is available), PageContext's `{@link PageContext#include(String) include}` 
  method is called.
- If there is no PageContext and we're not in any sort of include (there is no `javax.servlet.include.servlet_path` 
  in the request attributes), then a call to `{@link RequestDispatcher#forward(javax.servlet.ServletRequest, javax.servlet.ServletResponse) forward}` 
  is made.
- Otherwise, `{@link RequestDispatcher#include(javax.servlet.ServletRequest, javax.servlet.ServletResponse) include}` 
  is called.

## Parameters

- `location` (default) - the location to go to after execution (ex. jsp).
- `parse` - true by default. If set to false, the location param will not be parsed for OGNL expressions.

## Examples

```xml
<result name="success" type="dispatcher">
  <param name="location">foo.jsp</param>
</result>
```
