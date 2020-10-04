---
layout: default
title: Validation
parent:
    title: Core Developers Guide
    url: index.html
---

# Validation
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Struts 2 validation is configured via XML or annotations. Manual validation in the action is also possible, and may be 
combined with XML and annotation-driven validation.

Validation also depends on both the `validation` and `workflow` interceptors (both are included in the default interceptor 
stack). The `validation` interceptor does the validation itself and creates a list of field-specific errors. 
The `workflow` interceptor checks for the presence of validation errors: if any are found, it returns the "input" result 
(by default), taking the user back to the form which contained the validation errors.

If we're using the default settings _and_ our action does not have an "input" result defined _and_  there are validation 
(or, incidentally, type conversion) errors, we'll get an error message back telling us there's no "input" result defined 
for the action.

## Using Annotations

[Annotations](validation-annotation) can be used as an alternative to XML for validation.

## Bean Validation

With struts 2.5 comes the Bean Validation Plugin. That is an alternative to the classic struts validation described here. 
See the [Plugin Page](../plugins/) for details.

## Examples

In all examples given here, the validation message displayed is given in plain English - to internationalize the message, 
put the string in a properties file and use a property key instead, specified by the 'key' attribute. It will be looked 
up by the framework (see [Localization](localization)).

1. [Basic Validation](basic-validation)
2. [Client-side Validation](client-side-validation)
3. _AJAX Validation_ 
4. [Using Field Validators](using-field-validators)
5. [Using Non Field Validators](using-non-field-validators)
6. [Using Visitor Field Validator](using-visitor-field-validator)
7. _How do we repopulate controls when validation fails_  (FAQ entry)

## Bundled Validators

When using a Field Validator, Field Validator Syntax is **ALWAYS** preferable than using the Plain Validator Syntax 
as it facilitates grouping of field-validators according to fields. This is very handy especially if a field needs 
to have many field-validators which is almost always the case.

1. [conversion validator](conversion-validator)
2. [date validator](date-validator)
3. [double validator](double-validator)
4. [email validator](email-validator)
5. [expression validator](expression-validator)
6. [fieldexpression validator](fieldexpression-validator)
7. [int validator](int-validator)
8. [regex validator](regex-validator)
9. [required validator](required-validator)
10. [requiredstring validator](requiredstring-validator)
11. [short validator](short-validator)
12. [stringlength validator](stringlength-validator)
13. [url validator](url-validator)
14. [visitor validator](visitor-validator)
15. [conditionalvisitor validator](conditionalvisitor-validator)

## Registering Validators

Validation rules are handled by validators, which must be registered with the ValidatorFactory (using the 
`registerValidator` method). The simplest way to do so is to add a file name `validators.xml` in the root of the classpath 
(/WEB-INF/classes) that declares all the validators you intend to use.

The following list shows the default validators included in the framework and is an example of the syntax used to declare 
our own validators.

{% highlight xml %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/com/opensymphony/xwork2/validator/validators/default.xml %}
{% endhighlight %}

> **Struts 2.1 and Prior**
> The `validators.xml` used to reference a DTD hosted by Opensymphony, the original location of the XWork project. 
> Since they moved to Apache Struts, DTDs were changed. Please ensure in your projects to include the DTD header 
> as described in the examples found here.

> **Struts 2.0.7 and Prior**
> The `validators.xml` containing custom validators needs to contain a copy of the default validators. No DTD was used 
> in `validators.xml`. See: [Release Notes 2.0.8](https://cwiki.apache.org/confluence/display/WW/Release+Notes+2.0.8#ReleaseNotes2.0.8-MigrationfrompreviousReleases)

## Turning on Validation

The default interceptor stack, "defaultStack", already has validation turned on. When creating your own interceptor-stack 
be sure to include **both** the `validation` and `workflow` interceptors. From `struts-default.xml`:

```xml
<interceptor-stack name="defaultStack">
   ...
   <interceptor-ref name="validation">
      <param name="excludeMethods">input,back,cancel,browse</param>
   </interceptor-ref>
   <interceptor-ref name="workflow">
      <param name="excludeMethods">input,back,cancel,browse</param>
   </interceptor-ref>
</interceptor-stack>
```

Beginning with version 2.0.4 Struts provides an extension to XWork's `com.opensymphony.xwork2.validator.ValidationInterceptor`
interceptor.

```xml
<interceptor name="validation" class="org.apache.struts2.interceptor.validation.AnnotationValidationInterceptor"/>
```

This interceptor allows us to turn off validation for a specific method by using the `@org.apache.struts2.interceptor.validation.SkipValidation`
annotation on the action method.

## Validator Scopes

Field validators, as the name indicate, act on single fields accessible through an action. A validator, in contrast, 
is more generic and can do validations in the full action context, involving more than one field (or even no field 
at all) in validation rule. Most validations can be defined on per field basis. This should be preferred over non-field 
validation wherever possible, as field validator messages are bound to the related field and will be presented next 
to the corresponding input element in the respecting view.

Non-field validators only add action level messages. Non-field validators are mostly domain specific and therefore 
offer custom implementations. The most important standard non-field validator provided by XWork is `ExpressionValidator`.

## Notes

Non-field validators takes precedence over field validators regardless of the order they are defined in `*-validation.xml`. 
If a non-field validator is `short-circuited`, it will causes its non-field validator to not being executed. 
See validation framework documentation for more info.

## Defining Validation Rules

Validation rules can be specified:
1. Per Action class: in a file named `ActionName-validation.xml`
2. Per Action alias: in a file named `ActionName-alias-validation.xml`
3. Inheritance hierarchy and interfaces implemented by Action class:
   XWork searches up the inheritance tree of the action to find default
   validations for parent classes of the Action and interfaces implemented

Here is an example for SimpleAction-validation.xml:

```xml
<!DOCTYPE validators PUBLIC "-//Apache Struts//XWork Validator 1.0.3//EN"
		"http://struts.apache.org/dtds/xwork-validator-1.0.3.dtd">
<validators>
  <field name="bar">
      <field-validator type="required">
          <message>You must enter a value for bar.</message>
      </field-validator>
      <field-validator type="int">
          <param name="min">6</param>
          <param name="max">10</param>
          <message>bar must be between ${min} and ${max}, current value is ${bar}.</message>
      </field-validator>
  </field>
  <field name="bar2">
      <field-validator type="regex">
          <param name="expression">[0-9],[0-9]</param>
          <message>The value of bar2 must be in the format "x, y", where x and y are between 0 and 9</message>
     </field-validator>
  </field>
  <field name="date">
      <field-validator type="date">
          <param name="min">12/22/2002</param>
          <param name="max">12/25/2002</param>
          <message>The date must be between 12-22-2002 and 12-25-2002.</message>
      </field-validator>
  </field>
  <field name="foo">
      <field-validator type="int">
          <param name="min">0</param>
          <param name="max">100</param>
          <message key="foo.range">Could not find foo.range!</message>
      </field-validator>
  </field>
  <validator type="expression">
      <param name="expression">foo lt bar </param>
      <message>Foo must be greater than Bar. Foo = ${foo}, Bar = ${bar}.</message>
  </validator>
</validators>
```

Here we can see the configuration of validators for the `SimpleActio`n class. Validators (and field-validators) must have 
a `type` attribute, which refers to a name of an Validator registered with the `ValidatorFactory `as above. Validator elements 
may also have `<param>` elements with name and value attributes to set arbitrary parameters into the Validator instance. 
See below for discussion of the message element.

In this context, "Action Alias" refers to the action name as given in the Struts configuration. Often, the name attribute 
matches the method name, but they may also differ.

## Localizing and Parameterizing Messages

Each Validator or Field-Validator element must define one message element inside the validator element body. The message 
element has 1 attributes, key which is not required. The body of the message tag is taken as the default message which 
should be added to the Action if the validator fails. Key gives a message key to look up in the Action's ResourceBundles 
using `getText()` from `LocaleAware` if the Action implements that interface (as `ActionSupport` does). This provides 
for Localized messages based on the `Locale` of the user making the request (or whatever `Locale` you've set into 
the `LocaleAware` Action). After either retrieving the message from the ResourceBundle using the Key value, or using 
the Default message, the current Validator is pushed onto the ValueStack, then the message is parsed for `${...}`
sections which are replaced with the evaluated value of the string between the `${` and `}`. This allows you 
to parameterize your messages with values from the Validator, the Action, or both.

If the validator fails, the validator is pushed onto the ValueStack and the message - either the default or 
the locale-specific one if the key attribute is defined (and such a message exists) - is parsed for `${...}` sections 
which are replaced with the evaluated value of the string between the `${` and `}`. This allows you to parameterize 
your messages with values from the validator, the Action, or both.

> Since validation rules are in an XML file, you must make sure you escape special characters. For example, notice 
> that in the expression validator rule above we use ">" instead of ">". Consult a resource on XML
> for the full list of characters that must be escaped. The most commonly used characters that must be escaped 
> are: & (use &amp;), < (use &lt;), and > (use &gt;).

Here is an example of a parameterized message:

This will pull the min and max parameters from the IntRangeFieldValidator and the value of bar from the Action.

```
bar must be between ${min} and ${max}, current value is ${bar}.
```

Another notable fact is that the provided message value is capable of containing OGNL expressions. Keeping this in mind, 
it is possible to construct quite sophisticated messages.

See the following example to get an impression:

```xml
<message>${getText("validation.failednotice")} ! ${getText("reason")}: ${getText("validation.inputrequired")}</message>
```

### Customizing validation messages

There is another option to customise validation messages by using parametrized messages. Either you can use them via
XML or with annotations.

#### XML

To use this new approach you must use a proper header in a `<ActionName>-validation.xml` file, see below:

```xml
<?xml version="1.0"?>
<!DOCTYPE validators PUBLIC
        "-//Apache Struts//XWork Validator 1.0.3//EN"
        "http://struts.apache.org/dtds/xwork-validator-1.0.3.dtd">
<validators>
  ...
</validators>
```

Now you can define validators that will use parametrized messages as below:

```xml
<field name="username">
    <field-validator type="requiredstring">
        <message key="errors.required">
            <param name="0">getText('username.field.name')</param>
        </message>
    </field-validator>
</field>
```

> NOTE: Please be aware that all the parameters will be evaluated against `ValueStack`, please do not reference user
> controlled values or incoming parameters in request as this can lead to a security vulnerability

Now you can define your properties file with localized messages:

```
errors.required={0} is required.
username.field.name=Username
```

As you can see you defined a `errors.required` key with a placeholder for the param. The names of the params are not important,
order is important as this mechanism uses `MessageFormat` to format the message.

The final output will be as follow:

```
Username is required.
```

#### Annotations

The same mechanism can be used with annotations as follow:

```java
@RequiredStringValidator(key = "errors.required", messageParams = {
    "getText('username.field.name')"
})
public void setUsername(String username) {
    this.username = username;
}
```

## Validator Flavor

The validators supplied by the XWork distribution (and any validators you might write yourself) come in two different 
flavors:

1. Plain Validators / Non-Field validators
2. FieldValidators

Plain Validators (such as the `ExpressionValidator`) perform validation checks that are not inherently tied to a single 
specified field. When you declare a plain Validator in your `-validation.xml` file you do not associate a `fieldname`
attribute with it. You should avoid using plain Validators within the `<field-validator>` syntax described below.

FieldValidators (such as the `EmailValidator`) are designed to perform validation checks on a single field. They require 
that you specify a `fieldname` attribute in your `-validation.xml` file. There are two different (but equivalent)
XML syntaxes you can use to declare FieldValidators (see "<validator> vs. <field-Validator> syntax" below).

There are two places where the differences between the two validator flavors are important to keep in mind:

1. when choosing the xml syntax used for declaring a validator (either `<validator>` or `<field-validator>`)
2.  when using the `short-circuit` capability

> Note that you do not declare what "flavor" of validator you are using in your `-validation.xml` file, you just declare 
> the name of the validator to use and Struts will know whether it's a "plain Validator" or a "FieldValidator" 
> by looking at the validation class that the validator's programmer chose to implement.

## Non-Field Validator Vs Field-Validator validatortypes

There are two ways you can define validators in your `-validation.xml` file:

1. `<validator>`
2. `<field-validator>`

Keep the following in mind when using either syntax:

Non-Field-Validator: The `<validator>` element allows you to declare both types of validators (either a plain Validator 
a field-specific FieldValidator).

```xml
<validator type="expression"> 
    <param name="expression">foo gt bar</param> 
    <message>foo must be great than bar.</message> 
</validator> 
```

```xml
<validator type="required"> 
    <param name="fieldName">bar</param> 
    <message>You must enter a value for bar.</message> 
</validator> 
```

**field-validator**: The `<field-validator>` elements are basically the same as the `<validator>` elements except that 
they inherit the `fieldName` attribute from the enclosing `<field>` element. FieldValidators defined within a `<field-validator`> 
element will have their `fieldName` automatically filled with the value of the parent `<field>` element's `fieldName`
 attribute. The reason for this structure is to conveniently group the validators for a particular field under one element, 
 otherwise the fieldName attribute would have to be repeated, over and over, for each individual `<validator>`.

It is always better to defined field-validator inside a `<field>` tag instead of using a `<validator>` tag and supplying 
`fieldName` as its param as the xml code itself is clearer (grouping of field is clearer).

> Note that you should only use FieldValidators (not plain Validators) within a block. A plain Validator inside 
> a `<field>` will not be allowed and would generate error when parsing the xml, as it is not allowed 
> in the defined DTD (xwork-validator-1.0.2.dtd)

Declaring a FieldValidator using the `<field-validator>` syntax:

```xml
<field name="email_address"> 
    <field-validator type="required"> 
        <message>You cannot leave the email address field empty.</message> 
    </field-validator> 
    <field-validator type="email"> 
        <message>The email address you entered is not valid.</message> 
    </field-validator> 
</field> 
```

The choice is yours. It's perfectly legal to only use elements without the elements and set the `fieldName` attribute 
for each of them. The following are effectively equal:

```xml
<field name="email_address"> 
    <field-validator type="required"> 
        <message>You cannot leave the email address field empty.</message> 
    </field-validator> 
    <field-validator type="email"> 
        <message>The email address you entered is not valid.</message> 
    </field-validator> 
</field> 
 
<validator type="required"> 
    <param name="fieldName">email_address</param> 
    <message>You cannot leave the email address field empty.</message> 
</validator> 
<validator type="email"> 
    <param name="fieldName">email_address</param> 
    <message>The email address you entered is not valid.</message> 
</validator> 
```

## Short-Circuiting Validator

It is possible to `short-circuit` a stack of validators. Here is another sample config file containing validation 
rules from the Xwork test cases: Notice that some of the `<field-validator>` and `<validator>` elements have 
the `short-circuit` attribute set to true.

```xml
<!DOCTYPE validators PUBLIC
        "-//Apache Struts//XWork Validator 1.0.3//EN"
 	   "http://struts.apache.org/dtds/xwork-validator-1.0.3.dtd">
<validators>
  <!-- Field Validators for email field -->
  <field name="email">
      <field-validator type="required" short-circuit="true">
          <message>You must enter a value for email.</message>
      </field-validator>
      <field-validator type="email" short-circuit="true">
          <message>Not a valid e-mail.</message>
      </field-validator>
  </field>
  <!-- Field Validators for email2 field -->
  <field name="email2">
     <field-validator type="required">
          <message>You must enter a value for email2.</message>
      </field-validator>
     <field-validator type="email">
          <message>Not a valid e-mail2.</message>
      </field-validator>
  </field>
  <!-- Plain Validator 1 -->
  <validator type="expression">
      <param name="expression">email.equals(email2)</param>
      <message>Email not the same as email2</message>
  </validator>
  <!-- Plain Validator 2 -->
  <validator type="expression" short-circuit="true">
      <param name="expression">email.startsWith('mark')</param>
      <message>Email does not start with mark</message>
  </validator>
</validators>
```

**short-circuiting and Validator flavors**

Plain validator takes precedence over field-validator. They get validated first in the order they are defined and then 
the field-validator in the order they are defined. Failure of a particular validator marked as short-circuit will 
prevent the evaluation of subsequent validators and an error (action error or field error depending on the type of validator) 
will be added to the `ValidationContext` of the object being validated.

In the example above, the actual execution of validator would be as follows:

1. Plain Validator 1
2. Plain Validator 2
3. Field Validators for email field
4. Field Validators for email2 field

Since Plain Validator 2 is short-circuited, if its validation failed, it will causes Field validators for email field 
and Field validators for email2 field to not be validated as well.

**Usefull Information:**
More complicated validation should probably be done in the `validate()` method on the action itself (assuming the action 
implements `Validatable` interface which `ActionSupport` already does).

A plain Validator (non FieldValidator) that gets short-circuited will completely break out of the validation stack. 
No other validators will be evaluated and plain validators takes precedence over field validators meaning that they 
get evaluated in the order they are defined before field validators get a chance to be evaluated.

**Short cuircuiting and validator flavours**

A FieldValidator that gets short-circuited will only prevent other FieldValidators for the same field from being 
evaluated. Note that this "same field" behavior applies regardless of whether the `<validator>` or `<field-validator>`
syntax was used to declare the validation rule. By way of example, given this `-validation.xml` file:

```xml
<validator type="required" short-circuit="true">
  <param name="fieldName">bar</param>
  <message>You must enter a value for bar.</message>
</validator>

<validator type="expression">
  <param name="expression">foo gt bar</param>
  <message>foo must be great than bar.</message>
</validator>
```

both validators will be run, even if the "required" validator short-circuits. "required" validators are FieldValidator's 
and will not short-circuit the plain ExpressionValidator because FieldValidators only short-circuit other checks on that 
same field. Since the plain Validator is not field specific, it is not short-circuited.

## How Validators of an Action are Found

As mentioned above, the framework will also search up the inheritance tree of the action to find default validations 
for interfaces and parent classes of the Action. If you are using the short-circuit attribute and relying on default 
validators higher up in the inheritance tree, make sure you don't accidentally short-circuit things higher in the tree 
that you really want!

The effect of having common validators on both

- `<actionClass>-validation.xml`
- `<actionClass>-<actionAlias>-validation.xml`

It should be noted that the nett effect will be validation on both the validators available in both validation 
configuration file. For example if we have 'requiredstring' validators defined in both validation xml file for field 
named 'address', we will see 2 validation error indicating that the the address cannot be empty (assuming validation 
failed). This is due to WebWork will merge validators found in both validation configuration files.

The logic behind this design decision is such that we could have common validators in `<actionClass>-validation.xml` 
and more context specific validators to be located in `<actionClass>-<actionAlias>-validation.xml`.

## Writing custom validators

If you want to write custom validator use on of these classes as a starting point:

- `com.opensymphony.xwork2.validator.validators.ValidatorSupport`
- `com.opensymphony.xwork2.validator.validators.FieldValidatorSupport`
- `com.opensymphony.xwork2.validator.validators.RangeValidatorSupport`
- `com.opensymphony.xwork2.validator.validators.RepopulateConversionErrorFieldValidatorSupport`

## Resources

[WebWork Validation](http://today.java.net/pub/a/today/2006/01/19/webwork-validation.html)
