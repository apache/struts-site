---
layout: default
title: Tag Developers Guide
parent:
  url: themes-and-templates.html
  title: Themes and Templates
---

# css_xhtml theme

The _css_xhtml theme_ provides all the basics that the [simple theme](simple-theme.html) provides and adds several features.

_ Standard two-column CSS-based layout, using `<div>` for the HTML [Struts Tags](struts-tags.html) ([form](form-tag.htmk), 
  [textfield](textfield-tag.html), [select](select-tag.html), etc)
- Labels for each of the HTML [Struts Tags](struts-tags.html), placed according to the CSS stylesheet
- [Validation](../core-developers/validation.html) and error reporting
- [Pure JavaScript Client Side Validation](../core-developers/pure-java-script-client-side-validation.html) using 100% 
  JavaScript on the browser

## Wrapping the Simple Theme

The xhtml theme uses the "wrapping" technique described by [Extending Themes](extending-themes.html). Let's look at how 
the HTML tags are wrapped by a standard header and footer. For example, in the [textfield](textfield-tag.html) template, 
`text.ftl`, the `controlheader.ftl` and `controlfooter.ftl` templates are wrapped around the simple template.

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/template/simple/text.ftl %}
{% endhighlight %}

## CSS XHTML theme header

The header used by the HTML tags in the css_xhtml theme is complicated. Unlike the [xhtml theme](xhtml-theme.html), 
the CSS theme does not use a `labelposition` attribute. Instead, the label position is defined by CSS rules.

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/template/css_xhtml/controlheader.ftl %}
{% endhighlight %}

Note that the `fieldErrors`, usually caused by [Validation](../core-developers/validation.html), are displayed in a `div`
block before the element is displayed.

## CSS XHTML theme footer

And the `controlfooter.ftl` contents:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/template/css_xhtml/controlfooter.ftl %}
{% endhighlight %}

## Special Interest

Two css_xhtml templates of special interest are `head` and `form`.

### Head template

The css_xhtml [head](head-tag.html) template is similar to the xhtml head template. The difference is that CSS is used 
to provide the layout. The contents of **head.ftl** are:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/template/css_xhtml/head.ftl %}
{% endhighlight %}

The head includes a style sheet. The contents of **styles.css** are:

{% highlight css %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/template/css_xhtml/styles.css %}
{% endhighlight %}

### Form template

The css_xhtml [form](form-tag.html) template is almost exactly like the _xhtml form template_ , including support for 
[Pure JavaScript Client Side Validation](../core-developers/pure-java-script-client-side-validation.html). The difference 
is that instead of printing out an opening and closing `<table>` element, there are no elements. Instead, the CSS rules 
for the individual HTML tags are assumed to handle all display logic. However, as noted, client-side validation is still 
supported.

### css_xhtml form template

The css_xhtml [form](form-tag.html) template is almost exactly like the _xhtml form template_ , including support for 
[Pure JavaScript Client Side Validation](../core-developers/pure-java-script-client-side-validation.html). The only 
difference is that instead of printing out an opening and closing `<table>` element, there are no elements. Instead, 
the CSS rules for the individual HTML tags are assumed to handle all display logic. However, as noted, client side 
validation is still supported.
