---
layout: tag-developers
title: if tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# if

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Perform basic condition flow. `if` tag could be used by itself or can be followed by zero or more `elseif` tags 
followed by zero or one `else` tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/if-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/if-attributes.html %}

## Examples

```jsp
<s:if test="%{false}">
    <div>Will Not Be Executed</div>
</s:if>
<s:elseif test="%{true}">
    <div>Will Be Executed</div>
</s:elseif>
<s:else>
    <div>Will Not Be Executed</div>
</s:else>
```
