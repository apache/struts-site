---
layout: default
title: Tag Developers Guide (WIP)
---

# Ajax Tags

**Dojo plugin is deprecated and was removed since Struts 2.5**


> **Please** check that documentation and the Dojo tag examples in the showcase app of the appropriate Struts 2 version 
> before asking questions on the struts-user mailing list!

## Description

To use the AJAX tags from 2.1 on you must:

- Include the Dojo Plugin distributed with Struts 2 in your /WEB-INF/lib folder.
- Add `<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>` to your page.
- Include the [head](head-tag.html) tag on the page, which can be configured for performance or debugging purposes.

## Handling AJAX Responses

The following attributes affect the handling of all ajax responses.

|Attribute|Default Value|Description|
|---------|-------------|-----------|
|parseContent|true|When true, Dojo will parse the response into an XHTML Document Object and traverse the nodes searching for Dojo Widget markup.  The parse and traversal is performed prior to inserting the nodes into the DOM. This attribute must be enabled to nest Dojo widgets (dojo tags) within responses. There's significant processing involved to create and parse the document so switch this feature off when not required. Note also that the response must be valid XHTML for cross-browser support and widgets must have unique IDs.|
|separateScripts|true|When true, Dojo will extract the <script> tags from the response, concatenate the extracted code into one block, create a new Function whose body is the extracted code and immediately invoke the function. The invocation is performed after the DOM has been updated with the XHTML. The function is executed within the scope of the widget (that is, the  **this** variable points to the widget instance).\
\
When false, Dojo will extract the <script> tags from the response, concatenate the extracted code into one block and:\
\
\*in IE:  invoke window.execScript() on the code\
\
\*in other browsers: create a <script> node containing the code and insert that node into the DOM\
\
This invocation occurs after the DOM has been updated with the XHTML. Note that scripts may not be executed if it is not valid to create a <script> node in the DOM at the destination.|
|executeScripts|false|When true, Dojo will extract code from the <script> tags from the response and execute it based on the separateScripts value.\
\
When false, the XHTML response is inserted into the DOM and <script> nodes are ignored. |

> It's possible that the updated DOM will not include <script> nodes even though the inline code has been executed.

Ensure the response is XHTML-compliant (including, for example, thead and tbody tags in tables).

If you intend to run inline javascript:

- Ensure the  javascript can be concatenated and executed in one block,
- set executeScripts=true,
- set separateScripts=true (the reliable option)

## Topics

Most of the AJAX tags use Dojo topics for event notification and communication between them, to learn about topics visit 
[Dojo's documentation](http://dojotoolkit.org/book/dojo-book-0-4/part-5-connecting-pieces/event-system/topics)

## Examples

Examples can be found on the documentation for each tag in the [UI Tag Reference](ui-tag-reference.html) page, 
for additional examples see [Ajax and JavaScript Recipes](ajax-and-javascript-recipes.html) and the Showcase application 
distributed with Struts 2.

## Tags

- [a](dojo-href-tag.html)
- [autocompleter](dojo-autocompleter-tag.html)
- [bind](dojo-bind-tag.html)
- [datetimepicker](dojo-datetimepicker-tag.html)
- [div](dojo-div-tag.html)
- [head](dojo-head-tag.html)
- [submit](dojo-submit-tag.html)
- [tabbedpanel](dojo-tabbedpanel-tag.html) 
- [textarea](dojo-textarea-tag.html)
- [tree](dojo-tree-tag.html)
- [treenode](dojo-treenode-tag.html)
