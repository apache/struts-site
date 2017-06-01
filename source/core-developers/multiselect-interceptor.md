---
layout: core-developers
title: Multiselect Interceptor
---

# Multiselect Interceptor



~~~~~~~
org.apache.struts2.interceptor.MultiselectInterceptor
~~~~~~~
 is in the 

~~~~~~~
defaultStack
~~~~~~~
\. It checks each form parameter submitted to the action and if it finds one with a prefix of 

~~~~~~~
__multiselect_
~~~~~~~
 it inserts a value for a parameter whose name is derived from the suffix to 

~~~~~~~
__multiselect_
~~~~~~~
 if it does not exist\. The default value inserted is an empty String array\.

This means that a a field that can have multiple selected values(select, checkboxlist, etc) can be accompanied by a hidden input with the same name but a prefix of 

~~~~~~~
__multiselect_
~~~~~~~
 so that if the no value is selected on the form the action will still receive a value(empty collection) rather than the default HTML action of not providing a value for unselected elements,
 