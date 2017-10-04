---
layout: default
title: Tag Developers Guide (WIP)
---

# push


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% comment %}start snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}
<p> <p>Push value on stack for simplified usage.</p></p>
{% comment %}end snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

__Parameters__



{% comment %}start snippet id=tagattributes|javadoc=false|url=struts2-tags/push.html {% endcomment %}
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
					<td align="left" valign="top">value</td>
					<td align="left" valign="top"><strong>true</strong></td>
					<td align="left" valign="top"></td>
					<td align="left" valign="top">false</td>
					<td align="left" valign="top">String</td>
					<td align="left" valign="top">Value to push on stack</td>
				</tr>
		</table></p>
{% comment %}end snippet id=tagattributes|javadoc=false|url=struts2-tags/push.html {% endcomment %}

__Examples__



{% comment %}start snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```xml
 <s:push value="user">
     <s:propery value="firstName" />
     <s:propery value="lastName" />
 </s:push>
```

{% comment %}end snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example1description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```none
 Pushed user into the stack, and hence property tag could access user's properties
 (firstName, lastName etc) since user is now at the top of the stack
```

{% comment %}end snippet id=example1description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```xml
  <s:push value="myObject">                              ----- (1)
       <s:bean name="jp.SomeBean" var="myBean"/>        ----- (2)
          <s:param name="myParam" value="top"/>        ----- (3)
       </s:bean>
   </s:push>
```

{% comment %}end snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example2description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```none
 when in (1), myObject is at the top of the stack
 when in (2), jp.SomeBean is in the top of stack, also in stack's context with key myBean
 when in (3), top will get the jp.SomeBean instance
```

{% comment %}end snippet id=example2description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example3|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```xml
 <s:push value="myObject">                                       ---(A)
    <s:bean name="jp.SomeBean" var="myBean"/>                   ---(B)
       <s:param name="myParam" value="top.mySomeOtherValue"/>  ---(C)
    </s:bean>
 </s:push>
```

{% comment %}end snippet id=example3|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example3description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```none
 when in (A), myObject is at the top of the stack
 when in (B), jp.SomeBean is at the top of the stack, also in context with key myBean
 when in (C), top refers to jp.SomeBean instance. so top.mySomeOtherValue would invoke SomeBean's mySomeOtherValue() method
```

{% comment %}end snippet id=example3description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example4|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```xml
 <s:push value="myObject">                                 ---- (i)
    <s:bean name="jp.SomeBean" var="myBean"/>             ---- (ii)
       <s:param name="myParam" value="[1].top"/>         -----(iii)
    </s:bean>
 </s:push>
```

{% comment %}end snippet id=example4|lang=xml|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}


{% comment %}start snippet id=example4description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}

```none
 when in (i), myObject is at the top of the stack
 when in (ii), jp.SomeBean is at the top of the stack, followed by myObject
 when in (iii), [1].top will returned top of the cut of stack starting from myObject, namely myObject itself
```

{% comment %}end snippet id=example4description|lang=none|javadoc=true|url=org.apache.struts2.components.Push {% endcomment %}
