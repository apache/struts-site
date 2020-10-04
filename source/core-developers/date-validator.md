---
layout: core-developers
title: date validator
parent:
    title: Validation
    url: validation.html
---

# date validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

Field Validator that checks if the date supplied is within a specific range.

> NOTE: If no date converter is specified, `XWorkBasicConverter` will kick in to do the date conversion, which 
> by default using the `Date.SHORT` format using the specified locale else falling back to the system default locale.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `min` - the min date range. If not specified will not be checked.
- `max` - the max date range. If not specified will not be checked.
- `parse` - if set to true, minExpression and maxExpression will be evaluated to find min/max.
- `minExpression` - expression to calculate the minimum value (if none is specified, it will not be checked).
- `maxExpression` - expression to calculate the maximum value (if none is specified, it will not be checked).

You can either use the `min` / `max` value or `minExpression` / `maxExpression` (when `parse` is set to `true`) - 
using expression can be slightly slower, see the example below.

> Warning: Do not use `${minExpression}` and `${maxExpression}` as an expression as this will turn into infinitive loop!

## Examples

```xml
<validators>
    <!-- Plain Validator syntax -->
    <validator type="date">
        <param name="fieldName">birthday</param>
        <param name="min">01/01/1990</param>
        <param name="max">01/01/2000</param>
        <message>Birthday must be within ${min} and ${max}</message>
    </validator>
 
    <!-- Field Validator Syntax -->
    <field name="birthday">
        <field-validator type="date">
            <param name="min">01/01/1990</param>
            <param name="max">01/01/2000</param>
            <message>Birthday must be within ${min} and ${max}</message>
        </field-validator>
    </field>
 
    <!-- Field Validator Syntax with expression -->
    <field name="birthday">
        <field-validator type="date">
            <param name="minExpression">${minValue}</param> <!-- will be evaluated as: Date getMinValue() -->
            <param name="maxExpression">${maxValue}</param> <!-- will be evaluated as: Date getMaxValue() -->
            <message>Age needs to be between ${min} and ${max}</message>
        </field-validator>
    </field>
</validators>
```
