---
layout: core-developers
title: email validator
---

# email validator

### Description

EmailValidator checks that a given String field, if not empty, is a valid email address.

The regular expression used to validate that the string is an email address is:

```
\\b^['_a-z0-9-\\+](\\.['_a-z0-9-\\+])@[a-z0-9-](\\.[a-z0-9-])\\.([a-z]{2,6})$\\b
```

You can also specify `expression`, `caseSensitive` and `trim` params as a OGNL expression, see the example below.

### Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.

Check also documentation of the `RegexpValidator` for more details - the EmailValidator is based on it.

> Warning
> Do not use `${regexExpression}`, `${caseSensitiveExpression}` and `${trimExpression}` as an expression as this will turn into infinitive loop!

### Examples

```
<!-- Plain Validator Syntax -->
<validators>
    <validator type="email">
        <param name="fieldName">myEmail</param>
        <message>Must provide a valid email</message>
    </validator>
</validators>
 
<!-- Field Validator Syntax -->
<field name="myEmail">
   <field-validator type="email">
      <message>Must provide a valid email</message>
   </field-validator>
</field>
 
<!-- Field Validator Syntax with expressions -->
<!-- Only available when used with xml based configuration, if you want to have the same
        flexibility with annotations use @RegexFieldValidator instead -->
<field name="myEmail">
   <field-validator type="email">
      <param name="regexExpression">${emailPattern}</param> <!-- will be evaluated as: String getEmailPattern() -->
      <param name="caseSensitiveExpression">${emailCaseSensitive}</param> <!-- will be evaluated as: boolean getEmailCaseSensitive() -->
      <param name="trimExpression">${trimEmail}</param> <!-- will be evaluated as: boolean getTrimEmail() -->
      <message>Must provide a valid email</message>
   </field-validator>
</field>
```
