---
layout: core-developers
title: DateRangeFieldValidator Annotation
---

# DateRangeFieldValidator Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}
<p> This validator checks that a date field has a value within a specified range.
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}

##### Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}
<p> <p>The annotation must be applied at method level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}
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
 <td class='confluenceTd'> Date property.  The minimum the date must be. </td>
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
 <td class='confluenceTd'> Date property.  The maximum date can be. </td>
 </tr>
 <tr>
 <td class='confluenceTd'>maxExpression</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the maximum date can be.</td>
 </tr>
 <tr>
 <td class='confluenceTd'>maxExpression</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>OGNL expression used to obtain the maximum date can be.</td>
 </tr>
 <tr>
 <td class='confluenceTd'>dateFormat</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>Format used to parse min/max value.</td>
 </tr>
 </table>

 <p>If neither <em>min</em> nor <em>max</em> is set, nothing will be done.</p>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}

##### Examples



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}

```java
 @DateRangeFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, min = "2005/01/01", max = "2005/12/31")

```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.DateRangeFieldValidator {% endcomment %}
