---
layout: default
title: Tag Developers Guide (WIP)
---

# i18n


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.I18n {% endcomment %}
<p>
 Gets a resource bundle and place it on the value stack. This allows
 the text tag to access messages from any bundle, and not just the bundle
 associated with the current action.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.I18n {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/i18n.html {% endcomment %}
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
					<td align="left" valign="top">name</td>
					<td align="left" valign="top"><strong>true</strong></td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Name of resource bundle to use (eg foo/bar/customBundle)</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/i18n.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.I18n {% endcomment %}

```xml

 <s:i18n name="myCustomBundle">
    The i18n value for key aaa.bbb.ccc in myCustomBundle is <s:property value="text('aaa.bbb.ccc')" />
 </s:i18n>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.I18n {% endcomment %}
