---
layout: core-developers
title: ValidationParameter annotation
---

# ValidationParameter annotation


{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}
<p> The ValidationParameter annotation is used as a parameter for CustomValidators.</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}

__Usage__



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}
<p> <p>The annotation must embedded into CustomValidator annotations as a parameter.</p></p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}

__Parameters__



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}
<p> <table class='confluenceTable' summary=''>
 <tr>
 <th class='confluenceTh'> Parameter </th>
 <th class='confluenceTh'> Required </th>
 <th class='confluenceTh'> Default </th>
 <th class='confluenceTh'> Notes </th>
 </tr>
 <tr>
 <td class='confluenceTd'>name</td>
 <td class='confluenceTd'>yes</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>parameter name.</td>
 </tr>
 <tr>
 <td class='confluenceTd'>value</td>
 <td class='confluenceTd'>yes</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'>parameter value.</td>
 </tr>
 </table></p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}

__Examples__



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}

```java
 @CustomValidator(
   type ="customValidatorName",
   fieldName = "myField",
   parameters = { @ValidationParameter( name = "paramName", value = "paramValue" ) }
 )
```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.ValidationParameter {% endcomment %}
