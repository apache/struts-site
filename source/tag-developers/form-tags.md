---
layout: default
title: Tag Developers Guide
---

# Form Tags

Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

| 

Within the form tags, there are two classes of tags: the form tag itself, and all other tags, which make up the individual form elements. The behavior of the form tag is different than the elements enclosed within it.

__Form Tag Themes__

As explained in [Themes and Templates](themes-and-templates.html), the HTML Tags (which includes Form Tags) are all driven by templates. Templates are grouped together to create themes. The framework bundles three themes in the distribution.

|simple|Sometimes _too_  simple|
|------|-----------------------|
|xhtml|Extends simple|(default)|
|ajax|Extends xhtml|

The predefined themes can be used "as is" or customized.



| The xhtml theme renders out a two-column table. If a different layout is needed, do _not_  write your own HTML. Create a new theme or utilize the simple theme.

| 

__Simple theme caveats__

The downside of using the simple theme is that it doesn't support as many of the attributes that the other themes do. For example, the `label` attribute does nothing in the simple theme, and the automatic display of error messages is not supported.

__Common Attributes__

All the form tags extend the UIBean class. This base class provides a set of common attributes, that can be grouped in to three categories: `templated-related`, javascript-related, and general attributes. The individual attributes are documented on each tag's reference page.

In addition to the common attributes, a special attribute exists for all form element tags: `form` (\${parameters.form}). The `form` property represents the attributes used to render the form tag, such as the form's id. In a template, the form's ID can be found by calling \${parameters.form.id}.

__Template-Related Attributes__



{% comment %}start snippet id=templateRelatedAttributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}
<p>
 <table border="1" summary="">
    <thead>
       <tr>
          <td>Attribute</td>
          <td>Theme</td>
          <td>Data Types</td>
          <td>Description</td>
       </tr>
    </thead>
    <tbody>
       <tr>
          <td>templateDir</td>
          <td>n/a</td>
          <td>String</td>
          <td>define the template directory</td>
       </tr>
       <tr>
          <td>theme</td>
          <td>n/a</td>
          <td>String</td>
          <td>define the theme name</td>
       </tr>
       <tr>
          <td>template</td>
          <td>n/a</td>
          <td>String</td>
          <td>define the template name</td>
       </tr>
       <tr>
          <td>themeExpansionToken</td>
          <td>n/a</td>
          <td>String</td>
          <td>special token (defined with struts.ui.theme.expansion.token) used to search for template in parent theme
          (don't use it separately!)</td>
       </tr>
       <tr>
          <td>expandTheme</td>
          <td>n/a</td>
          <td>String</td>
          <td>concatenation of themeExpansionToken and theme which tells internal template loader mechanism
          to try load template from current theme and then from parent theme (and parent theme, and so on)
          when used with <#include/> directive</td>
       </tr>
    </tbody>
 </table>

</p>
{% comment %}end snippet id=templateRelatedAttributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}

__Javascript-Related Attributes__



{% comment %}start snippet id=javascriptRelatedAttributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}
<p>
 <table border="1" summary="">
    <thead>
       <tr>
          <td>Attribute</td>
          <td>Theme</td>
          <td>Data Types</td>
          <td>Description</td>
       </tr>
    </thead>
    <tbody>
       <tr>
          <td>onclick</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onclick attribute</td>
       </tr>
       <tr>
          <td>ondblclick</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript ondbclick attribute</td>
       </tr>
       <tr>
          <td>onmousedown</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onmousedown attribute</td>
       </tr>
       <tr>
          <td>onmouseup</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onmouseup attribute</td>
       </tr>
       <tr>
          <td>onmouseover</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onmouseover attribute</td>
       </tr>
       <tr>
          <td>onmouseout</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onmouseout attribute</td>
       </tr>
       <tr>
          <td>onfocus</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onfocus attribute</td>
       </tr>
       <tr>
          <td>onblur</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onblur attribute</td>
       </tr>
       <tr>
          <td>onkeypress</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onkeypress attribute</td>
       </tr>
       <tr>
          <td>onkeyup</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onkeyup attribute</td>
       </tr>
       <tr>
          <td>onkeydown</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onkeydown attribute</td>
       </tr>
       <tr>
          <td>onselect</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onselect attribute</td>
       </tr>
       <tr>
          <td>onchange</td>
          <td>simple</td>
          <td>String</td>
          <td>html javascript onchange attribute</td>
       </tr>
    </tbody>
 </table>

</p>
{% comment %}end snippet id=javascriptRelatedAttributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}

__Tooltip Related Attributes__



{% comment %}start snippet id=tooltipattributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}
<p>
 <table border="1" summary="">
  <tr>
     <td>Attribute</td>
     <td>Data Type</td>
     <td>Default</td>
     <td>Description</td>
  </tr>
  <tr>
      <td>tooltip</td>
      <td>String</td>
      <td>none</td>
      <td>Set the tooltip of this particular component</td>
  </tr>
  <tr>
      <td>jsTooltipEnabled</td>
      <td>String</td>
      <td>false</td>
      <td>Enable js tooltip rendering</td>
  </tr>
    <tr>
      <td>tooltipIcon</td>
      <td>String</td>
      <td>/struts/static/tooltip/tooltip.gif</td>
      <td>The url to the tooltip icon</td>
   <tr>
      <td>tooltipDelay</td>
      <td>String</td>
      <td>500</td>
      <td>Tooltip shows up after the specified timeout (miliseconds). A behavior similar to that of OS based tooltips.</td>
   </tr>
   <tr>
      <td>key</td>
      <td>simple</td>
      <td>String</td>
      <td>The name of the property this input field represents.  This will auto populate the name, label, and value</td>
   </tr>
 </table>

</p>
{% comment %}end snippet id=tooltipattributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}

__General Attributes__



{% comment %}start snippet id=generalAttributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}
<p>
 <table border="1" summary="">
    <thead>
       <tr>
          <td>Attribute</td>
          <td>Theme</td>
          <td>Data Types</td>
          <td>Description</td>
       </tr>
    </thead>
    <tbody>
       <tr>
          <td>cssClass</td>
          <td>simple</td>
          <td>String</td>
          <td>define html class attribute</td>
       </tr>
       <tr>
          <td>cssStyle</td>
          <td>simple</td>
          <td>String</td>
          <td>define html style attribute</td>
       </tr>
       <tr>
          <td>cssErrorClass</td>
          <td>simple</td>
          <td>String</td>
          <td>error class attribute</td>
       </tr>
       <tr>
          <td>cssErrorStyle</td>
          <td>simple</td>
          <td>String</td>
          <td>error style attribute</td>
       </tr>
       <tr>
          <td>title</td>
          <td>simple</td>
          <td>String</td>
          <td>define html title attribute</td>
       </tr>
       <tr>
          <td>disabled</td>
          <td>simple</td>
          <td>String</td>
          <td>define html disabled attribute</td>
       </tr>
       <tr>
          <td>label</td>
          <td>xhtml</td>
          <td>String</td>
          <td>define label of form element</td>
       </tr>
       <tr>
          <td>labelPosition</td>
          <td>xhtml</td>
          <td>String</td>
          <td>define label position of form element (top/left), default to left</td>
       </tr>
       <tr>
          <td>requiredPosition</td>
          <td>xhtml</td>
          <td>String</td>
          <td>define required label position of form element (left/right), default to right</td>
       </tr>
       <tr>
          <td>errorPosition</td>
          <td>xhtml</td>
          <td>String</td>
          <td>define error position of form element (top|bottom), default to top</td>
       </tr>
       <tr>
          <td>name</td>
          <td>simple</td>
          <td>String</td>
          <td>Form Element's field name mapping</td>
       </tr>
       <tr>
          <td>requiredLabel</td>
          <td>xhtml</td>
          <td>Boolean</td>
          <td>add * to label (true to add false otherwise)</td>
       </tr>
       <tr>
          <td>tabIndex</td>
          <td>simple</td>
          <td>String</td>
          <td>define html tabindex attribute</td>
       </tr>
       <tr>
          <td>value</td>
          <td>simple</td>
          <td>Object</td>
          <td>define value of form element</td>
       </tr>
    </tbody>
 </table>

</p>
{% comment %}end snippet id=generalAttributes|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}



| Some tag attributes may not be utilized by all, or any, of the templates. For example, the form tag supports the tabindex attribute, but none of the themes render the tabindex.

| 

__Value/Name Relationship__

In many of the tags (except for the form tag) there is a unique relationship between the `name` and `value` attributes. The `name` attribute provides the name for the tag, which in turn is used as the control attribute when the form is submitted. The value submitted is bound to the `name`. In most cases, the `name` maps to a simple JavaBean property, such as "postalCode". On a submit, the value would be set to the property by calling the `setPostalCode` mutator.

Likewise, a form control could be populated by calling a JavaBean accessor, like `getPostalCode`. In the expression language, we can refer to the JavaBean property by name. An expression like "%{postalCode}" would in turn call `getPostalCode`.


```ftl
<@s.form action="updateAddress">
    <@s.textfield label="Postal Code" name="postalCode" value="%{postalCode}"/>
    ...
</@s.form>

```

However, since the tags imply a relationship between the `name` and `value`, the `value` attribute is optional. If a `value` is not specified, by default, the JavaBean accessor is used instead.


```ftl
<@s.form action="updateAddress">
    <@s.textfield label="Postal Code" name="postalCode"/>
    ...
</@s.form>

```

While most attributes are exposed to the underlying templates as the same key as the attribute (\${parameters.label}), the `value` attribute is not. Instead, it can be accessed via the `nameValue` key (\${parameters.nameValue}). The `nameValue` key indicates that the value may have been generated from the `name` attribute rather than explicitly defined in the `value` attribute.

__ID Name Assignment__

All form tags automatically assign an ID to the control, but the ID can be overridden if needed.

|Forms|The default ID is the action name. For example, "updateAddress".|
|-----|------------------------------------------------------------------|
|Controls|The default ID is the form's name concatenated with the tag name. For example, "updateAddress_postalCode".|

__Form labelposition propagation__

When `labelposition` attribute was defined for `<s:form>` tag it will be propagated to all form elements, but if form element defines its own `labelposition` it will take precedence over `<s:form>`'s attribute. Since 2.3.17.

__Required Attribute__

The `required` attribute on many UI tags defaults to true only if you have client-side validation enabled, and a validator is associated with that particular field.

__Tooltip__



{% comment %}start snippet id=tooltipdescription|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}
<p> <p>
 <b>tooltipConfig is deprecated, use individual tooltip configuration attributes instead </b>
 </p>

 <p>
 Every Form UI component (in xhtml / css_xhtml or any other that extends them) can
 have tooltips assigned to them. The Form component's tooltip related attribute, once
 defined, will be applied to all form UI components that are created under it unless
 explicitly overridden by having the Form UI component itself defined with their own tooltip attribute.
 </p>

 <p>
 In Example 1, the textfield will inherit the tooltipDelay and tooltipIconPath attribute from
 its containing form. In other words, although it doesn't define a tooltipIconPath
 attribute, it will have that attribute inherited from its containing form.
 </p>

 <p>
 In Example 2, the  textfield will inherit both the tooltipDelay and
 tooltipIconPath attribute from its containing form, but the tooltipDelay
 attribute is overridden at the textfield itself. Hence, the textfield actually will
 have its tooltipIcon defined as /myImages/myIcon.gif, inherited from its containing form, and
 tooltipDelay defined as 5000.
 </p>

 <p>
 Example 3, 4 and 5 show different ways of setting the tooltip configuration attribute.<br>
 <b>Example 3:</b> Set tooltip config through the body of the param tag<br>
 <b>Example 4:</b> Set tooltip config through the value attribute of the param tag<br>
 <b>Example 5:</b> Set tooltip config through the tooltip attributes of the component tag<br>
 </p>

</p>
{% comment %}end snippet id=tooltipdescription|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}


{% comment %}start snippet id=tooltipexample|lang=xml|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}

```xml

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

{% comment %}end snippet id=tooltipexample|lang=xml|javadoc=true|url=org.apache.struts2.components.UIBean {% endcomment %}
