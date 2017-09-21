---
layout: default
title: Tag Developers Guide (WIP)
---

# Selecting Template Directory

Template directory can be selected using several different rules, in this order:

1. The 

~~~~~~~
templateDir
~~~~~~~
 attribute on the specific tag

2. The page-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

3. The request-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

4. The session-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

5. The application-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

6. The 

~~~~~~~
struts.ui.templateDir
~~~~~~~
 property in _struts.properties_  (defaults to _template_ )

__Tips__

+ To change the template directory for the entire application, modify the _struts.properties_ .

