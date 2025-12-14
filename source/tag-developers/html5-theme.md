---
layout: default
title: Tag Developers Guide
parent:
  url: themes-and-templates
  title: Themes and Templates
---

# html5 theme
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The _html5 theme_ extends the [simple theme](simple-theme) and provides modern HTML5 output.

## Features

- Extends the [simple theme](simple-theme) via `theme.properties`
- Clean, modern HTML5 markup output
- [Validation](../core-developers/validation) and error reporting

## Theme Configuration

The HTML5 theme extends the simple theme via `theme.properties`:

{% highlight properties %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/html5/theme.properties %}
{% endhighlight %}

## Using the HTML5 Theme

Set the theme on individual tags:

```jsp
<s:textfield name="username" theme="html5" />
```

Or set it for an entire form:

```jsp
<s:form action="login" theme="html5">
    <s:textfield name="username" />
    <s:password name="password" />
    <s:submit value="Login" />
</s:form>
```

Or globally in `struts.xml`:

```xml
<constant name="struts.ui.theme" value="html5" />
```

## Available Templates

The HTML5 theme includes templates for all standard Struts UI tags including:
textfield, textarea, password, checkbox, checkboxlist, radio, select, file,
hidden, label, combobox, reset, submit, form, and more.

## Text Field Template Example

{% highlight freemarker %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/main/resources/template/html5/text.ftl %}
{% endhighlight %}

## Since

Available since Struts 7.2.0
