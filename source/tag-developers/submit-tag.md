---
layout: default
title: Tag Developers Guide (WIP)
---

# submit


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Submit %}



| To use method attribute (to use multiple submit buttons which direct to different action methods) you must set **struts.enable.DynamicMethodInvocation** to **true** but this can lead to [security vulnerability](http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation)^[http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation] - use with care! Instead you can try to use _Multiple Submit Buttons_  solution.

| 


This tag works with all themes, but has special importance when combined with the [form](#PAGE_14201) tag in the [ajax theme](#PAGE_14205). Please read up on the [ajax theme](#PAGE_14205) for more information.

| 

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/submit.html %}
