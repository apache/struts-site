---
layout: default
title: Static Content
parent:
  title: Core Developers
  url: index
---

# Static Content
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Struts can serve a static content like CSS and JavaScript files using a predefined path. By default, these resources
are served using `/static` path defined using a constant `struts.ui.staticContentPath` - see below for more details.

Please remember to include this path in your filter mapping if you use a custom mapping, see [web.xml](web-xml.md) example config. 

## Disabling static content

You can disable this feature by setting the following constant to `false`. Once disabled you must provided the required
CSS & JavaScript files on your own, which can be a good thing when you want to use a CDN.

```xml
<constant name="struts.serve.static" value="false"/>
```

> If you disable this feature, but you use the `xhtml`, or `css_xhtml` theme, make sure the JavasScript and CSS files
> shipped inside the core jar are extracted to your web application directory or served in some other way.

## Custom Static Content Loaders

Static content is served by an implementation of `org.apache.struts2.dispatcher.StaticContentLoader`. To write your own
`StaticContentLoader`, implement `StaticContentLoader` and define a bean for the class:

```xml
<bean type="org.apache.struts2.dispatcher.StaticContentLoader" class="MyStaticContentLoader" name="myLoader"/>
<constant name="struts.staticContentLoader" value="myLoader"/>
```

## Default Content Loader

The Apache Struts provides a default implementation of `StaticContentLoader` which
is `org.apache.struts2.dispatcher.DefaultStaticContentLoader`. This loader will handle urls that start with "/static/"
by default.

This content loader can serve static content from the classpath, so when writing a plugin, you can put a file inside
your plugin's jar like "/static/image/banner.jpg" and it will be served when the url "/static/image/banner.jpg" is
requested.

> This loader is not optimized to handle static content, and to improve performance, it is recommended that you extract
> your static content to the web application directory, and let the container handle them.

## Default path

If needed you can change the default path at which static content is served. Just define a new `constant` in your
`struts.xml` with a path as below:

```xml
<constant name="struts.ui.staticContentPath" value="/my-static-content"/>
```

This value is also used by the Default Content Loader.

## Preventing Struts from handling a request

If there is a request that Struts is handling as an action, and you wish to make Struts ignore it,
you can do so by specifying a comma separated list of regular expressions like:

```xml
<constant name="struts.action.excludePattern" value="/some/content/.*,/other/content/.*"/>
```

These regular expression will be evaluated against the request's URI (`HttpServletRequest.getRequestURI()`), and if any
of them matches, then Struts will not handle the request.

To evaluate each pattern the `Pattern` class from JDK will be used, you can find more about what kind of pattern you can
use in the [Pattern class JavaDoc](http://docs.oracle.com/javase/1.5.0/docs/api/java/util/regex/Pattern).

Since Struts 6.1.0 you can use a custom separator. By default, the provided patterns are split using comma `,`,
but it can happen that you want to use comma in your patterns as well, e.g.: `/static/[a-z]{1,10}.json`. In such case
you can define a custom separator to be used to split the patterns, use `struts.action.excludePattern.separator`
constant:

```xml
<constant name="struts.action.excludePattern.separator" value="//"/>
<constant name="struts.action.excludePattern" value="/some/[a-zA-Z]{1,10}.json///other/content/.*"/>
```
