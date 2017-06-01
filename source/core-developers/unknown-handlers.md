---
layout: core-developers
title: Unknown Handlers
---

# Unknown Handlers

Unknown Handler stacks are available from Struts 2\.1 on\.

> 

#####Unkown Handlers#####

Unknown Handlers are classes that implement the 

~~~~~~~
com.opensymphony.xwork2.UnknownHandler
~~~~~~~
 interface, and are called by the framework, when an unknown action, result, or method are executed\. To define an unknown handler, create a class implementing the mentioned interface, and add a bean definition to your struts\.xml:


~~~~~~~

<bean type="com.opensymphony.xwork2.UnknownHandler" name="handler" class="myclasses.SomeUnknownHandler"/>

~~~~~~~

#####Stacking Unknown Handlers#####

Multiple unknown handlers can be defined, using the _unknown\-handler\-stack_  tag:


~~~~~~~

<bean type="com.opensymphony.xwork2.UnknownHandler" name="handler1" class="com.opensymphony.xwork2.config.providers.SomeUnknownHandler"/>
<bean type="com.opensymphony.xwork2.UnknownHandler" name="handler2" class="com.opensymphony.xwork2.config.providers.SomeUnknownHandler"/>

<unknown-handler-stack>
   <unknown-handler-ref name="handler1" />
   <unknown-handler-ref name="handler2" />
</unknown-handler-stack>

~~~~~~~

When multiple unknown handlers are stacked like above, they will be called in the specified order, in the same cases when a single unknown handler would be called (when an unknown action, result, or method are executed), until one of them handles the requested action\. 

#####Uknown Handlers Manager#####

The default class that handles unknown handler stacks is 

~~~~~~~
com.opensymphony.xwork2.DefaultUnknownHandlerManager
~~~~~~~
, a custom implementation of this class can be provided by implementing the interface 

~~~~~~~
com.opensymphony.xwork2.UnknownHandlerManager
~~~~~~~
 and setting the property 

~~~~~~~
struts.unknownHandlerManager
~~~~~~~
