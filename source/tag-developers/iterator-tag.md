---
layout: default
title: Tag Developers Guide
---

# iterator


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


The id attribute is deprecated in Struts 2.1.x, and has been replaced by the var attribute.

| 

The begin, end and step attributes are only available from 2.1.7 on

> 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p>Iterator will iterate over a value. An iterable value can be any of: java.util.Collection, java.util.Iterator,
 java.util.Enumeration, java.util.Map, or an array.</p>

</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/iterator.html {% endcomment %}
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

					<td align="left" valign="top">begin</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">0</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">if specified the iteration will start on that index</td>

				</tr>

				<tr>

					<td align="left" valign="top">end</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Size of the 'values' List or array, or 0 if 'step' is negative</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">if specified the iteration will end on that index(inclusive)</td>

				</tr>

				<tr>

					<td align="left" valign="top">status</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Boolean</td>

					<td align="left" valign="top">If specified, an instanceof IteratorStatus will be pushed into stack upon each iteration</td>

				</tr>

				<tr>

					<td align="left" valign="top">step</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">1</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">Integer</td>

					<td align="left" valign="top">if specified the iteration index will be increased by this value on each iteration. It can be a negative value, in which case 'begin' must be greater than 'end'</td>

				</tr>

				<tr>

					<td align="left" valign="top">value</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">the iteratable source to iterate over, else an the object itself will be put into a newly created List</td>

				</tr>

				<tr>

					<td align="left" valign="top">var</td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top"></td>

					<td align="left" valign="top">false</td>

					<td align="left" valign="top">String</td>

					<td align="left" valign="top">Name used to reference the value pushed into the Value Stack</td>

				</tr>

		</table>

</p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/iterator.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p>The following example retrieves the value of the getDays() method of the current object on the value stack and
 uses it to iterate over. The <s:property/> tag prints out the current value of the iterator.</p>

</p>
{% comment %}end snippet id=example1description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example1code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml
 <s:iterator value="days">
   <p>day is: <s:property/></p>
 </s:iterator>

```

{% comment %}end snippet id=example1code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example2description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p>The following example uses a {@link Bean} tag and places it into the ActionContext. The iterator tag will retrieve
 that object from the ActionContext and then calls its getDays() method as above. The status attribute is also used to
 create an {@link IteratorStatus} object, which in this example, its odd() method is used to alternate row
 colours:</p>

</p>
{% comment %}end snippet id=example2description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example2code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml

 <s:bean name="org.apache.struts2.example.IteratorExample" var="it">
   <s:param name="day" value="'foo'"/>
   <s:param name="day" value="'bar'"/>
 </s:bean>

 <table border="0" cellspacing="0" cellpadding="1">
 <tr>
   <th>Days of the week</th>
 </tr>

 <s:iterator value="#it.days" status="rowstatus">
   <tr>
     <s:if test="#rowstatus.odd == true">
       <td style="background: grey"><s:property/></td>
     </s:if>
     <s:else>
       <td><s:property/></td>
     </s:else>
   </tr>
 </s:iterator>
 </table>


```

{% comment %}end snippet id=example2code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example3description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p> The next example will further demonstrate the use of the status attribute, using a DAO obtained from the action
 class through OGNL, iterating over groups and their users (in a security context). The last() method indicates if the
 current object is the last available in the iteration, and if not, we need to separate the users using a comma: </p>

</p>
{% comment %}end snippet id=example3description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example3code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml

  <s:iterator value="groupDao.groups" status="groupStatus">
      <tr class="<s:if test="#groupStatus.odd == true ">odd</s:if><s:else>even</s:else>">
          <td><s:property value="name" /></td>
          <td><s:property value="description" /></td>
          <td>
              <s:iterator value="users" status="userStatus">
                  <s:property value="fullName" /><s:if test="!#userStatus.last">,</s:if>
              </s:iterator>
          </td>
      </tr>
  </s:iterator>


```

{% comment %}end snippet id=example3code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example4description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p> The next example iterates over a an action collection and passes every iterator value to another action. The
 trick here lies in the use of the '[0]' operator. It takes the current iterator value and passes it on to the edit
 action. Using the '[0]' operator has the same effect as using <s:property />. (The latter, however, does not
 work from inside the param tag). </p>

</p>
{% comment %}end snippet id=example4description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example4code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml

      <s:action name="entries" var="entries"/>
      <s:iterator value="#entries.entries" >
          <s:property value="name" />
          <s:property />
          <s:push value="...">
              <s:action name="edit" var="edit" >
                  <s:param name="entry" value="[0]" />
              </s:action>
          </push>
      </s:iterator>


```

{% comment %}end snippet id=example4code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example5description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p>A loop that iterates 5 times</p>

</p>
{% comment %}end snippet id=example5description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example5code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml

 <s:iterator var="counter" begin="1" end="5" >
    <!-- current iteration value (1, ... 5) -->
    <s:property value="top" />
 </s:iterator>


```

{% comment %}end snippet id=example5code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example6description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p>Another way to create a simple loop, similar to JSTL's
 <c:forEach begin="..." end="..." ...> is to use some 
 OGNL magic, which provides some under-the-covers magic to 
 make 0-n loops trivial. This example also loops five times.</p>

</p>
{% comment %}end snippet id=example6description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example6code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml

 <s:iterator status="stat" value="(5).{ #this }" >
    <s:property value="#stat.count" /> <!-- Note that "count" is 1-based, "index" is 0-based. -->
 </s:iterator>


```

{% comment %}end snippet id=example6code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example7description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
<p>
 <p>A loop that iterates over a partial list</p>

</p>
{% comment %}end snippet id=example7description|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}


{% comment %}start snippet id=example7code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}

```xml

 <s:iterator value="{1,2,3,4,5}" begin="2" end="4" >
    <!-- current iteration value (2,3,4) -->
    <s:property value="top" />
 </s:iterator>


```

{% comment %}end snippet id=example7code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent {% endcomment %}
