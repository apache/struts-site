---
layout: default
title: Tag Developers Guide
parent:
  url: themes-and-templates.html
  title: Themes and Templates
---

# ajax theme

> NOTE: Ajax template (Dojo plugin) is deprecated and won't be supported any longer.

The ajax theme extends the [xhtml theme](xhtml-theme) with AJAX features. The theme uses the popular DOJO 
AJAX/JavaScript toolkit. AJAX features include:

- [AJAX Client Side Validation](../core-developers/ajax-client-side-validation) 
- Remote [form](form-tag) submission support (works with the [submit](dojo-submit-tag) tag as well)
- An advanced [div](dojo-div-tag) template that provides dynamic reloading of partial HTML
- An advanced [a](dojo-a-tag) template that provides the ability to load and evaluate JavaScript remotely
- An AJAX-only [tabbedpanel](dojo-tabbedpanel-tag) implementation
- A rich pub-sub event model
- Interactive autocomplete tag

> See also: [Ajax tags](ajax-tags) 

## Browser Compatibility

AJAX (as a technology) uses a browser-side scripting component that varies between browsers (and sometimes versions). 
To hide those differences from the developer, we utilize the dojo toolkit ([http://www.dojotoolkit.org](http://www.dojotoolkit.org)). 
Several browsers are supported by dojo, and any UI's created with the ajax theme should act the same way for supported 
browsers. The supported browsers are:

- IE 5.5\+
- FF 1.0\+
- Latest Safari (on up-to-date OS versions)
- Latest Opera
- Latest Konqueror

## Extending the AJAX Theme

The wrapping technique utilized by the ajax theme is much like [xhtml theme](xhtml-theme), but the `controlheader.ftl`
is a wee bit different.

```ftl
<#if attributes.label?if_exists != "">
	<#include "/${attributes.templateDir}/xhtml/controlheader.ftl" />
</#if>
<#if attributes.form?exists && attributes.form.validate?default(false) == true>
	<#-- can't mutate the data model in freemarker -->
    <#if attributes.onblur?exists>
        ${tag.addParameter('onblur', "validate(this);${attributes.onblur}")}
    <#else>
        ${tag.addParameter('onblur', "validate(this);")}
    </#if>
</#if>
```

The header provides for [AJAX Client Side Validation](../core-developers/ajax-client-side-validation) by checking 
if the `validate` attribute is set to true. If it is, a validation request is made on each `onblur` event 
for a HTML [Struts Tags](struts-tags). Some people don't like the `onblur` behavior; they would rather a more 
advanced timer (say, 200ms) be kicked off after every keystroke. You can override this template and provide that 
type of behavior if you would like.

## Special Interest

Three ajax_xhtml templates of special interest are `head`, `div` , and `a`.

> Especially with the ajax theme, it is important to use the [head](dojo-head-tag) tag. 
> (See the [ajax head template](ajax-head-template) for more information.) Without it, AJAX support may not be set 
> up properly.

- [ajax head template](ajax-head-template) 
- [ajax div template](ajax-div-template) 
- [ajax a template](ajax-a-template) 

> In addition to these templates, be familiar with the [ajax event system](ajax-event-system) provided by 
> the framework and Dojo.
