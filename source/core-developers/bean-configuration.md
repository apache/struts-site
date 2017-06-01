---
layout: core-developers
title: Bean Configuration
---

# Bean Configuration

Internally, the framework uses its own _dependency injection_  container\. The container loads key framework objects, so that any piece of the framework can be replaced, extended, or removed in a standard, consistent way\. _Plugins_ , in particular, leverage this capability to extend the framework to provide support for third\-party libraries like _Spring_  or _Sitemesh_ \.  

 (ok)  Most applications won't need to extend the Bean Configuration\. 

#####Beans#####

The bean element has one required attribute, 

~~~~~~~
class
~~~~~~~
, which specifies the Java class to be created or manipulated\.  A bean can either 

1. be created by the framework's container and injected into internal framework objects, or

2. have values injected to its static methods

The first use, object injection, is generally accompanied by the 

~~~~~~~
type
~~~~~~~
 attribute, which tells the container which interface this object implements\.  

The second use, value injection, is good for allowing objects not created by the container to receive framework constants\. Objects using value inject must define the  the 

~~~~~~~
static
~~~~~~~
 attribute\.

| Attribute | Required | Description |
|-----------|----------|-------------|
| class |**yes**| the name of the bean class |
| type | no | the primary Java interface this class implements |
| name | no | the unique name of this bean; must be unique among other beans that specify the same type|
| scope | no | the scope of the bean; must be either default, singleton, request, session, thread|
| static | no | whether to inject static methods or not; shouldn't be true when the type is specified |
| optional | no | whether the bean is optional or not |

__Sample usage__

**Bean Example (struts\.xml)**


~~~~~~~

<struts>

  <bean type="com.opensymphony.xwork2.ObjectFactory" name="myfactory" class="com.company.myapp.MyObjectFactory" />
  
  ... 

</struts>

~~~~~~~