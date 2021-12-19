---
layout: default
title: Themes and Templates
parent:
  title: Tag Developers Guide
  url: index
---

# Themes and Templates

The notions of "themes" and "templates" are at the core of the HTML [Struts Tags](struts-tags) provided by the framework.

## Definitions

| tag | A small piece of code executed from within [JSP](jsp), [FreeMarker](freemarker), or [Velocity](velocity). |
| template | A bit of code, usually written in [FreeMarker](freemarker), that can be rendered by certain tags (HTML tags) |
| theme | A  collection of _templates_  packaged together to provide common functionality |

> See [Struts Tags](struts-tags) for more about the HTML and other tags provided by the framework.

## Template Basics

|[Template Loading](template-loading)| How templates are loaded |
|[Selecting Template Directory](selecting-template-directory)| How the template directories are loaded |
|[Selecting Themes](selecting-themes)| How you can pick a theme when writing your results |
|[Extending Themes](extending-themes)| How to create your own themes based on existing themes |

## More About Themes

|[simple theme](simple-theme)| A minimal theme with no "bells and whistles" |
|[xhtml theme](xhtml-theme)| The default theme that uses common HTML practices |
|[css_xhtml theme](css-xhtml-theme)| The [xhtml theme](xhtml-theme) re-implemented using strictly CSS for layout |
|[ajax theme](ajax-theme)| A theme based on the [xhtml theme](xhtml-theme) that provides advanced AJAX features |
