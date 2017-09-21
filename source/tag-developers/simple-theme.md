---
layout: default
title: Tag Developers Guide (WIP)
---

# simple theme

The simple theme renders "bare bones" HTML elements. The simple theme is most often used as a starting point for other themes. (See [Extending Themes](#PAGE_13962) for more.)

For example, the [textfield](#PAGE_13912) tag renders the HTML 

~~~~~~~
<input/>
~~~~~~~
 tag without a label, validation, error reporting, or any other formatting or functionality.



| Both the [xhtml theme](#PAGE_13834) and [css_xhtml theme](#PAGE_14215) extend the simple theme. Look to them for examples of how to build on the foundation laid by the simple theme.

| 

__Head Tag__

The simple theme [head](#PAGE_13997) template prints out a javascript include required for the [datetimepicker](#PAGE_14274) tag to render properly.

__simple head template__

The [simple theme](#PAGE_14291)[head](#PAGE_13997) template only does one thing: it loads the minimal Ajax/Dojo support so that tags can import Dojo widgets easily.

The source of the simple head.ftl template is:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/simple/head.ftl}
~~~~~~~

