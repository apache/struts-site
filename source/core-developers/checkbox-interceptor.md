---
layout: default
title: Checkbox Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Checkbox Interceptor

This interceptor is  defined in the `defaultStack`. It checks each form parameter submitted  to the action and if it 
finds one with a prefix of `_checkbox` it inserts a value for a parameter whose name is derived from the suffix 
to `_checkbox` if it does not exist. The default value inserted is `false` but this can be changed by setting 
the `uncheckedValue` parameter on the interceptor.

This means that a checkbox can be accompanied by a hidden input with the same name but a prefix of `_checkbox` so that 
if the checkbox is not checked on the form the action will still receive a value rather than the default HTML action 
of not providing a value for unchecked checkboxes.

## Parameters

 - `uncheckedValue` - the default value of an unchecked box can be overridden by setting the `uncheckedValue` property.

## Extending the Interceptor

This interceptor does not have any known extension points.
