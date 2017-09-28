---
layout: default
title: Tag Developers Guide (WIP)
---

# dojo submit

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

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



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/submit.html %}

__Examples__



{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Render an image submit:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Render a button submit:


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Update target content with html returned from an action:


{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Submit form(inside the form):


{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Submit form(outside the form):


{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Using beforeNotifyTopics:


{% snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Using afterNotifyTopics and highlight target:


{% snippet id=example8|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Using errorNotifyTopics and indicator:


{% snippet id=example9|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

