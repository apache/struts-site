---
layout: default
title: Preparable Interface
parent:
    title: Getting started
    url: index
---

# Preparable Interface
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The example code for this tutorial, **preparable-interface**, is available at [struts-examples](https://github.com/apache/struts-examples).

## Introduction

Often the data used to populate a form control is dynamically generated, perhaps from a database. When the user submits 
the form, the Struts validation interceptor attempts to validate the user's form input. If validation fails the Struts 
framework returns the value `input` but the `input` action is not re-executed. Rather the view associated with the `input` 
result is rendered to the user. Usually this view is the page that displayed the original form.

This work-flow can cause a problem if one or more of the form fields or some other data displayed depends on a dynamic 
look-up that that is accomplished in the Action class's input method. Since the Action class's input method is not 
re-executed when validation fails, the view page may no longer have access to the correct information to create the form 
or other display information.

The [Struts user mailing list](../mail) is an excellent place to get help. If you are having 
a problem getting the tutorial example applications to work search the Struts mailing list. If you don't find an answer 
to your problem, post a question on the mailing list.

## Preparable Interface

Struts provides the [Preparable interface]({{ site.apidocs }}/org/apache/struts2/Preparable)
to overcome this problem. An Action class that implements this interface must override the prepare method. The `prepare` 
method will always be called by the Struts framework's [prepare interceptor](../core-developers/prepare-interceptor) 
whenever any method is called for the Action class and also when validation fails before the view is rendered.

In the `prepare` method you should put any statements that must be executed no matter what other Action class method will 
be called and also statements that should be executed if validation fails. Usually statements in the prepare method set 
the value for Action class instance fields that will be used to populate form controls and get the values that will be 
used to set the initial form field values.

In addition to automatically running the prepare method the [prepare interceptor](../core-developers/prepare-interceptor) 
will also call a method named `prepare<ActionMethodName>`. For example, define a prepare method and a `prepareInput` method 
in the Action class that implements `Preparable`. When the Struts framework calls the input method, the prepare interceptor 
will call the prepareInput and the prepare methods before calling the input method.

## Example Application

If you examine class EditAction in the example application (see above) you'll see that it implements the `Preparable` interface. 
In the prepare method is this code:

**EditAction.java prepare Method**

```java
carModelsAvailable = carModelsService.getCarModels();

setPersonBean(editService.getPerson());
```

The above statements get the car model values used to populate the car model check boxes displayed in the form and also 
get the information about the Person object being edited.

When you run the example application, look in the log to see when the prepare method is called in relation to the input 
and execute methods. Running the example application and examining the log should help you understand the impact of implementing 
the `Preparable` interface and the prepare method.

## Summary

When your application requires specific statements to be executed no matter which method of the Action class is called 
or when validation fails, you should implement the Preparable interface and override the prepare method.

|Return to [HTTP Session](http-session)|or|onward to [Exclude Parameters](exclude-parameters)|
