---
layout: tag-developers
title: doubleselect tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# doubleselect

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

Note that the `doublelistkey` and `doublelistvalue` attribute will default to `key` and `value` respectively only when 
the `doublelist` attribute is evaluated to a Map or its descendant. Other thing else, will result in `doublelistkey` 
and `doublelistvalue` to be null and not used.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/doubleselect-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/doubleselect-attributes.html %}

## Examples

```jsp
 <s:doubleselect label="doubleselect test1" name="menu" list="{'fruit','other'}" doubleName="dishes" doubleList="top == 'fruit' ? {'apple', 'orange'} : {'monkey', 'chicken'}" />
 <s:doubleselect label="doubleselect test2" name="menu" list="#{'fruit':'Nice Fruits', 'other':'Other Dishes'}" doubleName="dishes" doubleList="top == 'fruit' ? {'apple', 'orange'} : {'monkey', 'chicken'}" />
```
