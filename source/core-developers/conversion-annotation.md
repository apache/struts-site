---
layout: core-developers
title: Conversion Annotation
---

# Conversion Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}
<p> A marker annotation for type conversions at Type level.
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}

#####Usage#####



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}
<p> The Conversion annotation must be applied at Type level.
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}
<p> <table summary="">
 <thead>
 <tr>
 <th>Parameter</th>
 <th>Required</th>
 <th>Default</th>
 <th>Description</th>
 </tr>
 </thead>
 <tbody>
 <tr>
 <td>conversion</td>
 <td>no</td>
 <td>&nbsp;</td>
 <td>used for Type Conversions applied at Type level.</td>
 </tr>
 </tbody>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}

```java
 @Conversion(
     conversions = {
          // key must be the name of a property for which converter should be used
          @TypeConversion(key = "date", converter = "org.demo.converter.DateConverter")
     }
 )
 public class ConversionAction implements Action {

     private Date date;

     public setDate(Date date) {
         this.date = date;
     }

     public Date getDate() {
         return date;
     }

 }


```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.conversion.annotations.Conversion {% endcomment %}

Check also [TypeConversion Annotation](type-conversion-annotation.html) for more examples!