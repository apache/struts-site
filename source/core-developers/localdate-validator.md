---
layout: default
title: localdate validator
parent:
    title: Validation
    url: validation.html
---

# localdate validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

> Since Struts 7.5.0

## Description

Field Validator that checks if a `java.time.LocalDate` is within a specific range, both bounds inclusive. 
Use the [date validator](date-validator) for a `java.util.Date` property; on a `LocalDate` property it fails with 
a `ClassCastException`.

A `null` value is not checked, add a [required validator](required-validator) if the field must be filled in.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `min` - the min date as an ISO date (`yyyy-MM-dd`). If not specified will not be checked.
- `max` - the max date as an ISO date (`yyyy-MM-dd`). If not specified will not be checked.
- `minExpression` - expression to calculate the minimum value (if none is specified, it will not be checked).
- `maxExpression` - expression to calculate the maximum value (if none is specified, it will not be checked).

> Warning: Do not use `${minExpression}` and `${maxExpression}` as an expression as this will turn into infinitive loop!

## Examples

```xml
<validators>
    <!-- Plain Validator syntax -->
    <validator type="localdate">
        <param name="fieldName">birthday</param>
        <param name="min">1990-01-01</param>
        <param name="max">2000-01-01</param>
        <message>Birthday must be within ${min} and ${max}</message>
    </validator>

    <!-- Field Validator Syntax -->
    <field name="birthday">
        <field-validator type="localdate">
            <param name="min">1990-01-01</param>
            <param name="max">2000-01-01</param>
            <message>Birthday must be within ${min} and ${max}</message>
        </field-validator>
    </field>

    <!-- Field Validator Syntax with expression -->
    <field name="birthday">
        <field-validator type="localdate">
            <param name="minExpression">${minValue}</param> <!-- will be evaluated as: LocalDate getMinValue() -->
            <param name="maxExpression">${maxValue}</param> <!-- will be evaluated as: LocalDate getMaxValue() -->
            <message>Birthday must be within ${min} and ${max}</message>
        </field-validator>
    </field>
</validators>
```

The annotation equivalent is [LocalDateRangeFieldValidator Annotation](local-date-range-field-validator-annotation).
