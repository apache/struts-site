---
layout: core-developers
title: Validation Annotation
---

# Validation Annotation



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}
<p> This annotation has been deprecated since 2.1 as its previous purpose, to define classes that support annotation validations,
 is no longer necessary.
</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}

## Usage



{% comment %}start snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}
<p> <p>The Validation annotation must be applied at Type level.</p>
</p>
{% comment %}end snippet id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}

## Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}
<p> <table class='confluenceTable' summary=''>
 <tr>
 <th class='confluenceTh'> Parameter </th>
 <th class='confluenceTh'> Required </th>
 <th class='confluenceTh'> Default </th>
 <th class='confluenceTh'> Notes </th>
 </tr>
 <tr>
 <td class='confluenceTd'>validations</td>
 <td class='confluenceTd'>yes</td>
 <td class='confluenceTd'>&nbsp;</td>
 <td class='confluenceTd'></td>
 </tr>
 </table>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}

## Examples

**An Annotated Interface**

+ Mark the interface with @Validation()

+ Apply standard or custom annoations at method level



{% comment %}start snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}

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

{% comment %}end snippet id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}

**An Annotated Class**


{% comment %}start snippet id=example2|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}

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

{% comment %}end snippet id=example2|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validation {% endcomment %}


> 

> 

> When multiple methods are used to map different actions on the same class, and one of them is annotated with _@Validations_ , those validators will be triggered for all the actions, unless they are annotated with @SkipValidation or _validateAnnotatedMethodOnly_  is set to _true_  in the "validation" interceptor, like:

> 
 > \<interceptor\-ref name="validation"\>
 >     \<param name="validateAnnotatedMethodOnly"\>true\</param\>
 >     \<param name="excludeMethods"\>input,back,cancel,browse\</param\>
 > \</interceptor\-ref\>
 > 
 