---
layout: default
title: Tag Developers Guide (WIP)
---

# bind

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java {% endcomment %}
<p> <p>
 This tag will generate event listeners for multiple events on multiple sources,
 making an asynchronous request to the specified href, and updating multiple targets.
 </p></p>
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
		</table></p>
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

