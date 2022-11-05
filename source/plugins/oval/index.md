---
layout: plugin
title: OVal Plugin
parent:
    url: /plugins
    title: Plugins
---

# OVal Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

> This plugin got marked as deprecated since Struts 2.6!

## Overview

[OVal](http://oval.sourceforge.net/) is a pragmatic and extensible validation framework for any kind of Java objects (not only JavaBeans). Constraints can be declared with annotations (@NotNull, @MaxLength), POJOs or XML. Custom constraints can be expressed as custom Java classes or by using scripting languages such as JavaScript, Groovy, BeanShell, OGNL or MVEL.

The OVal plugin provides support for using the [OVal Validation Framework](http://oval.sourceforge.net/)

## Interceptors

The plugin defines the interceptor "ovalValidation" and the interceptor stack "ovalValidationStack" in the "oval-default" package. To use this interceptor, extend the "oval-default" package and apply the interceptor to your action, like:

```xml
<struts>
   <package namespace="/myactions" name="myactions" extends="oval-default">
        <action name="simpleFieldsXMLChild" class="org.apache.struts2.interceptor.SimpleFieldsXMLChild">
            <interceptor-ref name="ovalValidationStack"/>
            <result type="void"></result>
        </action>
   </package>
</struts>
```

## Annotations

OVal provides many annotations for validations that can be used out of the box (custom validators can also be defined). Once the "ovalValidation" interceptor is applied to an action, you can annotate it:

```java
public class SimpleField extends ActionSupport{
    @NotNull()
    @NotEmpty
    @Length(max = 3)
    private String name;
//...
}
```

Use the @AssertValid annotation to validate nested objects, like

```java
public class MemberObject extends ActionSupport {
    @AssertValid
    private Person person = new Person();

    public Person getPerson() {
        return person;
    }
}
```

## XML Configuration

OVal provides support for defining the validation via XML. Validation files must end in "-validation.xml" and the rules to find them, are the same rules used to find the validation XML files used by the regular validation mechanisms (default validation in xwork):

1. Per Action class: in a file named ActionName-validation.xml

2. Per Action alias: in a file named ActionName-alias-validation.xml

3. Inheritance hierarchy and interfaces implemented by Action class: The plugin searches up the inheritance tree of the action to find default validations for parent classes of the Action and interfaces implemented

Here is an example of an XML validation file:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<oval xmlns="http://oval.sf.net/oval-configuration" xmlns:xsi="http://http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://oval.sf.net/oval-configuration http://oval.sourceforge.net/oval-configuration-1.3.xsd">
    <class type="org.apache.struts2.interceptor.SimpleFieldsXML" overwrite="false"
           applyFieldConstraintsToSetters="true">
        <field name="firstName">
            <notNull/>
        </field>
    </class>
</oval>
```

## Profiles

A profile is a set of validations, that can be enabled for a method in an action, for example:

```java
import org.apache.struts2.validation.Profiles;

public class FieldsWithProfiles extends ActionSupport {
    @NotNull(profiles = "1")
    private String firstName;

    @NotNull(profiles = "2")
    private String middleName;

    @NotNull(profiles = "3")
    private String lastName;

    @Profiles({"1", "3"})
    public String firstAndLast() {
        return SUCCESS;
    }

    @Profiles({"2"})
    public void middle() {
        return SUCCESS;
    }
}
```

In this example, when _firstAndLast()_  is executed, the fields _firstName_  and _lastName_  will be validated. When _middle()_  is executed, only _middleName_  will be validated. When a method is annotated with the _Profiles_  annotation, only the validations in the specified profiles will be performed. If no profile is specified for an action method, all the validations in the class will be evaluated.

## Internationalization of messages

The OVal annotations (and corresponding XML tags) have a _message_  attribute that can be used to specify either the error message, or the key of the error message. If a key is found in a property file, matching the value of the _massage_  attribute, it will be used as the message, otherwise the value will be used as a literal string. For example, given this property file:

**BookAction.properties**

```text
notnull.field=${field.name} cannot be null

field.too.long=${field.name} value is too long, allowed length is ${max}
```

and this class:

**BookAction.java**

```java
public class BookActionextends extends ActionSupport {
    @NotNull(message = "notnull.field")
    @Length(max = 3, message = "field.too.long")
    private String title;

    @NotNull(message = "You must enter a valid ISBN")
    private String isbn;
//...
}
```

When that action is validated, the field errors would be:

+ "title cannot be null"

+ "You must enter a valid ISBN"

+ "title value is too long, allowed length is 3"

The current OVal "context" object is pushed into the stack for each validator, so it can be accessed from the property file to build the error message. See the [OVal javadoc](http://oval.sourceforge.net/api/net/sf/oval/context/FieldContext) for more properties available in the FieldContext class.

## The OVal Validation Interceptor

This interceptor runs the action through the standard validation framework, which in turn checks the action against any validation rules (found in files such as ActionClass-validation.xml) and adds field-level and action-level error messages (provided that the action implements com.opensymphony.xwork2.ValidationAware). This interceptor is often one of the last (or second to last) interceptors applied in a stack, as it assumes that all values have already been set on the action.

This interceptor does nothing if the name of the method being invoked is specified in the _excludeMethods_  parameter. _excludeMethods_  accepts a comma-delimited list of method names. For example, requests to foo!input.action and foo!back.action will be skipped by this interceptor if you set the excludeMethods parameter to "input, back".

Note that this has nothing to do with the com.opensymphony.xwork2.Validateable interface and simply adds error messages to the action. The workflow of the action request does not change due to this interceptor. Rather, this interceptor is often used in conjuction with the workflow interceptor.

NOTE: As this method extends off MethodFilterInterceptor, it is capable of deciding if it is applicable only to selective methods in the action class. See MethodFilterInterceptor for more info.

The param _alwaysInvokeValidate_  (default to _true_ ), will make the interceptor invoke _validate()_  on the action, if the action implements _Validateable_ .

The param _programmatic_  (defaults to _true_ ), will make the plugin call _validateX()_  where _X_  is the name of the method that will be invoked in the action. If this param is set to _false_ , _alwaysInvokeValidate_  is ignored and _validate()_  won't be invoked.

## Installation

The jar plugin needs to be added to the lib directory of your application as well as other dependencies. If you are using XML validation, XStream needs to be included. Here is the maven dependency example:

```xml
<dependency>
    <groupId>com.thoughtworks.xstream</groupId>
    <artifactId>xstream</artifactId>
    <version>1.3.1</version>
</dependency>
```

## Configuration reference

Add a _constant_  element to your struts config file to change the value of a configuration setting, like:

```xml
 <constant name="struts.oval.validateJPAAnnotations" value="true" />
```

| Name | Default Value | Description |
|------|---------------|-------------|
| struts.oval.validateJPAAnnotations | false | Enables [mapping of JPA annotations to Oval validators](http://oval.sourceforge.net/userguide.html#d0e242)|

## Resources

+ [OVal User Guide](http://oval.sourceforge.net/userguide)

+ [OVal Javadoc](http://oval.sourceforge.net/userguide)

+ [OVal Tutorials](http://oval.sourceforge.net/userguide.html#d0e1138)
