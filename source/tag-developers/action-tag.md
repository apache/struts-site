---
layout: default
title: Tag Developers Guide (WIP)
---

# action

Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

## Description

{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ActionComponent %}

Parameters can be passed to the action using nested [param](param-tag.html) tags.

## Placement in context

The action will not be published to the context until the whole tag is evaluated, meaning that inside the body of the tag, 
the action cannot be accessed, For example:

```jsp
<s:action var="myAction" name="MyAction" namespace="/">
    Is "myAction" null inside the tag? <s:property value="#myAction == null" />
</s:action>
    Is "myAction" null outside the tag? <s:property value="#myAction == null" />
```

Will print:

Is "myAction" null inside the tag? true

Is "myAction" null outside the tag? false

## Parameters

{% snippet id=tagattributes|struts2-tags/action.html %}

## Examples

{% snippet id=javacode|javadoc=true|lang=java|url=org.apache.struts2.components.ActionComponent %}


{% snippet id=strutsxml|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent %}


{% snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent %}
