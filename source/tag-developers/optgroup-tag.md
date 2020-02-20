---
layout: tag-developers
title: optgroup tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# optgroup

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Create a optgroup component which needs to resides within a select tag.

This tag is to be used within a `select` tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/optgroup-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/optgroup-attributes.html %}

## Examples

```jsp
<s:select label="My Selection"
           name="mySelection"
           value="%{'POPEYE'}"
           list="%{#{'SUPERMAN':'Superman', 'SPIDERMAN':'spiderman'}}">
   <s:optgroup label="Adult"
                list="%{#{'SOUTH_PARK':'South Park'}}" />
   <s:optgroup label="Japanese"
                list="%{#{'POKEMON':'pokemon','DIGIMON':'digimon','SAILORMOON':'Sailormoon'}}" />
</s:select>
```
