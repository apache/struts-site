---
layout: default
title: Form validation using XML
---
## Form Validation Using XML

The example code for this tutorial, form_xml_validation, is available for checkout at [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples)

__Introduction__

In this tutorial we'll cover how to validate a user's input in form fields using Struts 2's XML validation methodology. In the [Form Validation](form-validation.html) tutorial we discussed validating a user's input using the validate method in the Action class. Using a separate XML validation file gives you the ability to use validators built-in to the Struts 2 framework.

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

__Example Application__

The example application that supports this tutorial shows how to use Struts 2's XML validation methodology. The information that can be edited is encapsulated in an object of class Person.

To enable the user to edit his information that is stored in the Person object, we have this form:

![form-validation-1.png](attachments/att20873263_form-validation-1.png)

When the user submits the form, we want to validate his entries into the form fields.

__Validation Using XML__

To validate a user's form field entries you can use a separate XML file that contains your validation rules. The XML file that contains the validation rules must be named as ActionClassName-validation.xml. In the example application, the XML validation file is named EditAction-validation.xml (see src/main/resources/org/apache/struts/edit/action).

Struts 2 provides several different validators that you can use in the XML validation file. See [Validation](//struts.apache.org/docs/validation.html) for a list of validators you can employ.

In the above form, we want to ensure the user enters a first name. To have the Struts 2 framework enforce that rule we can used the Struts 2 [requiredstring validator](//struts.apache.org/docs/requiredstring-validator.html). This validator checks that the user has entered a string value in the form field.

__XML Validator Format__

In the XML validation file (for this example that is EditAction-validation.xml), is this XML:

**XML Validator Required String**

```xml
<!DOCTYPE validators PUBLIC "-//Apache Struts//XWork Validator 1.0.3//EN" "http://struts.apache.org/dtds/xwork-validator-1.0.3.dtd">

<validators>
    <validator type="requiredstring">
        <param name="fieldname">personBean.firstName</param>
        <message>First name is required.</message>
    </validator>
</validators>
```

Within the validators node you can have 1 or more validator nodes. The type attribute specifies which validator you want the Struts 2 framework to use (see [Validation](//struts.apache.org/docs/validation.html) ). The param name="fieldname" node is used to tell the framework which form field entry to apply the rule to. See edit.jsp for the form fields and their name value (review [Struts 2 Form Tags](form-tags.html) if you're not familiar with how to use Struts 2 form tags). The message node is used to tell the framework what message to display if the validation fails.

| There are alternate ways to write the XML that goes in the validation XML file. See [Validation](//struts.apache.org/docs/validation.html) in the Struts 2 documentation for a full discussion.

For example if the user doesn't enter a value in the first name form field and clicks on the Save Changes button, he will see the following.

![form-validation-2.png](attachments/att20873264_form-validation-2.png)

__Validating An Email Address__

You can use the Struts 2 [email validator](//struts.apache.org/docs/email-validator.html) to validate the user's input in the email field. Here is the validator node that is in the `EditAction-validation.xml` file.

**Email Validator**

```xml
<validator type="requiredstring">
    <param name="fieldname">personBean.email</param>
    <message>Email address is required.</message>
</validator>
<validator type="email">
    <param name="fieldname">personBean.email</param>
    <message>Email address not valid.</message>
</validator>
```

Note that in the example, we are requiring the user to enter an email address and then validating the email address the user entered.

__Validating A User's Input Using A Regular Expression__

The Struts 2 framework provides a powerful way to validate a user's form field input by using the [regex validator](//struts.apache.org/docs/regex-validator.html) . In the example application, we want to ensure the user enters the phone number in the format 999-999-9999. We can use a regular expression and the [regex validator](//struts.apache.org/docs/regex-validator.html) to enforce this rule.

**REGEX Validator**

```xml
<validator type="requiredstring">
    <param name="fieldname">personBean.phoneNumber</param>
    <message>Phone number is required.</message>
</validator>
<validator type="regex">
    <param name="fieldname">personBean.phoneNumber</param>
    <param name="regex"><![CDATA[\d{3}-\d{3}-\d{4}]]></param>
    <message>Phone number must be entered as 999-999-9999.</message>
</validator>
```

The param name="expression" node is used to specify the regular expression that will be applied to the user's input. Note how the regular expression is contained within a CDATA section.

__Validating A User's Input Using An OGNL Expression__

In the example application, we want to ensure the user checks at least one of the car model check boxes. To enforce this rule we can use the [fieldexpression validator](//struts.apache.org/docs/fieldexpression-validator.html) . Here's the XML for that validator node.

**FieldExpression Validator**

```xml
<validator type="fieldexpression">
    <param name="fieldname">personBean.carModels</param>
    <param name="expression"><![CDATA[personBean.carModels.length > 0]]></param>
    <message>You must select at least one car model.</message>
</validator>
```

The param name="expression" node contains an OGNL expression that evaluates to true or false. We haven't previously discussed OGNL, which stands for Object-Graph Navigation Language (see [http://www.opensymphony.com/ognl/](http://www.opensymphony.com/ognl/) and [OGNL](//struts.apache.org/docs/ognl.html) ). OGNL expressions can be evaluated by the Struts 2 framework as Java statements.

In the above XML the value of the param name="expression" node, personBean.carModels.length \> 0, will be evaluated by the framework as a Java statement. The part personBean.carModels tells the framework to call the getCarModels method of class Person. That method returns an Array. Since class Array has a length attribute, the framework will get the value of the length attribute of the Array returned by the getCarModels method.

If the user did not check any of the check boxes, the Array returned by the getCarModels method will have a length value of 0. Since the complete OGNL expression will only evaluate to true if the length value is greater than 0, the validation fails. The user will see this.

![form-validation-3.png](attachments/att20873265_form-validation-3.png)

The fieldexpression validator is useful when doing conditional validation of a user's input. If the OGNL expression doesn't evaluate to true then the user's input won't be allowed.

__Summary__

The Struts 2 framework provides easy-to-use validation methodologies. You can add a validate method to the Action class or have a separate XML file with validation rules or you can use a combination of both methodologies.

|Return to [Form tags](form-tags.html)|or|onward to [Control tags](control-tags.html)|
