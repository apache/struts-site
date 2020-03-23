---
layout: tag-developers
title: generator tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# generator

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Generate an iterator based on the val attribute supplied.

> NOTE: The generated iterator will **ALWAYS** be pushed into the top of the stack, and poped at the end of the tag.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/generator-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/generator-attributes.html %}

## Examples

**Example 1**: generate a simple iterator

```jsp
<s:generator val="%{'aaa,bbb,ccc,ddd,eee'}">
 <s:iterator>
     <s:property /><br/>
 </s:iterator>
</s:generator>
```

This generates an iterator and print it out using the iterator tag.

**Example 2**: generate an iterator with count attribute

```jsp
<s:generator val="%{'aaa,bbb,ccc,ddd,eee'}" count="3">
 <s:iterator>
     <s:property /><br/>
 </s:iterator>
</s:generator>
```

This generates an iterator, but only 3 entries will be available in the iterator generated, namely aaa, bbb and ccc 
respectively because count attribute is set to 3.

**Example 3**: generate an iterator with var attribute

```jsp
<s:generator val="%{'aaa,bbb,ccc,ddd,eee'}" count="4" separator="," var="myAtt" />
<%
 Iterator i = (Iterator) pageContext.getAttribute("myAtt");
 while(i.hasNext()) {
     String s = (String) i.next(); %>
     <%=s%> <br/>
<%    }
%>
```

This generates an iterator and put it in the PageContext under the key as specified by the var attribute.

**Example 4**: generate an iterator with comparator attribute

```jsp
<s:generator val="%{'aaa,bbb,ccc,ddd,eee'}" converter="%{myConverter}">
 <s:iterator>
     <s:property /><br/>
 </s:iterator>
</s:generator>
```

```java
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
```

This will generate an iterator with each entries decided by the converter supplied. With this converter, it simply 
add "converter-" to each entries.
