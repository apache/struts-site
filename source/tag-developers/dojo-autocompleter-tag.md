---
layout: default
title: Tag Developers Guide (WIP)
---

# autocompleter

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}
<p> <p>The autocomplete tag is a combobox that can autocomplete text entered on the input box. If an action
 is used to populate the autocompleter, the output of the action must be a well formed JSON string. </p>
 <p>The autocompleter follows this rule to find its datasource:<p>
 <p>1. If the response is an array, assume that it contains 2-dimension array elements, like:
 <pre>
 [
      ["Alabama", "AL"],
      ["Alaska", "AK"]
 ]
 </pre>
 <p>2. If a value is specified in the "dataFieldName" attribute, and the response has a field with that
 name, assume that's the datasource, which can be an array of 2-dimension array elements, or a map, 
 like (assuming dataFieldName="state"):</p>
 <pre>
 {
      "state" : [
           ["Alabama","AL"],
           ["Alaska","AK"]
      ]
 }     
 or
 {
      "state" : {
            "Alabama" : "AL",
            "Alaska" : "AK"
      }
 }
 </pre>
 </pre>
 <p>3. If there is a field that starts with the value specified on the "name" attribute, assume 
 that's the datasource, like (assuming name="state"):</p>
 <pre>
 {
      "states" : [
           ["Alabama","AL"],
           ["Alaska","AK"]
      ]
 }
 </pre>
 <p>4. Use first array that is found, like:<p>
 <pre>
 {
      "anything" : [
            ["Alabama", "AL"],
            ["Alaska", "AK"]
     ]       
 }
 <p>5. If the response is a map, use it (recommended as it is the easiest one to generate):
 <pre>
 {
      "Alabama" : "AL",
      "Alaska" : "AK"
 }
 </pre>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/autocompleter.html {% endcomment %}
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

					<td align="left" valign="top">afterNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published after the request(if the request succeeds)</td>

				</tr>

				<tr>

					<td align="left" valign="top">autoComplete</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether autocompleter should make suggestion on the textbox</td>

				</tr>

				<tr>

					<td align="left" valign="top">beforeNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published before the request</td>

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

					<td align="left" valign="top">dataFieldName</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Value specified in 'name'</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Name of the field in the returned JSON object that contains the data array</td>

				</tr>

				<tr>

					<td align="left" valign="top">delay</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">100</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Delay before making the search</td>

				</tr>

				<tr>

					<td align="left" valign="top">disabled</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Enable or disable autocompleter</td>

				</tr>

				<tr>

					<td align="left" valign="top">dropdownHeight</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">120</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Dropdown's height in pixels</td>

				</tr>

				<tr>

					<td align="left" valign="top">dropdownWidth</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">same as textbox</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Dropdown's width</td>

				</tr>

				<tr>

					<td align="left" valign="top">emptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Decide if an empty option is to be inserted. Default false.</td>

				</tr>

				<tr>

					<td align="left" valign="top">errorNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published after the request(if the request fails)</td>

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

					<td align="left" valign="top">forceValidOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Force selection to be one of the options</td>

				</tr>

				<tr>

					<td align="left" valign="top">formFilter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Function name used to filter the fields of the form</td>

				</tr>

				<tr>

					<td align="left" valign="top">formId</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Form id whose fields will be serialized and passed as parameters</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the header key for the header option.</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the header value for the header option.</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The URL used to load the options</td>

				</tr>

				<tr>

					<td align="left" valign="top">iconPath</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Path to icon used for the dropdown</td>

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

					<td align="left" valign="top">indicator</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Id of element that will be shown while request is made</td>

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

					<td align="left" valign="top">keyName</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Name of the field to which the selected key will be assigned</td>

				</tr>

				<tr>

					<td align="left" valign="top">keyValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Initial key value</td>

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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iteratable source to populate from.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the key used to retrive the option key.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the value used to retrive the option value.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topic that will trigger a reload</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadMinimumCount</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">3</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Minimum number of characters that will force the content to be loaded</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadOnTextChange</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Options will be reloaded everytime a character is typed on the textbox</td>

				</tr>

				<tr>

					<td align="left" valign="top">maxLength</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Deprecated. Use maxlength instead.</td>

				</tr>

				<tr>

					<td align="left" valign="top">maxlength</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">HTML maxlength attribute</td>

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

					<td align="left" valign="top">notifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topics that will be published when content is reloaded</td>

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

					<td align="left" valign="top">preload</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Load options when page is loaded</td>

				</tr>

				<tr>

					<td align="left" valign="top">readonly</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether the input is readonly</td>

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

					<td align="left" valign="top">resultsLimit</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">30</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Limit how many results are shown as autocompletion options, set to -1 for unlimited results</td>

				</tr>

				<tr>

					<td align="left" valign="top">searchType</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">stringstart</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">how the search must be performed, options are: 'startstring', 'startword' and 'substring'</td>

				</tr>

				<tr>

					<td align="left" valign="top">showDownArrow</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show or hide the down arrow button</td>

				</tr>

				<tr>

					<td align="left" valign="top">size</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">HTML size attribute</td>

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

					<td align="left" valign="top"></td>

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

					<td align="left" valign="top">transport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">XMLHTTPTransport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Transport used by Dojo to make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">type</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">text</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Specifies the html5 type element to display. e.g. text, email, url</td>

				</tr>

				<tr>

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element</td>

				</tr>

				<tr>

					<td align="left" valign="top">valueNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published when a value is selected</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/autocompleter.html {% endcomment %}

__Examples__

Get list from an action:


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <sx:autocompleter name="autocompleter1" href="%{jsonList}"/>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Uses a list:


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <s:autocompleter name="test"  list="{'apple','banana','grape','pear'}" autoComplete="false"/>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Autocompleter that reloads its content everytime the text changes (and the length of the text is greater than 3):


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <sx:autocompleter name="mvc" href="%{jsonList}" loadOnTextChange="true" loadMinimumCount="3"/>
 
 The text entered on the autocompleter is passed as a parameter to the url specified in "href", like (text is "struts"):
  
 http://host/example/myaction.do?mvc=struts

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Linking two autocompleters:


{% comment %}start snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <form id="selectForm">
      <sx:autocompleter  name="select" list="{'fruits','colors'}"  valueNotifyTopics="/changed" />
 </form>  
 <sx:autocompleter  href="%{jsonList}" formId="selectForm" listenTopics="/changed"/>

```

{% comment %}end snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Set/Get selected values using JavaScript:


{% comment %}start snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <sx:autocompleter  href="%{jsonList}" id="auto"/>
 <script type="text/javascript">
   function getValues() {
      var autoCompleter = dojo.widget.byId("auto");
      
      //key (in the states example above, "AL")
      var key = autoCompleter.getSelectedKey();
      alert(key);
      
      //value (in the states example above, "Alabama")
      var value = autoCompleter.getSelectedValue();
      alert(value);
      
      //text currently on the textbox (anything the user typed)
      var text = autoCompleter.getText();
      alert(text);
   }
 
   function setValues() {
      var autoCompleter = dojo.widget.byId("auto");
      
      //key (key will be set to "AL" and value to "Alabama")
      autoCompleter.setSelectedKey("AL");
      
      //value (key will be set to "AL" and value to "Alabama")
      autoCompleter.setAllValues("AL", "Alabama");
   }
 </script>

```

{% comment %}end snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Using beforeNotifyTopics:


{% comment %}start snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/before", function(event, widget){
     alert('inside a topic event. before request');
     //event: set event.cancel = true, to cancel request
     //widget: widget that published the topic
 });
 </script>         
 
 <sx:autocompleter beforeNotifyTopics="/before" href="%{#ajaxTest} />

```

{% comment %}end snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Using errorNotifyTopics:


{% comment %}start snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/after", function(data, request, widget){
     alert('inside a topic event. after request');
     //data : JavaScript object from parsing response
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>        
 
 <sx:autocompleter afterNotifyTopics="/after" href="%{#ajaxTest}" />

```

{% comment %}end snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Using errorNotifyTopics:


{% comment %}start snippet id=example8|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}
<p> <script type="text/javascript">
 dojo.event.topic.subscribe("/error", function(error, request, widget){
     alert('inside a topic event. on error');
     //error : error object (error.message has the error message)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>
 
 <sx:autocompleter errorNotifyTopics="/error" href="%{#ajaxTest}" />
</p>
{% comment %}end snippet id=example8|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

Using valueNotifyTopics:


{% comment %}start snippet id=example9|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}
<p> <script type="text/javascript">
 dojo.event.topic.subscribe("/value", function(value, key, text, widget){
     alert('inside a topic event. after value changed');
     //value : selected value (like "Florida" in example above)
     //key: selected key (like "FL" in example above)
     //text: text typed into textbox
     //widget: widget that published the topic
 });
 </script>   
 
 <sx:autocompleter valueNotifyTopics="/value" href="%{#ajaxTest}" />
</p>
{% comment %}end snippet id=example9|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java {% endcomment %}

__Caveats__

+ The service that is producing the HTTP Response with JSON response to the Autocompleter tag must set the HTTP Header Response Content-Type to 

~~~~~~~
text/json
~~~~~~~
. JSON has its own MIME type, which this tag expects.

+ Since 2.0.9, there is a change in the value:key order. Now, the value **must** come before the key.

