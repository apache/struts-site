---
layout: tag-developers
title: iterator tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# iterator

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

> **NOTE**: The id attribute is deprecated in Struts 2.1.x, and has been replaced by the var attribute.
> The `begin`, `end` and `step` attributes are only available from 2.1.7+

## Description

Iterator will iterate over a value. An iterable value can be any of: `java.util.Collection`, `java.util.Iterator`, 
`java.util.Enumeration`, `java.util.Map`, or an array.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/iterator-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/iterator-attributes.html %}

## Examples

The following example retrieves the value of the getDays() method of the current object on the value stack and uses 
it to iterate over. The `<s:property/>` tag prints out the current value of the iterator.

```jsp
<s:iterator value="days">
  <p>day is: <s:property/></p>
</s:iterator>
```

The following example uses a {@link Bean} tag and places it into the ActionContext. The iterator tag will retrieve that 
object from the `ActionContext` and then calls its `getDays()` method as above. The status attribute is also used 
to create an `IteratorStatus` object, which in this example, its `odd()` method is used to alternate row colours:

```jsp
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

The next example will further demonstrate the use of the status attribute, using a DAO obtained from the action class 
through OGNL, iterating over groups and their users (in a security context). The last() method indicates if the current 
object is the last available in the iteration, and if not, we need to separate the users using a comma:

```jsp
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

The next example iterates over a an action collection and passes every iterator value to another action. The trick here 
lies in the use of the `[0]` operator. It takes the current iterator value and passes it on to the edit action. 
Using the `[0]` operator has the same effect as using `<s:property />`. (The latter, however, does not work from inside 
the `param` tag).

```jsp
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

A loop that iterates 5 times

```jsp
<s:iterator var="counter" begin="1" end="5" >
   <!-- current iteration value (1, ... 5) -->
   <s:property value="top" />
</s:iterator>
```

Another way to create a simple loop, similar to JSTL's `<c:forEach begin="..." end="..." ...>` is to use some  OGNL 
magic, which provides some under-the-covers magic to make 0-n loops trivial. This example also loops five times.

```jsp
<s:iterator status="stat" value="(5).{ #this }" >
   <s:property value="#stat.count" /> <!-- Note that "count" is 1-based, "index" is 0-based. -->
</s:iterator>
```

A loop that iterates over a partial list

```jsp
<s:iterator value="{1,2,3,4,5}" begin="2" end="4" >
   <!-- current iteration value (2,3,4) -->
   <s:property value="top" />
</s:iterator>
```
