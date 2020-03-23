---
layout: tag-developers
title: combobox tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# combobox

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

The combo box is basically an HTML INPUT of type text and HTML SELECT grouped together to give you a combo box
functionality. You can place text in the INPUT control by using the SELECT control or type it in directly in
the text field.

In this example, the SELECT will be populated from id=year attribute. Counter is itself an Iterator. It will
span from first to last. The population is done via javascript, and requires that this tag be surrounded by a

Note that unlike the `<s:select/>` tag, there is no ability to define the individual `<option>` tags' id attribute
or content separately. Each of these is simply populated from the toString() method of the list item. Presumably
this is because the select box isn't intended to actually submit useful data, but to assist the user in filling
out the text field.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/combobox-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/combobox-attributes.html %}

## Examples

### JSP:

```jsp
<-- Example One -->
<s:bean name="struts.util.Counter" var="year">
  <s:param name="first" value="text('firstBirthYear')"/>
  <s:param name="last" value="2000"/>

  <s:combobox label="Birth year" size="6" maxlength="4" name="birthYear" list="#year"/>
</s:bean>

<-- Example Two -->
<s:combobox
    label="My Favourite Fruit"
    name="myFavouriteFruit"
    list="{'apple','banana','grape','pear'}"
    headerKey="-1"
    headerValue="--- Please Select ---"
    emptyOption="true"
    value="banana" />

<-- Example Two -->
<s:combobox
   label="My Favourite Color"
   name="myFavouriteColor"
   list="#{'red':'red','green':'green','blue':'blue'}"
   headerKey="-1"
   headerValue="--- Please Select ---"
   emptyOption="true"
   value="green" />
```
 
### Velocity:

```
#tag( ComboBox "label=Birth year" "size=6" "maxlength=4" "name=birthYear" "list=#year" )
```
