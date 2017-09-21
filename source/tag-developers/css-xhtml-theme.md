---
layout: default
title: Tag Developers Guide (WIP)
---

# css_xhtml theme

The css_xhtml theme provides all the basics that the [simple theme](#PAGE_14291) provides and adds several features.

+ Standard two-column CSS-based layout, using 

~~~~~~~
<div>
~~~~~~~
 for the HTML [Struts Tags](#PAGE_14248) ([form](#PAGE_14201), [textfield](#PAGE_13912), [select](#PAGE_14127), etc)

+ Labels for each of the HTML [Struts Tags](#PAGE_14248), placed according to the CSS stylesheet

+ _Validation_  and error reporting

+ _Pure JavaScript Client Side Validation_  using 100% JavaScript on the browser

__Wrapping the Simple Theme__

The xhtml theme uses the "wrapping" technique described by [Extending Themes](#PAGE_13962). Let's look at how the HTML tags are wrapped by a standard header and footer. For example, in the [textfield](#PAGE_13912) template, 

~~~~~~~
text.ftl
~~~~~~~
, the 

~~~~~~~
controlheader.ftl
~~~~~~~
 and 

~~~~~~~
controlfooter.ftl
~~~~~~~
 templates are wrapped around the simple template.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/simple/text.ftl}
~~~~~~~

__CSS XHTML theme header__

The header used by the HTML tags in the css_xhtml theme is complicated. Unlike the [xhtml theme](#PAGE_13834), the CSS theme does not use a 

~~~~~~~
labelposition
~~~~~~~
 attribute. Instead, the label position is defined by CSS rules.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/controlheader.ftl}
~~~~~~~

Note that the 

~~~~~~~
fieldErrors
~~~~~~~
, usually caused by _Validation_ , are displayed in a 

~~~~~~~
div
~~~~~~~
 block before the element is displayed.

__CSS XHTML theme footer__

And the 

~~~~~~~
controlfooter.ftl
~~~~~~~
 contents:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/controlfooter.ftl}
~~~~~~~

__Special Interest__

Two css_xhtml templates of special interest are 

~~~~~~~
head
~~~~~~~
 and 

~~~~~~~
form
~~~~~~~
.

__Head template__

The css_xhtml [head](#PAGE_13997) template is similar to the xhtml head template. The difference is that CSS is used to provide the layout.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/head.ftl}
~~~~~~~

The head includes a style sheet.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/styles.css}
~~~~~~~

__Form template__

The css_xhtml [form](#PAGE_14201) template is almost exactly like the _xhtml form template_ , including support for _Pure JavaScript Client Side Validation_ . The difference is that instead of printing out an opening and closing 

~~~~~~~
<table>
~~~~~~~
 element, there are no elements. Instead, the CSS rules for the individual HTML tags are assumed to handle all display logic. However, as noted, client-side validation is still supported.

__css_xhtml form template__

The css_xhtml [form](#PAGE_14201) template is almost exactly like the _xhtml form template_ , including support for _Pure JavaScript Client Side Validation_ . The only difference is that instead of printing out an opening and closing 

~~~~~~~
<table>
~~~~~~~
 element, there are no elements. Instead, the CSS rules for the individual HTML tags are assumed to handle all dislay logic. However, as noted, client side validation is still supported.

__css_xhtml head template__

The css_xhtml [head](#PAGE_13997) template is very similar to the _xhtml head template_ . The only difference is that CSS that is included is specifically designed to provide the layout for the [css_xhtml theme](#PAGE_14215). The contents of **head.ftl** are:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/head.ftl}
~~~~~~~

The contents of **styles.css** are:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/styles.css}
~~~~~~~
