---
layout: core-developers
title: Checkbox Interceptor
---

# Checkbox Interceptor



~~~~~~~
org.apache.struts2.interceptor.CheckboxInterceptor
~~~~~~~
 is in the 

~~~~~~~
defaultStack
~~~~~~~
\. It checks each form parameter submitted to the action and if it finds one with a prefix of 

~~~~~~~
_checkbox
~~~~~~~
 it inserts a value for a parameter whose name is derived from the suffix to 

~~~~~~~
_checkbox
~~~~~~~
 if it does not exist\. The default value inserted is 

~~~~~~~
false
~~~~~~~
 but this can be changed by setting the 

~~~~~~~
uncheckedValue
~~~~~~~
 parameter on the interceptor\.

This means that a checkbox can be accompanied by a hidden input with the same name but a prefix of 

~~~~~~~
_checkbox
~~~~~~~
 so that if the checkbox is not checked on the form the action will still receive a value rather than the default HTML action of not providing a value for unchecked checkboxes\.

#####Parameters#####



~~~~~~~
{% snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.CheckboxInterceptor %}
~~~~~~~

#####Extending the Interceptor#####



~~~~~~~
{% snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.CheckboxInterceptor %}
~~~~~~~
