---
layout: core-developers
title: regex validator
---

# regex validator

## Description

Validates a string field using a regular expression.

## Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `regexp` - The RegExp expression
- `caseSensitive` - Boolean (Optional). Sets whether the expression should be matched against in a case-sensitive way. Default is true.
- `trim` - Boolean (Optional). Sets whether the expression should be trimmed before matching. Default is true.
- `regexExpression` - String (Optional). Defines regExp expression as an OGNL expression - will be evaluated to String.
- `caseSensitiveExpression` - String (Optional). Defines `caseSensitive` param as an OGNL expression - will be evaluated to Boolean.
- `trimExpression` - String (Optional). Defines trim param as an OGNL expression - will be evaluated to Boolean.

You can mix normal params with expression aware params but thus was not tested.

> Warning
> Do not use `${regexExpression}`, `${caseSensitiveExpression}` and `${trimExpression}` as an expression as this will turn into infinitive loop! 

## Examples

```
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="regex">
        <param name="fieldName">myStrangePostcode</param>
        <param name="regex"><![CDATA[([aAbBcCdD][123][eEfFgG][456])]]></param>
    </validator>
 
    <!-- Field Validator Syntax -->
    <field name="myStrangePostcode">
        <field-validator type="regex">
            <param name="regex"><![CDATA[([aAbBcCdD][123][eEfFgG][456])]]></param>
        </field-validator>
    </field>
 
    <!-- Field Validator Syntax with expressions -->
    <field name="myStrangePostcode">
        <field-validator type="regex">
            <param name="regexExpression">${regexValue}</param> <!-- will be evaluated as: String getRegexValue() -->
            <param name="caseSensitiveExpression">${caseSensitiveValue}</param> <!-- will be evaluated as: boolean getCaseSensitiveValue() -->
            <param name="trimExpression">${trimValue}</param> <!-- will be evaluated as: boolean getTrimValue() -->
        </field-validator>
    </field>
</validators>
```
