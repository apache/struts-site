---
layout: default
title: password tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# password

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/password-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/password-attributes.html %}

## Examples

In this example, a `password` tag is displayed. For the label, we are calling ActionSupport's `getText()` to retrieve
password label from a resource bundle.

```jsp
<s:password label="%{text('password')}" name="password" size="10" maxlength="15" />
```
