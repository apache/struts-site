---
layout: default
title: actionerror tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# actionerror

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render action errors if they exists the specific layout of the rendering depends on the theme itself. Empty (null or 
blank string) errors will not be printed. The action error strings will be html escaped by default.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/actionerror-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/actionerror-attributes.html %}

## Examples

```jsp
    <s:actionerror />
    <s:form .... >
       ....
    </s:form>
```
