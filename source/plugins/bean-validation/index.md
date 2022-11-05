---
layout: plugin
title: Bean Validation Plugin
parent:
    url: /plugins
    title: Plugins
---

# Bean Validation Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Bean Validation

The Bean Validation plugin implements a bridge to use Bean Validation in struts actions. Bean Validation has been
specified in JSR 303 and is part of the JavaEE platform. Full-fledged application servers already bring validation
providers which can be leveraged by this plugin. The plugin integrates with other struts features like:

- i18n
- model driven
- AJAX Validation
- workflow

## Setup

In order to use the Bean Validation plugin, you first need to add the JAR file to the `WEB-INF/lib` directory of your
application or include the dependency in your project's Maven POM file.

**pom.xml**

```xml
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-bean-validation-plugin</artifactId>
    <version>X.X.X</version>
</dependency>
```

Where X.X.X is the current version of Struts 2. Please remember that the Bean Validation Plugin is available from
version 2.5.

## Configuration

This sample shows the configuration constants the plugin provides. It also shows how to enable bean-validation
by extending your own application package from `struts-bean-validation` which comes along with the plugin.

**struts.xml**

```xml
<struts>
    <constant name="struts.beanValidation.providerClass" value="org.hibernate.validator.HibernateValidator"/>
    <constant name="struts.beanValidation.ignoreXMLConfiguration" value="false"/>
    <constant name="struts.beanValidation.convertMessageToUtf" value="false"/>
    <constant name="struts.beanValidation.convertMessageFromEncoding" value="ISO-8859-1"/>

    <package name="my-bean-validation" extends="struts-bean-validation">
    </package>
</struts>
```

Here is another example that shows how you can combine bean-validation with other plugins by configuring your own
Interceptor-Stack (note: this is just a very short example. In a real app you should take more care about your stack).
You can combine bean validation with classic struts validation (or disable either) by putting the according interceptors
in your stack (or by removing them from your stack).

**struts.xml**

```xml
<package name="my-app-package" extends="struts-default">
    <interceptors>
        <interceptor>
            name="beanValidation"
            class="org.apache.struts.beanvalidation.validation.interceptor.BeanValidationInterceptor">
        </interceptor>
        <interceptor-stack name="appDefaultStack">
            <interceptor-ref name="beanValidation"/>
            <interceptor-ref name="defaultStack"/>
        </interceptor-stack>
    </interceptors>
</package>
```

## Bean Validation Example

Here is an example Action that makes use of bean validation. Note that some of the validation annotations are taken
from `javax` package (which is defined in the JSR) while others are taken from the validaton provider (in this
case: `hibernate`). You can specifiy own text keys in the `message` attribute of the annotations. If you do that the
whole struts i18n mechanism kicks in to resolve those text keys.

**com.example.actions.BeanValidationAction**

```java
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts.beanvalidation.constraints.FieldMatch;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.ScriptAssert;
import org.hibernate.validator.constraints.URL;

import javax.validation.constraints.*;
import java.util.Date;


@Namespace("/bean-validation")
@ParentPackage("my-bean-validation")
@Action(results = {
        @Result(name = "input", location = "bean-validation.jsp"),
        @Result(name = "success", location = "/WEB-INF/validation/successFieldValidatorsExample.jsp")
})
@FieldMatch(first = "fieldExpressionValidatorField", second = "requiredValidatorField", message = "requiredValidatorField and fieldExpressionValidatorField are not matching")
@ScriptAssert(lang = "javascript", script = "_this.dateValidatorField != null && _this.dateValidatorField.before(new java.util.Date())", message = "Date need to before now")
public class BeanValidationExampleAction extends ActionSupport {
    @NotNull
    private String requiredValidatorField = null;

    @NotBlank
    private String requiredStringValidatorField = null;

    @NotNull(message = "your.text.key.here")
    @Min(1)
    @Max(10)
    private Integer integerValidatorField = null;

    @NotNull
    private Date dateValidatorField = null;

    @NotNull
    @Size(min = 4, max = 64)
    @Email

    private String emailValidatorField = null;

    @NotNull
    @Size(min = 4, max = 64)
    @URL
    private String urlValidatorField = null;

    @NotNull
    @Size(min = 2, max = 4)
    private String stringLengthValidatorField = null;

    @Pattern(regexp = "[^<>]+")
    private String regexValidatorField = null;

    private String fieldExpressionValidatorField = null;


    public Date getDateValidatorField() {

        return dateValidatorField;
    }

    public void setDateValidatorField(Date dateValidatorField) {
        this.dateValidatorField = dateValidatorField;
    }

    public String getEmailValidatorField() {
        return emailValidatorField;
    }

    public void setEmailValidatorField(String emailValidatorField) {
        this.emailValidatorField = emailValidatorField;
    }

    public Integer getIntegerValidatorField() {
        return integerValidatorField;
    }

    public void setIntegerValidatorField(Integer integerValidatorField) {
        this.integerValidatorField = integerValidatorField;
    }

    public String getRegexValidatorField() {
        return regexValidatorField;
    }

    public void setRegexValidatorField(String regexValidatorField) {
        this.regexValidatorField = regexValidatorField;
    }

    public String getRequiredStringValidatorField() {
        return requiredStringValidatorField;
    }

    public void setRequiredStringValidatorField(String requiredStringValidatorField) {
        this.requiredStringValidatorField = requiredStringValidatorField;
    }

    public String getRequiredValidatorField() {
        return requiredValidatorField;
    }

    public void setRequiredValidatorField(String requiredValidatorField) {
        this.requiredValidatorField = requiredValidatorField;
    }

    public String getStringLengthValidatorField() {
        return stringLengthValidatorField;
    }

    public void setStringLengthValidatorField(String stringLengthValidatorField) {
        this.stringLengthValidatorField = stringLengthValidatorField;
    }

    public String getFieldExpressionValidatorField() {
        return fieldExpressionValidatorField;
    }

    public void setFieldExpressionValidatorField(
            String fieldExpressionValidatorField) {
        this.fieldExpressionValidatorField = fieldExpressionValidatorField;
    }

    public String getUrlValidatorField() {
        return urlValidatorField;
    }

    public void setUrlValidatorField(String urlValidatorField) {
        this.urlValidatorField = urlValidatorField;
    }
}
```
