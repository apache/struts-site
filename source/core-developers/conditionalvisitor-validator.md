---
layout: core-developers
title: conditionalvisitor validator
---

# conditionalvisitor validator

### Description

The ConditionalVisitorFieldValidator will forward validation to the VisitorFieldValidator only if the expression will evaluate to true.

### Parameters

- `expression` - an OGNL expression which should evaluate to true to pass validation to the VisitorFieldValidator.

### Examples

```
<field name="colleaguePosition">
    <field-validator type="conditionalvisitor">
        <param name="expression">reason == 'colleague' and colleaguePositionID == 'OTHER'</param>
        <message>You must select reason Colleague and position Other</message>
    </field-validator>
</field>
```
