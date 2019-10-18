---
layout: default
title: Tag Developers Guide
---

# FreeMarker Tags
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

FreeMarker tags are extensions of the generic [Struts Tags](struts-tags) provided by the framework. You can jump 
right in just by knowing the generic structure in which the tags can be accessed: 

```ftl
<@s.tag> ...</@s.tag>
```

, where `tag` is any of the [tags](tags) supported by the framework.

For example, in JSP you might create a form using Struts tags.

**JSP Form**

```jsp
<s:form action="updatePerson">
    <s:textfield label="First name" name="firstName"/>
    <s:submit value="Update"/>
</s:form>
```

In FreeMarker the same form can also be built using Struts tags.

**FTL Form**

```ftl
<@s.form action="updatePerson">
    <@s.textfield label="First name" name="firstName"/>
    <@s.submit value="Update"/>
</@s.form>
```

**But, wait there's more!** 

Aside from doing everything that the JSP tags do, the FTL tags boast additional features that you can use to make your 
pages even easier to code. You can even invoke third-party JSP taglibs as if there were native FTL tags.

## Attributes and Parameters

Unlike older versions of JSP (in which the [JSP Tags](jsp-tags) are based), FreeMarker allows for _dynamic attributes_, 
much like JSP 2.0. You can supply attributes to the tags that the tag doesn't explicitedly support. Those attributes 
that cannot be applied directly to the tag object will be set to the tag's general-purpose `parameters` Map.

Suppose we wanted to build an URL in a JSP. The URL needs to take an arbitary parameter to the query string, 
that (being arbitary) isn't specified on the URL tag. In a JSP, we'd have to use the `url` and `param` tags together.

**Creating a URL with a query string (JSP)**

```jsp
<s:url value="somePage">
    <s:param name="personId" value="%{personId}"/>
</s:url>
```

In FreeMarker, we can pass the arbitrary parameter directly and create the URL in one simple statement.

**Creating a URL with a query string (FTL)**

```ftl
<@s.url value="somePage" personId="%{personId}"/>
```

### Using inline attributes with templates

Suppose you created a "three column" theme to replace the typical two column theme (xhtml). You might want an additional 
parameter to display in the third column called "description". Using FreeMarker, you can just pop the description 
attribute into the textfield tag, no fuss, no muss.

**Passing an attribute to the template**

```ftl
<@s.form action="updatePerson">
    <@s.textfield label="First name" name="firstName" description="..."/>
    <@s.submit value="Update"/>
</@s.form>
```

In the new template, the description is referenced via the parameters Map: `${parameters.description}`.

> For simple cases, inline attributes are much easier to use than the param} tag. But, the `param` tag is more flexible 
> than inline attributes for advanced use cases. For example, `param` can take the entire body of the tag and apply 
> that as the `value` attribute.

## Attribute Types

Remember that all tag attributes must first be set as Strings - they are then later evaluated (using [OGNL](ognl)) 
to a different type, such as List, int, or boolean. This generally works just fine, but it can be limiting when using 
FreeMarker which provides more advanced ways to apply attributes. Suppose the following example:

```ftl
<@s.select label="Foo label - %{foo}" name="%{name}" list="%{1, 2, 3}"/>
```

What will happen here is that each attribute will be evaluated to a String as best it can. This may involve calling the
`toString` method on the internal FreeMarker objects. In this case, all objects will end up being exactly what you would 
expect. Then, when the tag runs, the `list` attribute will be converted from a String to a List using [OGNL](ognl)'s 
advanced collection support.

But suppose you wish to use FreeMarker's list or hash support instead? You can do this:

```ftl
<@s.select label="Foo label - %{foo}" name="%{name}" list=[1, 2, 3]/>
```

Notice that the list attribute no longer has quotes around it. Now it will come in to the tag as an object that can't 
easily be converted to a String. Normally, the tag would just call `toString`, which would return `[1, 2, 3]` and be 
unable to be converted back to a List by OGNL. Rather than go through all this back and forth, the frameworks's FreeMarker 
tag support will recognize collections and not pass them through the normal tag attribute. Instead, the framework will 
set them directly in the `parameters` Map, ready to be consumed by the template.

In the end, everything tends to do what you would expect, but it can help to understand the difference of when OGNL is 
being used and when it isn't, and how attribute types get converted.

## JSP Tag Support

While the framework provides native FreeMarker Tags, you might wish to use other third-party tags that are only available 
for JSP. Fortunately, FreeMarker has the ability to run JSP tags. To do so, you must include the JspSupportServlet in 
the application's `web.xml`, as this allows the FreeMarker integration to get access to the required objects needed 
to emulate a JSP taglib container.

**Adding JspSupportSerlvet to web.xml**

```xml
<servlet>
    <servlet-name>JspSupportServlet</servlet-name>
    <servlet-class>org.apache.struts2.views.JspSupportServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
</servlet>
```

Once you've done that, you can simply add something like this in your templates:

```ftl
<#assign cewolf=JspTaglibs["/WEB-INF/cewolf.tld"] />
...
<@cewold.xxx ... />
```
