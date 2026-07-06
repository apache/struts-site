---
layout: default
title: webjar tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# webjar

{:.alert .alert-info}
Available since Struts 7.3.0.

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Resolves a version-less [WebJar](https://www.webjars.org/) resource path to a servable URL and writes it to the output
(or stores it in a variable when `var` is set). For example, `bootstrap/css/bootstrap.min.css` is resolved to
`<ctx>/static/webjars/bootstrap/5.3.8/css/bootstrap.min.css`, so you never hardcode the WebJar version in your templates.

The tag emits a plain URL string, so it composes with [script](script-tag), [link](link-tag), or a raw `<link>` /
`<script>` element. See [Static Content](../core-developers/static-content#webjars-support) for the serving pipeline and
configuration constants.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/webjar-description.html %}

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/main/core/src/site/resources/tags/webjar-attributes.html %}

## Examples

**Example 1** - reference a WebJar stylesheet:

```jsp
<link rel="stylesheet" href="<s:webjar path="bootstrap/css/bootstrap.min.css"/>"/>
```

**Example 2** - reference a WebJar script:

```jsp
<s:webjar var="webjarUrl" path="jquery/jquery.min.js"/>
<s:script src="%{webjarUrl}"/>
```

**Example 3** - FreeMarker macro:

```html
<@s.webjar path="jquery/jquery.min.js"/>
```
