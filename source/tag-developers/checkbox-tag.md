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

## Hidden Field Prefix

> Since Struts 7.2.0

The checkbox tag generates a companion hidden field to ensure that unchecked values are still submitted with the form.
By default, this hidden field uses the prefix `__checkbox_` (e.g., `__checkbox_checkboxField1`).

For HTML5 compliance, you can change the prefix to `struts_checkbox_` using the `struts.ui.checkbox.hiddenPrefix` constant:

```xml
<constant name="struts.ui.checkbox.hiddenPrefix" value="struts_checkbox_" />
```

| Prefix | Example Hidden Field Name | Notes |
|--------|--------------------------|-------|
| `__checkbox_` | `__checkbox_checkboxField1` | Default, backward-compatible |
| `struts_checkbox_` | `struts_checkbox_checkboxField1` | HTML5-compliant alternative |
