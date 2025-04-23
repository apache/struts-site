---
layout: default
title: script tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# script

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render a `<script>` tag. Uses to reference a script inside your page, it automatically adds `nonce` attribute when available.

**Note**: please be aware not all attributes are supported by tag. They are present because the `Script` class inherits
all the fields from the `Component` class.   

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/script-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/script-attributes.html %}

## Examples

**Example 1**

```jsp
<s:url var="myScript" value="./js/my-script.js" encode="false"/>
<s:script src="%{myScript}"/>
```

**Example 2**

```jsp
<s:script>
    $(function () {
        ...
    });
</s:script>
```
