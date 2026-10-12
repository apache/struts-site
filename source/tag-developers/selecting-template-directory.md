---
layout: default
title: Tag Developers Guide
---

# Selecting Template Directory

Template directory can be selected using several different rules, in this order:

1. The `templateDir` attribute on the specific tag
2. The page-scoped attribute named `templateDir`
3. The request-scoped attribute named `templateDir`
4. The session-scoped attribute named `templateDir`
5. The application-scoped attribute named `templateDir`
6. The `struts.ui.templateDir` [scoped constant](../core-developers/package-configuration#scoped-constants) of the
   action's package or one of its parents (since 7.5.0)
7. The `struts.ui.templateDir` property in `struts.xml` (defaults to _template_)

## Tips

- To change the template directory for the entire application, modify the `struts.xml`
- To change the template directory for all actions of a package, declare
  `<scoped-constant name="struts.ui.templateDir" value="admin-template"/>` in that package (since 7.5.0) 
