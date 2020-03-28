---
layout: default
title: reset tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# reset

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render a reset button. The reset tag is used together with the form tag to provide form resetting.
The reset can have two different types of rendering:
- input: renders as html `<input type="reset"...>`
- button: renders as html `<button type="reset"...>`
 
Please note that the button type has advantages by adding the possibility to separate the submitted value from the text 
shown on the button face, but has issues with Microsoft Internet Explorer at least up to 6.0.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/reset-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/reset-attributes.html %}

## Examples

**Example 1**

```jsp
<s:reset value="Reset" />
```

**Example 2**

```jsp
Render a reset button:
<s:reset type="button" key="reset"/>
```
