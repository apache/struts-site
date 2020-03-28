---
layout: default
title: sort tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# submit

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Render a submit button. The submit tag is used together with the form tag to provide asynchronous form submissions.

The submit can have three different types of rendering:
- `input`: renders as html `<input type="submit"...>`
- `image`: renders as html `<input type="image"...>`
- `button`: renders as html `<button type="submit"...>`
 
Please note that the button type has advantages by adding the possibility to seperate the submitted value from the text 
shown on the button face, but has issues with Microsoft Internet Explorer at least up to 6.0.

> To use method attribute (to use multiple submit buttons which direct to different action methods) you must set 
> **struts.enable.DynamicMethodInvocation** to **true** but this can lead to 
> [security vulnerability](http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation)^[http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation] 
> - use with care! Instead you can try to use Multiple Submit Buttons] solution.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/submit-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/submit-attributes.html %}
