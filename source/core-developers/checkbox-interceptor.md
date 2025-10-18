---
layout: default
title: Checkbox Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Checkbox Interceptor

This interceptor is defined in the `defaultStack`. It is essential for handling HTML checkboxes, as unchecked checkboxes are not submitted as part of a form. This interceptor ensures that a value is always present for a checkbox, so that in the Action class, the property is not `null`.

## How it works

The interceptor looks for a special hidden field in the form that is associated with the checkbox. This hidden field must have a name that starts with `__checkbox_` followed by the name of the checkbox. For example, if your checkbox is named `myCheckbox`, the hidden field should be named `__checkbox_myCheckbox`.

When the form is submitted, the `CheckboxInterceptor` does the following:
1. It iterates through the request parameters.
2. If it finds a parameter that starts with `__checkbox_`, it extracts the name of the checkbox from it (e.g., `myCheckbox`).
3. It then checks if a parameter with the checkbox's name (`myCheckbox`) exists in the request.
4. If the checkbox parameter does not exist (which means the checkbox was unchecked), the interceptor adds a new parameter to the request with the checkbox's name and a value of `false`.
5. Finally, it removes the `__checkbox_` prefixed parameters from the request, so they are not processed further.

This ensures that the Action property for the checkbox will be set to `false` instead of being `null`.

The `<s:checkbox>` tag from the Struts UI Tags library automatically generates this hidden field for you.

## Parameters

 - `uncheckedValue` - The default value for an unchecked box is `false`. You can override this by setting the `uncheckedValue` property on the interceptor.

## Extending the Interceptor

This interceptor does not have any known extension points.

## Checkbox lists usage with @StrutsParameter

The `<s:checkboxlist>` tag is used to render a list of checkboxes. When using this tag, the submitted values are populated into a `Collection` or an array in your Action.
When using `@StrutsParameter` with a checkbox list, you must place the annotation on the setter method of the collection property.

### Example

```java
public class MyAction extends ActionSupport {
    private Collection<String> mySelection;

    @StrutsParameter
    public void setMySelection(Collection<String> mySelection) {
        this.mySelection = mySelection;
    }

    @StrutsParameter
    public Collection<String> getMySelection() {
        return mySelection;
    }
}
```
