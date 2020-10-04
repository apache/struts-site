---
layout: default
title: double validator
parent:
    title: Validation
    url: validation.html
---

# double validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

Field Validator that checks if the double specified is within a certain range.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `minInclusive` - the minimum inclusive value in FloatValue format specified by Java language (if none is specified, it will not be checked).
- `maxInclusive` - the maximum inclusive value in FloatValue format specified by Java language (if none is specified, it will not be checked).
- `minExclusive` - the minimum exclusive value in FloatValue format specified by Java language (if none is specified, it will not be checked).
- `maxExclusive` - the maximum exclusive value in FloatValue format specified by Java language (if none is specified, it will not be checked).
- `minInclusiveExpression` - the minimum inclusive value specified as a OGNL expression (if none is specified, it will not be checked).
- `maxInclusiveExpression` - the maximum inclusive value specified as a OGNL expression (if none is specified, it will not be checked).
- `minExclusiveExpression` - the minimum exclusive value specified as a OGNL expression (if none is specified, it will not be checked).
- `maxExclusiveExpression` - the maximum exclusive value specified as a OGNL expression (if none is specified, it will not be checked).

You can specify either `minInclusive`, `maxInclusive`, `minExclusive` and `maxExclusive` or `minInclusiveExpression`, 
`maxInclusiveExpression`, `minExclusiveExpression` and `maxExclusiveExpression` as a OGNL expression, see example below. 
You can always try to mix params but be aware that such behaviour was not tested.

> Warning: do not use `${minInclusiveExpression}`, `${maxInclusiveExpression}`, `${minExclusiveExpressionExpression}` 
> and `${maxExclusive}` as an expression as this will turn into infinitive loop!

## Examples

```xml
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="double">
        <param name="fieldName">percentage</param>
        <param name="minInclusive">20.1</param>
        <param name="maxInclusive">50.1</param>
        <message>Age needs to be between ${minInclusive} and ${maxInclusive} (inclusive)</message>
    </validator>
 
    <!-- Field Validator Syntax -->
    <field name="percentage">
        <field-validator type="double">
            <param name="minExclusive">0.123</param>
            <param name="maxExclusive">99.98</param>
            <message>Percentage needs to be between ${minExclusive} and ${maxExclusive} (exclusive)</message>
        </field-validator>
    </field>
 
    <!-- Field Validator Syntax with expression -->
    <field name="percentage">
        <field-validator type="double">
            <param name="minExclusiveExpression">${minExclusiveValue}</param> <!-- will be evaluated as: Double getMinExclusiveValue() -->
            <param name="maxExclusiveExpression">${maxExclusiveValue}</param> <!-- will be evaluated as: Double getMaxExclusiveValue() -->
            <message>Percentage needs to be between ${minExclusive} and ${maxExclusive} (exclusive)</message>
        </field-validator>
    </field>
</validators>
```
