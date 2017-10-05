---
layout: default
title: Tag Developers Guide (WIP)
---

# date

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Date {% endcomment %}
<p>
 Format Date object in different ways.
 <p>
 The date tag will allow you to format a Date in a quick and easy way.
 You can specify a <b>custom format</b> (eg. "dd/MM/yyyy hh:mm"), you can generate
 <b>easy readable notations</b> (like "in 2 hours, 14 minutes"), or you can just fall back
 on a <b>predefined format</b> with key 'struts.date.format' in your properties file.
 </p>

 <p>
 If that key is not defined, it will finally fall back to the default DateFormat.MEDIUM
 formatting.
 </p>

 <p>
 <b>Note</b>: If the requested Date object isn't found on the stack, a blank will be returned.
 </p>

 <p>
 Configurable attributes are:
 </p>

 <ul>
    <li>name</li>
    <li>nice</li>
    <li>format</li>
 </ul>

 <p>
 Following how the date component will work, depending on the value of nice attribute
 (which by default is false) and the format attribute.
 </p>

 <p>
 <b><u>Condition 1: With nice attribute as true</u></b>
 </p>
 <table border="1" summary="">
   <tr>
      <td>i18n key</td>
      <td>default</td>
   </tr>
   <tr>
      <td>struts.date.format.past</td>
      <td>{0} ago</td>
   </tr>
   <tr>
      <td>struts.date.format.future</td>
      <td>in {0}</td>
   </tr>
   <tr>
      <td>struts.date.format.seconds</td>
      <td>an instant</td>
   </tr>
   <tr>
      <td>struts.date.format.minutes</td>
      <td>{0,choice,1#one minute|1<{0} minutes}</td>
   </tr>
   <tr>
      <td>struts.date.format.hours</td>
      <td>{0,choice,1#one hour|1<{0} hours}{1,choice,0#|1#, one minute|1<, {1} minutes}</td>
   </tr>
   <tr>
      <td>struts.date.format.days</td>
      <td>{0,choice,1#one day|1<{0} days}{1,choice,0#|1#, one hour|1<, {1} hours}</td>
   </tr>
   <tr>
      <td>struts.date.format.years</td>
      <td>{0,choice,1#one year|1<{0} years}{1,choice,0#|1#, one day|1<, {1} days}</td>
   </tr>
 </table>

 <p>
 <b><u>Condition 2: With nice attribute as false and format attribute is specified eg. dd/MM/yyyyy </u></b>
 </p>

 <p>In this case the format attribute will be used.</p>

 <p>
 <b><u>Condition 3: With nice attribute as false and no format attribute is specified </u></b>
 </p>
 <table border="1" summary="">
    <tr>
      <td>i18n key</td>
      <td>default</td>
   </tr>
   <tr>
      <td>struts.date.format</td>
      <td>if one is not found DateFormat.MEDIUM format will be used</td>
   </tr>
 </table>


</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Date {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/date.html {% endcomment %}
<p>		<table width="100%">

			<tr>

				<td colspan="6"><h4>Dynamic Attributes Allowed:</h4> false</td>

			</tr>

			<tr>

				<td colspan="6">&nbsp;</td>

			</tr>

			<tr>

				<th align="left" valign="top"><h4>Name</h4></th>

				<th align="left" valign="top"><h4>Required</h4></th>

				<th align="left" valign="top"><h4>Default</h4></th>

				<th align="left" valign="top"><h4>Evaluated</h4></th>

				<th align="left" valign="top"><h4>Type</h4></th>

				<th align="left" valign="top"><h4>Description</h4></th>

			</tr>

				<tr>

					<td align="left" valign="top">format</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Date or DateTime format pattern</td>

				</tr>

				<tr>

					<td align="left" valign="top">name</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The date value to format</td>

				</tr>

				<tr>

					<td align="left" valign="top">nice</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether to print out the date nicely</td>

				</tr>

				<tr>

					<td align="left" valign="top">timezone</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The specific timezone in which to format the date</td>

				</tr>

				<tr>

					<td align="left" valign="top">var</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Name used to reference the value pushed into the Value Stack</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/date.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Date {% endcomment %}

```xml
  <s:date name="person.birthday" format="dd/MM/yyyy" />
  <s:date name="person.birthday" format="%{getText('some.i18n.key')}" />
  <s:date name="person.birthday" nice="true" />
  <s:date name="person.birthday" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Date {% endcomment %}
