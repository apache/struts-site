---
layout: core-developers
title: int validator
parent:
    title: Validation
    url: validation.html
---

# int validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

Field Validator that checks if the integer specified is within a certain range.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required
- `min` - the minimum value (if none is specified, it will not be checked)
- `max` - the maximum value (if none is specified, it will not be checked)
- `parse` - if set to true, minExpression and maxExpression will be evaluated to find min/max
- `minExpression` - expression to calculate the minimum value (if none is specified, it will not be checked)
- `maxExpression` - expression to calculate the maximum value (if none is specified, it will not be checked) 

You can either use the `min` / `max` value or `minExpression` / `maxExpression` (when `parse` is set to `true`) - using 
expression can be slightly slower, see the example below.

> Warning: do not use `${minExpression}` and `${maxExpression}` as an expression as this will turn into infinitive loop!

## Examples

```xml
<validators>
     <!-- Plain Validator Syntax -->
     <validator type="int">
         <param name="fieldName">age</param>
         <param name="min">20</param>
         <param name="max">50</param>
         <message>Age needs to be between ${min} and ${max}</message>
     </validator>
 
     <!-- Field Validator Syntax -->
     <field name="age">
         <field-validator type="int">
             <param name="min">20</param>
             <param name="max">50</param>
             <message>Age needs to be between ${min} and ${max}</message>
         </field-validator>
     </field>
 
     <!-- Field Validator Syntax with expression -->
     <field name="age">
         <field-validator type="int">
             <param name="minExpression">${minValue}</param> <!-- will be evaluated as: Integer getMinValue() -->
             <param name="maxExpression">${maxValue}</param> <!-- will be evaluated as: Integer getMaxValue() -->
             <message>Age needs to be between ${min} and ${max}</message>
         </field-validator>
     </field>
</validators>
```
