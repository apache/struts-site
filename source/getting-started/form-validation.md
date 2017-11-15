---
layout: default
title: Form Validation
parent:
    title: Getting started
    url: index.html
---

# Form Validation
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This tutorial assumes you've completed the [Processing Forms](processing-forms.html) tutorial and have a working 
**form_processing** project. The example code for this tutorial, **form_validation**, is available for checkout from 
the Struts 2 GitHub repository [struts-examples](https://github.com/apache/struts-examples).

## Introduction

In this tutorial we'll explore using Struts 2 to validate the user's input on a form. There are two ways you can use Struts 2 
to do form validation. This tutorial will cover the more basic method, where the validation is included in the Struts 2 Action class.

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are having 
a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer 
to your problem, post a question on the mailing list.

## Add validate Method

To enable the Struts 2 Action class to validate a user's input on a Struts 2 form, you must define a validate method 
in your Action class. Using the example from [Processing Forms](processing-forms.html) tutorial, let's say that we have 
these business rules:

1. User must provide a first name
2. User must provide an email address
3. User younger then 18 cannot register

If you recall from the [Processing Forms](processing-forms.html) tutorial the user's input into the form fields is placed 
by Struts 2 into the Java model class `personBean`. So a user's input into the `firstName` field would end up as the value 
for `personBean`'s `firstName` instance field (via the `personBean.setFirstName` method).

In the validate method we can refer to get the values of personBean's instance fields by using the appropriate get methods. 
Once we have the values we can employ logic to enforce our business rules.

Add the following validate method to `Register.java` (the Action class).

**validate method**

```java
public void validate(){
    if (personBean.getFirstName().length() == 0) {
        addFieldError("personBean.firstName", "First name is required.");
    }

    if (personBean.getEmail().length() == 0) {
        addFieldError("personBean.email", "Email is required.");
    }

    if (personBean.getAge() < 18) {
        addFieldError("personBean.age", "Age is required and must be 18 or older");
    }
}
```

When the user presses the submit button on the register form, Struts 2 will transfer the user's input to the personBean's 
instance fields. Then Struts 2 will automatically execute the validate method. If any of the if statements are true, 
Struts 2 will call its `addFieldError` method (which our Action class inherited by extending ActionSupport).

If any errors have been added then Struts 2 will not proceed to call the execute method. Rather the Struts 2 framework 
will return `input` as the result of calling the action.

## Handle Input Being Returned

So what should we do if Struts 2 returns `input` indicating that the user's input in the form is not valid? In most cases 
we will want to redisplay the web page that has the form and include in the form error messages to inform the user what is wrong.

To handle the return value of `input` we need to add the following result to our action node in `struts.xml`.

```xml
<result name="input">/register.jsp</result>
```

The above result node goes just after the success result node for the register action and before the closing of the action node.

## Error Messages

So when validation fails and Struts 2 returns input, the Struts 2 framework will redisplay the `register.jsp`. Since we 
used Struts 2 form tags, automatically Struts 2 will add the error messages. These error messages are the ones we specified 
in the `addFieldError` method call. The addFieldError method takes two arguments. The first is the form field name to which 
the error applies and the second is the error message to display above that form field.

So the following `addFieldError` method call:

```java
addFieldError("personBean.firstName", "First name is required.")
```

will cause the message _First name is required_ to be displayed above the `firstName` field on the form.

If you have made the above changes to the [Processing Forms](processing-forms.html) tutorial or you have downloaded 
from [form-validation](https://github.com/apache/struts-examples/tree/master/form-validation) 
run the application (see the README.txt in the project root folder). Click on the Please register link. On the registration 
form, just click the submit button and you should see:

![form_errors.png](attachments/att14975003_form_errors.png)

Struts 2 called the validate method, validation failed, the `register.jsp` was displayed with the error messages.

## Styling The Error Messages

The Struts 2 `s:head` tag can be used to provide CSS that includes a style for the error message. Add `<s:head />` 
to `register.jsp` before the closing HTML `</head>` tag. Go through the same steps as above and you should see:

![form_errors_styled.png](attachments/att14975001_form_errors_styled.png)

## Summary

This tutorial covered validating a user's form input by adding a validate method to an Action class. There is another 
more sophisticated way to validate user input using XML. If you want to learn more about using XML for validation 
in Struts 2 see [Validation](../core-developers/validation.html) .

## Up Next

In our next tutorial we'll cover how to use message resource files to separate out the text from the view page.

|Return to [Processing Forms](processing-forms.html)|or|onward to [Message resource files](message-resource-files.html)|
