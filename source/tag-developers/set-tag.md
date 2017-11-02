---
layout: default
title: Tag Developers Guide
---

# set


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Set {% endcomment %}
<p> <p>The set tag assigns a value to a variable in a specified scope. It is useful when you wish to assign a variable to a
 complex expression and then simply reference that variable each time rather than the complex expression. This is
 useful in both cases: when the complex expression takes time (performance improvement) or is hard to read (code
 readability improvement).</p>
 <p>If the tag is used with body content, the evaluation of the value parameter is omitted. Instead, the String to
 which the body evaluates is set as value for the scoped variable.</p>

 <p>The scopes available are as follows:</p>
 <ul>
   <li>application - the value will be set in application scope according to servlet spec. using the name as its key</li>
   <li>session - the value will be set in session scope according to servlet spec. using the name as key </li>
   <li>request - the value will be set in request scope according to servlet spec. using the name as key </li>
   <li>page - the value will be set in page scope according to servlet spec. using the name as key</li>
   <li>action - the value will be set in the request scope and Struts' action context using the name as key</li>
 </ul>

 <p>
 NOTE:<br>
 If no scope is specified, it will default to action scope.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Set {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/set.html {% endcomment %}
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

					<td align="left" valign="top">scope</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">action</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The scope in which to assign the variable. Can be <b>application</b>, <b>session</b>, <b>request</b>, <b>page</b>, or <b>action</b>.</td>

				</tr>

				<tr>

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The value that is assigned to the variable named <i>name</i></td>

				</tr>

				<tr>

					<td align="left" valign="top">var</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Name used to reference the value pushed into the Value Stack</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/set.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Set {% endcomment %}

```xml
 <s:set var="personName" value="person.name"/>
 Hello, <s:property value="#personName"/>

 <s:set var="janesName">Jane Doe</s:set>
 <s:property value="#janesName"/>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Set {% endcomment %}
