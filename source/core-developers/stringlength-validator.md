---
layout: core-developers
title: stringlength validator
---

# stringlength validator

## Description

StringLengthFieldValidator checks that a String field is of a certain length. If the `minLength` parameter is specified, it will make sure that the String has at least that many characters. If the `maxLength` parameter is specified, it will make sure that the String has at most that many characters. The `trim` parameter determines whether it will `String#trim()` the String before performing the length check. If unspecified, the String will be trimmed.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `maxLength` - Integer. The max length of the field value. Default ignore.
- `minLength` - Integer. The min length of the field value. Default ignore.
- `trim` - (Optional) Boolean, default true. Trim the field value before evaluating its min/max length. Default true.
- `maxLengthExpression` - (Optional) String. Defines the max length param as an OGNL expression.
- `minLengthExpression` - (Optional) String. Defines the min length param as an OGNL expression.
- `trimExpression` - (Optional) String. Defines th trim param as an OGNL expression.

> Warning
> Do not use `${minLengthExpression}`, `${maxLengthExpression}` and `${trimExpression}` as an expression as this will turn into infinitive loop!

## Examples

```
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="stringlength">
        <param name="fieldName">myPurchaseCode</param>
        <param name="minLength">10</param>
        <param name="maxLength">10</param>
        <param name="trim">true</param>
        <message>Your purchase code needs to be 10 characters long</message>
    </validator>
 
    <!-- Field Validator Syntax -->
    <field name="myPurchaseCode">
        <field-validator type="stringlength">
             <param name="minLength">10</param>
             <param name="maxLength">10</param>
             <param name="trim">true</param>
             <message>Your purchase code needs to be 10 characters long</message>
        </field-validator>
    </field>
 
    <!-- Field Validator Syntax with expression -->
    <field name="myPurchaseCode">
        <field-validator type="stringlength">
             <param name="minLengthExpression">${minLengthValue}</param> <!-- will be evaluated as: Integer getMinLengthValue() -->
             <param name="maxLengthExpression">${maxLengthValue}</param> <!-- will be evaluated as: Integer getMaxLengthValue() -->
             <param name="trimExpression">${trimValue}</param> <!-- will be evaluated as: boolean getTrimValue() -->
             <message>Your purchase code needs to be 10 characters long</message>
        </field-validator>
    </field>
</validators>
```
