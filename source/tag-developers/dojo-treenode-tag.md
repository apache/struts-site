---
layout: default
title: Tag Developers Guide (WIP)
---

# treenode

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java {% endcomment %}
<p>
 Renders a tree node within a tree widget with AJAX support.<p/>

 Either of the following combinations should be used depending on if the tree
 is to be constructed dynamically or statically. <p/>

 <b>Dynamically:</b>
 <ul>
      <li>id - id of this tree node</li>
      <li>title - label to be displayed for this tree node</li>
 </ul>

 <b>Statically:</b>
 <ul>
      <li>rootNode - the parent node of which this tree is derived from</li>
      <li>nodeIdProperty - property to obtained this current tree node's id</li>
      <li>nodeTitleProperty - property to obtained this current tree node's title</li>
      <li>childCollectionProperty - property that returnds this current tree node's children</li>
 </ul>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/treenode.html {% endcomment %}
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
					<td align="left" valign="top">accesskey</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Set the html accesskey attribute on rendered html element</td>
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
					<td align="left" valign="top">The css style to use for element</td>
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
					<td align="left" valign="top">The id to use for the element</td>
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
					<td align="left" valign="top"><strong>true</strong></td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Label expression used for rendering tree node label.</td>
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
					<td align="left" valign="top">value</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Preset the value of input element.</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/treenode.html {% endcomment %}

__Examples__

Update target content with html returned from an action:


{% comment %}start snippet id=example|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java {% endcomment %}

```xml

 <-- Creating tree statically using hard-coded data. -->
 <s:tree id="..." label="...">
    <s:treenode id="..." label="..." />
    <s:treenode id="..." label="...">
        <s:treenode id="..." label="..." />
        <s:treenode id="..." label="..." />
    </s:treenode>
    <s:treenode id="..." label="..." />
 </s:tree>

 <-- Creating tree dynamically using data from backing action. -->
 <s:tree
          id="..."
          rootNode="..."
          nodeIdProperty="..."
          nodeTitleProperty="..."
          childCollectionProperty="..." />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java {% endcomment %}
