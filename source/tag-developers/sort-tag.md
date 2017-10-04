---
layout: default
title: Tag Developers Guide (WIP)
---

# sort


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SortIteratorTag {% endcomment %}
<p>
 <b>NOTE: JSP-TAG</b>

 <p>A Tag that sorts a List using a Comparator both passed in as the tag attribute.
 If 'var' attribute is specified, the sorted list will be placed into the PageContext
 attribute using the key specified by 'var'. The sorted list will ALWAYS be
 pushed into the stack and poped at the end of this tag.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SortIteratorTag {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|url=struts2-tags/sort.html {% endcomment %}
<p>		<table width="100%">
			<tr>
				<td colspan="6"><h4>Dynamic Attributes Allowed:</h4> false</td>
			</tr>
			<tr>
				<td colspan="6">&nbsp;</td>
			</tr>
			<tr>
				<th align="left" valign="top"><h4>Name</h4></th>
				<th align="left" valign="top"><h4>Required</h4></th>
				<th align="left" valign="top"><h4>Default</h4></th>
				<th align="left" valign="top"><h4>Evaluated</h4></th>
				<th align="left" valign="top"><h4>Type</h4></th>
				<th align="left" valign="top"><h4>Description</h4></th>
			</tr>
				<tr>
					<td align="left" valign="top">comparator</td>
					<td align="left" valign="top"><strong>true</strong></td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">java.util.Comparator</td>
					<td align="left" valign="top">The comparator to use</td>
				</tr>
				<tr>
					<td align="left" valign="top">source</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The iterable source to sort</td>
				</tr>
				<tr>
					<td align="left" valign="top">var</td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">The name to store the resultant iterator into page context, if such name is supplied</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|url=struts2-tags/sort.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SortIteratorTag {% endcomment %}

```xml

 USAGE 1:
 <s:sort comparator="myComparator" source="myList">
      <s:iterator>
      <!-- do something with each sorted elements -->
      <s:property value="..." />
      </s:iterator>
 </s:sort>

 USAGE 2:
 <s:sort var="mySortedList" comparator="myComparator" source="myList" />

 <%
    Iterator sortedIterator = (Iterator) pageContext.getAttribute("mySortedList");
    for (Iterator i = sortedIterator; i.hasNext(); ) {
      // do something with each of the sorted elements
    }
 %>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SortIteratorTag {% endcomment %}
