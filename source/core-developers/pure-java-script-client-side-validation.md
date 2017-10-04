---
layout: core-developers
title: Pure JavaScript Client Side Validation
---

# Pure JavaScript Client Side Validation#### {#PAGE_14262}

Pure JavaScript client side validation is the simplest but least feature\-rich type of [Client Side Validation](client-side-validation.html). 
This type of validation uses 100% client\-side JavaScript code to try to validate the values entered by the user. 
Because the validation logic is actually repeated in the JavaScript code, it is important to understand that 
some values will be considered acceptable by the JavaScript code but will be marked as unacceptable by the server\-side [Validation](validation.html).


{% comment %}start snippet id=supported-validators|url=struts2/core/src/main/resources/template/xhtml/form-close-validate.ftl {% endcomment %}
<p>Only the following validators are supported:
* required validator
* requiredstring validator
* stringlength validator
* regex validator
* email validator
* url validator
* int validator
* double validator</p>
{% comment %}end snippet id=supported-validators|url=struts2/core/src/main/resources/template/xhtml/form-close-validate.ftl {% endcomment %}


> 

> 

> JavaScript client validation is not available for visitor validations\.

> 

__Error reporting__

Because client side validation does not talk to the server, the theme (_xhtml theme_  or _css\_xhtml theme_ ) is responsible for properly manipulating the HTML DOM to display the error message inline\. The JavaScript that is responsible for doing this logic is 

~~~~~~~
validation.js
~~~~~~~
 and can be found in each theme\.



| Errors are reported using the default validation message, not the internationalized version that the server\-side might be aware of\. This is a known issue\. You may want to try the [AJAX Client Side Validation](ajax-client-side-validation.html) for messages that are fully internationalized\.

| 

__Additional Validator Support__

If you wish to add additional validator support beyond those listed, you may override the _xhtml theme_  teamplte 

~~~~~~~
form-close-validate.ftl
~~~~~~~
\. This file contains the JavaScript that tries to validate each user\-entered value from within the browswer\. The _css\_xhtml theme_  extends the _xhtml theme_  and therefore doesn't have it's own form\-close\-validate\.ftl template\.
