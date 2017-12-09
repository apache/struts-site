---
layout: default
title: Validation Annotation
parent:
    title: Annotations
    url: annotations.html
---

# Validation Annotation

This annotation has been deprecated since Struts 2.1 as its previous purpose, to define classes that support annotation validations,
is no longer necessary.

## Usage

Validation annotation must be applied at Type level.

## Parameters

- `validations` - list of validations to apply

## Examples

### An Annotated Interface

- Mark the interface with `@Validation()`
- Apply standard or custom annotations at method level

```java
 @Validation()
 public interface AnnotationDataAware {

     void setBarObj(Bar b);

     Bar getBarObj();

     @RequiredFieldValidator(message = "You must enter a value for data.")
     @RequiredStringValidator(message = "You must enter a value for data.")
     void setData(String data);

     String getData();
 }

```

### An Annotated Class

```java
 @Validation()
 public class SimpleAnnotationAction extends ActionSupport {

     @RequiredFieldValidator(type = ValidatorType.FIELD, message = "You must enter a value for bar.")
     @IntRangeFieldValidator(type = ValidatorType.FIELD, min = "6", max = "10", message = "bar must be between ${min} and ${max}, current value is ${bar}.")
     public void setBar(int bar) {
         this.bar = bar;
     }

     public int getBar() {
         return bar;
     }

     @Validations(
             requiredFields =
                     {@RequiredFieldValidator(type = ValidatorType.SIMPLE, fieldName = "customfield", message = "You must enter a value for field.")},
             requiredStrings =
                     {@RequiredStringValidator(type = ValidatorType.SIMPLE, fieldName = "stringisrequired", message = "You must enter a value for string.")},
             emails =
                     { @EmailValidator(type = ValidatorType.SIMPLE, fieldName = "emailaddress", message = "You must enter a value for email.")},
             urls =
                     { @UrlValidator(type = ValidatorType.SIMPLE, fieldName = "hreflocation", message = "You must enter a value for email.")},
             stringLengthFields =
                     {@StringLengthFieldValidator(type = ValidatorType.SIMPLE, trim = true, minLength="10" , maxLength = "12", fieldName = "needstringlength", message = "You must enter a stringlength.")},
             intRangeFields =
                     { @IntRangeFieldValidator(type = ValidatorType.SIMPLE, fieldName = "intfield", min = "6", max = "10", message = "bar must be between ${min} and ${max}, current value is ${bar}.")},
             dateRangeFields =
                     {@DateRangeFieldValidator(type = ValidatorType.SIMPLE, fieldName = "datefield", min = "-1", max = "99", message = "bar must be between ${min} and ${max}, current value is ${bar}.")},
             expressions = {
                 @ExpressionValidator(expression = "foo > 1", message = "Foo must be greater than Bar 1. Foo = ${foo}, Bar = ${bar}."),
                 @ExpressionValidator(expression = "foo > 2", message = "Foo must be greater than Bar 2. Foo = ${foo}, Bar = ${bar}."),
                 @ExpressionValidator(expression = "foo > 3", message = "Foo must be greater than Bar 3. Foo = ${foo}, Bar = ${bar}."),
                 @ExpressionValidator(expression = "foo > 4", message = "Foo must be greater than Bar 4. Foo = ${foo}, Bar = ${bar}."),
                 @ExpressionValidator(expression = "foo > 5", message = "Foo must be greater than Bar 5. Foo = ${foo}, Bar = ${bar}.")
     }
     )
     public String execute() throws Exception {
         return SUCCESS;
     }
 }

```

When multiple methods are used to map different actions on the same class, and one of them is annotated with `@Validations`, 
those validators will be triggered for all the actions, unless they are annotated with `@SkipValidation` or `validateAnnotatedMethodOnly`
is set to `true` in the `validation` interceptor, like:

```xml 
<interceptor-ref name="validation">
    <param name="validateAnnotatedMethodOnly">true</param>
    <param name="excludeMethods">input,back,cancel,browse</param>
</interceptor-ref>
``` 
