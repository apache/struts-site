---
layout: default
title: Tag Developers Guide (WIP)
---

# submit


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Submit {% endcomment %}
<p> Render a submit button. The submit tag is used together with the form tag to provide asynchronous form submissions.
 The submit can have three different types of rendering:
 <ul>
 <li>input: renders as html <input type="submit"...></li>
 <li>image: renders as html <input type="image"...></li>
 <li>button: renders as html <button type="submit"...></li>
 </ul>
 Please note that the button type has advantages by adding the possibility to seperate the submitted value from the
 text shown on the button face, but has issues with Microsoft Internet Explorer at least up to 6.0</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Submit {% endcomment %}



| To use method attribute (to use multiple submit buttons which direct to different action methods) you must set **struts.enable.DynamicMethodInvocation** to **true** but this can lead to [security vulnerability](http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation)^[http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation] - use with care! Instead you can try to use _Multiple Submit Buttons_  solution.

| 


This tag works with all themes, but has special importance when combined with the [form](#PAGE_14201) tag in the [ajax theme](#PAGE_14205). Please read up on the [ajax theme](#PAGE_14205) for more information.

| 

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/submit.html {% endcomment %}
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
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set action attribute.</td>
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
					<td align="left" valign="top">errorPosition</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Define error position of form element (top|bottom)</td>
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
					<td align="left" valign="top">Set method attribute.</td>
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
					<td align="left" valign="top">onselect</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html onselect attribute on rendered html element</td>
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
					<td align="left" valign="top">src</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Supply an image src for <i>image</i> type submit button. Will have no effect for types <i>input</i> and <i>button</i>.</td>
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
					<td align="left" valign="top">type</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">input</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The type of submit to use. Valid values are <i>input</i>, <i>button</i> and <i>image</i>.</td>
				</tr>
				<tr>
					<td align="left" valign="top">value</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Preset the value of input element.</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/submit.html {% endcomment %}
