---
layout: default
title: checkboxlist tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# checkboxlist

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

Note that the `listkey` and `listvalue` attribute will default to `"key"` and `"value"` respectively only when 
the list attribute is evaluated to a Map or its descendant. Everything else will result in `listkey` and `listvalue` 
to be null and not used.

## Description

Creates a series of checkboxes from a list. Setup is like `<s:select />` or `<s:radio />`, but creates checkbox tags.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/checkboxlist-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/checkboxlist-attributes.html %}

## Examples

```jsp
 <s:checkboxlist name="foo" list="bar"/>
```
