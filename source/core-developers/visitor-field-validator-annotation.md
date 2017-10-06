---
layout: core-developers
title: VisitorFieldValidator Annotation
---

# VisitorFieldValidator Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}
<p> The validator allows you to forward validator to object properties of your action
 using the objects own validator files. This allows you to use the ModelDriven development
 pattern and manage your validations for your models in one place, where they belong, next to
 your model classes.

 The VisitorFieldValidator can handle either simple Object properties, Collections of Objects, or Arrays.
 The error message for the VisitorFieldValidator will be appended in front of validator messages added
 by the validations for the Object message.
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}

##### Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}
<p> <p>The annotation must be applied at method level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}
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
 <td class='confluenceTd'> context </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> action alias </td>
 <td class='confluenceTd'> Determines the context to use for validating the Object property. If not defined, the context of the Action validation is propogated to the Object property validation.  In the case of Action validation, this context is the Action alias.  </td>
 </tr>
 <tr>
 <td class='confluenceTd'> appendPrefix </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> true </td>
 <td class='confluenceTd'> Determines whether the field name of this field validator should be prepended to the field name of the visited field to determine the full field name when an error occurs.  For example, suppose that the bean being validated has a "name" property.  If <em>appendPrefix</em> is true, then the field error will be stored under the field "bean.name".  If <em>appendPrefix</em> is false, then the field error will be stored under the field "name".  <br> <img class="emoticon" src="/images/icons/emoticons/warning.gif" height="16" width="16" alt="" style="border: 0px; align: middle;"> If you are using the VisitorFieldValidator to validate the model from a ModelDriven Action, you should set <em>appendPrefix</em> to false unless you are using "model.name" to reference the properties on your model. </td>
 </tr>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}

##### Examples



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}

```java
 @VisitorFieldValidator(message = "Default message", key = "i18n.key", shortCircuit = true, context = "action alias", appendPrefix = true)

```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.VisitorFieldValidator {% endcomment %}
