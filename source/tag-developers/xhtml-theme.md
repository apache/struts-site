---
layout: default
title: Tag Developers Guide (WIP)
---

# xhtml theme

The xhtml provides all the basics that the [simple theme](#PAGE_14291) provides and adds several features.

+ Standard two-column table layout for the HTML [Struts Tags](#PAGE_14248) ([form](#PAGE_14201), [textfield](#PAGE_13912), [select](#PAGE_14127), and so forth)

+ Labels for each of the HTML [Struts Tags](#PAGE_14248) on the left hand side (or top, depending on the 

~~~~~~~
labelposition
~~~~~~~
 attribute)

+ _Validation_  and error reporting

+ _Pure JavaScript Client Side Validation_  using 100% JavaScript on the browser

__Wrapping the Simple Theme__

The xhtml theme uses the "wrapping" technique described by [Extending Themes](#PAGE_13962). Let's look at how the HTML tags are wrapped by a standard header and footer. For example, in the 

~~~~~~~
text.ftl
~~~~~~~
 template, the 

~~~~~~~
controlheader.ftl
~~~~~~~
 and 

~~~~~~~
controlfooter.ftl
~~~~~~~
 templates are wrapped around the simple template.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/text.ftl}
~~~~~~~

 (?)  The 

~~~~~~~
controlheader.ftl
~~~~~~~
 is referenced using \${parameters.theme} so that the code can be reused by the [ajax theme](#PAGE_14205).

__XHTML Theme Header__

Now let's look at the 

~~~~~~~
controlheader.ftl
~~~~~~~
 and 

~~~~~~~
controlheader-core.ftl
~~~~~~~
. Again, these are split up for easy re-use with the [ajax theme](#PAGE_14205)) contents:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/controlheader.ftl}
~~~~~~~


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/controlheader-core.ftl}
~~~~~~~

The header used by the HTML tags in the xhtml theme is complicated. However, a close look reveals that the logic produces two behaviors: either a two-column format or a two-row format. Generally the two-column approach is what we want, so that is the default option. To use the two-row approach, change the 

~~~~~~~
labelposition
~~~~~~~
 parameter to 

~~~~~~~
top
~~~~~~~
.



| The fieldErrors, usually caused by _Validation_ , are printed out as a row above the HTML form element. Some people prefer that the errors display elsewhere, such as in a third column. If you wish to place these elsehwere, overriding the headers is easy, allowing you to continue to use the other features provided by this theme. See [Template Loading](#PAGE_13817) for more information on how to do this.

| 

__XHTML Theme Footer__

The primary objective of 

~~~~~~~
controlfooter.ftl
~~~~~~~
 is to close the table. But, before the table closes, the template checks for an 

~~~~~~~
after
~~~~~~~
 parameter.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/controlfooter.ftl}
~~~~~~~

While "after" isn't an attribute supported by any of the [Struts Tags](#PAGE_14248), if you are using [FreeMarker Tags](#PAGE_14294), [Velocity Tags](#PAGE_13950), or the [param](#PAGE_13825) tag in any template language, you can add an 

~~~~~~~
after
~~~~~~~
 parameter to place any content you like after the [simple theme](#PAGE_14291) template renders. The 

~~~~~~~
after
~~~~~~~
 attribute makes it easier to fine-tune HTML forms for your specific environment.

__Special Interest__

Two xhtml templates of special interest are 

~~~~~~~
head
~~~~~~~
 and 

~~~~~~~
form
~~~~~~~
.

__head template__

The xhtml [head](#PAGE_13997) template extends the _simple head template_  and provides an additional CSS that helps render the  form elements.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/head.ftl}
~~~~~~~

The head template imports a style sheet.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/styles.css}
~~~~~~~

__form template__

The xhtml form template sets up the wrapping table around all the other  form elements. In addition to creating this wrapping table, the opening and closing templates also, if the 

~~~~~~~
validate
~~~~~~~
 parameter is set to true, enable _Pure JavaScript Client Side Validation_ .


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form.ftl}
~~~~~~~

The closing template, 

~~~~~~~
form-close.ftl*
~~~~~~~
:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form-close.ftl}
~~~~~~~

__xhtml form template__

The xhtml form template sets up the wrapping table around all the other [xhtml theme](#PAGE_13834) form elements. In addition to creating this wrapping table, the opening and closing templates also, if the _validate_  parameter is set to true, enable _Pure JavaScript Client Side Validation_ . See the **form.ftl** contents:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form.ftl}
~~~~~~~

The closing template, **form-close.ftl**:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form-close.ftl}
~~~~~~~

__xhtml head template__

The xhtml [head](#PAGE_13997) template extends the _simple head template_  and provides an additional CSS that helps render the [xhtml theme](#PAGE_13834) form elements. The contents of **head.ftl** are:


~~~~~~~
{snippet:id=all|lang=xml|url=webwork/src/java/template/xhtml/head.ftl}
~~~~~~~

The contents of **styles.css** are:


~~~~~~~
{snippet:id=all|lang=xml|url=webwork/src/java/template/xhtml/styles.css}
~~~~~~~

