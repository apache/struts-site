---
layout: default
title: Tag Developers Guide (WIP)
---
# component

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.GenericUIBean}
~~~~~~~

{snippet:id=note|javadoc=true|url=org.apache.struts2.components.GenericUIBean}

**(!) templateDir and theme attribute**


> 

> 

> The final path to the template will be built using the _templateDir_  and _template_  attributes, like \${templateDir}/\${theme}/\${template}. If for example your component is under /components/html/option.jsp, you would have to set templateDir="components", theme="html" and template="options.jsp". 

> 

> 

> For any Struts tag that you use in your component, make sure that you set its templateDir="template"

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/component.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.GenericUIBean}
~~~~~~~
