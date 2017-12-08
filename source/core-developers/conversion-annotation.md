---
layout: default
title: Conversion Annotation
parent:
    title: Annotations
    url: annotations.html
---

# Conversion Annotation

A marker annotation for type conversions at Type level.

## Usage

The Conversion annotation must be applied at Type level.

## Parameters

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

## Examples

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

Check also [TypeConversion Annotation](type-conversion-annotation.html) for more examples!
