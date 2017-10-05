---
layout: default
title: Tag Developers Guide (WIP)
---

# generator

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.IteratorGeneratorTag {% endcomment %}
<p> <b>NOTE: JSP-TAG</b>

 <p>Generate an iterator based on the val attribute supplied.</P>

 <b>NOTE:</b> The generated iterator will <b>ALWAYS</b> be pushed into the top of the stack, and poped
 at the end of the tag.
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.IteratorGeneratorTag {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/generator.html {% endcomment %}
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

					<td align="left" valign="top">converter</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">org.apache.struts2.util.IteratorGenerator.Converter</td>

					<td align="left" valign="top">The converter to convert the String entry parsed from <i>val</i> into an object</td>

				</tr>

				<tr>

					<td align="left" valign="top">count</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">The max number entries to be in the iterator</td>

				</tr>

				<tr>

					<td align="left" valign="top">separator</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The separator to be used in separating the <i>val</i> into entries of the iterator</td>

				</tr>

				<tr>

					<td align="left" valign="top">val</td>

					<td align="left" valign="top"><strong>true</strong></td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">The source to be parsed into an iterator</td>

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
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/generator.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.IteratorGeneratorTag {% endcomment %}

```xml
 Example One:
 <pre>
 Generate a simple iterator
 <s:generator val="%{'aaa,bbb,ccc,ddd,eee'}">
  <s:iterator>
      <s:property /><br/>
  </s:iterator>
 </s:generator>
 </pre>
 This generates an iterator and print it out using the iterator tag.

 Example Two:
 <pre>
 Generate an iterator with count attribute
 <s:generator val="%{'aaa,bbb,ccc,ddd,eee'}" count="3">
  <s:iterator>
      <s:property /><br/>
  </s:iterator>
 </s:generator>
 </pre>
 This generates an iterator, but only 3 entries will be available in the iterator
 generated, namely aaa, bbb and ccc respectively because count attribute is set to 3

 Example Three:
 <pre>
 Generate an iterator with var attribute
 <s:generator val="%{'aaa,bbb,ccc,ddd,eee'}" count="4" separator="," var="myAtt" />
 <%
  Iterator i = (Iterator) pageContext.getAttribute("myAtt");
  while(i.hasNext()) {
      String s = (String) i.next(); %>
      <%=s%> <br/>
 <%    }
 %>
 </pre>
 This generates an iterator and put it in the PageContext under the key as specified
 by the var attribute.


 Example Four:
 <pre>
 Generate an iterator with comparator attribute
 <s:generator val="%{'aaa,bbb,ccc,ddd,eee'}" converter="%{myConverter}">
  <s:iterator>
      <s:property /><br/>
  </s:iterator>
 </s:generator>


 public class GeneratorTagAction extends ActionSupport {

   ....

   public Converter getMyConverter() {
      return new Converter() {
          public Object convert(String value) throws Exception {
              return "converter-"+value;
          }
      };
   }

   ...

 }
 </pre>
 This will generate an iterator with each entries decided by the converter supplied. With
 this converter, it simply add "converter-" to each entries.

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.IteratorGeneratorTag {% endcomment %}
