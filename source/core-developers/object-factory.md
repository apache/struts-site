---
layout: core-developers
title: ObjectFactory
---

# ObjectFactory

All objects created by the framework are instantiated by the ObjectFactory\. The ObjectFactory provides the means of integrating the framework with IoC containers like Spring, Pico, Plexus, and so forth\.

#### Customize

##### Extend ObjectFactory


Customized ObjectFactory must extend ObjectFactory or any of its descendants and have a default, no\-argument constructor\.

| 

To register a customized ObjectFactory, add or edit an entry in 

~~~~~~~
struts.properties
~~~~~~~



~~~~~~~
 struts.objectFactory=foo.bar.MyCustomObjectFactory

~~~~~~~

where foo\.bar\.MyCustomObjectFactory is the custom object factory\.


~~~~~~~
public class MyObjectFactory extends ObjectFactory {
    .....
}

~~~~~~~

##### Define dedicated factory

If you want to just extend one part of ObjectFactory, ie\. to change how [Result Types](result-types.html) are build, you can implement 

~~~~~~~
ResultFactory
~~~~~~~
 interface and register it with dedicated name, see _Extension Points_  for more details\. Original ObjectFactory will use these dedicated factories to do the work\. It's already done this way \- the original functionality of ObjectFactory was extracted to separated classes which implements the interfaces below\. Check the source of ObjectFactory to see more details\. All these factories are available as from version 2\.3\.16\.

List of Factory interfaces:

+ 

~~~~~~~
ResultFactory
~~~~~~~
 \- dedicated interfaces used by  to create [Result Types](result-types.html)

  + 

~~~~~~~
StrutsResultFactory
~~~~~~~
 it's internal implementation which checks if Result implements 

~~~~~~~
ParamNameAwareResult
~~~~~~~
 interface to restrict names of parameters set on the instance of Result, see [Result Types](result-types.html) for more info\.

+ 

~~~~~~~
ActionFactory
~~~~~~~
 \- dedicated interface used by  to actions

+ 

~~~~~~~
InterceptorFactory
~~~~~~~
 \- dedicated interface used by  to create interceptors

+ 

~~~~~~~
ValidatorFactory
~~~~~~~
 \- dedicated interface used by  to create validators

+ 

~~~~~~~
ConverterFactory
~~~~~~~
 \- dedicated interface used by  to create instances of _TypeConverter_ 

+ 

~~~~~~~
UnknownHandlerFactory
~~~~~~~
 \- dedicated interfaces used by  to create instances of [Unknown Handlers](unknown-handlers.html) (as from version 2\.3\.18)
