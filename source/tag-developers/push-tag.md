---
layout: default
title: push tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# push

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/push-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/push-attributes.html %}

## Examples

```jsp
<s:push value="user">
    <s:propery value="firstName" />
    <s:propery value="lastName" />
</s:push>
```

Pushed user into the stack and hence property tag could access user's properties (`firstName`, `lastName`, etc.) since
user is now at the top of the stack.

```jsp
<s:push value="myObject">                            ----- (1)
     <s:bean name="jp.SomeBean" var="myBean"/>       ----- (2)
        <s:param name="myParam" value="top"/>        ----- (3)
     </s:bean>
</s:push>
```

when in (1), `myObject` is at the top of the stack
when in (2), `jp.SomeBean` is in the top of stack, also in stack's context with key `myBean`
when in (3), top will get the `jp.SomeBean` instance

```jsp
<s:push value="myObject">                                     ---(A)
   <s:bean name="jp.SomeBean" var="myBean"/>                  ---(B)
      <s:param name="myParam" value="top.mySomeOtherValue"/>  ---(C)
   </s:bean>
</s:push>
```

when in (A), `myObject` is at the top of the stack
when in (B), `jp.SomeBean` is at the top of the stack, also in context with key `myBean`
when in (C), top refers to `jp.SomeBean` instance. so `top.mySomeOtherValue` would invoke SomeBean's `mySomeOtherValue()`
method

```jsp
<s:push value="myObject">                               ---- (i)
   <s:bean name="jp.SomeBean" var="myBean"/>            ---- (ii)
      <s:param name="myParam" value="[1].top"/>         -----(iii)
   </s:bean>
</s:push>
```

when in (i), `myObject` is at the top of the stack
when in (ii), `jp.SomeBean` is at the top of the stack, followed by `myObject`
when in (iii), `[1].top` will returned top of the cut of stack starting from `myObject`, namely `myObject` itself
