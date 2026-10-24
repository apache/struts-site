---
layout: default
title: datetextfield tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# datetextfield

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/datetextfield-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/datetextfield-attributes.html %}

## Examples

With the [html5 theme](html5-theme) (since 7.5.0) the tag renders a single native date input. The browser shows the
date in the user's locale and always submits it as `yyyy-MM-dd`, so the `format` attribute is ignored:

```jsp
<s:datetextfield name="birthday" theme="html5" min="1900-01-01" max="2026-12-31"/>
```

```html
<input type="date" name="birthday" value="1990-05-17" id="birthday" min="1900-01-01" max="2026-12-31"/>
```

- The property must be a `java.util.Date`; its value is rendered in the server's default time zone
- `min` and `max` are passed through as dynamic attributes and must be written as `yyyy-MM-dd`

With the [JavaTemplates Plugin](../plugins/javatemplates/) the tag renders one text input per date field, laid out
by the `format` attribute, and `DateTextFieldInterceptor` assembles them back into a `java.util.Date`:

```jsp
<s:datetextfield name="birthday" format="dd/MM/yyyy"/>
```

The simple, xhtml and css_xhtml themes do not support this tag.
