---
layout: default
title: else tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# else

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Perform basic condition flow. `else` tag can be only used with `if` tag or `elseif` tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/else-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/else-attributes.html %}

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
