---
layout: tag-developers
title: file tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# file

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Renders an HTML file input element.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/file-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/file-attributes.html %}

## Examples

```jsp
 <s:file name="anUploadFile" accept="text/*" />
 <s:file name="anohterUploadFIle" accept="text/html,text/plain" />
```
