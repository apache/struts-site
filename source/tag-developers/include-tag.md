---
layout: default
title: Tag Developers Guide
---

# include


Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Include {% endcomment %}
<p> <p>Include a servlet's output (result of servlet or a JSP page).</p>
 <p>Note: Any additional params supplied to the included page are <b>not</b>
 accessible within the rendered page through the <s:property...> tag
 since no valuestack will be created. You can, however, access them in a
 servlet via the HttpServletRequest object or from a JSP page via
 a scriptlet.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Include {% endcomment %}

**(!) How To access parameters**


> 

> 

> Parameters are passed as request parameters, so use the \${param.ParamName} notation to access them. Do not use the **property** tag to access parameters in included files.

> 

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/include.html {% endcomment %}
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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The jsp/servlet output to include</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/include.html {% endcomment %}

__Example__



{% comment %}start snippet id=example|lang=java|javadoc=true|url=org.apache.struts2.components.Include {% endcomment %}

```java
 <-- One: -->
 <s:include value="myJsp.jsp" />

 <-- Two: -->
 <s:include value="myJsp.jsp">
    <s:param name="param1" value="value2" />
    <s:param name="param2" value="value2" />
 </s:include>

 <-- Three: -->
 <s:include value="myJsp.jsp">
    <s:param name="param1">value1</s:param>
    <s:param name="param2">value2</s:param>
 </s:include>

```

{% comment %}end snippet id=example|lang=java|javadoc=true|url=org.apache.struts2.components.Include {% endcomment %}


{% comment %}start snippet id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Include {% endcomment %}

```none
 Example one - do an include myJsp.jsp page
 Example two - do an include to myJsp.jsp page with parameters param1=value1 and param2=value2
 Example three - do an include to myJsp.jsp page with parameters param1=value1 and param2=value2

```

{% comment %}end snippet id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Include {% endcomment %}
