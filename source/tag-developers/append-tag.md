---
layout: tag-developers
title: append tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# append

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Component for AppendIteratorTag, which jobs is to append iterators to form an appended iterator whereby entries goes 
from one iterator to another after each respective iterator is exhausted of entries.

For example, if there are 3 iterator appended (each iterator has 3 entries the following will be how the appended 
iterator entries will be arranged:

1. First Entry of the First Iterator
2. Second Entry of the First Iterator
3. Third Entry of the First Iterator
4. First Entry of the Second Iterator
5. Second Entry of the Second Iterator
6. Third Entry of the Second Iterator
7. First Entry of the Third Iterator
8. Second Entry of the Third Iterator
9. Third Entry of the Third Iterator

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/append-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/append-description.html %}

## Example

```java
 public class AppendIteratorTagAction extends ActionSupport {

  private List myList1;
  private List myList2;
  private List myList3;


  public String execute() throws Exception {

      myList1 = new ArrayList();
      myList1.add("1");
      myList1.add("2");
      myList1.add("3");

      myList2 = new ArrayList();
      myList2.add("a");
      myList2.add("b");
      myList2.add("c");

      myList3 = new ArrayList();
      myList3.add("A");
      myList3.add("B");
      myList3.add("C");

      return "done";
  }

  public List getMyList1() { return myList1; }
  public List getMyList2() { return myList2; }
  public List getMyList3() { return myList3; }
}

```

```jsp
 <s:append var="myAppendIterator">
      <s:param value="%{myList1}" />
      <s:param value="%{myList2}" />
      <s:param value="%{myList3}" />
 </s:append>
 <s:iterator value="%{#myAppendIterator}">
      <s:property />
 </s:iterator>
```
