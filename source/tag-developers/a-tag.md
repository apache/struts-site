---
layout: default
title: Tag Developers Guide (WIP)
---

# a

Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

## Description

~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Anchor}
~~~~~~~

> While this tag can be used with the [simple theme](simple-theme.html), [xhtml theme](xhtml-theme.html), and others, 
> it is really designed to work best with the [ajax theme](ajax-theme.html). We recommend reading the 
> _ajax a template_  documentation for more details.

## Parameters

~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/a.html}
~~~~~~~

## Usage

To get started, use the [head](head-tag.htlm) tag and the [ajax theme](ajax-theme.html). See _ajax head template_  
for more information. Then look at the usage details for the _ajax a template_ .

If you want to use additional parameters in your s:a the best practice is to use a s:url to create your url and then 
leverage this url into your s:a tag. This is done by creating a s:url and specifying an id attribute. like "testUrlId" 
in this example. Then in the s:a tag reference this id in the href attribute via `%{testUrlId}`

```jsp
<s:url var="testUrlId" namespace="/subscriber" action="customField" method="delete">
    <s:param name="customFieldDefinition.id" value="${id}"/>
</s:url>
<s:a errorText="Sorry your request had an error." preInvokeJS="confirm('Are you sure you want to delete this item?')" href="%{testUrlId}">
    <img src="<s:url value="/images/delete.gif"/>" border="none"/>
</s:a>

<img xsrc="<s:url value="/images/delete.gif"/>" border="none"/><s:a><img xsrc="<s:url value="/images/delete.gif"/>" border="none"/></s:a>
```
