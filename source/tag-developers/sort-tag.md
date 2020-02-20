---
layout: tag-developers
title: sort tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# sort

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

A Tag that sorts a List using a Comparator both passed in as the tag attribute. If `var` attribute is specified,
the sorted list will be placed into the `PageContext` attribute using the key specified by `var`. The sorted list will 
**ALWAYS** be pushed into the stack and poped at the end of this tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/sort-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/sort-attributes.html %}

## Examples

**Example 1**

```jsp
<s:sort comparator="myComparator" source="myList">
     <s:iterator>
     <!-- do something with each sorted elements -->
     <s:property value="..." />
     </s:iterator>
</s:sort>
```

**Example 2**

```jsp
<s:sort var="mySortedList" comparator="myComparator" source="myList" />

<%
   Iterator sortedIterator = (Iterator) pageContext.getAttribute("mySortedList");
   for (Iterator i = sortedIterator; i.hasNext(); ) {
     // do something with each of the sorted elements
   }
%>
```
