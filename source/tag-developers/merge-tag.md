---
layout: default
title: Tag Developers Guide (WIP)
---

# merge


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.MergeIterator {% endcomment %}
<p> <p>Component for MergeIteratorTag, which job is to merge iterators and successive
 call to the merged iterator will cause each merge iterator to have a chance to
 expose its element, subsequently next call will allow the next iterator to expose
 its element. Once the last iterator is done exposing its element, the first iterator
 is allowed to do so again (unless it is exhausted of entries).</P>

 <p>Internally the task are delegated to MergeIteratorFilter</p>

 <p>Example if there are 3 lists being merged, each list have 3 entries, the following will
 be the logic.</P>
 <ol>
      <li>Display first element of the first list</li>
      <li>Display first element of the second list</li>
      <li>Display first element of the third list</li>
      <li>Display second element of the first list</li>
      <li>Display second element of the second list</li>
      <li>Display second element of the third list</li>
      <li>Display third element of the first list</li>
      <li>Display thrid element of the second list</li>
      <li>Display third element of the thrid list</li>
 </ol>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.MergeIterator {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/merge.html {% endcomment %}
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

					<td align="left" valign="top">The name where the resultant merged iterator will be stored in the stack's context</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/merge.html {% endcomment %}

__Examples__



{% comment %}start snippet id=javacode|lang=java|javadoc=true|url=org.apache.struts2.components.MergeIterator {% endcomment %}

```java
 public class MergeIteratorTagAction extends ActionSupport {

  private List myList1;
  private List myList2;
  private List myList3;

  public List getMyList1() {
      return myList1;
  }

  public List getMyList2() {
      return myList2;
  }

  public List getMyList3() {
      return myList3;
  }


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
 }

```

{% comment %}end snippet id=javacode|lang=java|javadoc=true|url=org.apache.struts2.components.MergeIterator {% endcomment %}


{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.MergeIterator {% endcomment %}

```xml
 <s:merge var="myMergedIterator1">
      <s:param value="%{myList1}" />
      <s:param value="%{myList2}" />
      <s:param value="%{myList3}" />
 </s:merge>
 <s:iterator value="%{#myMergedIterator1}">
      <s:property />
 </s:iterator>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.MergeIterator {% endcomment %}
