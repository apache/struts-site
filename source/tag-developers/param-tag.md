---
layout: default
title: Tag Developers Guide (WIP)
---

# param


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Param {% endcomment %}
<p> <p>This tag can be used to parameterize other tags.<br>
 The include tag and bean tag are examples of such tags.
 </p>

 <p>
 The parameters can be added with or without a name as key.
 If the tag provides a name attribute the parameters are added using the
 {@link Component#addParameter(String, Object) addParamter} method.
 For unnamed parameters the Tag must implement the {@link UnnamedParametric} interface defined in
 this class (e.g. The TextTag does this).
 </p>

 <p>
 This tag has the following two paramters.
 </p>
 <!-- START SNIPPET: params -->
 <ul>
      <li>name (String) - the name of the parameter</li>
      <li>value (Object) - the value of the parameter</li>
      <li>suppressEmptyParameters (boolean) - whether to suppress this parameter if empty</li>
 </ul>
 <!-- END SNIPPET: params -->
 <p>
 <b>Note:</b>
 When you declare the param tag, the value can be defined in either a <tt>value</tt> attribute or
 as text between the start and end tag. Struts behaves a bit different according to these two situations.
 This is best illustrated using an example:
 <br><param name="color">blue</param> <-- (A) -->
 <br><param name="color" value="blue"/> <-- (B) -->
 <br>In the first situation (A) the value would be evaluated to the stack as a <tt>java.lang.String</tt> object.
 And in situation (B) the value would be evaluated to the stack as a <tt>java.lang.Object</tt> object.
 <br>For more information see <a href="https://issues.apache.org/jira/browse/WW-808">WW-808</a>.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Param {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/param.html {% endcomment %}
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

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Name of Parameter to set</td>

				</tr>

				<tr>

					<td align="left" valign="top">suppressEmptyParameters</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether to suppress empty parameters</td>

				</tr>

				<tr>

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">The value of evaluating provided name against stack</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Value expression for Parameter to set</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/param.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Param {% endcomment %}

```xml
 <pre>
 <ui:component>
  <ui:param name="key"     value="[0]"/>
  <ui:param name="value"   value="[1]"/>
  <ui:param name="context" value="[2]"/>
 </ui:component>
 </pre>

 <p>
 Whether to suppress empty parameters:
 </p>

 <pre>
 <s:url action="eventAdd">
   <s:param name="bean.searchString" value="%{bean.searchString}" />
   <s:param name="bean.filter" value="%{bean.filter}" />
   <s:param name="bean.pageNum" value="%{pager.pageNumber}" suppressEmptyParameters="true" />
 </s:url>
 </pre>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Param {% endcomment %}


{% comment %}start snippet id=exampledescription|javadoc=true|url=org.apache.struts2.components.Param {% endcomment %}
<p> where the key will be the identifier and the value the result of an OGNL expression run against the current
 ValueStack.
</p>
{% comment %}end snippet id=exampledescription|javadoc=true|url=org.apache.struts2.components.Param {% endcomment %}
