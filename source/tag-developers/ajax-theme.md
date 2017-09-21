---
layout: default
title: Tag Developers Guide (WIP)
---

# ajax theme


The ajax theme is deprecated!

| 

The ajax theme extends the [xhtml theme](#PAGE_13834) with AJAX features. The theme uses the popular DOJO AJAX/JavaScript toolkit. AJAX features include:

+ _AJAX Client Side Validation_ 

+ Remote [form](#PAGE_14201) submission support (works with the [submit](#PAGE_14054) tag as well)

+ An advanced [div](#PAGE_13908) template that provides dynamic reloading of partial HTML

+ An advanced [a](#PAGE_14027) template that provides the ability to load and evaluate JavaScript remotely

+ An AJAX-only [tabbedPanel](#PAGE_14222) implementation

+ A rich pub-sub event model

+ Interactive autocomplete tag

 (ok)  See also: _Ajax tags_ 

__Browser Compatibility__

AJAX (as a technology) uses a browser-side scripting component that varies between browers (and sometimes versions). To hide those differences from the developer, we utilize the dojo toolkit ([http://www.dojotoolkit.org](http://www.dojotoolkit.org)). Several browsers are supported by dojo, and any UI's created with the ajax theme should act the same way for supported browsers. The supported browsers are:

+ IE 5.5\+

+ FF 1.0\+

+ Latest Safari (on up-to-date OS versions)

+ Latest Opera

+ Latest Konqueror

__Extending the AJAX Theme__

The wrapping technique utilized by the ajax theme is much like [xhtml theme](#PAGE_13834), but the 

~~~~~~~
controlheader.ftl
~~~~~~~
 is a wee bit different.


~~~~~~~

<#if parameters.label?if_exists != "">
	<#include "/${parameters.templateDir}/xhtml/controlheader.ftl" />
</#if>
<#if parameters.form?exists && parameters.form.validate?default(false) == true>
	<#-- can't mutate the data model in freemarker -->
    <#if parameters.onblur?exists>
        ${tag.addParameter('onblur', "validate(this);${parameters.onblur}")}
    <#else>
        ${tag.addParameter('onblur', "validate(this);")}
    </#if>
</#if>

~~~~~~~

The header provides for _AJAX Client Side Validation_  by checking if the 

~~~~~~~
validate
~~~~~~~
 attribute is set to true. If it is, a validation request is made on each 

~~~~~~~
onblur
~~~~~~~
 event for a HTML [Struts Tags](#PAGE_14248). Some people don't like the 

~~~~~~~
onblur
~~~~~~~
 behavior; they would rather a more advanced timer (say, 200ms) be kicked off after every keystroke. You can override this template and provide that type of behavior if you would like.

__Special Interest__

Three ajax_xhtml templates of special interest are 

~~~~~~~
head
~~~~~~~
, 

~~~~~~~
div
~~~~~~~
, and 

~~~~~~~
a
~~~~~~~
.



| Especially with the ajax theme, it is important to use the [head](#PAGE_13997) tag. (See the _ajax head template_  for more information.) Without it, AJAX support may not be set up properly.

| 

+ _ajax head template_ 

+ _ajax div template_ 

+ _ajax a template_ 

 (ok)  In addition to these templates, be familiar with the _ajax event system_  provided by the framework and Dojo.

__ajax a template__


The ajax theme is experimental. Feedback is appreciated.

| 

The ajax a template is used to make asynchronous calls to the server when the user clicks on the a href link.  It is useful when you need to communicate information back to the application from the UI, without requiring the entire page to be re-rendered.  An example would be removing an item from a list.

The _preInvokeJS_  attribute is used to determine whether the URL specified should be called or not, and must contain Javascript that returns _true_  or _false_ .  If you want to call a JavaScript function, use the format preInvokeJS='yourMethodName(data,type)'. An example would be to show a confirm dialog to the user to double check whether they want to remove a user from a list.

**Remember**: the content returned by the _href_  attribute must be JavaScript. That JavaScript will then be evaluated within the webpage. If you only wish to publish an event to the topic specified, then simply return no result (or NONE) from your action and utilize the _notifyTopics_  attribute to specific the topic names.

For an example of the interaction between the [div](#PAGE_13908) tag and the [a](#PAGE_14027) tag using the topic pub/sub model, see the examples in the _ajax div template_ .

__ajax div template__


The Ajax theme is experimental. Feedback is appreciated.

| 

The ajax [div](#PAGE_13908) template provides a much more interesting div rendering option that the other themes do. Rather than simply rendering a 

~~~~~~~
<div>
~~~~~~~
 tag, this template relies on advanced AJAX features provided by the [Dojo Toolkit](http://dojotoolkit.org)^[http://dojotoolkit.org]. While the [div](#PAGE_13908) tag could be used outside of the [ajax theme](#PAGE_14205), it is usually not very useful. See the [div](#PAGE_13908) tag for more information on what features are provided.

__Features__

The remote div has a few features, some of which can be combined with the [a](#PAGE_14027) tag and the _ajax a template_ . These uses are:

+ Retrieve remote data

+ Initialize the div with content before the remote data is retrieved

+ Display appropriate error and loading messages

+ Refresh data on a timed cycle

+ Listen for events and refresh data

+ JavaScript control support

__Retrieve Remote Data__

The simplest way to use the div tag is to provide an _href_  attribute. For example:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"/>

~~~~~~~

What this does after the HTML page is completely loaded, the specified URL will be retrieved asynchronously in the browser. The entire contents returned by that URL will be injected in to the div.

__Initializing the Div__

Because the remote data isn't loaded immediately, it is sometimes useful to have some placeholder content that exists before the remote data is retrieved. The content is essentially just the body of the div element. For example:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239">
    Placeholder...
</saf:div>

~~~~~~~

If you wish to load more complex initial data, you can use the [action](#PAGE_14034) tag and the _executeResult_  attribute:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239">
    <ww:action id="weather" name="weatherBean" executeResult="true">
        <ww:param name="zip" value="97239"/>
    </ww:action>
</saf:div>

~~~~~~~

__Loading and Error Messages__

If you'd like to display special messages when the data is being retrieved or when the data cannot be retrieved, you can use the _errorText_  and _loadingText_  attributes:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"
        loadingText="Loading weather information..."
        errorText="Unable to contact weather server">
    Placeholder...
</saf:div>

~~~~~~~

__Refresh Timers__

Another feature this div template provides is the ability to refresh data on a timed basis. Using the _updateFreq_  and the _delay_ attributes, you can specify how often the timer goes off and when the timer starts (times in milliseconds). For example, the following will update every minute after a two second delay:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"
        loadingText="Loading weather information..."
        errorText="Unable to contact weather server">
        delay="2000"
        updateFreq="60000"
    Placeholder...
</saf:div>

~~~~~~~

__Listening for Events__

The [a](#PAGE_14027) tag (specifically the _ajax a template_ ) and the div tag support an _ajax event system_ , providing the ability to broadcast events to topics. You can specify the **topics** to listen to using a comma separated list in the _listenTopics_  attribute. What this means is that when a topic is published, usually through the _ajax a template_ , the URL specified in the _href_  attribute will be re-requested.


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"
        loadingText="Loading weather information..."
        errorText="Unable to contact weather server"
        listenTopics="weather_topic,some_topic">
    Placeholder...
</saf:div>
<saf:a id="link1"
      theme="ajax"
      href="refreshWeather.action"
      notifyTopics="weather_topic,other_topic"
      errorText="An Error ocurred">Refresh</saf:a>

~~~~~~~

__JavaScript Support__

There are also javascript functions to refresh the content and stop/start the refreshing of the component. For the remote div with the component id "remotediv1":

To start refreshing use the javascript:


~~~~~~~

remotediv1.startTimer();

~~~~~~~

To stop refreshing use the javascript:


~~~~~~~

remotediv1.stopTimer();

~~~~~~~

To refresh the content use the javascript:


~~~~~~~

remotediv1.refresh();

~~~~~~~

__JavaScript Examples:__

To further illustrate these concepts here is an example. Say you want to change the url of a div at runtime via javascript. Here is what you need to do:

What you will need to do is add a JS function that listens to a JS event that publishes the id from the select box that was selected.  It will modify the URL for the div (adding the id so the correct data is obtained) and then bind() the AJAX div so it refreshes.


~~~~~~~

<saf:head theme="ajax" />

<script type="text/javascript">
    function updateReports(id) {
       var reportDiv= window['reportDivId'];
       reportDiv.href = '/../reportListRemote.action?selectedId='+id;
       reportDiv.refresh();
    }
    dojo.event.topic.getTopic("updateReportsListTopic").subscribe(null, "updateReports");
</script>

<form ... >
<saf:select .... onchange="javascript: dojo.event.topic.publish("updateReportsListTopic", this.value); " />

<saf:div id="reportDivId" theme="ajax" href="/.../reportListRemote.action" >
  Loading reports...
</saf:div>
</form>

~~~~~~~

__ajax event system__

As you may have seen with the _ajax div template_  and _ajax a template_ , the framework and Dojo provide a nice way to subscribe and notify of topics from within the browser. A benifit of using Dojo as the basis of many of these components is being able to loosely couple UI components.  There are two attributes of importance: 

~~~~~~~
listenTopics
~~~~~~~
 and 

~~~~~~~
notifyTopics
~~~~~~~
.

+ If a component has a 

~~~~~~~
notifyTopics
~~~~~~~
 attribute, then after the processing has been completed a message with be published to the topic names supplied as a value (comma delimited).

+ If a component has a 

~~~~~~~
listenTopics
~~~~~~~
 attribute, then when a message is published to the topic names supplied as a value (comma delimited), the component will perform custom tag-specific logic ( i.e a DIV tag will re-fresh its content).

As well as this, you can publish and subscribe to topic names with javascript code.  To publish to the 

~~~~~~~
topic_name
~~~~~~~
 topic:


~~~~~~~

dojo.event.topic.publish("topic_name", "content");

~~~~~~~

The topic_name attribute is required, the content attribute is not and most elements are triggered without having this attribute. See the _ajax div template_  for an example of this type of interaction.

To subscribe to the _topic_name_  topic:


~~~~~~~

function doSomethingWithEvent(data) {
...
}

dojo.event.topic.getTopic("topic_name").subscribe(null, "doSomethingWithEvent");

~~~~~~~

The 

~~~~~~~
subscribe
~~~~~~~
 method takes 2 parameters, the first is the JavaScript object variable (or null if the function is not from an object) and the second is the name of the function to call when an event is recieved on the topic.

__ajax head template__

The ajax [head](#PAGE_13997) template builds upon the _xhtml head template_  by providing additional JavaScript includes for the [Dojo Toolkit](http://dojotoolkit.org)^[http://dojotoolkit.org], which is used by the _ajax a template_ , _ajax div template_  , and the _ajax tabbedPanel template_ . It is required to use this tag, 

~~~~~~~
<ww:head theme="ajax"/>
~~~~~~~
, in your HTML 

~~~~~~~
<head>
~~~~~~~
 block if you wish to use AJAX feature. The contents of **head.ftl** are:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/plugins/dojo/src/main/resources/template/ajax/head.ftl}
~~~~~~~



| If you are having trouble getting the AJAX theme to work, you should include the above JavaScript in your page manually, changing "isDebug: false" to "isDebug: true".  This will log out debugging information directly to the screen.

| 

Note that Dojo is configured to use the same character encoding specified in _struts.properties_ , typically UTF-8. For a simple example of how to use the [head](#PAGE_13997) tag with the AJAX theme, simply do the following in your HTML:


~~~~~~~
{snippet:id=common-include|lang=xml|url=struts2/apps/showcase/src/main/webapp/ajax/commonInclude.jsp}
~~~~~~~


> 

> 

> The above sample is from Struts trunk; for 2.0.6 you should use <s:head debug="true"/>.

> 

__ajax tabbedPanel template__

TODO: Describe the Ajax TabbedPanel template

__ajax submit template__

TODO: Describe the Ajax Submit template

