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
languages (see [JSP Tags](jsp-tags), [Velocity Tags](velocity-tags), and [FreeMarker Tags](freemarker-tags)),
but some are currently only specific to one language. Whenever a tag doesn't have complete support for every language,
it is noted on the tag's reference page.

The types of tags can be broken in to two types: generic and UI. Besides function and responsibility, the biggest
difference between the two is that the HTML tags support _templates_  and _themes_ . In addition to the general tag
reference, we also provide examples for using these generic tags in each of the support languages.s

> Be sure to read the [Tag Syntax](tag-syntax) document to learn how tag attribute syntax works.

## FAQs

* [Why do the form tags put table tags around controls?](https://cwiki.apache.org/confluence/display/WW/Why+do+the+form+tags+put+table+tags+around+controls)

* [How can I put a String literal in a Javascript call, for instance in an onChange attribute?](https://cwiki.apache.org/confluence/display/WW/How+can+I+put+a+String+literal+in+a+Javascript+call%2C+for+instance+in+an+onChange+attribute)

* [Why won't the 'if' tag evaluate a one char string?](https://cwiki.apache.org/confluence/display/WW/Why+won%27t+the+%27if%27+tag+evaluate+a+one+char+string)

* [Why does FreeMarker complain that there's an error in my user-directive when I used JSP Tag?](https://cwiki.apache.org/confluence/display/WW/Why+does+FreeMarker+complain+that+there%27s+an+error+in+my+user-directive+when+I+used+JSP+Tag)

* [Can an action tag run another method apart from the default execute method?](https://cwiki.apache.org/confluence/display/WW/Can+an+action+tag+run+another+method+apart+from+the+default+execute+method)

* [Why didn't my action tag get executed when I have validation errors?](https://cwiki.apache.org/confluence/display/WW/Why+didn%27t+my+action+tag+get+executed+when+I+have+validation+errors)

* [Why are request parameters appended to our hyperlinks?](https://cwiki.apache.org/confluence/display/WW/Why+are+request+parameters+appended+to+our+hyperlinks)

## Resources

* [Creating a UI Component in Struts 2](http://www.vitarara.org/cms/struts_2_cookbook/creating_a_ui_component) (Mark Menard)
* [Struts 2 Tags](http://www.roseindia.net/struts/struts2/struts-2-tags.shtml) (Rose India)
