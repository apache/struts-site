---
layout: core-developers
title: TypeConversion Annotation
---

# TypeConversion Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}
<p> <p>This annotation is used for class and application wide conversion rules.</p>

 <p>
 Class wide conversion:<br>
 The conversion rules will be assembled in a file called <code>XXXAction-conversion.properties</code>
 within the same package as the related action class.
 Set type to: <code>type = ConversionType.CLASS</code>
 </p>

 <p>
 Application wide conversion:<br>
 The conversion rules will be assembled within the <code>xwork-conversion.properties</code> file within the classpath root.
 Set type to: <code>type = ConversionType.APPLICATION</code>
 </p>
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}

##### Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}
<p> <p>The TypeConversion annotation can be applied at property and method level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}
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
 <td>key</td>
 <td>no</td>
 <td>The annotated property/key name</td>
 <td>The optional property name mostly used within TYPE level annotations.</td>
 </tr>
 <tr>
 <td>type</td>
 <td>no</td>
 <td>ConversionType.CLASS</td>
 <td>Enum value of ConversionType.  Determines whether the conversion should be applied at application or class level.</td>
 </tr>
 <tr>
 <td>rule</td>
 <td>no</td>
 <td>ConversionRule.PROPERTY</td>
 <td>Enum value of ConversionRule. The ConversionRule can be a property, a Collection or a Map.</td>
 </tr>
 <tr>
 <td>converter</td>
 <td>DEPRECATED: either this or value</td>
 <td>&nbsp;</td>
 <td>The class name of the TypeConverter to be used as converter.</td>
 </tr>
 <tr>
 <td>converterClass</td>
 <td>either this or value</td>
 <td>&nbsp;</td>
 <td>The class of the TypeConverter to be used as converter. XWorkBasicConverter by default.</td>
 </tr>
 <tr>
 <td>value</td>
 <td>either converter or this</td>
 <td>&nbsp;</td>
 <td>The value to set for ConversionRule.KEY_PROPERTY.</td>
 </tr>
 </tbody>
 </table>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}

##### Examples



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}

```java
 @Conversion()
 public class ConversionAction implements Action {

   private String convertInt;

   private String convertDouble;
   private List users = null;

   private HashMap keyValues = null;

   @TypeConversion(type = ConversionType.APPLICATION)
   public void setConvertInt( String convertInt ) {
       this.convertInt = convertInt;
   }

   @TypeConversion(converterClass = XWorkBasicConverter.class)
   public void setConvertDouble( String convertDouble ) {
       this.convertDouble = convertDouble;
   }

   @TypeConversion(rule = ConversionRule.COLLECTION, converterClass = String.class)
   public void setUsers( List users ) {
       this.users = users;
   }

   @TypeConversion(rule = ConversionRule.MAP, converterClass = BigInteger.class)
   public void setKeyValues( HashMap keyValues ) {
       this.keyValues = keyValues;
   }

   @TypeConversion(type = ConversionType.APPLICATION, property = "java.util.Date", converterClass = XWorkBasicConverter.class)
   public String execute() throws Exception {
       return SUCCESS;
   }
 }

```

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.conversion.annotations.TypeConversion {% endcomment %}
