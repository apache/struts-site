---
layout: default
title: StringLengthFieldValidator Annotation
parent:
    title: Annotations
    url: annotations.html
---

# StringLengthFieldValidator Annotation

This validator checks that a String field is of the right length. It assumes that the field is a String.
If neither `minLength` nor `maxLength` is set, nothing will be done.

## Usage

The annotation must be applied at method level.

## Parameters

<p> <table class='confluenceTable' summary=''>
 <tr>
 <th class='confluenceTh'> Parameter </th>
 <th class='confluenceTh'> Required </th>
 <th class='confluenceTh'> Default </th>
 <th class='confluenceTh'> Notes </th>
 </tr>
 <tr>
 <td class='confluenceTd'>message</td>
 <td class='confluenceTd'>yes</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>field error message</td>
 </tr>
 <tr>
 <td class='confluenceTd'>key</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>i18n key from language specific properties file.</td>
 </tr>
 <tr>
 <td class='confluenceTd'>messageParams</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>Additional params to be used to customize message - will be evaluated against the Value Stack</td>
 </tr>
 <tr>
 <td class='confluenceTd'>fieldName</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>&nbsp;</td>
 </tr>
 <tr>
 <td class='confluenceTd'>shortCircuit</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>false</td>
 <td class='confluenceTd'>If this validator should be used as shortCircuit.</td>
 </tr>
 <tr>
 <td class='confluenceTd'>type</td>
 <td class='confluenceTd'>yes</td>
 <td class='confluenceTd'>ValidatorType.FIELD</td>
 <td class='confluenceTd'>Enum value from ValidatorType. Either FIELD or SIMPLE can be used here.</td>
 </tr>
 <tr>
 <td class='confluenceTd'> trim </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> true </td>
 <td class='confluenceTd'> Boolean property.  Determines whether the String is trimmed before performing the length check.  </td>
 </tr>
 <tr>
 <td class='confluenceTd'> minLength </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Integer property.  The minimum length the String must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> minLengthExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the minimum length the String must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxLength </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Integer property.  The maximum length the String can be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxLengthExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the maximum length the String can be. </td>
 </tr>
 </table>
</p>

If neither `minLength` nor `maxLength` is set, nothing will be done.

## Examples

```java
 @StringLengthFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, trim = true, minLength = "5",  maxLength = "12")
```
