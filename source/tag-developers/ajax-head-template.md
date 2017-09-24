---
layout: default
title: Tag Developers Guide (WIP)
---

# ajax head template

The ajax [head](dojo-head-tag.html) template builds upon the [xhtml head template](head-tag.html) by providing additional 
JavaScript includes for the [Dojo Toolkit](http://dojotoolkit.org), which is used by the [ajax a template](ajax-a-template.html),
[ajax div template](ajax-div-template.html), and the [ajax tabbedPanel template](). It is required to use this tag, 
`<ww:head theme="ajax"/>` , in your HTML `<head>` block if you wish to use AJAX feature. The contents of **head.ftl** are:

{% highlight html %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/support-2-3/plugins/dojo/src/main/resources/template/ajax/head.ftl %}
{% endhighlight %}

> If you are having trouble getting the AJAX theme to work, you should include the above JavaScript in your page manually, 
> changing "isDebug: false" to "isDebug: true".  This will log out debugging information directly to the screen.

Note that Dojo is configured to use the same character encoding specified in `struts.xml` , typically UTF-8. For a simple 
example of how to use the [head](dojo-head-tag.html) tag with the AJAX theme, simply do the following in your HTML:

{% highlight html %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/apps/showcase/src/main/webapp/ajax/commonInclude.jsp %}
{% endhighlight %}

> The above sample is from Struts trunk; for 2.0.6 you should use `<s:head debug="true"/>`.
