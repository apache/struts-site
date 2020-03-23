---
layout: tag-developers
title: select tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# select

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render an HTML input tag of type select.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/select-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/select-attributes.html %}

## Examples

> **NOTE**: For any of the tags that use lists (select probably being the most ubiquitous), which uses the OGNL list
> notation (see the "months" example above), it should be noted that the map key created (in the months example,
> the '01', '02', etc.) is typed. '1' is a char, '01' is a String, "1" is a String. This is important since if
> the value returned by your "value" attribute is NOT the same type as the key in the "list" attribute, they
> WILL NOT MATCH, even though their String values may be equivalent. If they don't match, nothing in your list
> will be auto-selected.

```jsp
<s:select label="Pets"
       name="petIds"
       list="petDao.pets"
       listKey="id"
       listValue="name"
       multiple="true"
       size="3"
       required="true"
       value="%{petDao.pets.{id}}"
/>

<s:select label="Months"
       name="months"
       headerKey="-1" headerValue="Select Month"
       list="#{'01':'Jan', '02':'Feb', [...]}"
       value="selectedMonth"
       required="true"
/>

// The month id (01, 02, ...) returned by the getSelectedMonth() call
// against the stack will be auto-selected
```
