---
layout: default
title: Tag Developers Guide
---

# text

Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

## Description

Render a I18n text message.

The message must be in a resource bundle with the same name as the action that it is associated with. In practice this 
means that you should create a properties file in the same package as your Java class with the same name as your class, 
but with `.properties` extension.

If the named message is not found in a property file, then the body of the tag will be used as default message. If no body 
is used, then the stack can be searched, and if a value is returned, it will written to the output.
If no value is found on the stack, the key of the message will be written out.

For more details on using resource bundles with Struts 2 read the [localization guide](../core-developers/localization.html).

## Parameters

|__Dynamic Attributes Allowed__:|false|

|Name|Required|Default|Evaluated|Type|Description|Since|
|----|--------|-------|---------|----|-----------|-----|
|name|__true__| |false|String|Name of resource property to fetch|
|searchValueStack|false|false|false|Boolean|Search the stack if property is not found on resources|Deprecated|
|var|false| |false|String|Name used to reference the value pushed into the Value Stack|
|escapeCsv|false|false|false|Boolean|Whether to escape CSV (useful to escape a value for a column)|2.5.14|
|escapeHtml|false|false|false|Boolean|Whether to escape HTML|2.5.14|
|escapeJavaScript|false|false|false|Boolean|Whether to escape Javascript|2.5.14|
|escapeXml|false|false|false|Boolean|Whether to escape XML|2.5.14|


## Examples

> Accessing messages from a given bundle (the i18n Shop example bundle in the first example) and using bundle defined 
> through the framework in the second example.

```html
 <!-- First Example -->
 <s:i18n name="struts.action.test.i18n.Shop">
     <s:text name="main.title"/>
 </s:i18n>

 <!-- Second Example -->
 <s:text name="main.title" />

 <!-- Third Examlpe -->
 <s:text name="i18n.label.greetings">
    <s:param >Mr Smith</s:param>
 </s:text>

```

### Other example

```html
<s:text name="format.money"><s:param name="value" value="myMoneyValue"/></s:text>
```

where the following is in a regular (possibly locale-specific) properties file:

```
format.money={0,number,currency}
```

For more about formatting text, see

1. [http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html](http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html)

2. [http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html](http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html)

### If you wish to use i18n in your tag attributes

This will **not** work:

```html
<s:textfield name="lastName" label="<s:text name="person.lastName"/>" ../>
```

Instead, you should use the `getText()` method that you inherit when your Action extends `ActionSupport`:

```html
<s:textfield name="lastName" label="getText('person.lastName')" ../>
```
