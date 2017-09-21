---
layout: default
title: Tag Developers Guide (WIP)
---

# Extending Themes


Most often, an application may just need to override a template (see [Template Loading](#PAGE_13817)) so that a certain control renders differently. Or, an application may need to add a new template to an existing theme. Other times, you might want to create an entirely new theme, perhaps because you are building a rich set of unique and reusable templates for your organization.

There are three ways to create new themes:

+ Create a new theme from scratch (**hard!**)

+ Wrap an existing theme

+ Extend an existing theme

__Creating a New Theme from Scratch__


It's probably never a good idea to create a new theme from scratch. Instead, use the [simple theme](#PAGE_14291) as a starting point. The simple theme provides just enough foundation to make it easy to create new controls by extending or wrapping the basic controls. Before starting a new theme, be sure to review the source templates for all of the provided themes. The existing themes are your best guide to creating new themes.

| 

__Wrapping an Existing Theme__

The [xhtml theme](#PAGE_13834) provides several good examples of the "wrapping" technique. The [simple theme](#PAGE_14291) renders the basic control. The xhtml theme "dresses up" many of the controls by adding a header and footer.

**Wrapping a control**


~~~~~~~
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlheader.ftl" />
<#include "/${parameters.templateDir}/simple/xxx.ftl" />
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlfooter.ftl" />

~~~~~~~

Wrapping is a great way to augment the basic HTML elements provided by the simple theme.

__Extending an Existing Theme__

One benefit of object-orientated programming is that it lets us "design by difference." We can extend an object and code only the behaviour that changes. Themes provide a similar capability. The subdirectory that hosts a theme can contain a 

~~~~~~~
theme.properties
~~~~~~~
 file. A 

~~~~~~~
parent
~~~~~~~
 entry can be added to the property file to designate a theme to extend. The [ajax theme](#PAGE_14205) extends the [xhtml theme](#PAGE_13834) using this technique.

**/template/ajax/theme.properties**


~~~~~~~
parent = xhtml

~~~~~~~

An extended theme does not need to implement every single template that the [Struts Tags](#PAGE_14248) expect. It only needs to implement the templates that change. The other templates are loaded from the parent template.

__Special parameters__

[UIBean](http://struts.apache.org/development/2.x/struts2-core/apidocs/org/apache/struts2/components/UIBean.html)^[http://struts.apache.org/development/2.x/struts2-core/apidocs/org/apache/struts2/components/UIBean.html] provides few special parameters which can be used to build a new template (they are already used in 

~~~~~~~
xhtml
~~~~~~~
 and 

~~~~~~~
css_xhtml
~~~~~~~
 theme):

+ 

~~~~~~~
templateDir
~~~~~~~
 - current value of templateDir parameter, see [Selecting Template Directory](#PAGE_14227)

+ 

~~~~~~~
theme
~~~~~~~
 - used theme, see [Selecting Themes](#PAGE_14016)

+ 

~~~~~~~
template
~~~~~~~
 - name of the template file to use (i.e. text)

+ 

~~~~~~~
themeExpansionToken
~~~~~~~
 - special token used to indicate to search for a template also in parent theme (when used with 

~~~~~~~
<#include />
~~~~~~~
 directive)

+ 

~~~~~~~
expandTheme
~~~~~~~
 - tells internal template loader mechanism to try load template from current theme and then from parent theme (and parent theme, and so on)

Using 

~~~~~~~
expandTheme
~~~~~~~
 parameter allows to override only some parts of the theme's templates, e.g. css.ftl. You can define a new theme (set theme.properties) and override just single file.

\${parameters.expandTheme} is a recurrence which tells ThemeManager to load template from current theme and then from parent theme (defined in theme.properties) and so on.

Please also notice that the ThemeManager builds list of possible templates based on current theme and inherited themes (/template/custom/textarea.ftl, /template/xhtml/textarea.ftl, /template/simple/textarea.ftl). This is also true for templates which are loaded via \${parameters.expandTheme}.

 (ok)  See also example _Struts 2 Themes_  or [Creating a Theme in Struts 2](http://www.vitarara.org/cms/struts_2_cookbook/creating_a_theme)^[http://www.vitarara.org/cms/struts_2_cookbook/creating_a_theme] (Mark Menard)

