---
layout: default
title: Tag Developers Guide (WIP)
---

# include


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Include}
~~~~~~~

**(!) How To access parameters**


> 

> 

> Parameters are passed as request parameters, so use the \${param.ParamName} notation to access them. Do not use the **property** tag to access parameters in included files.

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/include.html}
~~~~~~~

__Example__



~~~~~~~
{snippet:id=example|lang=java|javadoc=true|url=org.apache.struts2.components.Include}
~~~~~~~


~~~~~~~
{snippet:id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Include}
~~~~~~~
