---
layout: default
title: Tag Developers Guide
parent:
  url: themes-and-templates.html
  title: Themes and Templates
---

# xhtml theme
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The xhtml provides all the basics that the [simple theme](simple-theme) provides and adds several features.

- Standard two-column table layout for the HTML [Struts Tags](struts-tags) ([form](form-tag), 
  [textfield](textfield-tag), [select](select-tag), and so forth)
- Labels for each of the HTML [Struts Tags](struts-tags) on the left hand side (or top, depending on 
  the `labelposition` attribute)
- [Validation](../core-developers/validation) and error reporting
- [Pure JavaScript Client Side Validation](../core-developers/pure-java-script-client-side-validation) using 
  100% JavaScript on the browser

## Wrapping the Simple Theme

The xhtml theme uses the "wrapping" technique described by [Extending Themes](extending-themes). Let's look at how 
the HTML tags are wrapped by a standard header and footer. For example, in the `text.ftl` template, the `controlheader.ftl`
and `controlfooter.ftl` templates are wrapped around the simple template.

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/text.ftl %}
{% endhighlight %}

> The `controlheader.ftl` is referenced using `${parameters.theme}` so that the code can be reused 
> by the [ajax theme](ajax-theme).

## XHTML Theme Header

Now let's look at the `controlheader.ftl` and `controlheader-core.ftl`. Again, these are split up for easy re-use with 
the [ajax theme](ajax-theme)) contents:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/controlheader.ftl %}
{% endhighlight %}

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/controlheader-core.ftl %}
{% endhighlight %}

The header used by the HTML tags in the xhtml theme is complicated. However, a close look reveals that the logic produces 
two behaviors: either a two-column format or a two-row format. Generally the two-column approach is what we want, so that 
is the default option. To use the two-row approach, change the `labelposition` parameter to `top`.

> The `fieldErrors`, usually caused by [Validation](../core-developers/validation), are printed out as a row above 
> the HTML form element. Some people prefer that the errors display elsewhere, such as in a third column. If you wish 
> to place these elsehwere, overriding the headers is easy, allowing you to continue to use the other features provided 
> by this theme. See [Template Loading](template-loading) for more information on how to do this.

## XHTML Theme Footer

The primary objective of `controlfooter.ftl` is to close the table. But, before the table closes, the template checks 
for an `after` parameter.

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/controlfooter.ftl %}
{% endhighlight %}

While `after` isn't an attribute supported by any of the [Struts Tags](struts-tags), if you are using 
[FreeMarker Tags](freemarker-tags), [Velocity Tags](velocity-tags), or the [param](param-tag) tag in any 
template language, you can add an `after` parameter to place any content you like after the [simple theme](simple-theme) 
template renders. The `after` attribute makes it easier to fine-tune HTML forms for your specific environment.

## Special Interest

Two xhtml templates of special interest are `head` and `form`.

### xhtml head template

The xhtml [head](head-tag) template extends the _simple head template_ and provides an additional CSS that helps 
render the form elements.

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/head.ftl %}
{% endhighlight %}

The head template imports a style sheet. The contents of **styles.css** are:

{% highlight css %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/styles.css %}
{% endhighlight %}

### form template

The xhtml form template sets up the wrapping table around all the other  form elements. In addition to creating this 
wrapping table, the opening and closing templates also, if the `validate` parameter is set to true, enable 
[Pure JavaScript Client Side Validation](../core-developers/pure-java-script-client-side-validation).

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/form.ftl %}
{% endhighlight %}

The closing template, `form-close.ftl`:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/form-close.ftl %}
{% endhighlight %}

### xhtml form template

The xhtml form template sets up the wrapping table around all the other [xhtml theme](xhtml-theme) form elements. 
In addition to creating this wrapping table, the opening and closing templates also, if the `validate` parameter is set 
to `true`, enable [Pure JavaScript Client Side Validation](../core-developers/pure-java-script-client-side-validation.htmk). 

See the **form.ftl** contents:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/form.ftl %}
{% endhighlight %}

The closing template, **form-close.ftl**:

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/xhtml/form-close.ftl %}
{% endhighlight %}
