---
layout: core-developers
title: InputConfig Annotation
---

# InputConfig Annotation


{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}
<p> Marks a action method that if it's not validated by ValidationInterceptor then execute input method or input result.</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}

#####Usage#####



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}
<p> The InputConfig annotation can be applied at method level.
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}
<p> <table class='confluenceTable' summary=''>
 <tr>
 <th class='confluenceTh'> Parameter </th>
 <th class='confluenceTh'> Required </th>
 <th class='confluenceTh'> Default </th>
 <th class='confluenceTh'> Notes </th>
 </tr>
 <tr>
 <td class='confluenceTd'>methodName</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'></td>
 <td class='confluenceTd'>execute this method if specific</td>
 </tr>
 <tr>
 <td class='confluenceTd'>resultName</td>
 <td class='confluenceTd'>no</td>
 <td class='confluenceTd'></td>
 <td class='confluenceTd'>return this result if methodName not specific</td>
 </tr>
 </table></p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}

```java
 public class SampleAction extends ActionSupport {

  public void isValid() throws ValidationException {
    // validate model object, throw exception if failed
  }

  @InputConfig(methodName="input")
  public String execute() {
     // perform action
     return SUCCESS;
  }
  public String input() {
     // perform some data filling
     return INPUT;
  }
 }
```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.InputConfig {% endcomment %}
