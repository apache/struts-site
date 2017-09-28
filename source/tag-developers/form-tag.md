---
layout: default
title: Tag Developers Guide (WIP)
---

# form


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Form %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/form.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form %}

__Validation__

There are two flavours _Client Side Validation_ , depending on the theme you are using (xhtml, ajax, etc). If you are using the [xhtml theme](#PAGE_13834) or [css_xhtml theme](#PAGE_14215), pure client side validation will be used. If you are using the [ajax theme](#PAGE_14205), a special AJAX-based validation will take place. Read the _Client Side Validation_  docs for more information.
