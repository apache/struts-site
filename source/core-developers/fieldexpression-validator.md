---
layout: core-developers
title: fieldexpression validator
---

# fieldexpression validator

### Description

Validates a field using an OGNL expression.

### Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.
- `expression` - The Ognl expression (must evaluate to a boolean) which is to be validated the stack.

### Examples

```
<!-- Plain Validator Syntax -->
<validators>
    <!-- Plain Validator Syntax -->
    <validator type="fieldexpression">
       <param name="fieldName">myField</param>
       <param name="expression"><![CDATA[#myCreditLimit > #myGirfriendCreditLimit]]></param>
       <message>My credit limit should be MORE than my girlfriend</message>
    <validator>
     
    <!-- Field Validator Syntax -->
    <field name="myField">
        <field-validator type="fieldexpression">
            <param name="expression"><![CDATA[#myCreditLimit > #myGirfriendCreditLimit]]></param>
            <message>My credit limit should be MORE than my girlfriend</message>
        </field-validator>
    </field>
</vaidators>
```
