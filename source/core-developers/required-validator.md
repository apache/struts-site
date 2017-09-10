---
layout: core-developers
title: required validator
---

# required validator

### Description

RequiredFieldValidator checks if the specified field is not null.

### Parameters

- `fieldName` - field name if plain-validator syntax is used, not needed if field-validator syntax is used.

### Examples

```
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="required">
        <param name="fieldName">username</param>
        <message>username must not be null</message>
    </validator>
 
 
    <!-- Field Validator Syntax -->
    <field name="username">
        <field-validator type="required">
               <message>username must not be null</message>
        </field-validator>
    </field>
</validators>
```
