---
layout: default
title: Validations Annotation
parent:
    title: Annotations
    url: annotations.html
---

# Validations Annotation

If you want to use several annotations of the same type, these annotations must be nested within the `@Validations()` annotation.

## Usage

Used at METHOD level.

## Parameters

<p> <table class='confluenceTable' summary=''>

 <tr>
 <th class='confluenceTh'> Parameter </th>
 <th class='confluenceTh'> Required </th>
 <th class='confluenceTh'> Notes </th>
 </tr>
 <tr>
 <td class='confluenceTd'> requiredFields </td>
 <td class='confluenceTd'> no </td>

 <td class='confluenceTd'> Add list of RequiredFieldValidators  </td>
 </tr>
 <tr>
 <td class='confluenceTd'> customValidators </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of CustomValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> conversionErrorFields </td>

 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of ConversionErrorFieldValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> dateRangeFields </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of DateRangeFieldValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> emails </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of EmailValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> fieldExpressions </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of FieldExpressionValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> intRangeFields </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of IntRangeFieldValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> requiredStrings </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of RequiredStringValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> stringLengthFields </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of StringLengthFieldValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> urls </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of UrlValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> visitorFields </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of VisitorFieldValidators </td>
 </tr>
 <tr>
 <td class='confluenceTd'> regexFields </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of RegexFieldValidator </td>
 </tr>
 <tr>
 <td class='confluenceTd'> expressions </td>
 <td class='confluenceTd'> no </td>
 <td class='confluenceTd'> Add list of ExpressionValidator </td>
 </tr>
 </table>
</p>

## Examples

```java
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
           longRangeFields =
                   { @LongRangeFieldValidator(type = ValidatorType.SIMPLE, fieldName = "intfield", min = "6", max = "10", message = "bar must be between ${min} and ${max}, current value is ${bar}.")},
           shortRangeFields =
                   { @ShortRangeFieldValidator(type = ValidatorType.SIMPLE, fieldName = "shortfield", min = "1", max = "128", message = "bar must be between ${min} and ${max}, current value is ${bar}.")},
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

```

## Different validations per method

Different validations per method is NOT supported for client-side validation!

To use different validations per method, the `validateAnnotatedMethodOnly` property must be set on the validation interceptor.

```xml
<interceptor-ref name="validation">
  <param name="validateAnnotatedMethodOnly">true</param>                
  <param name="excludeMethods">input,back,cancel,browse</param>
</interceptor-ref>
```

Here's a complete example of updating the default stack:

```xml
  <package name="default" extends="struts-default">
    <interceptors>
      <interceptor-stack name="content">
        <interceptor-ref name="exception"/>
                <interceptor-ref name="alias"/>
                <interceptor-ref name="servletConfig"/>
                <interceptor-ref name="prepare"/>
                <interceptor-ref name="i18n"/>
                <interceptor-ref name="chain"/>
                <interceptor-ref name="debugging"/>
                <interceptor-ref name="profiling"/>
                <interceptor-ref name="scopedModelDriven"/>
                <interceptor-ref name="modelDriven"/>
                <interceptor-ref name="fileUpload"/>
                <interceptor-ref name="checkbox"/>
                <interceptor-ref name="staticParams"/>
                <interceptor-ref name="params">
                  <param name="excludeParams">dojo\..*</param>
                </interceptor-ref>
                <interceptor-ref name="conversionError"/>
                <interceptor-ref name="validation">
  	            <param name="validateAnnotatedMethodOnly">true</param>                
                    <param name="excludeMethods">input,back,cancel,browse</param>
                </interceptor-ref>
                <interceptor-ref name="workflow">
                    <param name="excludeMethods">input,back,cancel,browse</param>
                </interceptor-ref>
      </interceptor-stack>
    </interceptors>
    <default-interceptor-ref name="default"/>
  </package>
</struts>
```
