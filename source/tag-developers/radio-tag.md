---
layout: default
title: radio tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# radio

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

> **NOTE**: that the `listkey` and `listvalue` attribute will default to `key` and `value` respectively only when 
> the `list` attribute is evaluated to a Map or its descendant. Everything else will result in `listkey` and `listvalue` 
> to be null and not used.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/radio-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/radio-attributes.html %}

## Examples

In this example, a radio control is displayed with a list of genders. The gender list is built from attribute 
`var=genders`. The framework calls `getGenders()` which will return a Map. For examples using `listKey` and `listValue`
attributes, see the section `select` tag. The default selected one will be determined (in this case) by the `getMale()`
method in the action class which should return a value similar to the key of the `getGenders()` map if that particular
gender is to be selected.

```jsp
<s:action name="GenderMap" var="genders"/>
<s:radio label="Gender" name="male" list="#genders.genders"/>
```

```ftl
<@s.radio name="car" list={"ford": "Ford Motor Co", "toyota": "Toyota"} listKey="key" listValue="value" />
```
