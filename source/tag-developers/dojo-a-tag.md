---
layout: default
title: Tag Developers Guide (WIP)
---

# dojo anchor

__Description__



~~~~~~~
{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~

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



~~~~~~~
{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html %}
~~~~~~~

__Examples__

Update target content with html returned from an action:


~~~~~~~
{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~

Submit form(anchor inside the form):


~~~~~~~
{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~

Submit form(anchor outside the form):


~~~~~~~
{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~

Using beforeNotifyTopics:


~~~~~~~
{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~

Using afterNotifyTopics and highlights target:


~~~~~~~
{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~

Using errorNotifyTopics and indicator:


~~~~~~~
{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}
~~~~~~~
