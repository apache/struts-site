---
layout: default
title: Tag Developers Guide (WIP)
---

# dojo head

__Description__


{% snippet id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}


> 

> 

> If you are planning to nest tags from the Dojo plugin, make sure you set parseContent="false", otherwise each request made by the inner tags will be performed twice.

> 

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html %}

__Examples__



{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}
