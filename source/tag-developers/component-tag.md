---
layout: default
title: component tag
parent:
  title: Tag Reference
  url: tag-reference.html
---

# component

Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Description

Renders an custom UI widget using the specified templates. Additional objects can be passed in to the template
using the [param](param-tag) tags.

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/component-description.html %}

### Freemarker:

Objects provided can be retrieve from within the template via `$parameters._paramname_`.

### JSP:

Objects provided can be retrieve from within the template via `<s:property value="%{parameters._paramname_}" />`

In the bottom JSP and Velocity samples, two parameters are being passed in to the component. From within the
component, they can be accessed as:

### Freemarker:
 
`$parameters.get('key1')` and `$parameters.get('key2')` or `$parameters.key1` and `$parameters.key2`

### JSP:

`<s:property value="%{parameters.key1}" />` and `<s:property value="%{'parameters.key2'}" />` or
`<s:property value="%{parameters.get('key1')}" />` and `<s:property value="%{parameters.get('key2')}" />`

Currently, your custom UI components can be written in Velocity, JSP, or Freemarker, and the correct rendering
engine will be found based on file extension.

**Remember:** the value `params` will always be resolved against the ValueStack so if you mean to pass a string literal 
to your component, make sure to wrap it in single quotes i.e. `value="'value1'"` (note the opening `"'` and closing `'"` 
otherwise, the value stack will search for an Object on the stack with a method of `getValue1()`.

If JSP is used as the template, the JSP template itself must lie within the webapp itself and not the classpath. 
Unlike Freemarker or Velocity, JSP template could not be picked up from the classpath.

**(!) templateDir and theme attribute**

> The final path to the template will be built using the _templateDir_  and _template_  attributes, like 
> \${templateDir}/\${theme}/\${template}. If for example your component is under _/components/html/option.jsp_, 
> you would have to set templateDir="components", theme="html" and template="options.jsp". 

> For any Struts tag that you use in your component, make sure that you set its templateDir="template"

## Attributes

{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/site/resources/tags/component-attributes.html %}

## Examples

### JSP

```jsp
<s:component template="/my/custom/component.vm"/>
```

or

```jsp
<s:component template="/my/custom/component.vm">
    <s:param name="key1" value="value1"/>
    <s:param name="key2" value="value2"/>
</s:component>
```

### Velocity

```
#s-component( "template=/my/custom/component.vm" )
```

or

```
#s-component( "template=/my/custom/component.vm" )
    #s-param( "name=key1" "value=value1" )
    #s-param( "name=key2" "value=value2" )
#end
```

### Freemarker

```
<@s..component template="/my/custom/component.ftl" />
```

or

```
<@s.component template="/my/custom/component.ftl">
    <@s.param name="key1" value="%{'value1'}" />
    <@s.param name="key2" value="%{'value2'}" />
</@s.component>
```
