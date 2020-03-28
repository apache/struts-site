---
layout: default
title: hidden tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# hidden

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Renders an HTML input element of type hidden, populated by the specified property from the ValueStack.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/hidden-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/hidden-attributes.html %}

## Examples

**Example 1**

```jsp
<s:hidden name="foo" />
```
Example One Resulting HTML (if `foo` evaluates to `bar`):

```html 
<input type="hidden" name="foo" value="bar" />
```

**Example 2**

```jsp
<s:hidden name="foo" value="%{bar}" />
```
 
Example Two Resulting HTML (if `getBar` method of the action returns `bar`)

```jsp
<input type="hidden" name="foo" value="bar" />
```
