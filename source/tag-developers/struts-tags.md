---
layout: default
title: Struts Tags
parent:
  title: Tag Developers Guide
  url: index
---

# Struts Tags

The framework provides a tag library decoupled from the view technology. In this section, we describe each tag in general 
terms, such as the attributes it supports, what the behaviors are, and so forth. Most tags are supported in all template 
languages (see [JSP Tags](jsp-tags.html), [Velocity Tags](velocity-tags.html), and [FreeMarker Tags](freemarker-tags.html)), 
but some are currently only specific to one language. Whenever a tag doesn't have complete support for every language, 
it is noted on the tag's reference page.

The types of tags can be broken in to two types: generic and UI. Besides function and responsibility, the biggest 
difference between the two is that the HTML tags support _templates_  and _themes_ . In addition to the general tag 
reference, we also provide examples for using these generic tags in each of the support languages.

> Be sure to read the [Tag Syntax](tag-syntax.html) document to learn how tag attribute syntax works.

## FAQs

+ _Why do the form tags put table tags around controls_ ?

+ _How can I put a String literal in a Javascript call, for instance in an onChange attribute_ ?

+ _Why won't the 'if' tag evaluate a one char string_ ?

+ _Why does FreeMarker complain that there's an error in my user-directive when I used JSP Tag_ ?

+ _Can an action tag run another method apart from the default execute method_ ?

+ _Why didn't my action tag get executed when I have validation errors_ ?

+ _Why are request parameters appended to our hyperlinks_ ?

## Resources

- [Creating a UI Component in Struts 2](http://www.vitarara.org/cms/struts_2_cookbook/creating_a_ui_component) (Mark Menard)
- [Struts 2 Tags](http://www.roseindia.net/struts/struts2/struts-2-tags.shtml) (Rose India)
