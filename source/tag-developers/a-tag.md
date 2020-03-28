---
layout: default
title: a tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# a

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

A tag that creates a HTML `<a>.` This tag supports the same attributes as the `url` tag, including nested parameters 
using the `param` tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/a-description.html %} 

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/a-attributes.html %}

## Usage

If you want to use additional parameters in your `s:a` the best practice is to use a `s:url` to create your url and then 
leverage this url into your `s:a` tag. This is done by creating a `s:url` and specifying an `var` attribute. Like `testUrlId` 
in this example. Then in the `s:a` tag reference this id in the href attribute via `%{testUrlId}`

```jsp
<s:url var="testUrlId" namespace="/subscriber" action="customField" method="delete">
    <s:param name="customFieldDefinition.id" value="${id}"/>
</s:url>

<s:a errorText="Sorry your request had an error." preInvokeJS="confirm('Are you sure you want to delete this item?')" href="%{testUrlId}">
    <img src="<s:url value="/images/delete.gif"/>" border="none"/>
</s:a>

<img xsrc="<s:url value="/images/delete.gif"/>" border="none"/>

<s:a><img xsrc="<s:url value="/images/delete.gif"/>" border="none"/></s:a>  
```
