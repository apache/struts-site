---
layout: tag-developers
title: actionmessage tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# actionmessage

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description 

Render action messages if they exists, specific rendering layout depends on the theme itself. Empty (null or blank 
string) messages will not be printed. The action message strings will be html escaped by default.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/actionmessage-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/actionmessage-attributes.html %}

## Examples

```jsp
    <s:actionmessage />
    <s:form .... >
       ....
    </s:form>
```
