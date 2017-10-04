---
layout: core-developers
title: IntRangeFieldValidator Annotation
---

# IntRangeFieldValidator Annotation


{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}
<p> This validator checks that a numeric field has a value within a specified range.
 If neither min nor max is set, nothing will be done.</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}

#####Usage#####



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}
<p> <p>The annotation must be applied at method level.</p></p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}
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
 <td class='confluenceTd'> Integer property. The minimum the number must be.</td>
 </tr>
 <tr>
 <td class='confluenceTd'> minExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the minimum the number must be.</td>
 </tr>
 <tr>
 <td class='confluenceTd'> max </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> Integer property. The maximum number can be. Can be an expression.!</td>
 </tr>
 <tr>
 <td class='confluenceTd'> maxExpression </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the maximum number can be.</td>
 </tr>
 <tr>
 <td class='confluenceTd'>parse</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>false</td>
 <td class='confluenceTd'>Enable parsing of min/max value.</td>
 </tr>
 </table>

 <p>If neither <em>min</em> nor <em>max</em> is set, nothing will be done.</p>

 <p>The values for min and max must be inserted as String values so that "0" can be handled as a possible value.</p></p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}

```java
 @IntRangeFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, min = "0", max = "42")

 @IntRangeFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, minExpression = "${minValue}", maxExpression = "${maxValue}")
```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator {% endcomment %}
