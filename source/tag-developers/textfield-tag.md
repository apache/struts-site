---
layout: default
title: textfield tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# textfield

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/textfield-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/textfield-attributes.html %}

## Examples

In this example, a text control for the `user` property is rendered. The `label` is also retrieved from a ResourceBundle 
via the `key` attribute.

```jsp
<s:textfield key="user" />
```
