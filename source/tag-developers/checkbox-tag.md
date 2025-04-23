---
layout: default
title: checkbox tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# checkbox

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Renders an HTML input element of type checkbox, populated by the specified property from the ValueStack.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/checkbox-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/checkbox-attributes.html %}

## Examples

### JSP

```jsp
<s:checkbox label="checkbox test" name="checkboxField1" value="aBoolean" fieldValue="true"/>
```

### Velocity

```
#tag( Checkbox "label=checkbox test" "name=checkboxField1" "value=aBoolean" )
```

### Resulting HTML (simple template, aBoolean == true):

```html
<input type="checkbox" name="checkboxField1" value="true" checked="checked" />
```
