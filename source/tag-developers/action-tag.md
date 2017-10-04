---
layout: default
title: Tag Developers Guide (WIP)
---

# action

Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

## Description

{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ActionComponent {% endcomment %}
<p> <p>This tag enables developers to call actions directly from a JSP page by specifying the action name and an optional
 namespace.  The body content of the tag is used to render the results from the Action.  Any result processor defined
 for this action in struts.xml will be ignored, <i>unless</i> the executeResult parameter is specified.</p></p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ActionComponent {% endcomment %}

Parameters can be passed to the action using nested [param](param-tag.html) tags.

## Placement in context

The action will not be published to the context until the whole tag is evaluated, meaning that inside the body of the tag, 
the action cannot be accessed, For example:

```jsp
<s:action var="myAction" name="MyAction" namespace="/">
    Is "myAction" null inside the tag? <s:property value="#myAction == null" />
</s:action>
    Is "myAction" null outside the tag? <s:property value="#myAction == null" />
```

Will print:

Is "myAction" null inside the tag? true

Is "myAction" null outside the tag? false

## Parameters

{% comment %}start snippet id=tagattributes|struts2-tags/action.html {% endcomment %}
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
					<td align="left" valign="top">executeResult</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether the result of this action (probably a view) should be executed/rendered</td>
				</tr>
				<tr>
					<td align="left" valign="top">flush</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">true</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether the writer should be flush upon end of action component tag, default to true</td>
				</tr>
				<tr>
					<td align="left" valign="top">ignoreContextParams</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether the request parameters are to be included when the action is invoked</td>
				</tr>
				<tr>
					<td align="left" valign="top">name</td>
					<td align="left" valign="top"><strong>true</strong></td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Name of the action to be executed (without the extension suffix eg. .action)</td>
				</tr>
				<tr>
					<td align="left" valign="top">namespace</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">namespace from where tag is used</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Namespace for action to call</td>
				</tr>
				<tr>
					<td align="left" valign="top">rethrowException</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether an exception should be rethrown, if the target action throws an exception</td>
				</tr>
				<tr>
					<td align="left" valign="top">var</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Name used to reference the value pushed into the Value Stack</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|struts2-tags/action.html {% endcomment %}

## Examples

{% comment %}start snippet id=javacode|javadoc=true|lang=java|url=org.apache.struts2.components.ActionComponent {% endcomment %}

```java
 public class ActionTagAction extends ActionSupport {

  public String execute() throws Exception {
      return "done";
  }

  public String doDefault() throws Exception {
      ServletActionContext.getRequest().setAttribute("stringByAction", "This is a String put in by the action's doDefault()");
      return "done";
  }
 }
```

{% comment %}end snippet id=javacode|javadoc=true|lang=java|url=org.apache.struts2.components.ActionComponent {% endcomment %}


{% comment %}start snippet id=strutsxml|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent {% endcomment %}

```xml
   <xwork>
      ....
     <action name="actionTagAction1" class="tmjee.testing.ActionTagAction">
         <result name="done">success.jsp</result>
     </action>
      <action name="actionTagAction2" class="tmjee.testing.ActionTagAction" method="default">
         <result name="done">success.jsp</result>
     </action>
      ....
   </xwork>
```

{% comment %}end snippet id=strutsxml|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent {% endcomment %}


{% comment %}start snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent {% endcomment %}

```xml
  <span>The following action tag will execute result and include it in this page</span>
  <br>
  <s:action name="actionTagAction" executeResult="true" />
  <br>
  <span>The following action tag will do the same as above, but invokes method specialMethod in action</span>
  <br>
  <s:action name="actionTagAction!specialMethod" executeResult="true" />
  <br>
  <span>The following action tag will not execute result, but put a String in request scope
       under an id "stringByAction" which will be retrieved using property tag</span>
  <s:action name="actionTagAction!default" executeResult="false" />
  <s:property value="#attr.stringByAction" />
```

{% comment %}end snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent {% endcomment %}
