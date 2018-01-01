---
layout: default
title: Control tags
parent:
    title: Getting started
    url: index.html
---

# Control Tags
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The example code for this tutorial, **control-tags**, is available at [struts-examples](https://github.com/apache/struts-examples)

## Introduction

Struts 2 has several control tags that can be used in the view. This tutorial will discuss and show examples of how to use the Struts 2 if and iterator tags. For more information about these and other control tags visit [tags reference](http://cwiki.apache.org/confluence/display/WW/Generic+Tag+Reference).

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

## Struts 2 if Tag

In the example application's thankyou.jsp is this markup.

**thankyou.jsp Struts if Tag**

```html
<s:if test="personBean.over21">
    <p>You are old enough to vote!</p>
</s:if>
<s:else>
   <p>You are NOT old enough to vote.</p>
</s:else>
```

The Struts if tag has a test attribute. The value of the test attribute must evaluate to true or false. If true the statements between the opening and closing s:if tags will be executed. If false, the statements between the opening and closing s:else tags will be executed. Note that s:else tags come after the closing s:if tag and that the s:else tags are not required.

In the above example the Struts framework will call method getPersonBean exposed by the Action class (EditAction.java). Using the Person object returned by that method, the framework will then call method isOver21 of class Person. That method returns a boolean that will be used to determine if the test is true or false.

The value of the test attribute must be an expression that evaluates to true or false, but doesn't need to be a method call that returns a boolean. For example this s:if tag that is in thankyou.jsp has a more complicated expression.

```html
<s:if test="personBean.carModels.length > 1">
    <p>Car models
</s:if>
<s:else>
   <p>Car model
</s:else>
```

The purpose of the above markup is to use either "Car model" or "Car models" depending on how many car models the user selected on the edit page. So the value for the test attribute of this iterator tag gets the length of the carModels String array and compares that to 1. If it's greater than 1, the correct grammar is "Car models" else the correct grammar is "Car model".

## Struts iterator Tag

The Struts iterator tag is used to generate a loop that iterates over each item in a collection. In the thankyou.jsp is this markup.

```html
<table style="margin-left:15px">
    <s:iterator value="personBean.carModels">
        <tr><td><s:property /></td></tr>
    </s:iterator>
</table>
```

The goal of this code is to create an HTML table with a row that display a car model selected by the user on the edit page. The car models the user selects on the edit page are stored in the carModels field (a String array) of the personBean object (of class Person).

The iterator tag has a value attribute that must evaluate to a collection (Array, List, Map).

The `s:property` tag nested inside the iterator tag is used to display the specific value of the collection each time the iterator loops over an element of the collection. Since the collection is an Array of String objects, the `s:property` tag doesn't need to specify a value attribute. By default the `s:property` tag will display the single String for that element of the collection.

If the collection contains objects that have multiple fields, then you should use the value attribute of the s:property tag to determine what field to display. For example:

```html
<table style="margin-left:15px">
    <s:iterator value="states" >	
        <tr><td><s:property value="stateAbbr" /></td> <td><s:property value="stateName" /></tr>
    </s:iterator>
</table>
```

The value of the iterator tag is states, which causes the Struts 2 framework to call the getStates method of the Action class (`EditAction.java`). The getStates method returns a List of State objects. The State class has two fields stateAbbr and stateName, both having the appropriate get method. The iterator will loop over each State object stored in the collection. Each time through the loop, the Struts 2 framework will have a reference to the current State object and will call getStateAbbr and getStateName methods for that current State object.

## Additional Iterator Attributes

The Struts 2 iterator tag has additional attributes you can use to control the begin and end values for specifying that the iterator tag should only loop over a part of the collection. See the [iterator tag reference](https://cwiki.apache.org/confluence/display/WW/iterator) for more information.

|Return to [Form validation using XML](form-validation-using-xml.html)|or|onward to [Wildcard method selection](wildcard-method-selection.html)|
