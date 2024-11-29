---
layout: default
title: link tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# link

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render a `<link>` tag. Uses to reference a script inside your page, it automatically adds `nonce` attribute when available.

**Note**: please be aware not all attributes are supported by tag. They are present because the `Link` class inherits
all the fields from the `Component` class.   

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/link-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/link-attributes.html %}

## Examples

**Example**

```jsp
<s:url var="myCss" value="./styles/my-style.css" encode="false"/>
<s:link href="%{myCss}" rel="stylesheet" type="text/css" media="all"/>
```