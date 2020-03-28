---
layout: default
title: label tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# label

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Renders an HTML LABEL that will allow you to output label:name combination that has the same format treatment 
as the rest of your UI controls.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/label-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/label-attributes.html %}

## Examples

```jsp
<s:label key="userName" />
```

In this example, a label is rendered. The label is retrieved from a ResourceBundle via the key attribute giving 
you an output of 'User Name: Ford.Prefect'. Assuming that i18n message userName corresponds to _User Name_ 
and the action's `getUserName()` method returns _Ford.Prefect_.
