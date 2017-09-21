---
layout: default
title: Tag Developers Guide (WIP)
---

# dojo div

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/div.html}
~~~~~~~

__Examples__

Simple div that loads its content once:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

div that reloads its content every 2 seconds, and shows an indicator while reloading:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

div that uses topics to control the timer, highlights its content in red after reload, and submits a form:


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~
