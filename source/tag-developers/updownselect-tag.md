---
layout: tag-developers
title: updownselect tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# updownselect

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

> **NOTE**: that the `listkey` and `listvalue` attribute will default to `key` and `value` respectively only when 
> the `list` attribute is evaluated to a Map or its descendant. Everything else will result in `listkey` and `listvalue`
> to be null and not used.

Create a Select component with buttons to move the elements in the select component up and down. When the containing
form is submitted, its elements will be submitted in the order they are arranged (top to bottom).

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/updownselect-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/updownselect-attributes.html %}

## Examples

**Example 1**: simple example

```jsp
<s:updownselect
    list="#{'england':'England', 'america':'America', 'germany':'Germany'}"
    name="prioritisedFavouriteCountries"
    headerKey="-1"
    headerValue="--- Please Order Them Accordingly ---"
    emptyOption="true" />
```
 
**Example 2**: more complex example

```jsp
<s:updownselect
    list="defaultFavouriteCartoonCharacters"
    name="prioritisedFavouriteCartoonCharacters"
    headerKey="-1"
    headerValue="--- Please Order ---"
    emptyOption="true"
    allowMoveUp="true"
    allowMoveDown="true"
    allowSelectAll="true"
    moveUpLabel="Move Up"
    moveDownLabel="Move Down"
    selectAllLabel="Select All" />
```
