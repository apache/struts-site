---
layout: default
title: LocalDateRangeFieldValidator Annotation
parent:
    title: Annotations
    url: annotations.html
---

# LocalDateRangeFieldValidator Annotation

> Since Struts 7.5.0

This validator checks that a `java.time.LocalDate` field has a value within a specified range, both bounds
inclusive. It is the annotation form of the [localdate validator](localdate-validator); use the
[DateRangeFieldValidator Annotation](date-range-field-validator-annotation) for a `java.util.Date` field.

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
 <td class='confluenceTd'> min </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> ISO date (yyyy-MM-dd).  The minimum the date must be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'>minExpression</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the minimum the date must be.</td>
 </tr>
 <tr>
 <td class='confluenceTd'> max </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> ISO date (yyyy-MM-dd).  The maximum date can be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'>maxExpression</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the maximum date can be.</td>
 </tr>
 </table>
</p>

If neither `min` nor `max` is set, nothing will be done. A `min` or `max` that is not an ISO date fails when the
validators are built, not when a request is validated.

## Examples

```java
 @LocalDateRangeFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, min = "2005-01-01", max = "2005-12-31")
```
