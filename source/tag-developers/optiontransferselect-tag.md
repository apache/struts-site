---
layout: default
title: optiontransferselect tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# optiontransferselect

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

> **NOTE**: that the `doublelistkey` and `doublelistvalue` attribute will default to `key` and `value` respectively 
> only when the `doublelist` attribute is evaluated to a Map or its descendant. Other thing else, will result 
> in `doublelistkey` and `doublelistvalue` to be null and not used.

## Description

Create a option transfer select component which is basically two `<select ...>` tag with buttons in the middle of them 
allowing options in each of the `<select ...>` to be moved between themselves. Will auto-select all its elements upon 
its containing form submission.

> **NOTE**: The `id` and `doubleId` need not be supplied as they will generated provided that the `optiontransferselect` 
> tag is being used in a form tag. The generated `id` and `doubleId` will be `<form_id>_<optiontransferselect_name>` 
> and `<form_id>_<optiontransferselect_doubleName>` respectively.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/optiontransferselect-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/optiontransferselect-attributes.html %}

## Dynamic attributes

The tag supports dynamic attributes but if you want to add the attributes to the right control which is generated
by the tag use the `right-` prefix as below:

```jsp
<s:ioptiontransferselect ... right-control-id="id2"/>
```

The prefix will be stripped while generating the second control.

## Examples

**Minimum example**

```jsp
<s:optiontransferselect
     label="Favourite Cartoons Characters"
     name="leftSideCartoonCharacters"
     list="{'Popeye', 'He-Man', 'Spiderman'}"
     doubleName="rightSideCartoonCharacters"
     doubleList="{'Superman', 'Mickey Mouse', 'Donald Duck'}"
 />
```

**Possible example**

```jsp
<s:optiontransferselect
    label="Favourite Cartoons Characters"
    name="leftSideCartoonCharacters"
    leftTitle="Left Title"
    rightTitle="Right Title"
    list="{'Popeye', 'He-Man', 'Spiderman'}"
    multiple="true"
    headerKey="headerKey"
    headerValue="--- Please Select ---"
    emptyOption="true"
    doubleList="{'Superman', 'Mickey Mouse', 'Donald Duck'}"
    doubleName="rightSideCartoonCharacters"
    doubleHeaderKey="doubleHeaderKey"
    doubleHeaderValue="--- Please Select ---"
    doubleEmptyOption="true"
    doubleMultiple="true"
/>
```
