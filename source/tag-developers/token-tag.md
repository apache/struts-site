---
layout: default
title: token tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# token

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

The token tag is used to help with the _double click_ submission problem. It is needed if you are using 
the `TokenInterceptor` or the `TokenSessionInterceptor`. The `s:token` tag merely places a hidden element that contains
the unique token.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/token-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/token-attributes.html %}

## Examples

```jsp
<s:token />
```
