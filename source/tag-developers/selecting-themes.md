---
layout: default
title: Tag Developers Guide
---

# Selecting Themes

Themes can be selected using several different rules, in this order:

1. The `theme` attribute on the specific tag
2. The `theme` attribute on a tag's surrounding [form](form-tag.html) tag
3. The page-scoped attribute named `theme`
4. The request-scoped attribute named `theme`
5. The session-scoped attribute named `theme`
6. The application-scoped attribute named `theme`
7. The `struts.ui.theme` property in `struts.xml` (defaults to _xhtml_)

See [Can I change theme on a per-page basis]() page for using scoped `theme` attribute.

## Tips

- To override an entire form's theme, change the "theme" attribute of the form. (Convenient for using 
  the [ajax theme](ajax-theme.html) for specific forms, for example.)
- To support user-selected themes, set the theme in the user's session.
- To change the theme for the entire application, modify the `struts.xml`.
