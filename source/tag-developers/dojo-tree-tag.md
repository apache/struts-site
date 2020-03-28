---
layout: default
title: Tag Developers Guide
---

# tree

> NOTE: Ajax template (Dojo plugin) is deprecated and won't be supported any longer.

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}
<p>
 Renders a tree widget with AJAX support.<p/>

 The "id "attribute is normally specified(recommended), such that it could be looked up using
 javascript if necessary. The "id" attribute is required if the "selectedNotifyTopic" or the 
 "href" attributes are going to be used.<p/>

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/tree.html {% endcomment %}
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

					<td align="left" valign="top">blankIconSrc</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Blank icon image source.</td>

				</tr>

				<tr>

					<td align="left" valign="top">childCollectionProperty</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The childCollectionProperty property.</td>

				</tr>

				<tr>

					<td align="left" valign="top">collapsedNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma separated lis of topics to be published when a node is collapsed. An object with a 'node' property will be passed as parameter to the topics.</td>

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

					<td align="left" valign="top">errorNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published after the request(if the request fails).Only valid if 'href' is set</td>

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

					<td align="left" valign="top">expandIconSrcMinus</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Expand icon (-) image source.</td>

				</tr>

				<tr>

					<td align="left" valign="top">expandIconSrcPlus</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Expand Icon (+) image source.</td>

				</tr>

				<tr>

					<td align="left" valign="top">expandedNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma separated lis of topics to be published when a node is expanded. An object with a 'node' property will be passed as parameter to the topics.</td>

				</tr>

				<tr>

					<td align="left" valign="top">gridIconSrcC</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Image source for under child item child icons.</td>

				</tr>

				<tr>

					<td align="left" valign="top">gridIconSrcL</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Image source for last child grid.</td>

				</tr>

				<tr>

					<td align="left" valign="top">gridIconSrcP</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Image source for under parent item child icons.</td>

				</tr>

				<tr>

					<td align="left" valign="top">gridIconSrcV</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Image source for vertical line.</td>

				</tr>

				<tr>

					<td align="left" valign="top">gridIconSrcX</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Image source for grid for sole root item.</td>

				</tr>

				<tr>

					<td align="left" valign="top">gridIconSrcY</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Image source for grid for last root item.</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Url used to load the list of children nodes for an specific node, whose id will be passed as a parameter named 'nodeId' (empty for root)</td>

				</tr>

				<tr>

					<td align="left" valign="top">iconHeight</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">18px</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Icon height</td>

				</tr>

				<tr>

					<td align="left" valign="top">iconWidth</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">19px</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Icon width</td>

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

					<td align="left" valign="top">name</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The name to set for element</td>

				</tr>

				<tr>

					<td align="left" valign="top">nodeIdProperty</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The nodeIdProperty property.</td>

				</tr>

				<tr>

					<td align="left" valign="top">nodeTitleProperty</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The nodeTitleProperty property.</td>

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

					<td align="left" valign="top">rootNode</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The rootNode property.</td>

				</tr>

				<tr>

					<td align="left" valign="top">selectedNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma separated lis of topics to be published when a node is selected. An object with a 'node' property will be passed as parameter to the topics.</td>

				</tr>

				<tr>

					<td align="left" valign="top">showGrid</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show grid</td>

				</tr>

				<tr>

					<td align="left" valign="top">showRootGrid</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The showRootGrid property (default true).</td>

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

					<td align="left" valign="top">templateCssPath</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">{contextPath}/struts/tree.css.</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Template css path</td>

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

					<td align="left" valign="top">toggle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">fade</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The toggle property (either 'explode' or 'fade')</td>

				</tr>

				<tr>

					<td align="left" valign="top">toggleDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">150</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Toggle duration in milliseconds</td>

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

					<td align="left" valign="top">treeCollapsedTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Deprecated. Use 'collapsedNotifyTopics' instead.</td>

				</tr>

				<tr>

					<td align="left" valign="top">treeExpandedTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Deprecated. Use 'expandedNotifyTopics' instead.</td>

				</tr>

				<tr>

					<td align="left" valign="top">treeSelectedTopic</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Deprecated. Use 'selectedNotifyTopics' instead.</td>

				</tr>

				<tr>

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/tree.html {% endcomment %}

__Examples__

Static tree:


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}

```xml
 <s:tree id="..." label="...">
    <s:treenode id="..." label="..." />
    <s:treenode id="..." label="...">
        <s:treenode id="..." label="..." />
        <s:treenode id="..." label="..." />
    </s:treenode>
    <s:treenode id="..." label="..." />
 </s:tree>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}

Dynamic tree (rendered on the server):


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}

```xml
 <s:tree
          id="..."
          rootNode="..."
          nodeIdProperty="..."
          nodeTitleProperty="..."
          childCollectionProperty="..." />

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}

Dynamic tree loaded with AJAX (one request is made for each node):


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}

```xml
 <s:url id="nodesUrl" namespace="/nodecorate" action="getNodes" />
 <div style="float:left; margin-right: 50px;">
     <sx:tree id="tree" href="%{#nodesUrl}" />
 </div>
 
 On this example the url specified on the "href" attibute will be called to load
 the elements on the root. The response is expected to be a JSON array of objects like:
 [
      {
           label: "Node 1",
           hasChildren: false,
           id: "Node1"
      },
      {
           label: "Node 2",
           hasChildren: true,
           id: "Node2"
      },
 ]
 
 "label" is the text that will be displayed for the node. "hasChildren" marks the node has
 having children or not (if true, a plus icon will be assigned to the node so it can be
 expanded). The "id" attribute will be used to load the children of the node, when the node
 is expanded. When a node is expanded a request will be made to the url in the "href" attribute
 and the node's "id" will be passed in the parameter "nodeId".
 
 The children collection for a node will be loaded only once, to reload the children of a 
 node, use the "reload()" function of the treenode widget. To reload the children nodes of "Node1"
 from the example above use the following javascript:
 
 dojo.widget.byId("Node1").reload();

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java {% endcomment %}
