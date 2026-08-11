---
layout: default
title: TypeConversion Annotation
parent:
    title: Annotations
    url: annotations.html
---

# TypeConversion Annotation

This annotation is used for class and application wide conversion rules.

- Class wide conversion:

  The conversion rules will be assembled in a file called `XXXAction-conversion.properties` within the same package 
  as the related action class. 
  Set type to: `type = ConversionType.CLASS`

- Application wide conversion:
 
  The conversion rules will be assembled within the `struts-conversion.properties` or `xwork-conversion.properties` (deprecated)
  file within the classpath root. Set type to: `type = ConversionType.APPLICATION`

## Usage

The `TypeConversion` annotation can be applied at method level, and since Struts 7.3.0 also at field level.

## Key derivation

> Since Struts 7.3.0

The `key` parameter accepts a bare property name for every `ConversionRule`; the rule's prefix is derived
automatically. It used to be derived only for method-level annotations, so class-level `@Conversion(conversions = ...)`
entries had to spell the prefix out:

```java
// before Struts 7.3.0 — prefix spelled out
@Conversion(conversions = @TypeConversion(key = "CreateIfNull_users", rule = ConversionRule.CREATE_IF_NULL, value = "true"))

// since Struts 7.3.0 — the CreateIfNull_ prefix is derived
@Conversion(conversions = @TypeConversion(key = "users", rule = ConversionRule.CREATE_IF_NULL, value = "true"))
```

Existing annotations that already carry a prefix keep working: a `key` starting with any known rule prefix is used
as-is, never prefixed twice. The prefixes are `CreateIfNull_`, `Element_`, `Key_` and `KeyProperty_`;
`ConversionRule.PROPERTY` and `ConversionRule.MAP` have no prefix of their own. Keys of
`ConversionType.APPLICATION` annotations are class names and are never prefixed.

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

`ConversionRule.COLLECTION` is deprecated since Struts 7.3.0 — use `ConversionRule.ELEMENT` instead. The two are handled
identically by the engine, and `ELEMENT` additionally covers the values of a `Map`. Existing annotations using
`COLLECTION` keep working and produce the deprecated `Collection_xxx` key, which is still read as a fallback.
{:.alert .alert-warning}

## Examples

```java
 @Conversion()
 public class ConversionAction implements Action {

   private String convertInt;

   private String convertDouble;
   private List users = null;

   private HashMap keyValues = null;

   @TypeConversion(type = ConversionType.APPLICATION)
   @StrutsParameter
   public void setConvertInt( String convertInt ) {
       this.convertInt = convertInt;
   }

   @TypeConversion(converterClass = XWorkBasicConverter.class)
   @StrutsParameter
   public void setConvertDouble( String convertDouble ) {
       this.convertDouble = convertDouble;
   }

   @TypeConversion(rule = ConversionRule.ELEMENT, converterClass = String.class)
   @StrutsParameter
   public void setUsers( List users ) {
       this.users = users;
   }

   @TypeConversion(rule = ConversionRule.MAP, converterClass = BigInteger.class)
   @StrutsParameter
   public void setKeyValues( HashMap keyValues ) {
       this.keyValues = keyValues;
   }

   @TypeConversion(type = ConversionType.APPLICATION, property = "java.util.Date", converterClass = XWorkBasicConverter.class)
   public String execute() throws Exception {
       return SUCCESS;
   }
 }
```
