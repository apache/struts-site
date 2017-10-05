---
layout: default
title: Tag Developers Guide (WIP)
---

# elseif


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ElseIf {% endcomment %}
<p>
 <p>Perform basic condition flow. 'If' tag could be used by itself or with 'Else If' Tag and/or single/multiple 'Else'
 Tag.</p>

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ElseIf {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/elseif.html {% endcomment %}
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

					<td align="left" valign="top">test</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Expression to determine if body of tag is to be displayed</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/elseif.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ElseIf {% endcomment %}

```xml
  <s:if test="%{false}">
      <div>Will Not Be Executed</div>
  </s:if>
  <s:elseif test="%{true}">
      <div>Will Be Executed</div>
  </s:elseif>
  <s:else>
      <div>Will Not Be Executed</div>
  </s:else>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ElseIf {% endcomment %}
