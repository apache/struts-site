---
layout: core-developers
title: FreeMarker Result
---

# FreeMarker Result

Renders a view using the Freemarker template engine. The `FreemarkarManager` class configures the template loaders so that the template location can be either

- relative to the web root folder, e.g.: `/WEB-INF/views/home.ftl`

- a classpath resource, e.g.: `/com/company/web/views/home.ftl`


Also see [Freemarker Support](freemarker-support.html).

#### Parameters

- `location` (default) - the location of the template to process.

- `parse`- true by default. If set to false, the location param will not be parsed for expressions.

- `contentType` - defaults to `text/html` unless specified.

- `writeIfCompleted` - `false` by default, write to stream only if there isn't any error processing the template. Setting `template_exception_handler=rethrow` in `freemarker.properties` will have the same effect.

#### Examples

```
<result name="success" type="freemarker">foo.ftl</result>
```
