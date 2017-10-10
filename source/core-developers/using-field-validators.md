---
layout: core-developers
title: Using Field Validators
---

# Using Field Validators

## Description

The followings show a simple example using Struts' Field Validators

__Step 1__

Create the jsp page

{% comment %}start snippet id=fieldValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/fieldValidatorsExample.jsp {% endcomment %}

```xml

            <h3>All Field Errors Will Appear Here</h3>
            <s:fielderror/>
            <hr/>

            <h3>Field Error due to 'Required String Validator Field' Will Appear Here</h3>
            <s:fielderror>
                <s:param value="%{'requiredStringValidatorField'}"/>
            </s:fielderror>
            <hr/>

            <h3>Field Error due to 'String Length Validator Field' Will Appear Here</h3>
            <s:fielderror>
                <s:param>stringLengthValidatorField</s:param>
            </s:fielderror>
            <hr/>

            <s:form action="submitFieldValidatorsExamples" namespace="/validation" method="POST" theme="xhtml">
                <s:textfield label="Required Validator Field" name="requiredValidatorField"/>
                <s:textfield label="Required String Validator Field" name="requiredStringValidatorField"/>
                <s:textfield label="Integer Validator Field" name="integerValidatorField"/>
                <s:textfield label="Date Validator Field" name="dateValidatorField"/>
                <s:textfield label="Email Validator Field" name="emailValidatorField"/>
                <s:textfield label="URL Validator Field" name="urlValidatorField"/>
                <s:textfield label="String Length Validator Field" name="stringLengthValidatorField"/>
                <s:textfield label="Regex Validator Field" name="regexValidatorField"/>
                <s:textfield label="Field Expression Validator Field" name="fieldExpressionValidatorField"/>
                <s:submit label="Submit" cssClass="btn btn-primary"/>
            </s:form>


```

{% comment %}end snippet id=fieldValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/fieldValidatorsExample.jsp {% endcomment %}

__Step 2__

Create the action class

{% comment %}start snippet id=fieldValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/FieldValidatorsExampleAction.java {% endcomment %}

```java
 */
public class FieldValidatorsExampleAction extends AbstractValidationActionSupport {

    private static final long serialVersionUID = -4829381083003175423L;

    private String requiredValidatorField = null;
    private String requiredStringValidatorField = null;
    private Integer integerValidatorField = null;
    private Date dateValidatorField = null;
    private String emailValidatorField = null;
    private String urlValidatorField = null;
    private String stringLengthValidatorField = null;
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

/**

```

{% comment %}end snippet id=fieldValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/FieldValidatorsExampleAction.java {% endcomment %}

__Step 3__

Create the validator\.xml\.

{% comment %}start snippet id=fieldValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/FieldValidatorsExampleAction-submitFieldValidatorsExamples-validation.xml {% endcomment %}

```xml
  		
<validators>
	<field name="requiredValidatorField">
		<field-validator type="required">
			<message><![CDATA[ required ]]></message>
		</field-validator>
	</field>
	<field name="requiredStringValidatorField">
		<field-validator type="requiredstring">
			<param name="trim">true</param>
			<message><![CDATA[ required and must be string ]]></message>
		</field-validator>
	</field>
	<field name="integerValidatorField">
		<field-validator type="int">
			<param name="min">1</param>
			<param name="max">10</param>
			<message><![CDATA[ must be integer min 1 max 10 if supplied ]]></message>
		</field-validator>
	</field>
	<field name="dateValidatorField">
		<field-validator type="date">
			<param name="min">01/01/1990</param>
			<param name="max">01/01/2000</param>
			<message><![CDATA[ must be a min 01-01-1990 max 01-01-2000 if supplied ]]></message>
		</field-validator>
	</field>
	<field name="emailValidatorField">
		<field-validator type="email">
			<message><![CDATA[ must be a valid email if supplied ]]></message>
		</field-validator>
	</field>
	<field name="urlValidatorField">
		<field-validator type="url">
			<message><![CDATA[ must be a valid url if supplied ]]></message>
		</field-validator>
	</field>
	<field name="stringLengthValidatorField">
		<field-validator type="stringlength">
			<param name="maxLength">4</param>
			<param name="minLength">2</param>
			<param name="trim">true</param>
			<message><![CDATA[ must be a String of a specific greater than 1 less than 5 if specified ]]></message>
		</field-validator>
	</field>
	<field name="regexValidatorField">
		<field-validator type="regex">
			<param name="regex"><![CDATA[ [^<>]+ ]]></param>
			<message><![CDATA[ regexValidatorField must match a regexp (.*\.txt) if specified ]]></message>
		</field-validator>
	</field>
	<field name="fieldExpressionValidatorField">
		<field-validator type="fieldexpression">
			<param name="expression">(fieldExpressionValidatorField == requiredValidatorField)</param>
			<message><![CDATA[ must be the same as the Required Validator Field if specified ]]></message>
		</field-validator>
	</field>
</validators>


```

{% comment %}end snippet id=fieldValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/FieldValidatorsExampleAction-submitFieldValidatorsExamples-validation.xml {% endcomment %}
