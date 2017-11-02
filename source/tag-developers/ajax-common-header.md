---
layout: default
title: Tag Developers Guide
---

# ajax common header

To use this tag:

- Add: `<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>`  to your page.
- The [head](head-tag.html) tag must be included on the page, which can be configured for performance or debugging purposes.
- If the `parseContent` parameter for the [head](head-tag.html) tag is false (it is false by default), then the **id** tag is required.

For more examples see [Ajax and JavaScript Recipes](ajax-and-javascript-recipes.html)


#####autocompleter##### {#PAGE_46753}

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

#####bind##### {#PAGE_66798}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}
<p> <p>
 This tag will generate event listeners for multiple events on multiple sources,
 making an asynchronous request to the specified href, and updating multiple targets.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ . Resulting in an "undefined" message in the content's, instead of the result of the request.

One possible alternative is to set _showLoadingText="false"_  and set the indicator attribute to an element showing the desired loading text or image (outside the div).


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <s:submit id="btn" />
        <sx:bind sources="btn" events="onclick" targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/bind.html {% endcomment %}
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

					<td align="left" valign="top">afterNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published after the request(if the request succeeds)</td>

				</tr>

				<tr>

					<td align="left" valign="top">ajaxAfterValidation</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Make an asynchronous request if validation succeeds. Only valid is 'validate' is 'true'</td>

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

					<td align="left" valign="top">errorNotifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published after the request(if the request fails)</td>

				</tr>

				<tr>

					<td align="left" valign="top">errorText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The text to display to the user if the is an error fetching the content</td>

				</tr>

				<tr>

					<td align="left" valign="top">events</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimited list of event names to attach to</td>

				</tr>

				<tr>

					<td align="left" valign="top">executeScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Javascript code in the fetched content will be executed</td>

				</tr>

				<tr>

					<td align="left" valign="top">formFilter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Function name used to filter the fields of the form.</td>

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

					<td align="left" valign="top">handler</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript function name that will make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightColor</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">none</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Color used to perform a highlight effect on the elements specified in the 'targets' attribute</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">2000</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Duration of highlight effect in milliseconds. Only valid if 'highlightColor' attribute is set</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The URL to call to obtain the content. Note: If used with ajax context, the value must be set as an url tag value.</td>

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

					<td align="left" valign="top">Id of element that will be shown while making request</td>

				</tr>

				<tr>

					<td align="left" valign="top">listenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topic that will trigger the remote call</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Loading...</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to be shown while content is being fetched</td>

				</tr>

				<tr>

					<td align="left" valign="top">notifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published before and after the request, and on errors</td>

				</tr>

				<tr>

					<td align="left" valign="top">separateScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Run scripts in a separate scope, unique for each tag</td>

				</tr>

				<tr>

					<td align="left" valign="top">showErrorTransportText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Set whether errors will be shown or not</td>

				</tr>

				<tr>

					<td align="left" valign="top">showLoadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show loading text on targets</td>

				</tr>

				<tr>

					<td align="left" valign="top">sources</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimited list of ids of the elements to attach to</td>

				</tr>

				<tr>

					<td align="left" valign="top">targets</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimited list of ids of the elements whose content will be updated</td>

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

					<td align="left" valign="top">validate</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Perform Ajax validation. 'ajaxValidation' interceptor must be applied to action</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/bind.html {% endcomment %}

__Examples__

Without attaching to an event, listening to a topic (used to make an Ajax call):


{% comment %}start snippet id=example0|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

```xml
 <sx:bind href="%{#ajaxTest}" listenTopics="/makecall"/>
 <s:submit onclick="dojo.event.topic.publish('/makecall')"/>

```

{% comment %}end snippet id=example0|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

Attached to event 'onclick' on submit button:


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

```xml
 <img id="indicator" src="${pageContext.request.contextPath}/images/indicator.gif" alt="Loading..." style="display:none"/>
 <sx:bind id="ex1" href="%{#ajaxTest}" sources="button" targets="div1" events="onclick" indicator="indicator" />
 <s:submit theme="simple" type="submit" value="submit" id="button"/>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

Submit form:


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

```xml
 <sx:bind id="ex3" href="%{#ajaxTest}" sources="chk1" targets="div1" events="onchange" formId="form1" />
 <form id="form1">
     <s:checkbox name="data" label="Hit me" id="chk1"/>
 </form>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

Using beforeNotifyTopics:


{% comment %}start snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/before", function(event, widget){
     alert('inside a topic event. before request');
     //event: set event.cancel = true, to cancel request
     //widget: widget that published the topic
 });
 </script>         
 
 <input type="button" id="button"> 
 <sx:bind id="ex1" href="%{#ajaxTest}" beforeNotifyTopics="/before" sources="button" events="onclick"/> 

```

{% comment %}end snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

Using afterNotifyTopics and highlight:


{% comment %}start snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/after", function(data, request, widget){
     alert('inside a topic event. after request');
     //data : text returned from request(the html)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>        
 
 <input type="button" id="button">
 <sx:bind id="ex1" href="%{#ajaxTest}" highlightColor="red" afterNotifyTopics="/after" sources="button" events="onclick"/>

```

{% comment %}end snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

Using errorNotifyTopics and indicator:


{% comment %}start snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/error", function(error, request, widget){
     alert('inside a topic event. on error');
     //error : error object (error.message has the error message)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>         
 
 <input type="button" id="button">
 <img id="ind1" src="${pageContext.request.contextPath}/images/indicator.gif" style="display:none"/>
 <sx:bind href="%{#ajaxTest}" indicator="ind1" errorNotifyTopics="/error" sources="button" events="onclick"/>

```

{% comment %}end snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}

#####checkbox##### {#PAGE_14029}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Checkbox {% endcomment %}
<p> Renders an HTML input element of type checkbox, populated by the specified property from the ValueStack.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Checkbox {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/checkbox.html {% endcomment %}
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

					<td align="left" valign="top">fieldValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The actual HTML value attribute of the checkbox.</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/checkbox.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Checkbox {% endcomment %}

```xml
 JSP:
 <s:checkbox label="checkbox test" name="checkboxField1" value="aBoolean" fieldValue="true"/>

 Velocity:
 #tag( Checkbox "label=checkbox test" "name=checkboxField1" "value=aBoolean" )

 Resulting HTML (simple template, aBoolean == true):
 <input type="checkbox" name="checkboxField1" value="true" checked="checked" />


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Checkbox {% endcomment %}

#####checkboxlist##### {#PAGE_13969}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean {% endcomment %}
<p> <p>
 Note that the listkey and listvalue attribute will default to "key" and "value"
 respectively only when the list attribute is evaluated to a Map or its descendant.
 Everything else will result in listkey and listvalue to be null and not used.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean {% endcomment %}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.CheckboxList {% endcomment %}
<p>
 Creates a series of checkboxes from a list. Setup is like <s:select /> or <s:radio />, but creates checkbox tags.

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.CheckboxList {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/checkboxlist.html {% endcomment %}
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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/checkboxlist.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.CheckboxList {% endcomment %}

```xml
 <s:checkboxlist name="foo" list="bar"/>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.CheckboxList {% endcomment %}

#####combobox##### {#PAGE_14259}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ComboBox {% endcomment %}
<p> <p>
 The combo box is basically an HTML INPUT of type text and HTML SELECT grouped together to give you a combo box
 functionality. You can place text in the INPUT control by using the SELECT control or type it in directly in
 the text field.
 </p>

 <p>
 In this example, the SELECT will be populated from id=year attribute. Counter is itself an Iterator. It will
 span from first to last. The population is done via javascript, and requires that this tag be surrounded by a
 <form>.
 </p>

 <p>
 Note that unlike the <s:select/> tag, there is no ability to define the individual <option> tags' id attribute
 or content separately. Each of these is simply populated from the toString() method of the list item. Presumably
 this is because the select box isn't intended to actually submit useful data, but to assist the user in filling
 out the text field.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ComboBox {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/combobox.html {% endcomment %}
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

					<td align="left" valign="top">emptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Decide if an empty option is to be inserted. Default false.</td>

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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If this is missing, the select widget is simply not displayed.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the key used to retrieve the option key.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the value used to retrieve the option value.</td>

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

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/combobox.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ComboBox {% endcomment %}

```xml
 JSP:
 <-- Example One -->
 <s:bean name="struts.util.Counter" var="year">
   <s:param name="first" value="text('firstBirthYear')"/>
   <s:param name="last" value="2000"/>

   <s:combobox label="Birth year" size="6" maxlength="4" name="birthYear" list="#year"/>
 </s:bean>

 <-- Example Two -->
 <s:combobox
     label="My Favourite Fruit"
     name="myFavouriteFruit"
     list="{'apple','banana','grape','pear'}"
     headerKey="-1"
     headerValue="--- Please Select ---"
     emptyOption="true"
     value="banana" />

 <-- Example Two -->
 <s:combobox
    label="My Favourite Color"
    name="myFavouriteColor"
    list="#{'red':'red','green':'green','blue':'blue'}"
    headerKey="-1"
    headerValue="--- Please Select ---"
    emptyOption="true"
    value="green" />

 Velocity:
 #tag( ComboBox "label=Birth year" "size=6" "maxlength=4" "name=birthYear" "list=#year" )

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ComboBox {% endcomment %}

#####component##### {#PAGE_14033}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.GenericUIBean {% endcomment %}
<p> <p>
 Renders an custom UI widget using the specified templates. Additional objects can be passed in to the template
 using the param tags.
 </p>

 <p><b>Freemarker:</b></p>
 <pre>Objects provided can be retrieve from within the template via $parameters._paramname_.</pre>

 <p><b>JSP:</b></p>
 <pre>Objects provided can be retrieve from within the template via <s:property value="%{parameters._paramname_}" /></pre>

 <p>
 In the bottom JSP and Velocity samples, two parameters are being passed in to the component. From within the
 component, they can be accessed as:
 </p>

 <p><b>Freemarker:</b></p>
 <pre>$parameters.get('key1') and $parameters.get('key2') or $parameters.key1 and $parameters.key2</pre>

 <p><b>JSP:</b></p>
 <pre>
 <s:property value="%{parameters.key1}" /> and <s:property value="%{'parameters.key2'}" /> or
 <s:property value="%{parameters.get('key1')}" /> and <s:property value="%{parameters.get('key2')}" />
 </pre>

 <p>
 Currently, your custom UI components can be written in Velocity, JSP, or Freemarker, and the correct rendering
 engine will be found based on file extension.
 </p>

 <p>
 <b>Remember:</b> the value params will always be resolved against the ValueStack so if you mean to pass a
 string literal to your component, make sure to wrap it in single quotes i.e. value="'value1'" (note the opening "' and closing '" otherwise, the the value
 stack will search for an Object on the stack with a method of getValue1().
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.GenericUIBean {% endcomment %}

{% comment %}start snippet id=note|javadoc=true|url=org.apache.struts2.components.GenericUIBean {% endcomment %}
<p>
 If Jsp is used as the template, the jsp template itself must lie within the
 webapp itself and not the classpath. Unlike Freemarker or Velocity, JSP template
 could not be picked up from the classpath.

</p>
{% comment %}end snippet id=note|javadoc=true|url=org.apache.struts2.components.GenericUIBean {% endcomment %}

**(!) templateDir and theme attribute**


> 

> 

> The final path to the template will be built using the _templateDir_  and _template_  attributes, like \${templateDir}/\${theme}/\${template}. If for example your component is under /components/html/option.jsp, you would have to set templateDir="components", theme="html" and template="options.jsp". 

> 

> 

> For any Struts tag that you use in your component, make sure that you set its templateDir="template"

> 

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/component.html {% endcomment %}
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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/component.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.GenericUIBean {% endcomment %}

```xml
 <p>
 JSP
 </p>
 <pre>
     <s:component template="/my/custom/component.vm"/>

       or

     <s:component template="/my/custom/component.vm">
       <s:param name="key1" value="value1"/>
       <s:param name="key2" value="value2"/>
     </s:component>
 </pre>

 <p>
 Velocity
 </p>
 <pre>
     #s-component( "template=/my/custom/component.vm" )

       or

     #s-component( "template=/my/custom/component.vm" )
       #s-param( "name=key1" "value=value1" )
       #s-param( "name=key2" "value=value2" )
     #end
 </pre>

 <p>
 Freemarker
 </p>
 <pre>
    <@s..component template="/my/custom/component.ftl" />

      or

    <@s..component template="/my/custom/component.ftl">
       <@s..param name="key1" value="%{'value1'}" />
       <@s..param name="key2" value="%{'value2'}" />
    </@s..component>
 </pre>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.GenericUIBean {% endcomment %}

#####datetextfield##### {#PAGE_40506485}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DateTextField %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/datetextfield.html {% endcomment %}
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

					<td align="left" valign="top">format</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Date format attribute</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/datetextfield.html {% endcomment %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DateTextField %}

#####datetimepicker##### {#PAGE_14274}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}
<p> <p>
 Renders a date/time picker in a dropdown container.
 </p>
 <p>
 A stand-alone DateTimePicker widget that makes it easy to select a date/time, or increment by week, month,
 and/or year.
 </p>

 <p>
 It is possible to customize the user-visible formatting with either the
 'formatLength' (long, short, medium or full) or 'displayFormat' attributes. By defaulty current
 locale will be used.</p>
 </p>
 
 Syntax supported by 'displayFormat' is (http://www.unicode.org/reports/tr35/tr35-4.html#Date_Format_Patterns):-
 <table border="1">
   <tr>
      <td>Format</td>
      <td>Description</td>
   </tr>
   <tr>
      <td>d</td>
      <td>Day of the month</td>
   </tr>
   <tr>
      <td>D</td>
      <td>Day of year</td>
   </tr>
   <tr>
      <td>M</td>
      <td>Month - Use one or two for the numerical month, three for the abbreviation, or four for the full name, or 5 for the narrow name.</td>
   </tr>
   <tr>
      <td>y</td>
      <td>Year</td>
   </tr>
   <tr>
      <td>h</td>
      <td>Hour [1-12].</td>
   </tr>
   <tr>
      <td>H</td>
      <td>Hour [0-23].</td>
   </tr>
   <tr>
      <td>m</td>
      <td>Minute. Use one or two for zero padding.</td>
   </tr>
   <tr>
      <td>s</td>
      <td>Second. Use one or two for zero padding.</td>
   </tr>
 </table>
 
 <p>
 The value sent to the server is a locale-independent value, in a hidden field as defined 
 by the name attribute. The value will be formatted conforming to RFC3 339 
 (yyyy-MM-dd'T'HH:mm:ss)
 </p>
 <p>
 The following formats(in order) will be used to parse the values of the attributes 'value', 
 'startDate' and 'endDate':
 </p>
 <ul>
   <li>SimpleDateFormat built using RFC 3339 (yyyy-MM-dd'T'HH:mm:ss)
   <li>SimpleDateFormat.getTimeInstance(DateFormat.SHORT)
   <li>SimpleDateFormat.getDateInstance(DateFormat.SHORT)
   <li>SimpleDateFormat.getDateInstance(DateFormat.MEDIUM)
   <li>SimpleDateFormat.getDateInstance(DateFormat.FULL)
   <li>SimpleDateFormat.getDateInstance(DateFormat.LONG)
   <li>SimpleDateFormat built using the value of the 'displayFormat' attribute(if any)
 </ul>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/datetimepicker.html {% endcomment %}
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

					<td align="left" valign="top">adjustWeeks</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">If true, weekly size of calendar changes to acomodate the month if false, 42 day format is used</td>

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

					<td align="left" valign="top">dayWidth</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">narrow</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">How to render the names of the days in the header(narrow, abbr or wide)</td>

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

					<td align="left" valign="top">displayFormat</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">A pattern used for the visual display of the formatted date, e.g. dd/MM/yyyy</td>

				</tr>

				<tr>

					<td align="left" valign="top">displayWeeks</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">6</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Total weeks to display</td>

				</tr>

				<tr>

					<td align="left" valign="top">endDate</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">2941-10-12</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Date</td>

					<td align="left" valign="top">Last available date in the calendar set</td>

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

					<td align="left" valign="top">formatLength</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">short</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Type of formatting used for visual display. Possible values are long, short, medium or full</td>

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

					<td align="left" valign="top">language</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">brower's specified preferred language</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Language to display this widget in</td>

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

					<td align="left" valign="top">startDate</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">1492-10-12</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Date</td>

					<td align="left" valign="top">First available date in the calendar set</td>

				</tr>

				<tr>

					<td align="left" valign="top">staticDisplay</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Disable all incremental controls, must pick a date in the current display</td>

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

					<td align="left" valign="top">toggleDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">100</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Duration of toggle in milliseconds</td>

				</tr>

				<tr>

					<td align="left" valign="top">toggleType</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">plain</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">oggle type of the dropdown. Possible values are plain,wipe,explode,fade</td>

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

					<td align="left" valign="top">date</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Defines the type of the picker on the dropdown. Possible values are 'date' for a DateTimePicker, and 'time' for a timePicker</td>

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

				<tr>

					<td align="left" valign="top">weekStartsOn</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">0</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Adjusts the first day of the week 0==Sunday..6==Saturday</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/datetimepicker.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

```xml
   <sx:datetimepicker name="order.date" label="Order Date" />
   <sx:datetimepicker name="delivery.date" label="Delivery Date" displayFormat="yyyy-MM-dd"  />
   <sx:datetimepicker name="delivery.date" label="Delivery Date" value="%{date}"  />
   <sx:datetimepicker name="delivery.date" label="Delivery Date" value="%{'2007-01-01'}"  />
   <sx:datetimepicker name="order.date" label="Order Date" value="%{'today'}"/>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

Getting and getting the datetimepicker value, from JavaScript:


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

```xml
 <sx:datetimepicker id="picker" label="Order Date" />
 <script type="text/javascript">
   function setValue() {
      var picker = dojo.widget.byId("picker");
      
      //string value
      picker.setValue('2007-01-01');
      
      //Date value
      picker.setValue(new Date());
   }
   
   function showValue() {
      var picker = dojo.widget.byId("picker");
      
      //string value
      var stringValue = picker.getValue();
      alert(stringValue);
      
      //date value
      var dateValue = picker.getDate();
      alert(dateValue);
   }
 </script>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

Publish topic when value changes


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

```xml
 <sx:datetimepicker id="picker" label="Order Date" valueNotifyTopics="/value"/>
 
 <script type="text/javascript">
 dojo.event.topic.subscribe("/value", function(textEntered, date, widget){
     alert('value changed');
     //textEntered: String enetered in the textbox
     //date: JavaScript Date object with the value selected
     //widet: widget that published the topic 
 });
 </script>  

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java {% endcomment %}

#####div##### {#PAGE_13908}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=core/src/main/java/org/apache/struts2/components/Div.java;h=5967686a4283c45d90558a0831e22122df47f35e;hb=974e051bc5e2541261c44cd6fc27717dfcb3267b {% endcomment %}
<p> Creates an HTML \<div\>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=https://gitbox.apache.org/repos/asf?p=struts.git;a=blob_plain;f=core/src/main/java/org/apache/struts2/components/Div.java;h=5967686a4283c45d90558a0831e22122df47f35e;hb=974e051bc5e2541261c44cd6fc27717dfcb3267b {% endcomment %}



| While this tag can be used with the [simple theme](#PAGE_14291), [xhtml theme](#PAGE_13834), and others, it is really designed to work best with the [ajax theme](#PAGE_14205). We recommend reading the _ajax div template_  documentation for more details.

| 

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/div.html {% endcomment %}
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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/div.html {% endcomment %}

#####dojo div##### {#PAGE_66929}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}
<p> <p>
 This tag generates an HTML div that loads its content using an XMLHttpRequest call, via
 the dojo framework. When the "updateFreq" is set the built in timer will start automatically and 
 reload the div content with the value of "updateFreq" as the refresh period(in milliseconds).
 Topics can be used to stop(stopTimerListenTopics) and start(startTimerListenTopics) this timer.  
 </p>
 <p>
 When used inside a "tabbedpanel" tag, each div becomes a tab. Some attributes are specific
 to this use case, like:
 <ul>
   <li>refreshOnShow: div content is realoded when tab is selected</li>
   <li>closable: Tab will have close button</li>
   <li>preload: load div content after page is loaded</li>
 </ul>
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/div.html {% endcomment %}
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

					<td align="left" valign="top">autoStart</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Start timer automatically</td>

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

					<td align="left" valign="top">closable</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Show a close button when the div is inside a 'tabbedpanel'</td>

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

					<td align="left" valign="top">delay</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">How long to wait before fetching the content (in milliseconds)</td>

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

					<td align="left" valign="top">errorText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The text to display to the user if the is an error fetching the content</td>

				</tr>

				<tr>

					<td align="left" valign="top">executeScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Javascript code in the fetched content will be executed</td>

				</tr>

				<tr>

					<td align="left" valign="top">formFilter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Function name used to filter the fields of the form.</td>

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

					<td align="left" valign="top">handler</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript function name that will make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightColor</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">none</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Color used to perform a highlight effect on this element</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">2000</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Duration of highlight effect in milliseconds. Only valid if 'highlightColor' attribute is set</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The URL to call to obtain the content. Note: If used with ajax context, the value must be set as an url tag value.</td>

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

					<td align="left" valign="top">Id of element that will be shown while making request</td>

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

					<td align="left" valign="top">listenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topic that will trigger the remote call</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Loading...</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to be shown while content is being fetched</td>

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

					<td align="left" valign="top">Comma delimmited list of topics that will published before and after the request, and on errors</td>

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

					<td align="left" valign="top">parseContent</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Parse returned HTML for Dojo widgets</td>

				</tr>

				<tr>

					<td align="left" valign="top">preload</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Load content when page is loaded</td>

				</tr>

				<tr>

					<td align="left" valign="top">refreshOnShow</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Content will be loaded when div becomes visible, used only inside the tabbedpanel tag</td>

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

					<td align="left" valign="top">separateScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Run scripts in a separate scope, unique for each tag</td>

				</tr>

				<tr>

					<td align="left" valign="top">showErrorTransportText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Set whether errors will be shown or not</td>

				</tr>

				<tr>

					<td align="left" valign="top">showLoadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show loading text on targets</td>

				</tr>

				<tr>

					<td align="left" valign="top">startTimerListenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topics that will start the timer (for autoupdate)</td>

				</tr>

				<tr>

					<td align="left" valign="top">stopTimerListenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topics that will stop the timer (for autoupdate)</td>

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

					<td align="left" valign="top">transport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">XMLHTTPTransport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Transport used by Dojo to make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">updateFreq</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">How often to reload the content (in milliseconds)</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/div.html {% endcomment %}

__Examples__

Simple div that loads its content once:


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

```xml
 <sx:div href="%{#url}">Initial Content</sx:div>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

div that reloads its content every 2 seconds, and shows an indicator while reloading:


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

```xml
 <img id="indicator" src="${pageContext.request.contextPath}/images/indicator.gif" style="display:none"/>
 <sx:div href="%{#url}" updateFreq="2000" indicator="indicator">
   Initial Content
 </sx:div>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

div that uses topics to control the timer, highlights its content in red after reload, and submits a form:


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

```xml
 <form id="form">
   <label for="textInput">Text to be submited when div reloads</label>
   <input type=textbox id="textInput" name="data">
 </form>
 <sx:div 
      href="%{#url}" 
      updateFreq="3000"
      listenTopics="/refresh"
      startTimerListenTopics="/startTimer"
      stopTimerListenTopics="/stopTimer"
      highlightColor="red"
      formId="form">
  Initial Content
 </sx:div>

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java {% endcomment %}

#####dojo head##### {#PAGE_66757}

__Description__


{% comment %}start snippet id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}
<p> The "head" tag renders required JavaScript code to configure Dojo and is required in order to use
 any of the tags included in the Dojo plugin.</p>
</p>
{% comment %}end snippet id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}
<p> <p></p>
 
 <p>To debug javascript errors set the "debug" attribute to true, which will display Dojo 
 (and Struts) warning and error messages at the bottom of the page. Core Dojo files are by default
 compressed, to improve loading time, which makes them very hard to read. To debug Dojo and Struts
 widgets, set the "compressed" attribute to true. Make sure to turn this option off before
 moving your project into production, as uncompressed files will take longer to download.
 </p>
 <p>For troubleshooting javascript problems the following configuration is recommended:</p>
 <pre>
   <sx:head debug="true" cache="false" compressed="false" />
 </pre>

 <p>Dojo files are loaded as required by the Dojo loading mechanism. The problem with this
 approach is that the files are not cached by the browser, so reloading a page or navigating
 to a different page that uses the same widgets will cause the files to be reloaded. To solve 
 this problem a custom Dojo profile is distributed with the Dojo plugin. This profile contains
 the files required by the tags in the Dojo plugin, all in one file (524Kb), which is cached 
 by the browser. This file will take longer to load by the browser but it will be downloaded 
 only once. By default the "cache" attribute is set to false.</p>
 
 <p>Some tags like the "datetimepicker" can use different locales, to use a locale
 that is different from the request locale, it must be specified on the "extraLocales" 
 attribute. This attribute can contain a comma separated list of locale names. From
 Dojo's documentation:</p>
 
 <p>
 The locale is a short string, defined by the host environment, which conforms to RFC 3066 
 (http://www.ietf.org/rfc/rfc3066.txt) used in the HTML specification. 
 It consists of short identifiers, typically two characters 
 long which are case-insensitive. Note that Dojo uses dash separators, not underscores like 
 Java (e.g. "en-us", not "en_US"). Typically country codes are used in the optional second 
 identifier, and additional variants may be specified. For example, Japanese is "ja"; 
 Japanese in Japan is "ja-jp". Notice that the lower case is intentional -- while Dojo 
 will often convert all locales to lowercase to normalize them, it is the lowercase that 
 must be used when defining your resources.
 </p>
 
 <p>The "locale" attribute configures Dojo's locale:</p>
 
 <p>"The locale Dojo uses on a page may be overridden by setting djConfig.locale. This may be 
 done to accomodate applications with a known user profile or server pages which do manual
 assembly and assume a certain locale. You may also set djConfig.extraLocale to load 
 localizations in addition to your own, in case you want to specify a particular 
 translation or have multiple languages appear on your page."</p>
 
 <p>To improve loading time, the property "parseContent" is set to false by default. This property will
 instruct Dojo to only build widgets using specific element ids. If the property is set to true
 Dojo will scan the whole document looking for widgets.</p>
 
 <p>Dojo 0.4.3 is distributed with the Dojo plugin, to use a different Dojo version, the 
 "baseRelativePath" attribute can be set to the URL of the Dojo root folder on your application.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}


> 

> 

> If you are planning to nest tags from the Dojo plugin, make sure you set parseContent="false", otherwise each request made by the inner tags will be performed twice.

> 

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html {% endcomment %}
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

					<td align="left" valign="top">baseRelativePath</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">/struts/dojo</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Context relative path of Dojo distribution folder</td>

				</tr>

				<tr>

					<td align="left" valign="top">cache</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Use Struts Dojo profile, which contains all Struts widgets in one file, making it possible to be chached by the browser</td>

				</tr>

				<tr>

					<td align="left" valign="top">compressed</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Use compressed version of dojo.js</td>

				</tr>

				<tr>

					<td align="left" valign="top">debug</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Enable Dojo debug messages</td>

				</tr>

				<tr>

					<td align="left" valign="top">extraLocales</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma separated list of locale names to be loaded by Dojo, locale names must be specified as in RFC3066</td>

				</tr>

				<tr>

					<td align="left" valign="top">locale</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Default locale to be used by Dojo, locale name must be specified as in RFC3066</td>

				</tr>

				<tr>

					<td align="left" valign="top">parseContent</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Parse the whole document for widgets</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}

```xml
 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
 <head>
   <title>My page</title>
   <sx:head/>
 </head>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}

```xml
 <%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
 <head>
   <title>My page</title>
   <sx:head debug="true" extraLocales="en-us,nl-nl,de-de"/>
 </head>

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java {% endcomment %}

#####dojo textarea##### {#PAGE_66931}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TextArea.java {% endcomment %}
<p> Render Dojo Editor2 widget
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TextArea.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/textarea.html {% endcomment %}
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

					<td align="left" valign="top">cols</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">HTML cols attribute</td>

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

					<td align="left" valign="top">readonly</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether the textarea is readonly</td>

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

					<td align="left" valign="top">rows</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">HTML rows attribute</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

				<tr>

					<td align="left" valign="top">wrap</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">HTML wrap attribute</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/textarea.html {% endcomment %}

#####doubleselect##### {#PAGE_14005}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleListUIBean {% endcomment %}
<p> <p>
 Note that the doublelistkey and doublelistvalue attribute will default to "key" and "value"
 respectively only when the doublelist attribute is evaluated to a Map or its descendant.
 Other thing else, will result in doublelistkey and doublelistvalue to be null and not used.
 </p>

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleListUIBean {% endcomment %}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleSelect {% endcomment %}
<p> Renders two HTML select elements with second one changing displayed values depending on selected entry of first one.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleSelect {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/doubleselect.html {% endcomment %}
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

					<td align="left" valign="top">doubleAccesskey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the html accesskey attribute.</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The css class for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The css style for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleDisabled</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Decides if a disable attribute should be added to the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleEmptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Decides if the second list will add an empty option</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleHeaderKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The header key for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleHeaderValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The header value for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleId</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The id of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleList</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The second iterable source to populate from.</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of second list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of second list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The key expression to use for second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of second list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The value expression to use for second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleMultiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Decides if multiple attribute should be set on the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleName</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The name for complete component</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnblur</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onblur attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnchange</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onchange attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onclick attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOndblclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the ondbclick attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnfocus</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onfocus attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnkeydown</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onkeydown attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnkeypress</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onkeypress attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnkeyup</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onkeyup attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmousedown</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmousedown attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmousemove</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmousemove attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmouseout</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmouseout attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmouseover</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmouseover attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmouseup</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmouseup attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnselect</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onselect attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleSize</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the size attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The value expression for complete component</td>

				</tr>

				<tr>

					<td align="left" valign="top">emptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Decides of an empty option is to be inserted in the second list</td>

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

					<td align="left" valign="top">formName</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The form name this component resides in and populates to</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the header key of the second list. Must not be empty! '-1' and '' is correct, '' is bad.</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Set the header value of the second list</td>

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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

				</tr>

				<tr>

					<td align="left" valign="top">multiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Creates a multiple select. The tag will pre-select multiple values if the values are passed as an Array (of appropriate types) via the value attribute.</td>

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

					<td align="left" valign="top">size</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Size of the element box (# of elements to show)</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/doubleselect.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DoubleSelect {% endcomment %}

```xml
 <s:doubleselect label="doubleselect test1" name="menu" list="{'fruit','other'}" doubleName="dishes" doubleList="top == 'fruit' ? {'apple', 'orange'} : {'monkey', 'chicken'}" />
 <s:doubleselect label="doubleselect test2" name="menu" list="#{'fruit':'Nice Fruits', 'other':'Other Dishes'}" doubleName="dishes" doubleList="top == 'fruit' ? {'apple', 'orange'} : {'monkey', 'chicken'}" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DoubleSelect {% endcomment %}

#####fielderror##### {#PAGE_14151}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.FieldError {% endcomment %}
<p>
 Render field errors if they exists. Specific layout depends on the particular theme.
 The field error strings will be html escaped by default.

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.FieldError {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/fielderror.html {% endcomment %}
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

					<td align="left" valign="top">escape</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top"> Whether to escape HTML</td>

				</tr>

				<tr>

					<td align="left" valign="top">fieldName</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Field name for single field attribute usage</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/fielderror.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.FieldError {% endcomment %}

```xml

    <!-- example 1 -->
    <s:fielderror />

    <!-- example 2 -->
    <s:fielderror>
         <s:param>field1</s:param>
         <s:param>field2</s:param>
    </s:fielderror>
    <s:form .... >
       ....
    </s:form>

    OR

    <s:fielderror>
          <s:param value="%{'field1'}" />
          <s:param value="%{'field2'}" />
    </s:fielderror>
    <s:form .... >
       ....
    </s:form>

    OR

    <s:fielderror fieldName="field1" />


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.FieldError {% endcomment %}


{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.components.FieldError {% endcomment %}
<p>
 Example 1: display all field errors<br>
 Example 2: display field errors only for 'field1' and 'field2'<br>

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.components.FieldError {% endcomment %}

#####file##### {#PAGE_14283}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.File {% endcomment %}
<p> Renders an HTML file input element.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.File {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/file.html {% endcomment %}
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

					<td align="left" valign="top">accept</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">HTML accept attribute to indicate accepted file mimetypes</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/file.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.File {% endcomment %}

```xml
 <s:file name="anUploadFile" accept="text/*" />
 <s:file name="anohterUploadFIle" accept="text/html,text/plain" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.File {% endcomment %}

#####form##### {#PAGE_14201}


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

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/form.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form {% endcomment %}

```xml

 <s:form ... />


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form {% endcomment %}

__Validation__

There are two flavours _Client Side Validation_ , depending on the theme you are using (xhtml, ajax, etc). If you are using the [xhtml theme](#PAGE_13834) or [css_xhtml theme](#PAGE_14215), pure client side validation will be used. If you are using the [ajax theme](#PAGE_14205), a special AJAX-based validation will take place. Read the _Client Side Validation_  docs for more information.

#####head##### {#PAGE_13997}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Head {% endcomment %}
<p>
 Renders parts of the HEAD section for an HTML file. Encoding can be set using this tag.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Head {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/head.html {% endcomment %}
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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/head.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Head {% endcomment %}

```xml
 <head>
   <title>My page</title>
   <s:head/>
 </head>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Head {% endcomment %}

#####hidden##### {#PAGE_14313}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Hidden {% endcomment %}
<p> Renders an HTML input element of type hidden, populated by the specified property from the ValueStack.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Hidden {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/hidden.html {% endcomment %}
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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/hidden.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Hidden {% endcomment %}

```xml
 <-- example one -->
 <s:hidden name="foo" />
 <-- example two -->
 <s:hidden name="foo" value="%{bar}" />

 Example One Resulting HTML (if foo evaluates to bar):
 <input type="hidden" name="foo" value="bar" />
 Example Two Resulting HTML (if getBar method of the action returns 'bar')
 <input type="hidden" name="foo" value="bar" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Hidden {% endcomment %}

#####inputtransferselect##### {#PAGE_17268774}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.InputTransferSelect {% endcomment %}
<p> <p>
 Create a input transfer select component which is basically an text input
 and  <select ...> tag with buttons in the middle of them allowing text
 to be added to the transfer select. Will auto-select all its
 elements upon its containing form submission.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.InputTransferSelect {% endcomment %}

{% comment %}start snippet id=notice|javadoc=true|url=org.apache.struts2.components.InputTransferSelect {% endcomment %}
<p> <p>
 NOTE: The id and doubleId need not be supplied as they will generated provided
 that the inputtransferselect tag is being used in a form tag. The generated id
 and doubleId will be <form_id>_<inputtransferselect_doubleName> and
 <form_id>_<inputtransferselect_doubleName> respectively.
 </p>
</p>
{% comment %}end snippet id=notice|javadoc=true|url=org.apache.struts2.components.InputTransferSelect {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/inputtransferselect.html {% endcomment %}
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

					<td align="left" valign="top">addLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the label used for the add button</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowRemoveAll</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Determine whether the remove all button will display</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowUpDown</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Determine whether items in the list can be reordered</td>

				</tr>

				<tr>

					<td align="left" valign="top">buttonCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the css class used for rendering buttons</td>

				</tr>

				<tr>

					<td align="left" valign="top">buttonCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the css style used for rendering buttons</td>

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

					<td align="left" valign="top">downLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the label used for the down button</td>

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

					<td align="left" valign="top">headerKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the header key of the select box</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the header value of the select box</td>

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

					<td align="left" valign="top">leftTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the left hand title</td>

				</tr>

				<tr>

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

				</tr>

				<tr>

					<td align="left" valign="top">multiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Determine whether or not multiple entries are shown</td>

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

					<td align="left" valign="top">removeAllLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the label used for the remove all button</td>

				</tr>

				<tr>

					<td align="left" valign="top">removeLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the label used for the remove button</td>

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

					<td align="left" valign="top">rightTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the right hand title</td>

				</tr>

				<tr>

					<td align="left" valign="top">size</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the size of the select box</td>

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

					<td align="left" valign="top">upLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the label used for the up button</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/inputtransferselect.html {% endcomment %}

__Example__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.InputTransferSelect {% endcomment %}

```xml

 <-- minimum configuration -->
 <s:inputtransferselect
      label="Favourite Cartoons Characters"
      name="cartoons"
      list="{'Popeye', 'He-Man', 'Spiderman'}"
  />


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.InputTransferSelect {% endcomment %}

#####label##### {#PAGE_14167}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Label {% endcomment %}
<p> <p>Renders an HTML LABEL that will allow you to output label:name combination that has the same format treatment as
 the rest of your UI controls.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Label {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/label.html {% endcomment %}
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

					<td align="left" valign="top">for</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> HTML for attribute</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/label.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Label {% endcomment %}

```xml
 <s:label key="userName" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Label {% endcomment %}


{% comment %}start snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Label {% endcomment %}

```none
 <p>In this example, a label is rendered. The label is retrieved from a ResourceBundle via the key attribute
 giving you an output of 'User Name: Ford.Prefect'. Assuming that i18n message userName corresponds
 to 'User Name' and the action's getUserName() method returns 'Ford.Prefect'</p>

```

{% comment %}end snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Label {% endcomment %}

#####optgroup##### {#PAGE_14170}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}
<p> <p>
 Create a optgroup component which needs to resides within a select tag.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

{% comment %}start snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}
<p> <p>
 This component is to be used within a  Select component.
 </p>

</p>
{% comment %}end snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/optgroup.html {% endcomment %}
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

					<td align="left" valign="top">disabled</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the disable attribute.</td>

				</tr>

				<tr>

					<td align="left" valign="top">label</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the label attribute</td>

				</tr>

				<tr>

					<td align="left" valign="top">list</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the list attribute.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the listKey attribute.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the listValue attribute.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/optgroup.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

```xml

 <s:select label="My Selection"
            name="mySelection"
            value="%{'POPEYE'}"
            list="%{#{'SUPERMAN':'Superman', 'SPIDERMAN':'spiderman'}}">
    <s:optgroup label="Adult"
                 list="%{#{'SOUTH_PARK':'South Park'}}" />
    <s:optgroup label="Japanese"
                 list="%{#{'POKEMON':'pokemon','DIGIMON':'digimon','SAILORMOON':'Sailormoon'}}" />
 </s:select>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptGroup {% endcomment %}

#####optiontransferselect##### {#PAGE_13943}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleListUIBean {% endcomment %}
<p> <p>
 Note that the doublelistkey and doublelistvalue attribute will default to "key" and "value"
 respectively only when the doublelist attribute is evaluated to a Map or its descendant.
 Other thing else, will result in doublelistkey and doublelistvalue to be null and not used.
 </p>

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleListUIBean {% endcomment %}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect {% endcomment %}
<p> <p>
 Create a option transfer select component which is basically two <select ...>
 tag with buttons in the middle of them allowing options in each of the
 <select ...> to be moved between themselves. Will auto-select all its
 elements upon its containing form submision.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect {% endcomment %}


{% comment %}start snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect {% endcomment %}
<p> <p>
 NOTE: The id and doubleId need not be supplied as they will generated provided
 that the optiontransferselect tag is being used in a form tag. The generated id
 and doubleId will be <form_id>_<optiontransferselect_nameame> and
 <form_id>_<optiontransferselect_doubleName> respectively.
 </p>

</p>
{% comment %}end snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/optiontransferselect.html {% endcomment %}
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

					<td align="left" valign="top">addAllToLeftLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Add To Left button label</td>

				</tr>

				<tr>

					<td align="left" valign="top">addAllToLeftOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after Add All To Left button pressed</td>

				</tr>

				<tr>

					<td align="left" valign="top">addAllToRightLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Add All To Right button label</td>

				</tr>

				<tr>

					<td align="left" valign="top">addAllToRightOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after Add All To Right button pressed</td>

				</tr>

				<tr>

					<td align="left" valign="top">addToLeftLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Add To Left button label</td>

				</tr>

				<tr>

					<td align="left" valign="top">addToLeftOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after Add To Left button pressed</td>

				</tr>

				<tr>

					<td align="left" valign="top">addToRightLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Add To Right button label</td>

				</tr>

				<tr>

					<td align="left" valign="top">addToRightOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after Add To Right button pressed</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowAddAllToLeft</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable Add All To Left button</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowAddAllToRight</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable Add All To Right button</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowAddToLeft</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable Add To Left button</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowAddToRight</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable Add To Right button</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowSelectAll</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable Select All button</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowUpDownOnLeft</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable up / down on the left side</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowUpDownOnRight</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Enable up / down on the right side</td>

				</tr>

				<tr>

					<td align="left" valign="top">buttonCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set buttons css class</td>

				</tr>

				<tr>

					<td align="left" valign="top">buttonCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set button css style</td>

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

					<td align="left" valign="top">doubleAccesskey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the html accesskey attribute.</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The css class for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The css style for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleDisabled</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Decides if a disable attribute should be added to the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleEmptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Decides if the second list will add an empty option</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleHeaderKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The header key for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleHeaderValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The header value for the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleId</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The id of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleList</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The second iterable source to populate from.</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of second list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of second list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The key expression to use for second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of second list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleListValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The value expression to use for second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleMultiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Decides if multiple attribute should be set on the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleName</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The name for complete component</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnblur</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onblur attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnchange</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onchange attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onclick attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOndblclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the ondbclick attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnfocus</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onfocus attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnkeydown</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onkeydown attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnkeypress</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onkeypress attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnkeyup</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onkeyup attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmousedown</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmousedown attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmousemove</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmousemove attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmouseout</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmouseout attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmouseover</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmouseover attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnmouseup</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onmouseup attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleOnselect</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the onselect attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleSize</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the size attribute of the second list</td>

				</tr>

				<tr>

					<td align="left" valign="top">doubleValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The value expression for complete component</td>

				</tr>

				<tr>

					<td align="left" valign="top">emptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Decides of an empty option is to be inserted in the second list</td>

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

					<td align="left" valign="top">formName</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The form name this component resides in and populates to</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set the header key of the second list. Must not be empty! '-1' and '' is correct, '' is bad.</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Set the header value of the second list</td>

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

					<td align="left" valign="top">leftDownLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Down label for the left side.</td>

				</tr>

				<tr>

					<td align="left" valign="top">leftTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Left title</td>

				</tr>

				<tr>

					<td align="left" valign="top">leftUpLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Up label for the left side</td>

				</tr>

				<tr>

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

				</tr>

				<tr>

					<td align="left" valign="top">multiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Creates a multiple select. The tag will pre-select multiple values if the values are passed as an Array (of appropriate types) via the value attribute.</td>

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

					<td align="left" valign="top">rightDownLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Down label for the left side.</td>

				</tr>

				<tr>

					<td align="left" valign="top">rightTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Right title</td>

				</tr>

				<tr>

					<td align="left" valign="top">rightUpLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Up label for the right side.</td>

				</tr>

				<tr>

					<td align="left" valign="top">selectAllLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Set Select All button label</td>

				</tr>

				<tr>

					<td align="left" valign="top">selectAllOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after Select All button pressed</td>

				</tr>

				<tr>

					<td align="left" valign="top">size</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Size of the element box (# of elements to show)</td>

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

					<td align="left" valign="top">upDownOnLeftOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after up / down on the left side buttons pressed</td>

				</tr>

				<tr>

					<td align="left" valign="top">upDownOnRightOnclick</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript to run after up / down on the right side buttons pressed</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/optiontransferselect.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect {% endcomment %}

```xml

 <-- minimum configuration -->
 <s:optiontransferselect
      label="Favourite Cartoons Characters"
      name="leftSideCartoonCharacters"
      list="{'Popeye', 'He-Man', 'Spiderman'}"
      doubleName="rightSideCartoonCharacters"
      doubleList="{'Superman', 'Mickey Mouse', 'Donald Duck'}"
  />

  <-- possible configuration -->
  <s:optiontransferselect
      label="Favourite Cartoons Characters"
      name="leftSideCartoonCharacters"
      leftTitle="Left Title"
      rightTitle="Right Title"
      list="{'Popeye', 'He-Man', 'Spiderman'}"
      multiple="true"
      headerKey="headerKey"
      headerValue="--- Please Select ---"
      emptyOption="true"
      doubleList="{'Superman', 'Mickey Mouse', 'Donald Duck'}"
      doubleName="rightSideCartoonCharacters"
      doubleHeaderKey="doubleHeaderKey"
      doubleHeaderValue="--- Please Select ---"
      doubleEmptyOption="true"
      doubleMultiple="true"
  />


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect {% endcomment %}

#####password##### {#PAGE_13826}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Password {% endcomment %}
<p> <p>Render an HTML input tag of type password.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Password {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/password.html {% endcomment %}
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

					<td align="left" valign="top">showPassword</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether to show input</td>

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

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/password.html {% endcomment %}

__Examples__



{% comment %}start snippet id=exdescription|javadoc=true|lang=none|url=org.apache.struts2.components.Password {% endcomment %}

```none
 <p>
 In this example, a password control is displayed. For the label, we are calling ActionSupport's getText() to
 retrieve password label from a resource bundle.
 </p>

```

{% comment %}end snippet id=exdescription|javadoc=true|lang=none|url=org.apache.struts2.components.Password {% endcomment %}


{% comment %}start snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Password {% endcomment %}

```xml
 <s:password label="%{text('password')}" name="password" size="10" maxlength="15" />

```

{% comment %}end snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Password {% endcomment %}

#####radio##### {#PAGE_14226}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean {% endcomment %}
<p> <p>
 Note that the listkey and listvalue attribute will default to "key" and "value"
 respectively only when the list attribute is evaluated to a Map or its descendant.
 Everything else will result in listkey and listvalue to be null and not used.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean {% endcomment %}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Radio {% endcomment %}
<p> <p>Render a radio button input field.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Radio {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/radio.html {% endcomment %}
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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/radio.html {% endcomment %}

__Examples__



{% comment %}start snippet id=exdescription|javadoc=true|url=org.apache.struts2.components.Radio {% endcomment %}
<p> In this example, a radio control is displayed with a list of genders. The gender list is built from attribute
 id=genders. The framework calls getGenders() which will return a Map. For examples using listKey and listValue attributes,
 see the section select tag. The default selected one will be determined (in this case) by the getMale() method
 in the action class which should return a value similar to the key of the getGenders() map if that particular
 gender is to be selected.
</p>
{% comment %}end snippet id=exdescription|javadoc=true|url=org.apache.struts2.components.Radio {% endcomment %}


{% comment %}start snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio {% endcomment %}

```xml
 <s:action name="GenderMap" var="genders"/>
 <s:radio label="Gender" name="male" list="#genders.genders"/>

```

{% comment %}end snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio {% endcomment %}


{% comment %}start snippet id=example_fmt|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio {% endcomment %}

```xml
 <@s.radio name="car" list={"ford": "Ford Motor Co", "toyota": "Toyota"} listKey="key" listValue="value" />

```

{% comment %}end snippet id=example_fmt|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio {% endcomment %}

#####reset##### {#PAGE_13833}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Reset {% endcomment %}
<p> Render a reset button. The reset tag is used together with the form tag to provide form resetting.
 The reset can have two different types of rendering:
 <ul>
 <li>input: renders as html <input type="reset"...></li>
 <li>button: renders as html <button type="reset"...></li>
 </ul>
 Please note that the button type has advantages by adding the possibility to separate the submitted value from the
 text shown on the button face, but has issues with Microsoft Internet Explorer at least up to 6.0
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Reset {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/reset.html {% endcomment %}
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

					<td align="left" valign="top">Supply a reset button text apart from reset value. Will have no effect for <i>input</i> type reset, since button text will always be the value parameter.</td>

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

					<td align="left" valign="top">Supply an image src for <i>image</i> type reset button. Will have no effect for types <i>input</i> and <i>button</i>.</td>

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

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/reset.html {% endcomment %}

__Examples__

__Example 1__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset {% endcomment %}

```xml
 <s:reset value="Reset" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset {% endcomment %}

__Example 2__



{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset {% endcomment %}

```xml
 Render a reset button:
 <s:reset type="button" key="reset"/>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset {% endcomment %}

#####select##### {#PAGE_14127}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Select {% endcomment %}
<p>
 Render an HTML input tag of type select.

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Select {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/select.html {% endcomment %}
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

					<td align="left" valign="top">emptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether or not to add an empty (--) option after the header option</td>

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

					<td align="left" valign="top">headerKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Key for first item in list. Must not be empty! '-1' and '' is correct, '' is bad.</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Value expression for first item in list</td>

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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

				</tr>

				<tr>

					<td align="left" valign="top">multiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top"> Creates a multiple select. The tag will pre-select multiple values if the values are passed as an Array or a Collection(of appropriate types) via the value attribute. If one of the keys equals one of the values in the Collection or Array it wil be selected</td>

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

					<td align="left" valign="top">size</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Size of the element box (# of elements to show)</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/select.html {% endcomment %}

__Examples__



{% comment %}start snippet id=exnote|javadoc=true|lang=none|url=org.apache.struts2.components.Select {% endcomment %}

```none

 Note: For any of the tags that use lists (select probably being the most ubiquitous), which uses the OGNL list
 notation (see the "months" example above), it should be noted that the map key created (in the months example,
 the '01', '02', etc.) is typed. '1' is a char, '01' is a String, "1" is a String. This is important since if
 the value returned by your "value" attribute is NOT the same type as the key in the "list" attribute, they
 WILL NOT MATCH, even though their String values may be equivalent. If they don't match, nothing in your list
 will be auto-selected.


```

{% comment %}end snippet id=exnote|javadoc=true|lang=none|url=org.apache.struts2.components.Select {% endcomment %}


{% comment %}start snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Select {% endcomment %}

```xml

 <s:select label="Pets"
        name="petIds"
        list="petDao.pets"
        listKey="id"
        listValue="name"
        multiple="true"
        size="3"
        required="true"
        value="%{petDao.pets.{id}}"
 />

 <s:select label="Months"
        name="months"
        headerKey="-1" headerValue="Select Month"
        list="#{'01':'Jan', '02':'Feb', [...]}"
        value="selectedMonth"
        required="true"
 />

 // The month id (01, 02, ...) returned by the getSelectedMonth() call
 // against the stack will be auto-selected


```

{% comment %}end snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Select {% endcomment %}

#####submit##### {#PAGE_14054}


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
 text shown on the button face, but has issues with Microsoft Internet Explorer at least up to 6.0
</p>
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

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/submit.html {% endcomment %}

#####tabbedPanel##### {#PAGE_14222}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java {% endcomment %}
<p> The tabbedpanel widget is primarily an AJAX component, where each tab can either be local content or remote
 content (refreshed each time the user selects that tab).</p>
 If the useSelectedTabCookie attribute is set to true, the id of the selected tab is saved in a cookie on activation.
 When coming back to this view, the cookie is read and the tab will be activated again, unless an actual value for the
 selectedTab attribute is specified.</p>
 If you want to use the cookie feature, please be sure that you provide a unique id for your tabbedpanel component,
 since this will also be the identifying name component of the stored cookie.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html {% endcomment %}
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

					<td align="left" valign="top">ajaxAfterValidation</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Make an asynchronous request if validation succeeds. Only valid if 'validate' is 'true'</td>

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

					<td align="left" valign="top">errorText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The text to display to the user if the is an error fetching the content</td>

				</tr>

				<tr>

					<td align="left" valign="top">executeScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Javascript code in the fetched content will be executed</td>

				</tr>

				<tr>

					<td align="left" valign="top">formFilter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Function name used to filter the fields of the form.</td>

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

					<td align="left" valign="top">handler</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript function name that will make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightColor</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">none</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Color used to perform a highlight effect on the elements specified in the 'targets' attribute</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">2000</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Duration of highlight effect in milliseconds. Only valid if 'highlightColor' attribute is set</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The URL to call to obtain the content. Note: If used with ajax context, the value must be set as an url tag value.</td>

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

					<td align="left" valign="top">Id of element that will be shown while making request</td>

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

					<td align="left" valign="top">listenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topic that will trigger the remote call</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Loading...</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to be shown while content is being fetched</td>

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

					<td align="left" valign="top">Comma delimmited list of topics that will published before and after the request, and on errors</td>

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

					<td align="left" valign="top">parseContent</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Parse returned HTML for Dojo widgets</td>

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

					<td align="left" valign="top">separateScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Run scripts in a separate scope, unique for each tag</td>

				</tr>

				<tr>

					<td align="left" valign="top">showErrorTransportText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Set whether errors will be shown or not</td>

				</tr>

				<tr>

					<td align="left" valign="top">showLoadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show loading text on targets</td>

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

					<td align="left" valign="top">targets</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimited list of ids of the elements whose content will be updated</td>

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

					<td align="left" valign="top">transport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">XMLHTTPTransport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Transport used by Dojo to make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">validate</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Perform Ajax validation. 'ajaxValidation' interceptor must be applied to action</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html {% endcomment %}

__Examples__

The following is an example of a tabbedpanel and panel tag utilizing local and remote content:


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java {% endcomment %}

```xml
 <sx:head />
 <sx:tabbedpanel id="test" >
    <sx:div id="one" label="one" theme="ajax" labelposition="top" >
        This is the first pane<br/>
        <s:form>
            <s:textfield name="tt" label="Test Text"/>  <br/>
            <s:textfield name="tt2" label="Test Text2"/>
        </s:form>
    </sx:div>
    <sx:div id="three" label="remote" theme="ajax" href="/AjaxTest.action" >
        This is the remote tab
    </sx:div>
 </sx:tabbedpanel>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java {% endcomment %}

Use notify topics to prevent a tab from being selected:


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java {% endcomment %}

```xml
 <sx:head />
 <script type="text/javascript">
 dojo.event.topic.subscribe("/beforeSelect", function(event, tab, tabContainer){
     event.cancel = true;
 });
 </script>
 
 <sx:tabbedpanel id="test" beforeSelectTabNotifyTopics="/beforeSelect">
    <sx:div id="three" label="remote" theme="ajax" href="/AjaxTest.action" >
        One Tab
    </sx:div>
    <sx:div id="three" label="remote" theme="ajax" href="/AjaxTest.action" >
        Another tab
    </sx:div>
 </sx:tabbedpanel>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java {% endcomment %}

#####textarea##### {#PAGE_13926}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.TextArea {% endcomment %}
<p> <p>Render HTML textarea tag.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.TextArea {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/textarea.html {% endcomment %}
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

					<td align="left" valign="top">class</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The css class to use for element - it's an alias of cssClass attribute.</td>

				</tr>

				<tr>

					<td align="left" valign="top">cols</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">HTML cols attribute</td>

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

					<td align="left" valign="top">readonly</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether the textarea is readonly</td>

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

					<td align="left" valign="top">rows</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">HTML rows attribute</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

				<tr>

					<td align="left" valign="top">wrap</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">HTML wrap attribute</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/textarea.html {% endcomment %}

__Example__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextArea {% endcomment %}

```xml
 <s:textarea label="Comments" name="comments" cols="30" rows="8"/>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextArea {% endcomment %}

#####textfield##### {#PAGE_13912}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.TextField {% endcomment %}
<p> <p>Render an HTML input field of type text</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.TextField {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/textfield.html {% endcomment %}
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

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/textfield.html {% endcomment %}

__Examples__



{% comment %}start snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.TextField {% endcomment %}

```none
 In this example, a text control for the "user" property is rendered. The label is also retrieved from a ResourceBundle via the key attribute.

```

{% comment %}end snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.TextField {% endcomment %}


{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextField {% endcomment %}

```xml
 <s:textfield key="user" />

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextField {% endcomment %}

#####token##### {#PAGE_13998}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Token {% endcomment %}
<p> <p>Stop double-submission of forms.</p>

 <p>
 The token tag is used to help with the "double click" submission problem. It is needed if you are using the
 TokenInterceptor or the TokenSessionInterceptor. The s:token tag merely places a hidden element that contains
 the unique token.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Token {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/token.html {% endcomment %}
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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/token.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Token {% endcomment %}

```xml
 <s:token />

```

{% comment %}end snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Token {% endcomment %}

#####tree##### {#PAGE_14168}

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

#####treenode##### {#PAGE_14288}

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

		</table>

</p>
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

#####updownselect##### {#PAGE_13884}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean {% endcomment %}
<p> <p>
 Note that the listkey and listvalue attribute will default to "key" and "value"
 respectively only when the list attribute is evaluated to a Map or its descendant.
 Everything else will result in listkey and listvalue to be null and not used.
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean {% endcomment %}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.UpDownSelect {% endcomment %}
<p> <p>
 Create a Select component with buttons to move the elements in the select component
 up and down. When the containing form is submited, its elements will be submitted in
 the order they are arranged (top to bottom).
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.UpDownSelect {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/updownselect.html {% endcomment %}
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

					<td align="left" valign="top">allowMoveDown</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether move down button should be displayed</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowMoveUp</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether move up button should be displayed</td>

				</tr>

				<tr>

					<td align="left" valign="top">allowSelectAll</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether or not select all button should be displayed</td>

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

					<td align="left" valign="top">emptyOption</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Whether or not to add an empty (--) option after the header option</td>

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

					<td align="left" valign="top">headerKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top"> Key for first item in list. Must not be empty! '-1' and '' is correct, '' is bad.</td>

				</tr>

				<tr>

					<td align="left" valign="top">headerValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Value expression for first item in list</td>

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

					<td align="left" valign="top">list</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssClass</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css class from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listCssStyle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get css style from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listLabelKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to be used to lookup for localised version of field label</td>

				</tr>

				<tr>

					<td align="left" valign="top">listTitle</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get title from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValue</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field content from</td>

				</tr>

				<tr>

					<td align="left" valign="top">listValueKey</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Property of list objects to get field value label from</td>

				</tr>

				<tr>

					<td align="left" valign="top">moveDownLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">v</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to display on the move down button</td>

				</tr>

				<tr>

					<td align="left" valign="top">moveUpLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">^</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to display on the move up button</td>

				</tr>

				<tr>

					<td align="left" valign="top">multiple</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top"> Creates a multiple select. The tag will pre-select multiple values if the values are passed as an Array or a Collection(of appropriate types) via the value attribute. If one of the keys equals one of the values in the Collection or Array it wil be selected</td>

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

					<td align="left" valign="top">selectAllLabel</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">*</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to display on the select all button</td>

				</tr>

				<tr>

					<td align="left" valign="top">size</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Size of the element box (# of elements to show)</td>

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

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Preset the value of input element.</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/updownselect.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.UpDownSelect {% endcomment %}

```xml

 <!-- Example 1: simple example -->
 <s:updownselect
 list="#{'england':'England', 'america':'America', 'germany':'Germany'}"
 name="prioritisedFavouriteCountries"
 headerKey="-1"
 headerValue="--- Please Order Them Accordingly ---"
 emptyOption="true" />

 <!-- Example 2: more complex example -->
 <s:updownselect
 list="defaultFavouriteCartoonCharacters"
 name="prioritisedFavouriteCartoonCharacters"
 headerKey="-1"
 headerValue="--- Please Order ---"
 emptyOption="true"
 allowMoveUp="true"
 allowMoveDown="true"
 allowSelectAll="true"
 moveUpLabel="Move Up"
 moveDownLabel="Move Down"
 selectAllLabel="Select All" />


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.UpDownSelect {% endcomment %}

####dojo anchor#### {#PAGE_66791}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}
<p> <p>
 A tag that creates an HTML <a/> element, that when clicked makes an asynchronous request(XMLHttpRequest). The url
 attribute must be build using the <s:url/> tag. 
 </p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ . Resulting in an "undefined" message in the content's, instead of the result of the request.

One possible alternative is to set _showLoadingText="false"_  and set the indicator attribute to an element showing the desired loading text or image (outside the div).


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <sx:a targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html {% endcomment %}
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

					<td align="left" valign="top">ajaxAfterValidation</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Make an asynchronous request if validation succeeds. Only valid if 'validate' is 'true'</td>

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

					<td align="left" valign="top">errorText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The text to display to the user if the is an error fetching the content</td>

				</tr>

				<tr>

					<td align="left" valign="top">executeScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Javascript code in the fetched content will be executed</td>

				</tr>

				<tr>

					<td align="left" valign="top">formFilter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Function name used to filter the fields of the form.</td>

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

					<td align="left" valign="top">handler</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript function name that will make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightColor</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">none</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Color used to perform a highlight effect on the elements specified in the 'targets' attribute</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">2000</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Duration of highlight effect in milliseconds. Only valid if 'highlightColor' attribute is set</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The URL to call to obtain the content. Note: If used with ajax context, the value must be set as an url tag value.</td>

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

					<td align="left" valign="top">Id of element that will be shown while making request</td>

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

					<td align="left" valign="top">listenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topic that will trigger the remote call</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Loading...</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to be shown while content is being fetched</td>

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

					<td align="left" valign="top">Comma delimmited list of topics that will published before and after the request, and on errors</td>

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

					<td align="left" valign="top">parseContent</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Parse returned HTML for Dojo widgets</td>

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

					<td align="left" valign="top">separateScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Run scripts in a separate scope, unique for each tag</td>

				</tr>

				<tr>

					<td align="left" valign="top">showErrorTransportText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Set whether errors will be shown or not</td>

				</tr>

				<tr>

					<td align="left" valign="top">showLoadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show loading text on targets</td>

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

					<td align="left" valign="top">targets</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimited list of ids of the elements whose content will be updated</td>

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

					<td align="left" valign="top">transport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">XMLHTTPTransport</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Transport used by Dojo to make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">validate</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Perform Ajax validation. 'ajaxValidation' interceptor must be applied to action</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html {% endcomment %}

__Examples__

Update target content with html returned from an action:


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

```xml
 <div id="div1">Div 1</div>
 <s:url id="ajaxTest" value="/AjaxTest.action"/>
 
 <sx:a id="link1" href="%{ajaxTest}" target="div1">
      Update Content
 </sx:a>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

Submit form(anchor inside the form):


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

```xml
 <s:form id="form" action="AjaxTest">
      <input type="textbox" name="data">
      <sx:a>Submit form</sx:a>           
 </s:form>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

Submit form(anchor outside the form):


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

```xml
 <s:form id="form" action="AjaxTest">
      <input type="textbox" name="data">   
 </s:form>
 
 <sx:a formId="form">Submit form</sx:a>

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

Using beforeNotifyTopics:


{% comment %}start snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/before", function(event, widget){
     alert('inside a topic event. before request');
     //event: set event.cancel = true, to cancel request
     //widget: widget that published the topic
 });
 </script>         
 
 <sx:a beforeNotifyTopics="/before">Publish topics</sx:a>

```

{% comment %}end snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

Using afterNotifyTopics and highlights target:


{% comment %}start snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/after", function(data, request, widget){
     alert('inside a topic event. after request');
     //data : text returned from request(the html)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>        
 
 <sx:a afterNotifyTopics="/after" highlightColor="red" href="%{#ajaxTest}">Publish topics</sx:a>

```

{% comment %}end snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

Using errorNotifyTopics and indicator:


{% comment %}start snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/error", function(error, request, widget){
     alert('inside a topic event. on error');
     //error : error object (error.message has the error message)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>         
 
 <img id="ind1" src="${pageContext.request.contextPath}/images/indicator.gif" style="display:none"/>
 <sx:a errorNotifyTopics="/error" indicator="ind1" href="%{#ajaxTest}">Publish topics</sx:a>

```

{% comment %}end snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java {% endcomment %}

####dojo submit#### {#PAGE_66801}

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}
<p> Renders a submit button that can submit a form asynchronously.
 The submit can have three different types of rendering:
 <ul>
 <li>input: renders as html <input type="submit"...></li>
 <li>image: renders as html <input type="image"...></li>
 <li>button: renders as html <button type="submit"...></li>
 </ul>
 Please note that the button type has advantages by adding the possibility to seperate the submitted value from the
 text shown on the button face, but has issues with Microsoft Internet Explorer at least up to 6.0
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ . Resulting in an "undefined" message in the content's, instead of the result of the request.

One possible alternative is to set _showLoadingText="false"_ (the default) and set the indicator attribute to an element showing the desired loading text or image (outside the div).


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <sx:submit  targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/submit.html {% endcomment %}
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

					<td align="left" valign="top">ajaxAfterValidation</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Make an asynchronous request if validation succeeds. Only valid if 'validate' is 'true'</td>

				</tr>

				<tr>

					<td align="left" valign="top">align</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">HTML align attribute.</td>

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

					<td align="left" valign="top">errorText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The text to display to the user if the is an error fetching the content</td>

				</tr>

				<tr>

					<td align="left" valign="top">executeScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Javascript code in the fetched content will be executed</td>

				</tr>

				<tr>

					<td align="left" valign="top">formFilter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Function name used to filter the fields of the form.</td>

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

					<td align="left" valign="top">handler</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Javascript function name that will make the request</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightColor</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">none</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Color used to perform a highlight effect on the elements specified in the 'targets' attribute</td>

				</tr>

				<tr>

					<td align="left" valign="top">highlightDuration</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">1000</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Duration of highlight effect in milliseconds. Only valid if 'highlightColor' attribute is set</td>

				</tr>

				<tr>

					<td align="left" valign="top">href</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The URL to call to obtain the content. Note: If used with ajax context, the value must be set as an url tag value.</td>

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

					<td align="left" valign="top">Set indicator</td>

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

					<td align="left" valign="top">Label expression used for rendering a element specific label</td>

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

					<td align="left" valign="top">listenTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Topic that will trigger the remote call</td>

				</tr>

				<tr>

					<td align="left" valign="top">loadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Loading...</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Text to be shown while content is being fetched</td>

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

					<td align="left" valign="top">notifyTopics</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimmited list of topics that will published before and after the request, and on errors</td>

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

					<td align="left" valign="top">parseContent</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Parse returned HTML for Dojo widgets</td>

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

					<td align="left" valign="top">separateScripts</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Run scripts in a separate scope, unique for each tag</td>

				</tr>

				<tr>

					<td align="left" valign="top">showErrorTransportText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">true</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Set whether errors will be shown or not</td>

				</tr>

				<tr>

					<td align="left" valign="top">showLoadingText</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Show loading text on targets</td>

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

					<td align="left" valign="top">targets</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Comma delimited list of ids of the elements whose content will be updated</td>

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

					<td align="left" valign="top">input</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The type of submit to use. Valid values are <i>input</i>, <i>button</i> and <i>image</i>.</td>

				</tr>

				<tr>

					<td align="left" valign="top">validate</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">Perform Ajax validation. 'ajaxValidation' interceptor must be applied to action</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/submit.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <sx:submit value="%{'Submit'}" />

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Render an image submit:


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <sx:submit type="image" value="%{'Submit'}" label="Submit the form" src="submit.gif"/>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Render a button submit:


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <sx:submit type="button" value="%{'Submit'}" label="Submit the form"/>

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Update target content with html returned from an action:


{% comment %}start snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <div id="div1">Div 1</div>
 <s:url id="ajaxTest" value="/AjaxTest.action"/>

 <sx:submit id="link1" href="%{ajaxTest}" target="div1" />

```

{% comment %}end snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Submit form(inside the form):


{% comment %}start snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <s:form id="form" action="AjaxTest">
      <input type="textbox" name="data">
      <sx:submit />
 </s:form>

```

{% comment %}end snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Submit form(outside the form):


{% comment %}start snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <s:form id="form" action="AjaxTest">
      <input type="textbox" name="data">
 </s:form>

 <sx:submit formId="form" />

```

{% comment %}end snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Using beforeNotifyTopics:


{% comment %}start snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/before", function(event, widget){
     alert('inside a topic event. before request');
     //event: set event.cancel = true, to cancel request
     //widget: widget that published the topic
 });
 </script>

 <sx:submit beforeNotifyTopics="/before" />

```

{% comment %}end snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Using afterNotifyTopics and highlight target:


{% comment %}start snippet id=example8|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/after", function(data, request, widget){
     alert('inside a topic event. after request');
     //data : text returned from request(the html)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>

 <sx:submit afterNotifyTopics="/after" highlightColor="red" href="%{#ajaxTest}" />

```

{% comment %}end snippet id=example8|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

Using errorNotifyTopics and indicator:


{% comment %}start snippet id=example9|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

```xml
 <script type="text/javascript">
 dojo.event.topic.subscribe("/error", function(error, request, widget){
     alert('inside a topic event. on error');
     //error : error object (error.message has the error message)
     //request: XMLHttpRequest object
     //widget: widget that published the topic
 });
 </script>

 <img id="ind1" src="${pageContext.request.contextPath}/images/indicator.gif" style="display:none"/>
 <sx:submit errorNotifyTopics="/error" indicator="ind1" href="%{#ajaxTest}" />

```

{% comment %}end snippet id=example9|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java {% endcomment %}

