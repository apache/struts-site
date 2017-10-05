---
layout: default
title: Tag Developers Guide (WIP)
---

# subset

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}
<p> <b>NOTE: JSP-TAG</b>

 <p>A tag that takes an iterator and outputs a subset of it. It delegates to
 {@link org.apache.struts2.util.SubsetIteratorFilter} internally to
 perform the subset functionality.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/subset.html {% endcomment %}
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

					<td align="left" valign="top">count</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Indicate the number of entries to be in the resulting subset iterator</td>

				</tr>

				<tr>

					<td align="left" valign="top">decider</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">org.apache.struts2.util.SubsetIteratorFilter.Decider</td>

					<td align="left" valign="top">Extension to plug-in a decider to determine if that particular entry is to be included in the resulting subset iterator</td>

				</tr>

				<tr>

					<td align="left" valign="top">source</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Indicate the source of which the resulting subset iterator is to be derived base on</td>

				</tr>

				<tr>

					<td align="left" valign="top">start</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">Indicate the starting index (eg. first entry is 0) of entries in the source to be available as the first entry in the resulting subset iterator</td>

				</tr>

				<tr>

					<td align="left" valign="top">var</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The name to store the resultant iterator into page context, if such name is supplied</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/subset.html {% endcomment %}

__Examples__



{% comment %}start snippet id=action|lang=java|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

```java
 public class MySubsetTagAction extends ActionSupport {
      public String execute() throws Exception {
         l = new ArrayList();
         l.add(new Integer(1));
         l.add(new Integer(2));
         l.add(new Integer(3));
         l.add(new Integer(4));
         l.add(new Integer(5));
         return "done";
      }


      public Integer[] getMyArray() {
         return a;
      }

      public List getMyList() {
         return l;
       }

      public Decider getMyDecider() {
      return new Decider() {
          public boolean decide(Object element) throws Exception {
              int i = ((Integer)element).intValue();
              return (((i % 2) == 0)?true:false);
          }
      };
      }
  }

```

{% comment %}end snippet id=action|lang=java|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}


{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

```xml
 <!-- s: List basic -->
    <s:subset source="myList">
       <s:iterator>
          <s:property />
       </s:iterator>
    </s:subset>

```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

```xml
 <!-- B: List with count -->
    <s:subset source="myList" count="3">
       <s:iterator>
           <s:property />
       </s:iterator>
     </s:subset>

```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

```xml
 <!--  C: List with start -->
      <s:subset source="myList" count="13" start="3">
         <s:iterator>
           <s:property />
         </s:iterator>
      </s:subset>

```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}


{% comment %}start snippet id=example4|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

```xml
 <!--  D: List with var -->
      <s:subset var="mySubset" source="myList" count="13" start="3" />
      <%
          Iterator i = (Iterator) pageContext.getAttribute("mySubset");
          while(i.hasNext()) {
      %>
      <%=i.next() %>
      <%  } %>

```

{% comment %}end snippet id=example4|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}


{% comment %}start snippet id=example5|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}

```xml
  <!--  D: List with Decider -->
      <s:subset source="myList" decider="myDecider">
             <s:iterator>
                  <s:property />
             </s:iterator>
      </s:subset>

```

{% comment %}end snippet id=example5|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag {% endcomment %}
