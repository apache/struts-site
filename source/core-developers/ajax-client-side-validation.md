---
layout: core-developers
title: AJAX Client Side Validation
---

# AJAX Client Side Validation


This validation mode only works with the _ajax theme_ 

| 

AJAX\-based client side validation improves upon [Pure JavaScript Client Side Validation](#PAGE_14262) by using a combination of JavaScript, DOM manipulation, and remote server communication\. Unlike the pure client side implementation, AJAX\-based validation communicates with the server\. This means all your validation rules that worked when submitting a form will still work within the browser\.

The validation occurs on each **onblur** event for each form element\. As each user types in some values and moves to the next form element, the value (and all other values previously entered) will be sent to the server for validation\. The entire validation stack is run, including visitor validators and your action's validate() method\.

If there is an error, like the pure implementation, the HTML and DOM will be updated immediately\.

For an example of this, see _AJAX Validation_ \.

__AJAX Validation__


__Description__

Struts provides [client side validation](client-side-validation.html)(using JavaScript) for a few validators\. Using AJAX validation, all [validators](#PAGE_14292) available to the application on the server side can be used without forcing the page to reload, just to show validation errors\. AJAX validation has a server side, which is in included in _JSON Plugin_  (an interceptor and a result)\. Client side must be handled by applictions themself\. One reason for that is there are too many JavaScript frameworks and libraries\. Struts has no preference which of them you use\. Previous versions of Struts included a client side which was relying on the Dojo JS framework and was located in Struts Dojo plugin\. That has been deprecated for a long time and was eventually removed\.

__Example__

This example is taken from the Struts showcase application\.

__Create the action class__



~~~~~~~
public class AjaxFormSubmitAction extends ActionSupport {
    private String requiredValidatorField = null;
    private String requiredStringValidatorField = null;
    private Integer integerValidatorField = null;
    private Date dateValidatorField = null;
    private String emailValidatorField = null;
    private String urlValidatorField = null;
    private String stringLengthValidatorField = null;
    private String regexValidatorField = null;
    private String fieldExpressionValidatorField = null;
    @Override
    public void validate() {
        if (hasFieldErrors()) {
            addActionError("Errors present!");
        }
    }
    public Date getDateValidatorField() {
        return dateValidatorField;
    }
    @DateRangeFieldValidator(
        min="01/01/1990", 
        max="01/01/2000", 
        message="must be a min 01-01-1990 max 01-01-2000 if supplied")
    public void setDateValidatorField(Date dateValidatorField) {
        this.dateValidatorField = dateValidatorField;
    }
    public String getEmailValidatorField() {
        return emailValidatorField;
    }
    @EmailValidator(message="must be a valid email if supplied")
    public void setEmailValidatorField(String emailValidatorField) {
        this.emailValidatorField = emailValidatorField;
    }
    public Integer getIntegerValidatorField() {
        return integerValidatorField;
    }
    @IntRangeFieldValidator(min="1", max="10", message="must be integer min 1 max 10 if supplied")
    public void setIntegerValidatorField(Integer integerValidatorField) {
        this.integerValidatorField = integerValidatorField;
    }
    public String getRegexValidatorField() {
        return regexValidatorField;
    }
    @RegexFieldValidator(
        regex="[^<>]+", 
        message="regexValidatorField must match a regexp (.*\\.txt) if specified")
    public void setRegexValidatorField(String regexValidatorField) {
        this.regexValidatorField = regexValidatorField;
    }
    public String getRequiredStringValidatorField() {
        return requiredStringValidatorField;
    }
    @RequiredStringValidator(trim=true, message="required and must be string")
    public void setRequiredStringValidatorField(String requiredStringValidatorField) {
        this.requiredStringValidatorField = requiredStringValidatorField;
    }
    public String getRequiredValidatorField() {
        return requiredValidatorField;
    }
    @RequiredFieldValidator(message="required")
    public void setRequiredValidatorField(String requiredValidatorField) {
        this.requiredValidatorField = requiredValidatorField;
    }
    public String getStringLengthValidatorField() {
        return stringLengthValidatorField;
    }
    @StringLengthFieldValidator(
        minLength="2", 
        maxLength="4", 
        trim=true, 
        message="must be a String of a specific greater than 1 less than 5 if specified")
    public void setStringLengthValidatorField(String stringLengthValidatorField) {
        this.stringLengthValidatorField = stringLengthValidatorField;
    }
    public String getFieldExpressionValidatorField() {
        return fieldExpressionValidatorField;
    }
    @FieldExpressionValidator(
        expression = "(fieldExpressionValidatorField == requiredValidatorField)", 
        message = "must be the same as the Required Validator Field if specified")
    public void setFieldExpressionValidatorField(
            String fieldExpressionValidatorField) {
        this.fieldExpressionValidatorField = fieldExpressionValidatorField;
    }
    public String getUrlValidatorField() {
        return urlValidatorField;
    }
    @UrlValidator(message="must be a valid url if supplied")
    public void setUrlValidatorField(String urlValidatorField) {
        this.urlValidatorField = urlValidatorField;
    }
}
~~~~~~~

 

__Map the Action__

Note that is is not necessary when using _Convention Plugin_ \.


~~~~~~~
<!DOCTYPE struts PUBLIC "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN" "http://struts.apache.org/dtds/struts-2.0.dtd">
	
<struts>
    <package>
         <action name="ajaxFormSubmit" class="org.apache.struts2.showcase.validation.AjaxFormSubmitAction">
             <interceptor-ref name="jsonValidationWorkflowStack"/>
             <result name="input">/WEB-INF/validation/ajaxFormSubmit.jsp</result>
             <result type="jsonActionRedirect">ajaxFormSubmitSuccess</result>
         </action>
    </package>

~~~~~~~

AJAX validation is performed by the _jsonValidation_  interceptor\. This interceptor is included in the _jsonValidationWorkflowStack_ , and is required in order to perform AJAX validation\. Normal results(input, success, etc) should be provided for the action in the case that someone tries to access the action directly, in which case normal validation will be triggered\. So, how does the _jsonValidation_  know that it must perform AJAX validation vs regular validation? We will see that in a minute, but you don't need to know that in order to use AJAX validation\. Same applies for specialized Redirect Result Type _jsonActionRedirect_ \.

__Create the JSP__



```jsp
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Struts2 Showcase - Validation - AJAX Form Submit</title>
    <s:head theme="xhtml"/>
</head>
<body>
<div class="page-header">
    <h1>AJAX Form Submit</h1>
</div>
    <h3>Action Errors Will Appear Here</h3>
    <s:actionerror theme="ajaxErrorContainers"/>
    <hr/>
    <s:form method="POST" theme="xhtml">
        <s:textfield label="Required Validator Field" name="requiredValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="Required String Validator Field" name="requiredStringValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="Integer Validator Field" name="integerValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="Date Validator Field" name="dateValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="Email Validator Field" name="emailValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="URL Validator Field" name="urlValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="String Length Validator Field" name="stringLengthValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="Regex Validator Field" name="regexValidatorField" theme="ajaxErrorContainers"/>
        <s:textfield label="Field Expression Validator Field" name="fieldExpressionValidatorField" theme="ajaxErrorContainers"/>
        <s:submit label="Submit" cssClass="btn btn-primary"/>
    </s:form>
</body>
</html> 
```

Things to note on this JSP:

+ The _form_  tag **does not** have _validate_  set to _true_ , which would perform client validation before the AJAX validation\.

+ It uses a customized theme _ajaxErrorContainers_ \. The default Struts themes generate HTML\-Elements to show validation errors only if errors are present when page is created on server side\. But in order to show validation errors that arrive later via AJAX it is necessary to have error\-container elements in DOM always\.

What happens if validation succeeds? That depends on your request parameters and action configuration\. If you are using _jsonActionRedirect_  result mentioned above the action will be executed while AJAX request is active and respond with JSON providing a new URL to load\. Otherwise the AJAX response will be empty and the form must be submitted a 2nd time but as usual request, not AJAX\.



| Setting _validate_  to _true_  in the _form_  tag will enable client side, JavaScript validation, which can be used along with AJAX validation (runs before the AJAX validation)\.

| 

__Custom Theme__

In this sample the _custom theme_  is based on _xhtml_  theme\. It is required to override 3 FTL files\.



> theme\.properties



~~~~~~~
parent = xhtml
~~~~~~~

 



> actionerror\.ftl



~~~~~~~
<#--
    Make sure element is always present. To be filled later via JS.
-->
<ul<#rt/>
<#if parameters.id??>
 id="${parameters.id?html}"<#rt/>
</#if>            
<#if parameters.cssClass??>
 class="${parameters.cssClass?html}"<#rt/>
<#else>
 class="errorMessage"<#rt/>
</#if>
<#if parameters.cssStyle??>
 style="${parameters.cssStyle?html}"<#rt/>
</#if>
>
<#if (actionErrors?? && actionErrors?size > 0)>
    <#list actionErrors as error>
        <#if error??>
            <li><span><#if parameters.escape>${error!?html}<#else>${error!}</#if></span><#rt/></li><#rt/>
        </#if>
    </#list>
</#if>
</ul>
~~~~~~~

 



> controlfooter\.ftl



~~~~~~~
${parameters.after!}<#t/>
    </td><#lt/>
</tr>
<#if (parameters.errorposition!"top") == 'bottom'>
<#assign hasFieldErrors = parameters.name?? && fieldErrors?? && fieldErrors[parameters.name]??/>
<#if hasFieldErrors>
<tr errorFor="${parameters.id}">
    <td class="tdErrorMessage" colspan="2"><#rt/>
        <#if hasFieldErrors>
            <#list fieldErrors[parameters.name] as error>
                <div class="errorMessage">${error?html}</div><#t/>
            </#list>
        </#if>
    </td><#lt/>
</tr>
</#if>
</#if>


~~~~~~~

 



> controlheader\-core\.ftl



~~~~~~~
 <#--
    Always include elements to show errors. They may be filled later via AJAX.
-->
<#assign hasFieldErrors = parameters.name?? && fieldErrors?? && fieldErrors[parameters.name]??/>
<#if (parameters.errorposition!"top") == 'top'>
<tr errorFor="${parameters.id}">
    <td class="tdErrorMessage" colspan="2" data-error-for-fieldname="${parameters.name}"><#rt/>
        <#if hasFieldErrors>
            <#list fieldErrors[parameters.name] as error>
                <div class="errorMessage">${error?html}</div><#t/>
            </#list>
        </#if>
    </td><#lt/>
</tr>
</#if>
<#if !parameters.labelposition?? && (parameters.form.labelposition)??>
<#assign labelpos = parameters.form.labelposition/>
<#elseif parameters.labelposition??>
<#assign labelpos = parameters.labelposition/>
</#if>
<#--
    if the label position is top,
    then give the label it's own row in the table
-->
<tr>
<#if (labelpos!"") == 'top'>
    <td class="tdLabelTop" colspan="2"><#rt/>
<#else>
    <td class="tdLabel"><#rt/>
</#if>
<#if parameters.label??>
    <label <#t/>
<#if parameters.id??>
        for="${parameters.id?html}" <#t/>
</#if>
<#if hasFieldErrors>
        class="errorLabel"<#t/>
<#else>
        class="label"<#t/>
</#if>
    ><#t/>
<#if parameters.required!false && parameters.requiredPosition!"right" != 'right'>
        <span class="required">*</span><#t/>
</#if>
${parameters.label?html}<#t/>
<#if parameters.required!false && parameters.requiredPosition!"right" == 'right'>
 <span class="required">*</span><#t/>
</#if>
${parameters.labelseparator!":"?html}<#t/>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/tooltip.ftl" />
</label><#t/>
</#if>
    </td><#lt/>
<#-- add the extra row -->
<#if (labelpos!"") == 'top'>
</tr>
<tr>
</#if>


~~~~~~~

__CSS__

To show users some nice visual feedback while waiting for AJAX response you can use a little CSS\. Remember to include the referenced _indicator\.gif_ \.


~~~~~~~
.ajaxVisualFeedback {
    width: 16px;
    height: 16px;
    background-image: url('../images/indicator.gif');
    background-repeat: no-repeat;
    float: right;
}
~~~~~~~

 

__JavaScript__

Now this is where the magic happens\. Here _jQuery_  is used to register an eventhandler which intercepts form submits\. It takes care of hiding validation errors that might be present, submit the form via AJAX and handle JSON responses\.


~~~~~~~
 /**
  * Validates form per AJAX. To be called as onSubmit handler.
  *
  * @param event onSubmit event
  */
function ajaxFormValidation(event) {
    event.preventDefault();
    _removeValidationErrors();
    var _form = $(event.target);
    var _formData = _form.serialize(true);
    // prepare visual feedback
    // you may want to use other elements here
    var originalButton = _form.find('.btn-primary');
    // note: jQuery returns an array-like object
    if (originalButton && originalButton.length && originalButton.length > 0) {
        originalButton.hide();
        var feedbackElement = $('<div class="ajaxVisualFeedback"></div>').insertAfter(originalButton);
        var restoreFunction = function() {
            originalButton.show();
            feedbackElement.remove();
        }
    }
    var options = {
        data: 'struts.enableJSONValidation=true&struts.validateOnly=false&' + _formData,
        async: true,
        processData: false,
        type: 'POST',
        success: function (response, statusText, xhr) {
            if (response.location) {
                // no validation errors
                // action has been executed and sent a redirect URL wrapped as JSON
                // cannot use a normal http-redirect (status-code 3xx) as this would be followed by browsers and would not be available here
                // follow JSON-redirect
                window.location.href = response.location;
            } else {
                if (restoreFunction) {
                    restoreFunction();
                }
                _handleValidationResult(_form, response);
            }
        },
        error: function(xhr, textStatus, errorThrown) {
            if (restoreFunction) {
                restoreFunction();
            }
            // struts sends status code 400 when validation errors are present
            if (xhr.status === 400) {
                _handleValidationResult(_form, JSON.parse(xhr.responseText))
            } else {
                // a real error occurred -> show user an error message
                _handleValidationResult(_form, {errors: ['Network or server error!']})
            }
		}
    }
    // send request, after delay to make sure everybody notices the visual feedback :)
    window.setTimeout(function() {
        var url = _form[0].action;
        jQuery.ajax(url, options);
    }, 1000);
}
/**
 * Removes validation errors from HTML DOM.
 */
function _removeValidationErrors() {
    // action errors
    // you might want to use a custom ID here
    $('ul.errorMessage li').remove();
    // field errors
    $('div.errorMessage').remove();
}
/**
 * Incorporates validation errors in HTML DOM.
 *
 * @param form Form containing errors.
 * @param errors Errors from server.
 */
function _handleValidationResult(form, errors) {
    // action errors
    if (errors.errors) {
        // you might want to use a custom ID here
        var errorContainer = $('ul.errorMessage');
        $.each(errors.errors, function(index, errorMsg) {
            var li = $('<li><span></span></li>');
            li.text(errorMsg); // use text() for security reasons
            errorContainer.append(li);
        });
    }
    // field errors
    if (errors.fieldErrors) {
        $.each(errors.fieldErrors, function(fieldName, errorMsg) {
            var td = $('td[data-error-for-fieldname="' + fieldName + '"]');
            if (td) {
                var div = $('<div class="errorMessage"></div>');
                div.text(errorMsg); // use text() for security reasons
                td.append(div);
            }
        });
    }
}
// register onSubmit handler
$(window).bind('load', function() {
    $('form').bind('submit', ajaxFormValidation);
});
~~~~~~~

 

__How it works__

_jsonValidation_  interceptor must be placed on a stack, following the _validation_  interceptor\. The interceptor itself won't perform any validation, but will check for validation errors on the action being invoked (assuming that the action is ValidationAware)\.

If you just want to use AJAX validation, without knowing the implementation details, you can skip this section\.

When the _jsonValidation_  interceptor is invoked, it will look for a parameter named _struts\.enableJSONValidation_ , this parameter **must** be set to _true_ , otherwise the interceptor won't do anything\. Then the interceptor will look for a parameter named _struts\.validateOnly_ , if this parameter exists, is set to _true_ , and there are validation errors (o action errors) they will be serialized into JSON in the form:


~~~~~~~
{
    "errors": ["Global Error 1", "Global Error 2"],
    "fieldErrors": {
        "field1": ["Field 1 Error 1", "Field 1 Error 2"],
        "field1": ["Field 2 Error 1", "Field 2 Error 2"]  
    }
}

~~~~~~~

If the action implements the _ModelDrive_  interface, "model\." will be stripped from the field names in the returned JSON\. If validation succeeds (and _struts\.validateOnly_  is true), an empty JSON string will be returned:


~~~~~~~
{}

~~~~~~~

If _struts\.validateOnly_  is false the action and result are executed\. In this case _jsonActionRedirect_  result is very useful\. It creates a JSON response in the form:


~~~~~~~
{"location": "<url to be loaded next>"}

~~~~~~~


> 

> 

> Remember to set struts\.enableJSONValidation=true in the request to enable AJAX validation

> 

__JSONValidationInterceptor parameters__

The following request parameters can be used to enable exposing validation errors:

+ **struts\.enableJSONValidation** \- a request parameter must be set to **true** to use this interceptor

+ **struts\.validateOnly** \- If the request has this parameter, execution will return after validation (action won't be executed)\. If **struts\.validateOnly** is set to false you may want to use _JSONActionRedirectResult_ 

+ **struts\.JSONValidation\.no\.encoding** \- If the request has this parameter set to **true,** the character encoding will **NOT** be set on the response \- is needed in portlet environment

You can override names of these parameters by specifying the following parameters when setting up a stack:

+ **validateJsonParam** \- to override name of **struts\.enableJSONValidation****
**

+ **validateOnlyParam** \- to override name of **struts\.validateOnly**

+ **noEncodingSetParam** \- to override name of **struts\.JSONValidation\.no\.encoding**

+ **validationFailedStatus** \- status to be set on response when there are validation errors, by default **400**

**
**

 Parameters overriding is available since Struts 2\.5\.9

__Flow chart of AJAX validation__


Some details are omitted, like results used\.

| 


As explained above: there is a case where form is submitted twice, one time as AJAX with validation only and another time as usual submit\.

| 

_struts2\-ajax\-vali\-flow\.png_ 
