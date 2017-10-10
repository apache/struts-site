---
layout: core-developers
title: requiredstring validator
---

# requiredstring validator

## Description

RequiredStringValidator checks that a String field is non-null and has a length > 0. (i.e. it isn't ""). The `trim` parameter determines whether it will `String#trim()` the String before performing the length check. If unspecified, the String will be trimmed.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
-  `trim` - (Optional) Boolean, default true. Trims the field name value before validating.
- `trimExpression` - (Optional) String. Specifies the trim param as an OGNL expression.

## Examples

```
<validators>
    <!-- Plain-Validator Syntax -->
    <validator type="requiredstring">
        <param name="fieldName">username</param>
        <param name="trim">true</param>
        <message>username is required</message>
    </validator>
     
    <!-- Field-Validator Syntax -->
    <field name="username">
        <field-validator type="requiredstring">
            <param name="trim">true</param>
            <message>username is required</message>
        </field-validator>
    </field>
 
    <!-- Field-Validator Syntax with expression -->
    <field name="username">
        <field-validator type="requiredstring">
            <param name="trimExpression">${trimValue}</param> <!-- will be evaluated as: boolean getTrimValue() -->
            <message>username is required</message>
        </field-validator>
    </field>
</validators>
```
