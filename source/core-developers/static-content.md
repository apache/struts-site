---
layout: core-developers
title: Static Content
---

# Static Content
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Struts can serve static content like css and javascript files. This feature is enabled by default, but can be disabled 
by setting:

```xml
<constant name="struts.serve.static" value="false" />
```

> If you disable this feature, but use the `xhtml`, or `css_xhtml` theme, make sure that the javascript and css files 
> shipped inside the core jar are extracted to your web application directory.

## Custom Static Content Loaders

Static content is served by an implementation of `org.apache.struts2.dispatcher.StaticContentLoader`. To write your own
`StaticContentLoader`, implement `StaticContentLoader` and define a bean for the class:

```xml
<bean type="org.apache.struts2.dispatcher.StaticContentLoader" class="MyStaticContentLoader" name="myLoader" />
<constant name="struts.staticContentLoader" value="myLoader" />
```

## Default Content Loader

Struts provides a default implementation of `StaticContentLoader` which is `org.apache.struts2.dispatcher.DefaultStaticContentLoader`. 
This loader will handle urls that start with "/static/" by default. 

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

## Preventing Struts from Handling a Request

If there is a request that Struts is handling as an action, and you wish to make Struts ignore it, you can do so by specifying 
a comma separated list of regular expressions like:

```xml
<constant name="struts.action.excludePattern" value="/some/content/.*?" />
```

These regular expression will be evaluated against the request's URI (`HttpServletRequest.getRequestURI()`), and if any 
of them matches, then Struts will not handle the request.

To evaluate each pattern Pattern class from JDK will be used, you can find more about what kind of pattern you can use 
in the [Pattern class JavaDoc](http://docs.oracle.com/javase/1.5.0/docs/api/java/util/regex/Pattern).
