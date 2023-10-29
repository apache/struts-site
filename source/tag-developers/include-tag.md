---
layout: default
title: include tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# include

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/include-description.html %}

> **Note:** Any additional params supplied to the included page are **not** accessible within the rendered page 
> through the `<s:property.../>` tag since no ValueStack will be created. You can, however, access them in a servlet
> via the HttpServletRequest object or from a JSP page via a scriptlet.

### How to access parameters

Parameters are passed as request parameters, so use the `${param.paramName}` notation to access them. Do not use 
the `<s:property/>` tag to access parameters in included files.

Below it's an example how you can access parameters passed into the included page:

with scope:
```
<s:set var="innerName" scope="page">${param.paramName}</s:set>
<s:property value="#attr.innerName"/>
```

with no scope:
```jsp
<s:set var="innerName">${param.paramName}</s:set>
<s:property value="innerName"/>
<s:property value="#attr.innerName"/>
<s:property value="#innerName"/>
```

> **Note**: You can access such params without using JSTL, just use `${param.paramName}` notation.

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/include-attributes.html %}

## Example

**Example 1**

```jsp
<s:include value="myJsp.jsp" />
```

do an include myJsp.jsp page
 
**Example 2**

```jsp
<s:include value="myJsp.jsp">
   <s:param name="param1" value="value2" />
   <s:param name="param2" value="value2" />
</s:include>
```

do an include to `myJsp.jsp` page with parameters `param1=value1` and `param2=value2`

**Example 3**

```jsp
<s:include value="myJsp.jsp">
   <s:param name="param1">value1</s:param>
   <s:param name="param2">value2</s:param>
</s:include>
```

do an include to `myJsp.jsp` page with parameters `param1=value1` and `param2=value2`

**Example 4**

accessing passed parameters in the included page

with scope:
```jsp
<s:set var="param1" scope="page">${param.param1}</s:set>
<s:property value="#attr.param1"/>
```

with no scope:
```jsp
<s:set var="param2">${param.param2}</s:set>
<s:property value="param2"/>

<s:property value="#attr.param2"/>
<s:property value="#param2"/>
```
