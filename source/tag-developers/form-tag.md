---
layout: default
title: form tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# form

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/form-description.html %}

The remote form allows the form to be submitted without the page being refreshed. The results from the form can be 
inserted into any HTML element on the page.

> NOTE: The order / logic in determining the posting url of the generated HTML form is as follows:

1. If the action attribute is not specified, then the current request will be used to determine the posting url
2. If the action is given, Struts will try to obtain an ActionConfig. This will be successful if the action attribute 
  is a valid action alias defined struts.xml.
3. If the action is given and is not an action alias defined in struts.xml, Struts will used the action attribute 
  as if it is the posting url, separting the namespace from it and using UrlHelper to generate the final url.

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/form-attributes.html %}

## Examples

```jsp
 <s:form ... />
```

## Validation

There are two flavours [Client Side Validation](../core-developers/client-side-validation), depending on the theme you 
are using (xhtml, ajax, etc). If you are using the [xhtml theme](xhtml-theme) or [css_xhtml theme](css-xhtml-theme), 
pure client side validation will be used. Read the [Client Side Validation](../core-developers/client-side-validation)
docs for more information.
