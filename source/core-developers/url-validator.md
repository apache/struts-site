---
layout: core-developers
title: url validator
---

# url validator

### Description

URLValidator checks that a given field is a String and a valid URL.

### Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `urlRegexExpression` - The regex defined as expression used to validate url. If not defined 'urlRegex' will be used instead.
- `urlRegex` - The regex used to validate url. If not defined default regex will be used.

### Examples

```
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="url">
        <param name="fieldName">myHomePage</param>
        <message>Invalid homepage url</message>
    </validator>

    <!-- Field Validator Syntax -->
    <field name="myHomepage">
        <field-validator type="url">
            <message>Invalid homepage url</message>
        </field-validator>
    </field>
</validators>
```

See more details in [UrlValidator Annotation](url-validator-annotation.html)
