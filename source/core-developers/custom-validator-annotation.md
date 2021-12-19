---
layout: default
title: CustomValidator Annotation
parent:
    title: Annotations
    url: annotations.html
---

# CustomValidator Annotation

This annotation can be used for custom validators. Use the `ValidationParameter` annotation to supply additional params.

## Usage

The annotation must be applied at method or type level.

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
 <td class='confluenceTd'>name of validator</td>
 <td class='confluenceTd'>Simple string which identifies that validator among other</td>
 </tr>
 </table>
</p>

## Examples

```java
 @CustomValidator(type ="customValidatorName", fieldName = "myField")
```

## Adding Parameters

Use the [ValidationParameter annotation](validation-parameter-annotation) to add custom parameter values.
