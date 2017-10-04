---
layout: default
title: Tag Developers Guide (WIP)
---

# property


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Property {% endcomment %}
<p> <p>
 Used to get the property of a <i>value</i>, which will default to the top of
 the stack if none is specified.
 </p></p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Property {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/property.html {% endcomment %}
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
					<td align="left" valign="top">default</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The default value to be used if <u>value</u> attribute is null</td>
				</tr>
				<tr>
					<td align="left" valign="top">escapeCsv</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether to escape CSV (useful to escape a value for a column)</td>
				</tr>
				<tr>
					<td align="left" valign="top">escapeHtml</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">true</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether to escape HTML</td>
				</tr>
				<tr>
					<td align="left" valign="top">escapeJavaScript</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether to escape Javascript</td>
				</tr>
				<tr>
					<td align="left" valign="top">escapeXml</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether to escape XML</td>
				</tr>
				<tr>
					<td align="left" valign="top">value</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">&lt;top of stack&gt;</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Object</td>
					<td align="left" valign="top">Value to be displayed</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/property.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Property {% endcomment %}

```xml

 <s:push value="myBean">
     <!-- Example 1: -->
     <s:property value="myBeanProperty" />

     <!-- Example 2: -->TextUtils
     <s:property value="myBeanProperty" default="a default value" />
 </s:push>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Property {% endcomment %}


{% comment %}start snippet id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Property {% endcomment %}

```none
 Example 1 prints the result of myBean's getMyBeanProperty() method.
 Example 2 prints the result of myBean's getMyBeanProperty() method and if it is null, print 'a default value' instead.
```

{% comment %}end snippet id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Property {% endcomment %}
