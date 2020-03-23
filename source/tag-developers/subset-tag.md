---
layout: tag-developers
title: subset tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# subset

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

A tag that takes an iterator and outputs a subset of it. It delegates to `org.apache.struts2.util.SubsetIteratorFilter`
internally to perform the subset functionality.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/subset-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/subset-attributes.html %}

## Examples

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

**Basic example**

```jsp
<s:subset source="myList">
   <s:iterator>
      <s:property />
   </s:iterator>
</s:subset>
```

**List with count**

```xml
<s:subset source="myList" count="3">
   <s:iterator>
       <s:property />
   </s:iterator>
</s:subset>
```

**List with start**

```jsp
<s:subset source="myList" count="13" start="3">
   <s:iterator>
     <s:property />
   </s:iterator>
</s:subset>
```

**List with var**

```jsp
<s:subset var="mySubset" source="myList" count="13" start="3" />
<%
    Iterator i = (Iterator) pageContext.getAttribute("mySubset");
    while(i.hasNext()) {
%>
<%=i.next() %>
<%  } %>
```

**List with Decider**

```jsp
<s:subset source="myList" decider="myDecider">
       <s:iterator>
            <s:property />
       </s:iterator>
</s:subset>
```
