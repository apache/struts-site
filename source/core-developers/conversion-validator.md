---
layout: core-developers
title: conversion validator
---

# conversion validator

### Description

Field Validator that checks if a conversion error occurred for this field.

### Parameters

- `fieldName` - The field name this validator is validating. Required if using Plain-Validator Syntax otherwise not required.

### Examples

```
<!-- Plain Validator Syntax -->
<validator type="conversion">
        <param name="fieldName">myField</param>
     <message>Conversion Error Occurred</message>
</validator>
  
<!-- Field Validator Syntax -->
<field name="myField">
   <field-validator type="conversion">
      <message>Conversion Error Occurred</message>
   </field-validator>
</field>
```

### Repopulating Field upon conversion Error

 The capability of auto-repopulating the stack with a fake parameter map when a conversion error has occurred can be done with `repopulateField` property set to `true`.

This is typically useful when one wants to repopulate the field with the original value when a conversion error occurred. Eg. with a textfield that only allows an Integer (the action class have an Integer field declared), upon conversion error, the incorrectly entered integer (maybe a text 'one') will not appear when dispatched back. With `repopulateField` property set to true, it will, meaning the textfield will have 'one' as its value upon conversion error.

```
<!-- myJspPage.jsp -->
<s:form action="someAction" method="POST">
  ....
  <s:textfield label="My Integer Field" name="myIntegerField" />
  ....
  <s:submit />
</s:form>
```

```
<!-- xwork.xml -->
<xwork>
<include file="xwork-default.xml" />
....
<package name="myPackage" extends="xwork-default">
  ....
  <action name="someAction" class="example.MyActionSupport.java">
     <result name="input">myJspPage.jsp</result>
     <result>success.jsp</result>
  </action>
  ....
</package>
....
</xwork>
```

```
<!-- MyActionSupport.java -->
public class MyActionSupport extends ActionSupport {
   private Integer myIntegerField;
 
   public Integer getMyIntegerField() { return this.myIntegerField; }
   public void setMyIntegerField(Integer myIntegerField) {
      this.myIntegerField = myIntegerField;
   }
}
```

```
<!-- MyActionSupport-someAction-validation.xml -->
<validators>
  ...
  <field name="myIntegerField">
     <field-validator type="conversion">
        <param name="repopulateField">true</param>
        <message>Conversion Error (Integer Wanted)</message>
     </field-validator>
  </field>
  ...
</validators>
```
