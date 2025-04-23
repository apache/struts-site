---
layout: default
title: set tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# set

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

The set tag assigns a value to a variable in a specified scope. It is useful when you wish to assign a variable 
to a complex expression and then simply reference that variable each time rather than the complex expression. This is
useful in both cases: when the complex expression takes time (performance improvement) or is hard to read (code
readability improvement).

If the tag is used with body content, the evaluation of the value parameter is omitted. Instead, the String to which 
the body evaluates is set as value for the scoped variable.

The scopes available are as follows:
- `application` - the value will be set in application scope according to servlet spec. using the name as its key
- `session` - the value will be set in session scope according to servlet spec. using the name as key
- `request` - the value will be set in request scope according to servlet spec. using the name as key
- `page` - the value will be set in page scope according to servlet spec. using the name as key (retrieve via #attr)
- `action` - the value will be set in the page scope and Struts' action context using the name as key

> **NOTE**: If no scope is specified, it will default to `action` scope.  For the `set` tag **specifically**, this also
> places (sets) the generated value into the `page` scope as well (retrieve via #attr).

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/set-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/set-attributes.html %}

## Examples

```jsp
<s:set var="personName" value="person.name"/>
Hello, <s:property value="#personName"/>

<s:set var="janesName">Jane Doe</s:set>
<s:property value="#janesName"/>
```
