---
layout: tag-developers
title: Tag Developers Guide
---

# Themes and Templates

The notions of "themes" and "templates" are at the core of the HTML [Struts Tags](struts-tags.html) provided by the framework.

## Definitions

| tag | A small piece of code executed from within [JSP](jsp.html), [FreeMarker](freemarker.html), or [Velocity](velocity.html). |
| template | A bit of code, usually written in [FreeMarker](freemarker.html), that can be rendered by certain tags (HTML tags) |
| theme | A  collection of _templates_  packaged together to provide common functionality |

> See [Struts Tags](struts-tags.html) for more about the HTML and other tags provided by the framework.

## Template Basics

|[Template Loading](template-loading.html)| How templates are loaded |
|[Selecting Template Directory](selecting-template-directory.html)| How the template directories are loaded |
|[Selecting Themes](selecting-themes.html)| How you can pick a theme when writing your results |
|[Extending Themes](extending-themes.html)| How to create your own themes based on existing themes |

## More About Themes

|[simple theme](simple-theme.html)| A minimal theme with no "bells and whistles" |
|[xhtml theme](xhtml-theme.html)| The default theme that uses common HTML practices |
|[css_xhtml theme](css-xhtml-theme.html)| The [xhtml theme](xhtml-theme.html) re-implemented using strictly CSS for layout |
|[ajax theme](ajax-theme.html)| A theme based on the [xhtml theme](xhtml-theme.html) that provides advanced AJAX features |
