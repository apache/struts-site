---
layout: default
title: Tag Developers Guide
parent:
  url: themes-and-templates.html
  title: Themes and Templates
---

# ajax theme

> The ajax theme is deprecated!

The ajax theme extends the [xhtml theme](xhtml-theme.html) with AJAX features. The theme uses the popular DOJO 
AJAX/JavaScript toolkit. AJAX features include:

- [AJAX Client Side Validation](../core-developers/ajax-client-side-validation.html) 
- Remote [form](form-tag.html) submission support (works with the [submit](dojo-submit-tag.html) tag as well)
- An advanced [div](dojo-div-tag.html) template that provides dynamic reloading of partial HTML
- An advanced [a](dojo-a-tag.html) template that provides the ability to load and evaluate JavaScript remotely
- An AJAX-only [tabbedpanel](dojo-tabbedpanel-tag.html) implementation
- A rich pub-sub event model
- Interactive autocomplete tag

> See also: [Ajax tags](ajax-tags.html) 

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

The wrapping technique utilized by the ajax theme is much like [xhtml theme](xhtml-theme.html), but the `controlheader.ftl`
is a wee bit different.

```ftl
<#if parameters.label?if_exists != "">
	<#include "/${parameters.templateDir}/xhtml/controlheader.ftl" />
</#if>
<#if parameters.form?exists && parameters.form.validate?default(false) == true>
	<#-- can't mutate the data model in freemarker -->
    <#if parameters.onblur?exists>
        ${tag.addParameter('onblur', "validate(this);${parameters.onblur}")}
    <#else>
        ${tag.addParameter('onblur', "validate(this);")}
    </#if>
</#if>
```

The header provides for [AJAX Client Side Validation](../core-developers/ajax-client-side-validation.html) by checking 
if the `validate` attribute is set to true. If it is, a validation request is made on each `onblur` event 
for a HTML [Struts Tags](struts-tags.html). Some people don't like the `onblur` behavior; they would rather a more 
advanced timer (say, 200ms) be kicked off after every keystroke. You can override this template and provide that 
type of behavior if you would like.

## Special Interest

Three ajax_xhtml templates of special interest are `head`, `div` , and `a`.

> Especially with the ajax theme, it is important to use the [head](dojo-head-tag.html) tag. 
> (See the [ajax head template](ajax-head-template.html) for more information.) Without it, AJAX support may not be set 
> up properly.

- [ajax head template](ajax-head-template.html) 
- [ajax div template](ajax-div-template.html) 
- [ajax a template](ajax-a-template.html) 

> In addition to these templates, be familiar with the [ajax event system](ajax-event-system.html) provided by 
> the framework and Dojo.
