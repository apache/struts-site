---
layout: core-developers
title: ExpressionValidator Annotation
---

# ExpressionValidator Annotation

{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}
<p> This non-field level validator validates a supplied regular expression.</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}

#####Usage#####



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}
<p> <p>The annotation must be applied at method level.</p></p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}
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
 <td class='confluenceTd'>shortCircuit</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>false</td>
 <td class='confluenceTd'>If this validator should be used as shortCircuit.</td>
 </tr>
 <tr>
 <td class='confluenceTd'> expression </td>
 <td class='confluenceTd'> yes </td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'> An OGNL expression that returns a boolean value.  </td>
 </tr>
 </table></p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}

```java
 @ExpressionValidator(message = "Default message", key = "i18n.key", shortCircuit = true, expression = "an OGNL expression" )
```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.ExpressionValidator {% endcomment %}
