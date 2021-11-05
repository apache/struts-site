---
layout: default
title: Tag Developers Guide
---

# Form Tags
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

Within the form tags, there are two classes of tags: the form tag itself, and all other tags, which make up
the individual form elements. The behavior of the form tag is different from the elements enclosed within it.

## Form Tag Themes

As explained in [Themes and Templates](themes-and-templates), the HTML Tags (which includes Form Tags) are all driven
by templates. Templates are grouped together to create themes. The framework bundles three themes in the distribution.

|Name|Description||
|---|---|---|
|simple|Sometimes _too_ simple|
|xhtml|Extends simple, layout base on `<table>`s|(default)
|css_xhtml|Extends simple, layout base on `<div>`s and CSS|

The predefined themes can be used "as is" or customized.

> The `xhtml` theme renders out a two-column table. If a different layout is needed, do _not_ write your own HTML.
> Create a new theme or utilize the simple theme.

## Simple theme caveats

The downside of using the simple theme is that it doesn't support as many of the attributes that the other themes do.
For example, the `label` attribute does nothing in the simple theme, and the automatic display of error messages
is not supported.

## Common Attributes

All the form tags extend the UIBean class. This base class provides a set of common attributes, that can be grouped 
in to three categories: _templated-related_, _javascript-related_, and _general_ attributes. The individual attributes
are documented on each tag's reference page.

In addition to the common attributes, a special attribute exists for all form element tags: `form` (`${parameters.form}`). 
The `form` property represents the attributes used to render the form tag, such as the form's id. In a template, 
the form's ID can be found by calling `${parameters.form.id}`.

## Template-Related Attributes

|Attribute|Theme|Data Types|Description|
|---|---|---|---|
|templateDir|n/a|String|define the template directory|
|theme|n/a|String|define the theme name|
|template|n/a|String|define the template name|
|themeExpansionToken|n/a|String|special token (defined with struts.ui.theme.expansion.token) used to search for template in parent theme
(don't use it separately!)|
|expandTheme|n/a|String|concatenation of themeExpansionToken and theme which tells internal template loader mechanism to try load template from current theme and then from parent theme (and parent theme, and so on) when used with <#include/> directive|

## Javascript-Related Attributes

|Attribute|Theme|Data Types|Description|
|---|---|---|---|
|onclick|simple|String|html javascript onclick attribute|
|ondblclick|simple|String|html javascript ondbclick attribute|
|onmousedown|simple|String|html javascript onmousedown attribute|
|onmouseup|simple|String|html javascript onmouseup attribute|
|onmouseover|simple|String|html javascript onmouseover attribute|
|onmouseout|simple|String|html javascript onmouseout attribute|
|onfocus|simple|String|html javascript onfocus attribute|
|onblur|simple|String|html javascript onblur attribute|
|onkeypress|simple|String|html javascript onkeypress attribute|
|onkeyup|simple|String|html javascript onkeyup attribute|
|onkeydown|simple|String|html javascript onkeydown attribute|
|onselect|simple|String|html javascript onselect attribute|
|onchange|simple|String|html javascript onchange attribute|

## Tooltip Related Attributes

|Attribute|Data Type|Default|Description|
|---|---|---|---|
|tooltip|String|none|Set the tooltip of this particular component|
|jsTooltipEnabled|String|false|Enable js tooltip rendering|
|tooltipIcon|String|/struts/static/tooltip/tooltip.gif|The url to the tooltip icon|
|tooltipDelay|String|500|Tooltip shows up after the specified timeout (milliseconds). A behavior similar to that of OS based tooltips.|
|key|simple|String|The name of the property this input field represents.  This will auto populate the name, label, and value|

## General Attributes

|Attribute|Theme|Data Types|Description|
|---|---|---|---|
|cssClass|simple|String|define html class attribute|
|cssStyle|simple|String|define html style attribute|
|cssErrorClass|simple|String|error class attribute|
|cssErrorStyle|simple|String|error style attribute|
|title|simple|String|define html title attribute|
|disabled|simple|String|define html disabled attribute|
|label|xhtml|String|define label of form element|
|labelPosition|xhtml|String|define label position of form element (top/left), default to left|
|requiredPosition|xhtml|String|define required label position of form element (left/right), default to right|
|errorPosition|xhtml|String|define error position of form element (top|bottom), default to top|
|name|simple|String|Form Element's field name mapping|
|requiredLabel|xhtml|Boolean|add * to label (true to add false otherwise)|
|tabIndex|simple|String|define html tabindex attribute|
|value|simple|Object|define value of form element|

> Some tag attributes may not be utilized by all, or any, of the templates. For example, the form tag supports
> the tabindex attribute, but none of the themes render the tabindex.

## Value/Name Relationship

In many of the tags (except for the form tag) there is a unique relationship between the `name` and `value` attributes.
The `name` attribute provides the name for the tag, which in turn is used as the control attribute when the form 
is submitted. The value submitted is bound to the `name`. In most cases, the `name` maps to a simple JavaBean property, 
such as "postalCode". On submit, the value would be set to the property by calling the `setPostalCode` mutator.

Likewise, a form control could be populated by calling a JavaBean accessor, like `getPostalCode`. In the expression 
language, we can refer to the JavaBean property by name. An expression like "%{postalCode}" would in turn call `getPostalCode`.

```ftl
<@s.form action="updateAddress">
    <@s.textfield label="Postal Code" name="postalCode" value="%{postalCode}"/>
    ...
</@s.form>
```

However, since the tags imply a relationship between the `name` and `value`, the `value` attribute is optional. 
If a `value` is not specified, by default, the JavaBean accessor is used instead.

```ftl
<@s.form action="updateAddress">
    <@s.textfield label="Postal Code" name="postalCode"/>
    ...
</@s.form>
```

While most attributes are exposed to the underlying templates as the same key as the attribute (`${parameters.label}`), 
the `value` attribute is not. Instead, it can be accessed via the `nameValue` key (`${parameters.nameValue}`).
The `nameValue` key indicates that the value may have been generated from the `name` attribute rather than explicitly
defined in the `value` attribute.

## ID Name Assignment

All form tags automatically assign an ID to the control, but the ID can be overridden if needed.

|Forms|The default ID is the action name. For example, "updateAddress".|
|-----|------------------------------------------------------------------|
|Controls|The default ID is the form's name concatenated with the tag name. For example, "updateAddress_postalCode".|

## Form labelposition propagation

When `labelposition` attribute was defined for `<s:form>` tag it will be propagated to all form elements, but if form 
element defines its own `labelposition` it will take precedence over `<s:form>`'s attribute. Since 2.3.17.

## Required Attribute

The `required` attribute on many UI tags defaults to true only if you have client-side validation enabled,
and a validator is associated with that particular field.

## Tooltip

> **NOTE**: tooltipConfig is deprecated, use individual tooltip configuration attributes instead

Every Form UI component (in `xhtml` / `css_xhtml` or any other which extends them) can have tooltips assigned to them.
The Form component's tooltip related attribute, once defined, will be applied to all form UI components that are created 
under it unless explicitly overridden by having the Form UI component itself defined with their own tooltip attribute.

In Example 1, the textfield will inherit the tooltipDelay and tooltipIconPath attribute from its containing form. 
In other words, although it doesn't define a tooltipIconPath attribute, it will have that attribute inherited from its
containing form.

In Example 2, the  textfield will inherit both the tooltipDelay and tooltipIconPath attribute from its containing form,
but the tooltipDelay attribute is overridden at the textfield itself. Hence, the textfield actually will have its 
tooltipIcon defined as /myImages/myIcon.gif, inherited from its containing form, and tooltipDelay defined as 5000.

Example 3, 4 and 5 show different ways of setting the tooltip configuration attribute.
- Example 3: Set tooltip config through the body of the param tag
- Example 4: Set tooltip config through the value attribute of the param tag
- Example 5: Set tooltip config through the tooltip attributes of the component tag

```jsp
<!-- Example 1: -->
<s:form
         tooltipDelay="500"
         tooltipIconPath="/myImages/myIcon.gif" .... >
  ....
    <s:textfield label="Customer Name" tooltip="Enter the customer name" .... />
  ....
</s:form>

<!-- Example 2: -->
<s:form
         tooltipDelay="500"
         tooltipIconPath="/myImages/myIcon.gif" .... >
  ....
    <s:textfield label="Address"
         tooltip="Enter your address"
         tooltipDelay="5000" />
  ....
</s:form>

<-- Example 3: -->
<s:textfield
       label="Customer Name"
       tooltip="One of our customer Details">
       <s:param name="tooltipDelay">
            500
       </s:param>
       <s:param name="tooltipIconPath">
            /myImages/myIcon.gif
       </s:param>
</s:textfield>

<-- Example 4: -->
<s:textfield
         label="Customer Address"
         tooltip="Enter The Customer Address" >
         <s:param
             name="tooltipDelay"
             value="500" />
</s:textfield>

<-- Example 5: -->
<s:textfield
         label="Customer Telephone Number"
         tooltip="Enter customer Telephone Number"
         tooltipDelay="500"
         tooltipIconPath="/myImages/myIcon.gif" />
```
