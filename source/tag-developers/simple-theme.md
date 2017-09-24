---
layout: default
title: Tag Developers Guide (WIP)
---

# simple theme
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The simple theme renders "bare bones" HTML elements. The simple theme is most often used as a starting point for other 
themes. (See [Extending Themes](extending-themes.html) for more.)

For example, the [textfield](textfield-tag.html) tag renders the HTML `<input/>` tag without a label, validation, error 
reporting, or any other formatting or functionality.

> Both the [xhtml theme](xhtml-theme.html) and [css_xhtml theme](css-xhtml-theme.xhtml) extend the simple theme. Look 
> to them for examples of how to build on the foundation laid by the simple theme.

## Head Tag

The simple theme [head](head-tag.html) template prints out a javascript include required 
for the [datetimepicker](dojo-datetimepicker-tag.html) tag to render properly.

## simple head template

The [simple theme](simple-theme.html)[head](head-tag.html) template only does one thing: it loads the minimal 
Ajax/Dojo support so that tags can import Dojo widgets easily.

The source of the simple `head.ftl` template is:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/template/simple/head.ftl %}
{% endhighlight %}
