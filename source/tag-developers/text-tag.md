---
layout: default
title: Tag Developers Guide (WIP)
---

# text

Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Text {% endcomment %}
<p> <p>
 Render a I18n text message.
 </p>

 <p>
 The message must be in a resource bundle
 with the same name as the action that it is associated with. In practice
 this means that you should create a properties file in the same package
 as your Java class with the same name as your class, but with .properties
 extension.
 </p>

 <p>
 If the named message is not found in a property file, then the body of the
 tag will be used as default message. If no body is used, then the stack can
 be searched, and if a value is returned, it will written to the output.
 If no value is found on the stack, the key of the message will be written out.
 </p></p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Text {% endcomment %}

For more details on using resource bundles with Struts 2 read the _localization guide_ .

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/text.html {% endcomment %}
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
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Name of resource property to fetch</td>
				</tr>
				<tr>
					<td align="left" valign="top">searchValueStack</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Search the stack if property is not found on resources</td>
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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/text.html {% endcomment %}

__Examples__



{% comment %}start snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Text {% endcomment %}

```none
 <p>Accessing messages from a given bundle (the i18n Shop example bundle in the first example) and using bundle defined through the framework in the second example.</p>
```

{% comment %}end snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Text {% endcomment %}


{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Text {% endcomment %}

```xml

 <!-- First Example -->
 <s:i18n name="struts.action.test.i18n.Shop">
     <s:text name="main.title"/>
 </s:i18n>

 <!-- Second Example -->
 <s:text name="main.title" />

 <!-- Third Examlpe -->
 <s:text name="i18n.label.greetings">
    <s:param >Mr Smith</s:param>
 </s:text>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Text {% endcomment %}

Other example


~~~~~~~

<s:text name="format.money"><s:param name="value" value="myMoneyValue"/></s:text>

~~~~~~~

where the following is in a regular (possibly locale-specific) properties file:


~~~~~~~

format.money={0,number,currency}

~~~~~~~

For more about formatting text, see

1. [http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html](http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html)

2. [http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html](http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html)

__If you wish to use i18n in your tag attributes__

This will **not** work:


~~~~~~~

<s:textfield name="lastName" label="<s:text name="person.lastName"/>" ../>

~~~~~~~

Instead, you should use the getText() method that you inherit when your Action extends XWork's ActionSupport:


~~~~~~~

<s:textfield name="lastName" label="getText('person.lastName')" ../>

~~~~~~~
