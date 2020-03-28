---
layout: default
title: param tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# param

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

This tag can be used to parameterize other tags. The `include` tag and `bean` tag are examples of such tags.

The parameters can be added with or without a `name` as key. If the tag provides a `name` attribute the parameters are 
added using the `Component#addParameter(String, Object)` method. For unnamed parameters the tag must implement 
the `UnnamedParametric` interface defined in this class (e.g. The TextTag does this).

This tag has the following two parameters.

- name (String) - the name of the parameter
- value (Object) - the value of the parameter
- suppressEmptyParameters (boolean) - whether to suppress this parameter if empty

> **NOTE**: When you declare the param tag, the value can be defined in either a `value` attribute or as text between 
> the start and end tag. Struts behaves a bit different according to these two situations. This is best illustrated 
> using an example:
> `<param name="color">blue</param>` (A)
> `<param name="color" value="blue"/>` (B)
> In the first situation (A) the value would be evaluated to the stack as a `java.lang.String` object. And in situation 
> (B) the value would be evaluated to the stack as a `java.lang.Object` object. 
> For more information see [WW-808](https://issues.apache.org/jira/browse/WW-808).

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/param-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/param-attributes.html %}

## Examples

```jsp
<ui:component>
 <ui:param name="key"     value="[0]"/>
 <ui:param name="value"   value="[1]"/>
 <ui:param name="context" value="[2]"/>
</ui:component>
```

Whether to suppress empty parameters:

```jsp
<s:url action="eventAdd">
  <s:param name="bean.searchString" value="%{bean.searchString}" />
  <s:param name="bean.filter" value="%{bean.filter}" />
  <s:param name="bean.pageNum" value="%{pager.pageNumber}" suppressEmptyParameters="true" />
</s:url>
```

where the key will be the identifier and the value the result of an OGNL expression run against the current ValueStack.
