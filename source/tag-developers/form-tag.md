---
layout: default
title: Tag Developers Guide (WIP)
---

# form


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Form {% endcomment %}
<p> <p>
 Renders HTML an input form.
 </p>

 <p>
 The remote form allows the form to be submitted without the page being refreshed. The results from the form
 can be inserted into any HTML element on the page.
 </p>
 <p>
 NOTE:<br>
 The order / logic in determining the posting url of the generated HTML form is as follows:
 </p>

 <ol>
 <li>
 If the action attribute is not specified, then the current request will be used to
 determine the posting url
 </li>
 <li>
 If the action is given, Struts will try to obtain an ActionConfig. This will be
 successful if the action attribute is a valid action alias defined struts.xml.
 </li>
 <li>
 If the action is given and is not an action alias defined in struts.xml, Struts
 will used the action attribute as if it is the posting url, separting the namespace
 from it and using UrlHelper to generate the final url.
 </li>
 </ol>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Form {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/form.html {% endcomment %}
<p>		<table width="100%">
			<tr>
				<td colspan="6"><h4>Dynamic Attributes Allowed:</h4> true</td>
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
					<td align="left" valign="top">acceptcharset</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The accepted charsets for this form. The values may be comma or blank delimited.</td>
				</tr>
				<tr>
					<td align="left" valign="top">accesskey</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html accesskey attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">action</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">current action</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set action name to submit to, without .action suffix</td>
				</tr>
				<tr>
					<td align="left" valign="top">class</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The css class to use for element - it's an alias of cssClass attribute.</td>
				</tr>
				<tr>
					<td align="left" valign="top">cssClass</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The css class to use for element</td>
				</tr>
				<tr>
					<td align="left" valign="top">cssErrorClass</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The css error class to use for element</td>
				</tr>
				<tr>
					<td align="left" valign="top">cssErrorStyle</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The css error style definitions for element to use</td>
				</tr>
				<tr>
					<td align="left" valign="top">cssStyle</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The css style definitions for element to use</td>
				</tr>
				<tr>
					<td align="left" valign="top">disabled</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html disabled attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">enctype</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">HTML form enctype attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">errorPosition</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Define error position of form element (top|bottom)</td>
				</tr>
				<tr>
					<td align="left" valign="top">focusElement</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Id of element that will receive the focus when page loads.</td>
				</tr>
				<tr>
					<td align="left" valign="top">id</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">HTML id attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">includeContext</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">true</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether actual context should be included in URL</td>
				</tr>
				<tr>
					<td align="left" valign="top">javascriptTooltip</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Use JavaScript to generate tooltips</td>
				</tr>
				<tr>
					<td align="left" valign="top">key</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the key (name, value, label) for this particular component</td>
				</tr>
				<tr>
					<td align="left" valign="top">label</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Label expression used for rendering an element specific label</td>
				</tr>
				<tr>
					<td align="left" valign="top">labelSeparator</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">:</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">String that will be appended to the label</td>
				</tr>
				<tr>
					<td align="left" valign="top">labelposition</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Define label position of form element (top/left)</td>
				</tr>
				<tr>
					<td align="left" valign="top">method</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">HTML form method attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">name</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The name to set for element</td>
				</tr>
				<tr>
					<td align="left" valign="top">namespace</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">current namespace</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Namespace for action to submit to</td>
				</tr>
				<tr>
					<td align="left" valign="top">onblur</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top"> Set the html onblur attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onchange</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onchange attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onclick</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onclick attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">ondblclick</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html ondblclick attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onfocus</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onfocus attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onkeydown</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onkeydown attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onkeypress</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onkeypress attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onkeyup</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onkeyup attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onmousedown</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onmousedown attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onmousemove</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onmousemove attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onmouseout</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onmouseout attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onmouseover</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onmouseover attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onmouseup</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onmouseup attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onreset</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">HTML onreset attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">onselect</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onselect attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">onsubmit</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">HTML onsubmit attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">openTemplate</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set template to use for opening the rendered html.</td>
				</tr>
				<tr>
					<td align="left" valign="top">portletMode</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The portlet mode to display after the form submit</td>
				</tr>
				<tr>
					<td align="left" valign="top">requiredLabel</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">If set to true, the rendered element will indicate that input is required</td>
				</tr>
				<tr>
					<td align="left" valign="top">requiredPosition</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Define required position of required form element (left|right)</td>
				</tr>
				<tr>
					<td align="left" valign="top">style</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The css style definitions for element to use - it's an alias of cssStyle attribute.</td>
				</tr>
				<tr>
					<td align="left" valign="top">tabindex</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html tabindex attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">target</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">HTML form target attribute</td>
				</tr>
				<tr>
					<td align="left" valign="top">template</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The template (other than default) to use for rendering the element</td>
				</tr>
				<tr>
					<td align="left" valign="top">templateDir</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The template directory.</td>
				</tr>
				<tr>
					<td align="left" valign="top">theme</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The theme (other than default) to use for rendering the element</td>
				</tr>
				<tr>
					<td align="left" valign="top">title</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html title attribute on rendered html element</td>
				</tr>
				<tr>
					<td align="left" valign="top">tooltip</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the tooltip of this particular component</td>
				</tr>
				<tr>
					<td align="left" valign="top">tooltipConfig</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Deprecated. Use individual tooltip configuration attributes instead.</td>
				</tr>
				<tr>
					<td align="left" valign="top">tooltipCssClass</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">StrutsTTClassic</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">CSS class applied to JavaScrip tooltips</td>
				</tr>
				<tr>
					<td align="left" valign="top">tooltipDelay</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Classic</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Delay in milliseconds, before showing JavaScript tooltips </td>
				</tr>
				<tr>
					<td align="left" valign="top">tooltipIconPath</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Icon path used for image that will have the tooltip</td>
				</tr>
				<tr>
					<td align="left" valign="top">validate</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">Boolean</td>
					<td align="left" valign="top">Whether client side/remote validation should be performed. Only useful with theme xhtml/ajax</td>
				</tr>
				<tr>
					<td align="left" valign="top">value</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Preset the value of input element.</td>
				</tr>
				<tr>
					<td align="left" valign="top">windowState</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The window state to display after the form submit</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/form.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form {% endcomment %}

```xml

 <s:form ... />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form {% endcomment %}

__Validation__

There are two flavours _Client Side Validation_ , depending on the theme you are using (xhtml, ajax, etc). If you are using the [xhtml theme](#PAGE_13834) or [css_xhtml theme](#PAGE_14215), pure client side validation will be used. If you are using the [ajax theme](#PAGE_14205), a special AJAX-based validation will take place. Read the _Client Side Validation_  docs for more information.
