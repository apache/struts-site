---
layout: tag-developers
title: textarea tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# textarea

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render HTML textarea tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/textarea-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/textarrea-attributes.html %}

## Example

```jsp
<s:textarea label="Comments" name="comments" cols="30" rows="8"/>
```