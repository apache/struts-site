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

| Parameter | Required | Notes |
|-----------|----------|-------|
| requiredFields | no | Add list of RequiredFieldValidators |
| customValidators | no | Add list of CustomValidators |
| conversionErrorFields | no | Add list of ConversionErrorFieldValidators |
| dateRangeFields | no | Add list of DateRangeFieldValidators |
| doubleRangeFields | no | Add list of DoubleRangeFieldValidators |
| emails | no | Add list of EmailValidators |
| expressions | no | Add list of ExpressionValidators |
| fieldExpressions | no | Add list of FieldExpressionValidators |
| intRangeFields | no | Add list of IntRangeFieldValidators |
| longRangeFields | no | Add list of LongRangeFieldValidators |
| regexFields | no | Add list of RegexFieldValidators |
| requiredStrings | no | Add list of RequiredStringValidators |
| shortRangeFields | no | Add list of ShortRangeFieldValidators |
| stringLengthFields | no | Add list of StringLengthFieldValidators |
| urls | no | Add list of UrlValidators |
| visitorFields | no | Add list of VisitorFieldValidators |

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
           doubleRangeFields =
                   { @DoubleRangeFieldValidator(type = ValidatorType.SIMPLE, fieldName = "doublefield", minInclusive = "0.0", maxInclusive = "100.0", message = "bar must be between ${minInclusive} and ${maxInclusive}, current value is ${bar}.")},
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
                <interceptor-ref name="actionFileUpload"/>
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
