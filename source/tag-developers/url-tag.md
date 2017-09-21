---
layout: default
title: Tag Developers Guide (WIP)
---

# url


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


The id attribute is deprecated in Struts 2.1.x, and has been replaced by the var attribute.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.URL}
~~~~~~~

__Setting a default value for includeParams__

The property _struts.url.includeParams_  can be used to set the default value of the _includeParams_  attribute.

**Setting the default value of includeParams**


~~~~~~~

<struts>
   ...
   <constant name="struts.url.includeParams" value="none" />
   ...
</struts>

~~~~~~~

See _Constant Configuration_  for further information.


> 

> 

>  As of Struts 2.1.3 the includeParams constant defaults to "none". 

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/url.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.URL}
~~~~~~~
