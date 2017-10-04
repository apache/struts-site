---
layout: core-developers
title: BeforeResult Annotation
---

# BeforeResult Annotation

####BeforeResult Annotation####



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}
<p> Marks a action method that needs to be executed before the result. Return value is ignored.</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}

#####Usage#####



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}
<p> The BeforeResult annotation can be applied at method level.
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}
<p> <table class='confluenceTable' summary=''>
 <tr>
 <th class='confluenceTh'> Parameter </th>
 <th class='confluenceTh'> Required </th>
 <th class='confluenceTh'> Default </th>
 <th class='confluenceTh'> Notes </th>
 </tr>
 <tr>
 <td class='confluenceTd'>priority</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'>10</td>
 <td class='confluenceTd'>Priority order of method execution</td>
 </tr>
 </table></p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}

```java
 public class SampleAction extends ActionSupport {

  @BeforeResult
  public void isValid() throws ValidationException {
    // validate model object, throw exception if failed
  }

  public String execute() {
     // perform action
     return SUCCESS;
  }
 }
```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.BeforeResult {% endcomment %}
