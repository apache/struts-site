---
layout: core-developers
title: Dispatcher
---

# Dispatcher

Dispatcher is the main point of control which dispatch request execution to given actions. It is used 
by [filters](web-xml) / servlet / listener / portlet to set up and run Struts environment.

## Error handling

When exception occurs (misconfiguration or some internal error), Dispatcher will pass handling to `DispatcherErrorHandler`
which by default uses `HttpServletResponse#sendError` to report error back to client. It will be 404 or 500 by default 
(depends on exception type).

If you need a different type of handling you can implement your own `DispatcherErrorHandler` and register it with 
Dispatcher using extension point `struts.dispatcher.errorHandler`, see [Plugins](../plugins-developer-guide/) for how 
to register your own implementation of internal mechanism.
