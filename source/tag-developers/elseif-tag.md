---
layout: default
title: elseif tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# elseif

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Perform basic condition flow. `elseif` tag can be only used with `if` tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/elseif-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/elseif-attributes.html %}

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
