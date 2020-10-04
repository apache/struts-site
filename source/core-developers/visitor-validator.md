---
layout: default
title: visitor validator
parent:
    title: Validation
    url: validation.html
---

# visitor validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The VisitorFieldValidator allows you to forward validation to object properties of your action using the object's own 
validation files. This allows you to use the `ModelDriven` development pattern and manage your validations for your models 
in one place, where they belong, next to your model classes. The VisitorFieldValidator can handle either simple Object 
properties, Collections of Objects, or Arrays.

## Parameters

- `fieldName` - field name if plain-validator syntax is used, not needed if field-validator syntax is used.
- `context` - the context of which validation should take place. Optional.
- `appendPrefix` - the prefix to be added to field. Optional.

## Examples

```xml
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="visitor">
        <param name="fieldName">user</param>
        <param name="context">myContext</param>
        <param name="appendPrefix">true</param>
    </validator>
 
    <!-- Field Validator Syntax -->
    <field name="user">
       <field-validator type="visitor">
          <param name="context">myContext</param>
          <param name="appendPrefix">true</param>
       </field-validator>
    </field>
</validators>
```
