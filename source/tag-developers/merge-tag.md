---
layout: tag-developers
title: merge tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# merge

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Component for MergeIteratorTag, which job is to merge iterators and successive call to the merged iterator will cause 
each merge iterator to have a chance to expose its element, subsequently next call will allow the next iterator to expose
its element. Once the last iterator is done exposing its element, the first iterator is allowed to do so again (unless 
it is exhausted of entries).

Internally the task are delegated to `MergeIteratorFilter`.

Example if there are 3 lists being merged, each list have 3 entries, the following will be the logic.

1. Display first element of the first list
2. Display first element of the second list
3. Display first element of the third list
4. Display second element of the first list<
5. Display second element of the second list
6. Display second element of the third list
7. Display third element of the first list<
8. Display third element of the second list
9. Display third element of the third list

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/merge-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/merge-attributes.html %}

## Examples

```java
public class MergeIteratorTagAction extends ActionSupport {

    private List myList1;
    private List myList2;
    private List myList3;
    
    public List getMyList1() {
        return myList1;
    }
    
    public List getMyList2() {
        return myList2;
    }
    
    public List getMyList3() {
        return myList3;
    }
    
    
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
}
```

```jsp
<s:merge var="myMergedIterator1">
     <s:param value="%{myList1}" />
     <s:param value="%{myList2}" />
     <s:param value="%{myList3}" />
</s:merge>
<s:iterator value="%{#myMergedIterator1}">
     <s:property />
</s:iterator>
```
