---
layout: default
title: inputtransferselect tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# inputtransferselect

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Create a input transfer select component which is basically an text input and `<select ...>` tag with buttons 
in the middle of them allowing text to be added to the transfer select. Will auto-select all its elements upon its
containing form submission.

> **NOTE**: The id and doubleId need not be supplied as they will generated provided that the inputtransferselect 
> tag is being used in a form tag. The generated id and doubleId will be `<form_id>_<inputtransferselect_doubleName>` 
> and `<form_id>_<inputtransferselect_doubleName>` respectively.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/inputtransferselect-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/inputtransferselect-attributes.html %}

## Dynamic attributes

The tag supports dynamic attributes but if you want to add the attributes to the input control which is generated
by the tag use the `input-` prefix as below:

```jsp
<s:inputtransferselect ... input-control-id="id2"/>
```

The prefix will be stripped while generating the second control.

## Example

```jsp
<s:inputtransferselect
     label="Favourite Cartoons Characters"
     name="cartoons"
     list="{'Popeye', 'He-Man', 'Spiderman'}"
 />
```
