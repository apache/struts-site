---
layout: core-developers
title: Freemarker Support
---

# Freemarker Support

Freemarker views can be rendered using the webwork result type 

~~~~~~~
freemarker
~~~~~~~
\.

__Configure your action to use the freemarker result type__

The 

~~~~~~~
freemarker
~~~~~~~
 result type is defined in 

~~~~~~~
struts-default.xml
~~~~~~~
, so normally you just include it, and define your resuts to use 

~~~~~~~
type="freemarker"
~~~~~~~
\.


~~~~~~~
<include file="struts-default.xml"/>
...
<action name="test" class="package.Test">
  <result name="success" type="freemarker">/WEB-INF/views/testView.ftl</result>
</action>
...

~~~~~~~

__Property Resoloution__

Your action properties are automatically resolved \- just like in a velocity view\.

**for example**

~~~~~~~
${name
~~~~~~~
\} will result in 

~~~~~~~
stack.findValue("name")
~~~~~~~
, which _generaly_  results in 

~~~~~~~
action.getName()
~~~~~~~
 being executed\.

A search process is used to resolve the variable, searching the following scopes in order, until a value is found :

+ freemarker variables

+ value stack

+ request attributes

+ session attributes

+ servlet context attributes

__Objects in the Context__

The following variables exist in the FreeMarker views

+ 

~~~~~~~
req
~~~~~~~
 \- the current HttpServletRequest

+ 

~~~~~~~
res
~~~~~~~
 \- the current HttpServletResponse

+ 

~~~~~~~
stack
~~~~~~~
 \- the current OgnlValueStack

+ 

~~~~~~~
ognl
~~~~~~~
 \- the OgnlTool instance

  + This class contains useful methods to execute OGNL expressions against arbitary objects, and a method to generate a select list using the \<s:select\> pattern\. (i\.e\. taking the name of the list property, a listKey and listValue)

+ 

~~~~~~~
struts
~~~~~~~
 \- an instance of StrutsBeanWrapper

+ 

~~~~~~~
action
~~~~~~~
 \- the current Struts action

+ 

~~~~~~~
exception
~~~~~~~
 \- _optional_  the Exception instance, if the view is a JSP exception or Servlet exception view

__FreeMarker configuration with recent releases__

To configure the freemarker engine that Struts uses, just add a file 

~~~~~~~
freemarker.properties
~~~~~~~
 to the classpath\. The supported properties are those that the Freemarker Configuration object expects \- see the [Freemarker documentation](http://freemarker\.org/docs/api/freemarker/template/Configuration\.html\#setSetting(java\.lang\.String,%20java\.lang\.String))^[http://freemarker\.org/docs/api/freemarker/template/Configuration\.html\#setSetting(java\.lang\.String,%20java\.lang\.String)] for these\.


~~~~~~~
default_encoding=ISO-8859-1
template_update_delay=5
locale=no_NO

~~~~~~~

__Using struts UI tags \- or any JSP Tag Library__

Freemarker has builtin support for using any JSP taglib\. You can use JSP taglibs in FreeMarker even if
 a) your servlet container has no support for JSP, or 
 b) you didn't specify the taglib in your web\.xml \- note how in the example below we refer to the taglib by its webapp\-absolute URL, so no configuration in web\.xml is needed\.


~~~~~~~
<#assign s=JspTaglibs["/WEB-INF/struts.tld"] />

<@s.form method="'post'" name="'inputform'" action="'save.action'" >
    <@s.hidden name="'id'" />
    <@s.textarea label="'Details'" name="'details'" rows=5 cols=40 />
    <@s.submit value="'Save'" align="center" />
</@s.form>

~~~~~~~

NOTE : numeric properties for tags MUST be numbers, not strings\. as in the rows and cols properties above\. if you use cols="40" you will receive an exception\. Other than that, the freemarker tag container behaves as you would expect\.

__Dynamic attributes support__

You can specify dynamic attributes with Struts 2 tags like this:


~~~~~~~
<@s.textfield name="test" dynamicAttributes={"placeholder":"input","foo":"bar"}/>

~~~~~~~

or like this:


~~~~~~~
<@s.textfield name="test" placeholder="input" foo="bar"/>

~~~~~~~

and for both case, it will be parsed into:


~~~~~~~
<input type="text" name="test" value="" id="test" placeholder="input" foo="bar"/>

~~~~~~~

You can also use OGNL expressions with dynamic tags like below:


~~~~~~~
<@s.textfield name="test" placeholder="input" foo="checked: %{bar}"/>

~~~~~~~

When using attributes with hyphens, use the below syntax (you can also leave the single quotes from false if you want)


~~~~~~~
<@s.form dynamicAttributes={'data-ajax':'false'}>
  ...
</@s.form>
~~~~~~~
