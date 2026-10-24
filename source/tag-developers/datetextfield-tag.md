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

- The property should be a `java.util.Date` or a `java.time.LocalDate` (since 7.5.0); a `java.util.Date` is rendered
  in the server's default time zone
- A type with a time part (`LocalDateTime`, `ZonedDateTime`, `OffsetDateTime`) renders its date part, but a date input
  cannot submit a time, so binding back into such a property fails — use `<s:textfield type="datetime-local"/>` instead
- `min` and `max` are passed through as dynamic attributes and must be written as `yyyy-MM-dd`

With the [JavaTemplates Plugin](../plugins/javatemplates/) the tag renders one text input per date field, laid out
by the `format` attribute, and `DateTextFieldInterceptor` assembles them back into a date:

```jsp
<s:datetextfield name="birthday" format="dd/MM/yyyy"/>
<s:datetextfield name="meetingAt" format="dd/MM/yyyy HH:mm"/>
```

- The property can be a `java.util.Date`, `java.time.LocalDate`, `java.time.LocalDateTime` or `java.time.LocalTime`
  (the `java.time` types since 7.5.0), converted in the server's default time zone
- A field in `format` that the property's type does not have, such as `HH` on a `LocalDate`, renders empty

The simple, xhtml and css_xhtml themes do not support this tag.
