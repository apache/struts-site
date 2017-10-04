---
layout: default
title: Tag Developers Guide (WIP)
---

# optgroup


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}
<p> <p>
 Create a optgroup component which needs to resides within a select tag.
 </p></p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

{% comment %}start snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}
<p> <p>
 This component is to be used within a  Select component.
 </p>
</p>
{% comment %}end snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/optgroup.html {% endcomment %}
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
					<td align="left" valign="top">disabled</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the disable attribute.</td>
				</tr>
				<tr>
					<td align="left" valign="top">label</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the label attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">list</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the list attribute.</td>
				</tr>
				<tr>
					<td align="left" valign="top">listKey</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the listKey attribute.</td>
				</tr>
				<tr>
					<td align="left" valign="top">listValue</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the listValue attribute.</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/optgroup.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

```xml

 <s:select label="My Selection"
            name="mySelection"
            value="%{'POPEYE'}"
            list="%{#{'SUPERMAN':'Superman', 'SPIDERMAN':'spiderman'}}">
    <s:optgroup label="Adult"
                 list="%{#{'SOUTH_PARK':'South Park'}}" />
    <s:optgroup label="Japanese"
                 list="%{#{'POKEMON':'pokemon','DIGIMON':'digimon','SAILORMOON':'Sailormoon'}}" />
 </s:select>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}
