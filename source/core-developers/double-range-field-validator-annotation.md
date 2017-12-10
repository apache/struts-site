---
layout: default
title: DoubleRangeFieldValidator Annotation
parent:
    title: Annotations
    url: annotations.html
---

# DoubleRangeFieldValidator Annotation

This validator checks that a double field has a value within a specified range. If neither `min` nor `max` is set, nothing will be done.

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
 <td class='confluenceTd'> minInclusive </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Double property.  The inclusive minimum the number must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'>minInclusiveExpression</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the inclusive minimum the number must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxInclusive </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Double property.  The inclusive maximum number can be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxInclusiveExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the inclusive maximum number can be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> minExclusive </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Double property.  The exclusive minimum the number must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> minExclusiveExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the exclusive minimum the number must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxExclusive </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Double property.  The exclusive maximum number can be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxExclusiveExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the exclusive maximum number can be. </td>
 </tr>
 </table> </p>

If neither `min` nor `max` is set, nothing will be done.

The values for `min` and `max` must be inserted as String values so that `"0"` can be handled as a possible value.

## Examples

```java
 @DoubleRangeFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, minInclusive = "0.123", maxInclusive = "99.987")
```
