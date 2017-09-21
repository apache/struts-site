---
layout: default
title: Tag Developers Guide (WIP)
---

# bind

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

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



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/bind.html}
~~~~~~~

__Examples__

Without attaching to an event, listening to a topic (used to make an Ajax call):


~~~~~~~
{snippet:id=example0|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Attached to event 'onclick' on submit button:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Submit form:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Using beforeNotifyTopics:


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Using afterNotifyTopics and highlight:


~~~~~~~
{snippet:id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Using errorNotifyTopics and indicator:


~~~~~~~
{snippet:id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

