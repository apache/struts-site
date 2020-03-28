---
layout: default
title: i18n tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# i18n

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Gets a resource bundle and place it on the value stack. This allows the text tag to access messages from any bundle, 
and not just the bundle associated with the current action.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/i18n-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/i18n-attributes.html %}

## Examples

```jsp
<s:i18n name="myCustomBundle">
  The i18n value for key aaa.bbb.ccc in myCustomBundle is <s:property value="text('aaa.bbb.ccc')" />
</s:i18n>
```
