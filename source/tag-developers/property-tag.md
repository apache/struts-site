---
layout: tag-developers
title: property tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# property

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Used to get the property of a `value`, which will default to the top of the stack if none is specified.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/property-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/property-attributes.html %}

## Examples

```jsp
<s:push value="myBean">
    <!-- Example 1: -->
    <s:property value="myBeanProperty" />

    <!-- Example 2: -->
    <s:property value="myBeanProperty" default="a default value" />
</s:push>
```

Example 1 prints the result of myBean's `getMyBeanProperty()` method.
Example 2 prints the result of myBean's `getMyBeanProperty()` method and if it is null, print `a default value` instead.
