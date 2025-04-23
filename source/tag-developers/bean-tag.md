---
layout: default
title: bean tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# bean

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Instantiates a class that conforms to the JavaBeans specification. This tag has a body which can contain a number 
of [param](param-tag) elements to set any mutator methods on that class.

If the var attribute is set on the BeanTag, it will place the instantiated bean into the stack's Context.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/bean-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/bean-attributes.html %}

## Examples

### in freemarker form

```
 [@s.bean name="org.apache.struts2.example.counter.SimpleCounter" var="counter"]
   [s:param name="foo" value="BAR"/]
   The value of foo is : [s:property value="foo"/], when inside the bean tag.
 [/s:bean]
```

### in jsp form
 
```jsp
 <s:bean name="org.apache.struts2.example.counter.SimpleCounter" var="counter">
   <s:param name="foo" value="BAR" />
   The value of foot is : <s:property value="foo"/>, when inside the bean tag <br />
 </s:bean>

```

This example instantiates a bean called SimpleCounter and sets the foo property (`setFoo('BAR')`). The `SimpleCounter` 
object is then pushed onto the `ValueStack`, which means that we can call its accessor methods (`getFoo()`) with 
the property tag and get their values.

In the above example, the id has been set to a value of `counter`. This means that the `SimpleCounter` class
will be placed into the stack's context. You can access the `SimpleCounter` class using a Struts tag:

### jsp form

```jsp
 <s:property value="#counter" />
```
 
### freemarker form

```
 [s:property value="#counter.foo"/]
```

In the property tag example, the <i>#</i> tells Ognl to search the context for the SimpleCounter class which has 
an `id(key)` of `counter`.
