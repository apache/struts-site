---
layout: default
title: Tag Developers Guide
---

# append

Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

## Description

{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.AppendIterator {% endcomment %}
<p> <p>Component for AppendIteratorTag, which jobs is to append iterators to form an
 appended iterator whereby entries goes from one iterator to another after each
 respective iterator is exhausted of entries.</p>

 <p>For example, if there are 3 iterator appended (each iterator has 3 entries),
 the following will be how the appended iterator entries will be arranged:</p>

 <ol>
      <li>First Entry of the First Iterator</li>
      <li>Second Entry of the First Iterator</li>
      <li>Third Entry of the First Iterator</li>
      <li>First Entry of the Second Iterator</li>
      <li>Second Entry of the Second Iterator</li>
      <li>Third Entry of the Second Iterator</li>
      <li>First Entry of the Third Iterator</li>
      <li>Second Entry of the Third Iterator</li>
      <li>Third Entry of the Third ITerator</li>
 </ol>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.AppendIterator {% endcomment %}

## Parameters

{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/append.html {% endcomment %}
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

					<td align="left" valign="top">var</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The name of which if supplied will have the resultant appended iterator stored under in the stack's context</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/append.html {% endcomment %}

## Example

{% comment %}start snippet id=code|lang=java|javadoc=true|url=org.apache.struts2.components.AppendIterator {% endcomment %}

```java
 public class AppendIteratorTagAction extends ActionSupport {

  private List myList1;
  private List myList2;
  private List myList3;


  public String execute() throws Exception {

      myList1 = new ArrayList();
      myList1.add("1");
      myList1.add("2");
      myList1.add("3");

      myList2 = new ArrayList();
      myList2.add("a");
      myList2.add("b");
      myList2.add("c");

      myList3 = new ArrayList();
      myList3.add("A");
      myList3.add("B");
      myList3.add("C");

      return "done";
  }

  public List getMyList1() { return myList1; }
  public List getMyList2() { return myList2; }
  public List getMyList3() { return myList3; }
}

```

{% comment %}end snippet id=code|lang=java|javadoc=true|url=org.apache.struts2.components.AppendIterator {% endcomment %}

{% comment %}start snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.AppendIterator {% endcomment %}

```xml
 <s:append var="myAppendIterator">
      <s:param value="%{myList1}" />
      <s:param value="%{myList2}" />
      <s:param value="%{myList3}" />
 </s:append>
 <s:iterator value="%{#myAppendIterator}">
      <s:property />
 </s:iterator>

```

{% comment %}end snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.AppendIterator {% endcomment %}
