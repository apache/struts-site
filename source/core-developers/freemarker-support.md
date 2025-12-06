---
layout: default
title: Freemarker Support
parent:
  title: Freemarker Result
  url: freemarker-result
---

# Freemarker Support
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Freemarker views can be rendered using a result type `freemarker`.

## Configure your action to use the freemarker result type

The `freemarker` result type is defined in `struts-default.xml`, so normally you just include it, and define your 
results to use `type="freemarker"`.

```xml
<include file="struts-default.xml"/>
...
<action name="test" class="package.Test">
  <result name="success" type="freemarker">/WEB-INF/views/testView.ftl</result>
</action>
...

```

## Property Resolution

Your action properties are automatically resolved - just like in a velocity view.

**for example**

`${name}` will result in `stack.findValue("name")`, which _generally_  results in `action.getName()` being executed.

A search process is used to resolve the variable, searching the following scopes in order, until a value is found:

- freemarker variables
- value stack
- request attributes
- session attributes
- servlet context attributes

## Objects in the Context

The following variables exist in the FreeMarker views:

- `req` - the current `HttpServletRequest`
- `res` - the current `HttpServletResponse`
- `stack` - the current `OgnlValueStack`
- `ognl` - the `OgnlTool` instance
  - This class contains useful methods to execute OGNL expressions against arbitrary objects, and a method to generate a select list using 
    the `<s:select/>` pattern. (i.e. taking the name of the list property, a listKey and listValue)
- `struts` - an instance of `StrutsBeanWrapper`
- `action` - the current Struts action
- `exception` - _optional_  the Exception instance, if the view is a JSP exception or Servlet exception view

## FreeMarker configuration with recent releases

To configure the freemarker engine that Struts uses, just add a file `freemarker.properties` to the classpath.
The supported properties are those that the Freemarker Configuration object expects - see the [Freemarker documentation](https://freemarker.apache.org/docs/api/freemarker/template/Configuration.html#setSetting-java.lang.String-java.lang.String-)
for these.

```
default_encoding=ISO-8859-1
template_update_delay=5
locale=no_NO
```

## FreeMarker Whitespace Stripping

**Available since Struts 7.2.0**

Struts supports automatic whitespace stripping during FreeMarker template compilation. When enabled, this feature
removes indentation and trailing whitespace from lines containing only FTL directives, significantly reducing the size
of generated HTML output.

This feature is controlled by the `struts.freemarker.whitespaceStripping` constant:

```xml
<constant name="struts.freemarker.whitespaceStripping" value="true" />
```

**Default behavior:**

- **Enabled by default** (`true`)
- **Automatically disabled** when `struts.devMode` is enabled to make debugging easier
- Works transparently with existing templates

**Benefits:**

- Reduces HTML output size by removing template indentation
- Improves page load times and reduces bandwidth usage
- No changes needed to existing FreeMarker templates
- Automatically disabled in development mode for easier debugging

**See also:**

- [Performance Tuning - FreeMarker Whitespace Stripping](performance-tuning#enable-freemarker-whitespace-stripping)
- [Compress Tag](../tag-developers/compress-tag) for runtime HTML compression

## Using struts UI tags - or any JSP Tag Library

Freemarker has builtin support for using any JSP taglib. You can use JSP taglibs in FreeMarker even if

- your servlet container has no support for JSP, or
- you didn't specify the taglib in your web.xml - note how in the example below we refer to the taglib by its
  webapp-absolute URL, so no configuration in web.xml is needed.

```ftl
<#assign s=JspTaglibs["/WEB-INF/struts.tld"] />

<@s.form method="'post'" name="'inputform'" action="'save.action'" >
    <@s.hidden name="'id'" />
    <@s.textarea label="'Details'" name="'details'" rows=5 cols=40 />
    <@s.submit value="'Save'" align="center" />
</@s.form>

```

*NOTE*: numeric properties for tags MUST be numbers, not strings. as in the rows and cols properties above. If you use
`cols="40"` you will receive an exception. Other than that, the freemarker tag container behaves as you would expect.

## Dynamic attributes support

You can specify dynamic attributes with Struts 2 tags like this:

```ftl
<@s.textfield name="test" dynamicAttributes={"placeholder":"input","foo":"bar"}/>
```

or like this:

```ftl
<@s.textfield name="test" placeholder="input" foo="bar"/>
```

and for both case, it will be parsed into:

```html
<input type="text" name="test" value="" id="test" placeholder="input" foo="bar"/>

```

You can also use OGNL expressions with dynamic tags like below:

```ftl
<@s.textfield name="test" placeholder="input" foo="checked: %{bar}"/>
```

When using attributes with hyphens, use the below syntax (you can also leave the single quotes from false if you want)

```ftl
<@s.form dynamicAttributes={'data-ajax':'false'}>
  ...
</@s.form>
```
