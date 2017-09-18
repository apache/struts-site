#Tag Developers Guide# {#PAGE_14324}


The framework offers a flexible view layer that supports multiple view technologies, including JSP, FreeMaker, and Velocity\.

| 

| 

| |\
\
+ [Struts Tags](#PAGE_14248)\
\
  + [Generic Tags](#PAGE_19745)\
\
  + [UI Tags](#PAGE_19736)\
\
  + [Themes and Templates](#PAGE_14247)\
\
  + [Tag Reference](#PAGE_19705)\
\
  + [Ajax Tags](#PAGE_31510)\
\
    + [Ajax and JavaScript Recipes](#PAGE_56182)\
\
+ [OGNL](#PAGE_14198)\
\
+ [Tag Syntax](#PAGE_13927)\
\
+ _Alt Syntax_ \
|\
\
+ [JSP](#PAGE_14141)\
\
  + [specific tags](#PAGE_13973)\
\
+ [FreeMarker](#PAGE_14078)\
\
  + [specific tags](#PAGE_14294)\
\
+ [Velocity](#PAGE_13894)\
\
  + [specific tags](#PAGE_13950)\
|
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


| 

###Next:###

##FreeMarker## {#PAGE_14078}


FreeMarker is a Java\-based template engine that is a great alternative to [JSP](#PAGE_14141)\. FreeMarker is ideal for situations where your action results can possibly be loaded from outside a Servlet container\. For example, if you wished to support plugins in your application, you might wish to use FreeMarker so that the plugins could provide the entire action class and view in a single jar that is loaded from the classloader\.

For more information on FreeMarker itself, please visit the [FreeMarker website](http://freemarker\.sourceforge\.net/)^[http://freemarker\.sourceforge\.net/]\.



| The framework utilizes FreeMarker because the engine includes strong error reporting, built\-in internationalization and powerful macro libraries\.

| 

| 

| Support is also included for [Velocity](#PAGE_13894) templates\. For a comparison of Velocity vs FreeMarker see [here](http://freemarker\.org/fmVsVel\.html)^[http://freemarker\.org/fmVsVel\.html]\.

| 

####Getting Started####

Getting started with FreeMarker is as simple as ensuring all the dependencies are included in your project's classpath\. Typically, the only dependency is 

~~~~~~~
freemarker.jar
~~~~~~~
\. Other than that, _struts\-default\.xml_  already configures the _FreeMarker Result_  needed to process your application's templates\.


~~~~~~~
<action name="test" class="com.acme.TestAction">
    <result name="success" type="freemarker">test-success.ftl</result>
</action>

~~~~~~~

Then in 

~~~~~~~
test-success.ftl
~~~~~~~
:


~~~~~~~
<html>
<head>
    <title>Hello</title>
</head>
<body>

Hello, ${name}

</body>
</html>

~~~~~~~

Where 

~~~~~~~
name
~~~~~~~
 is a property on your action\. That's it\! Read the rest of this document for details on how templates are loaded, variables are resolved, and tags can be used\.

####Servlet / JSP Scoped Objects####

The following are ways to obtained Application scope attributes, Session scope attributes, Request scope attributes, Request parameters, and framework Context scope parameters:\-

#####Application Scope Attribute#####

Assuming there's an attribute with name 

~~~~~~~
myApplicationAttribute
~~~~~~~
 in the Application scope\.


~~~~~~~
<#if Application.myApplicationAttribute?exists>
     ${Application.myApplicationAttribute}
</#if>

~~~~~~~

or


~~~~~~~
<@s.property value="%{#application.myApplicationAttribute}" />

~~~~~~~

#####Session Scope Attribute#####

Assuming there's an attribute with name 

~~~~~~~
mySessionAttribute
~~~~~~~
 in the Session scope\.


~~~~~~~
<#if Session.mySessionAttribute?exists>
     ${Session.mySessionAttribute}
</#if>

~~~~~~~

or


~~~~~~~
<@s.property value="%{#session.mySessionAttribute}" />

~~~~~~~

#####Request Scope Attribute#####

Assuming there's an attribute with name 'myRequestAttribute' in the Request scope\.


~~~~~~~
<#if Request.myRequestAttribute?exists>
      ${Request.myRequestAttribute}
</#if>

~~~~~~~

or


~~~~~~~
<@s.property value="%{#request.myRequestAttribute}" />

~~~~~~~

#####Request Parameter#####

Assuming there's a request parameter myParameter (eg\. [http://host/myApp/myAction\.action?myParameter=one](http://host/myApp/myAction\.action?myParameter=one))\.


~~~~~~~
<#if Parameters.myParameter?exists>
     ${Parameters.myParameter}
</#if>

~~~~~~~

or


~~~~~~~
<@s.property value="%{#parameters.myParameter}" />

~~~~~~~

#####Context parameter#####

Assuming there's a parameter with the name myContextParam in framework context\.


~~~~~~~
${stack.findValue('#myContextParam')}

~~~~~~~

or


~~~~~~~
<@s.property value="%{#myContextParam}" />

~~~~~~~

####Template Loading####

The framework looks for FreeMarker templates in two locations (in this order):

1. Web application

2. Class path

This ordering makes it ideal for providing templates inside a fully\-built jar, but allowing for overrides of those templates to be defined in your web application\. In fact, this is how you can override the default UI tags and [Form Tags](#PAGE_14230) included with the framework\.

In addition, you can specify a location (directory on your file system) through the 

~~~~~~~
templatePath
~~~~~~~
 or 

~~~~~~~
TemplatePath
~~~~~~~
 context variable (in the 

~~~~~~~
web.xml
~~~~~~~
)\. If a variable is specified, the content of the directory it points to will be searched first\.



| This variable is currently NOT relative to the root of your application\.

| 

####Variable Resolution####

When using FreeMarker with the framework, variables are looked up in several different places, in this order:

1. Built-in variables

2. Value stack

3. Action context

4. Request scope

5. Session scope

6. Application scope

Note that the action context is looked up after the value stack\. This means that you can reference the variable without the typical preceding has marker (\#) like you would have to when using the JSP 

~~~~~~~
s:property
~~~~~~~
 tag\. This is a nice convenience, though be careful because there is a small chance it could trip you up\.


~~~~~~~
<@s.url id="url" value="http://www.yahoo.com"/>
Click <a xhref="${url}">here</a>!

~~~~~~~

The built\-in variables that Struts\-FreeMarker integration provides are:

|Name|Description|
|----|-----------|
|stack|The value stack itself, useful for calls like \$\{stack\.findString('ognl expr')\}|
|action|The action most recently executed|
|response|The HttpServletResponse|
|res|Same as response|
|request|The HttpServletRequest|
|req|Same as request|
|session|The HttpSession|
|application|The ServletContext|
|base|The request's context path|

####Tag Support####

FreeMarker includes complete tag support\. See the [FreeMarker Tags](#PAGE_14294) documentation for information on how to use the generic [Struts Tags](#PAGE_14248) provided by Struts\. In addition to this, you can use any JSP tag, like so:


~~~~~~~
<#assign mytag=JspTaglibs["/WEB-INF/mytag.tld"]>
<@mytag.tagx attribute1="some ${value}"/>

~~~~~~~

Where **mytag\.tld** is the JSP Tag Library Definition file for your tag library\. Note: in order to use this support in FreeMarker, you must enable the 

~~~~~~~
JSPSupportServlet
~~~~~~~
 in 

~~~~~~~
web.xml
~~~~~~~
:


~~~~~~~
<servlet>
    <servlet-name>JspSupportServlet</servlet-name>
    <servlet-class>org.apache.struts2.views.JspSupportServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
</servlet>

~~~~~~~

####Tips and Tricks####

There are some advanced features that may be useful when building Struts applications with FreeMarker\.

#####Type Conversion and Locales#####

FreeMarker has built in support for formatting dates and numbers\. The formatting rules are based on the locale associated with the action request, which is by default set in _struts\.properties_  but can be over\-ridden using the _I18n Interceptor_ \. This is normally perfect for your needs, but it is important to remember that these formatting rules are handled by FreeMarker and not by the framework's _Type Conversion_  support\.

If you want the framework to handle the formatting according to the _Type Conversion_  you have specified, you shouldn't use the normal \$\{\.\.\.\} syntax\. Instead, you should use the [property](#PAGE_13960) tag\. The difference is that the property tag is specifically designed to take an [OGNL](#PAGE_14198) expression, evaluate it, and then convert it to a String using any _Type Conversion_  rules you have specified\. The normal \$\{\.\.\.\} syntax will use a FreeMarker expression language, evaluate it, and then convert it to a String using the built in formatting rules\.

 (\!)  The difference in how type conversion is handled under Freemarker is subtle but important to understand\.

#####Extending#####

Sometimes you may with to extend the framework's FreeMarker support\. For example, you might want to extend the Struts tags that come bundled with the framework\.

To extend the Freemarker support, develop a class that extends 

~~~~~~~
org.apache.struts2.views.freemarker.FreemarkerManager
~~~~~~~
, overriding methods as needed, and plugin the class through the _struts\.properties_ :


~~~~~~~
struts.freemarker.manager.classname = com.yourcompany.YourFreeMarkerManager

~~~~~~~

#####ObjectWrapper Settings#####

Once you get familiar with FreeMarker, you will find certain _subtleties_ with it that may become frustrating\. The most common thing you'll likely run in to is the BeansWrapper provided by FreeMarker\. If you don't know what this is, don't worry\. However, if you do, know this:

~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.views.freemarker.StrutsBeanWrapper}
~~~~~~~

#####Syntax Notes#####

As of FreeMarker 2\.3\.4, an alternative syntax is supported\. This alternative syntax is great if you find that your IDE (especially IntelliJ IDEA) makes it difficult to work with the default syntax\. You can read more about this syntax [here](http://freemarker\.sourceforge\.net/docs/dgui\_misc\_alternativesyntax\.html)^[http://freemarker\.sourceforge\.net/docs/dgui\_misc\_alternativesyntax\.html]\.

#####Cache#####

You can enable FreeMarker cache mechanism by specifying below options in struts\.xml:

+ 

~~~~~~~
<constant name="struts.freemarker.mru.max.strong.size" value="250" />
~~~~~~~
 \- this option will be used by [freemarker\.cache\.MruCacheStorage](http://freemarker\.org/docs/api/freemarker/cache/MruCacheStorage\.html)^[http://freemarker\.org/docs/api/freemarker/cache/MruCacheStorage\.html]

+ 

~~~~~~~
<constant name="struts.freemarker.templatesCache.updateDelay" value="1800" />
~~~~~~~
 \- default update cache interval (5 seconds)

+ 

~~~~~~~
<constant name="struts.freemarker.templatesCache" value="true" />
~~~~~~~
 \- \***DEPRECATED**\* this option will use a internal ConcurrentHashMap in FreemarkerTemplateEngine but not freemarker native cache

Setting 

~~~~~~~
devMode
~~~~~~~
 to true will disable cache and updateDelay immediately, but you can explicit specify these constants to enable cache even in 

~~~~~~~
devMode
~~~~~~~
, see _devMode_ 

#####Incompatible Improvements#####

By default Struts is using FreeMarker in way to be backward compatible as much as possible but if you need to enable new features you can do it via 

~~~~~~~
freemarker.properties
~~~~~~~
 by defining [incompatible improvements](http://freemarker\.org/docs/pgui\_config\_incompatible\_improvements\.html\#pgui\_config\_incompatible\_improvements\_how\_to\_set)^[http://freemarker\.org/docs/pgui\_config\_incompatible\_improvements\.html\#pgui\_config\_incompatible\_improvements\_how\_to\_set] settings, ie\.:


~~~~~~~
incompatible_improvements=2.3.22
~~~~~~~

You can also pass this setting via 

~~~~~~~
ServletContext
~~~~~~~
 

~~~~~~~
<init-param/> (since Struts 2.5.13):
~~~~~~~



~~~~~~~
<init-param>
    <param-name>freemarker.incompatible_improvements</param-name>
    <param-value>2.3.22</param-value>
</init-param>
~~~~~~~


This can impact your freemarker powered pages and Struts tags as well, so please careful test this change\.

####Next:####

##FreeMarker Tags## {#PAGE_14294}

FreeMarker tags are extensions of the generic [Struts Tags](#PAGE_14248) provided by the framework\. You can jump right in just by knowing the generic structure in which the tags can be accessed: 

~~~~~~~
<@s.tag> ...</@s.tag>
~~~~~~~
, where _tag_  is any of the [tags](#PAGE_14248) supported by the framework\.

For example, in JSP you might create a form using Struts tags\.

**JSP Form**


~~~~~~~

<s:form action="updatePerson">
    <s:textfield label="First name" name="firstName"/>
    <s:submit value="Update"/>
</s:form>

~~~~~~~

In FreeMarker the same form can also be built using Struts tags\.

**FTL Form**


~~~~~~~

<@s.form action="updatePerson">
    <@s.textfield label="First name" name="firstName"/>
    <@s.submit value="Update"/>
</@s.form>

~~~~~~~

_But, wait there's more\!_ 

Aside from doing everything that the JSP tags do, the FTL tags boast additional features that you can use to make your pages even easier to code\. You can even invoke third\-party JSP taglibs as if there were native FTL tags\.

####Attributes and Parameters####

Unlike older versions of JSP (in which the [JSP Tags](#PAGE_13973) are based), FreeMarker allows for _dynamic attributes_ , much like JSP 2\.0\. You can supply attributes to the tags that the tag doesn't explicitedly support\. Those attributes that cannot be applied directly to the tag object will be set to the tag's general\-purpose 

~~~~~~~
parameters
~~~~~~~
 Map\.

Suppose we wanted to build an URL in a JSP\. The URL needs to take an arbitary parameter to the query string, that (being arbitary) isn't specified on the URL tag\. In a JSP, we'd have to use the 

~~~~~~~
url
~~~~~~~
 and 

~~~~~~~
param
~~~~~~~
 tags together\.

**Creating a URL with a query string (JSP)**


~~~~~~~

<s:url value="somePage">
    <s:param name="personId" value="%{personId}"/>
</s:url>

~~~~~~~

In FreeMarker, we can pass the arbitrary parameter directly and create the URL in one simple statement\.

**Creating a URL with a query string (FTL)**


~~~~~~~

<@s.url value="somePage" personId="${personId}"/>

~~~~~~~

#####Using inline attributes with templates#####

Suppose you created a "three column" theme to replace the typical two column theme (xhtml)\. You might want an additional parameter to display in the third column called "description"\. Using FreeMarker, you can just pop the description attribute into the textfield tag, no fuss, no muss\.

**Passing an attribute to the template**


~~~~~~~

<@s.form action="updatePerson">
    <@s.textfield label="First name" name="firstName" description="..."/>
    <@s.submit value="Update"/>
</@s.form>

~~~~~~~

In the new template, the description is referenced via the parameters Map: "\$\{parameters\.description\}"\.



| For simple cases, inline attributes are much easier to use than the param\} tag\. But, the \{\{param\} tag is more flexible than inline attributes for advanced use cases\. For example, \{\{param can take the entire body of the tag and apply that as the _value_  attribute\.

| 

####Attribute Types####

Remember that all tag attributes must first be set as Strings \- they are then later evaluated (using [OGNL](#PAGE_14198)) to a different type, such as List, int, or boolean\. This generally works just fine, but it can be limiting when using FreeMarker which provides more advanced ways to apply attributes\. Suppose the following example:


~~~~~~~

<@s.select label="Foo label - ${foo}" name="${name}" list="%{{1, 2, 3}}"/>

~~~~~~~

What will happen here is that each attribute will be evaluated to a String as best it can\. This may involve calling the 

~~~~~~~
toString
~~~~~~~
 method on the internal FreeMarker objects\. In this case, all objects will end up being exactly what you would expect\. Then, when the tag runs, the 

~~~~~~~
list
~~~~~~~
 attribute will be converted from a String to a List using [OGNL](#PAGE_14198)'s advanced collection support\.

But suppose you wish to use FreeMarker's list or hash support instead? You can do this:


~~~~~~~

<@s.select label="Foo label - ${foo}" name="${name}" list=[1, 2, 3]/>

~~~~~~~

Notice that the list attribute no longer has quotes around it\. Now it will come in to the tag as an object that can't easily be converted to a String\. Normally, the tag would just call 

~~~~~~~
toString
~~~~~~~
, which would return "\[1, 2, 3\]" and be unable to be converted back to a List by OGNL\. Rather than go through all this back and forth, the frameworks's FreeMarker tag support will recognize collections and not pass them through the normal tag attribute\. Instead, the framework will set them directly in the 

~~~~~~~
parameters
~~~~~~~
 Map, ready to be consumed by the template\.

In the end, everything tends to do what you would expect, but it can help to understand the difference of when OGNL is being used and when it isn't, and how attribute types get converted\.

####JSP Tag Support####

While the framework provides native FreeMarker Tags, you might wish to use other third\-party tags that are only available for JSP\. Fortunately, FreeMarker has the ability to run JSP tags\. To do so, you must include the JspSupportServlet in the application's 

~~~~~~~
web.xml
~~~~~~~
, as this allows the FreeMarker integration to get access to the required objects needed to emulate a JSP taglib container\.

**Adding JspSupportSerlvet to web\.xml**


~~~~~~~

<servlet>
    <servlet-name>JspSupportServlet</servlet-name>
    <servlet-class>org.apache.struts2.views.JspSupportServlet</servlet-class>
    <load-on-startup>1</load-on-startup>
</servlet>

~~~~~~~

Once you've done that, you can simply add something like this in your templates:


~~~~~~~

<#assign cewolf=JspTaglibs["/WEB-INF/cewolf.tld"] />
...
<@cewold.xxx ... />

~~~~~~~

####Next:####

##JSP## {#PAGE_14141}

The default configuration (_struts\-default\.xml_ ) configures the _Dispatcher Result_  as the default result, which works well with JavaServer Pages\. Any JSP 1\.2\+ container can work with Struts 2 JSP tags immediately\.

####Getting Started####

Because JSP support occurs through the _Dispatcher Result_ , which is the default result type, you don't need to specify the type attribute when configuring _struts\.xml_ :


~~~~~~~

<action name="test" class="com.acme.TestAction">
    <result name="success">test-success.jsp</result>
</action>

~~~~~~~

Then in **test\-success\.jsp**:


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <title>Hello</title>
</head>
<body>

Hello, <s:property value="name"/>

</body>
</html>

~~~~~~~

Where **name** is a property on your action\. That's it\!

####Servlet / JSP Scoped Objects####

The following are ways to obtain Application scope attributes, Session scope attributes, Request scope attributes, Request parameters and framework Context scope parameters:\-

#####Application Scope Attribute#####

Assuming there's an attribute with name 'myApplicationAttribute' in the Application scope\.


~~~~~~~

<s:property value="%{#application.myApplicationAttribute}" />

~~~~~~~

#####Session Scope Attribute#####

Assuming there's an attribute with name 'mySessionAttribute' in the Session scope\.


~~~~~~~

<s:property value="%{#session.mySessionAttribute}" />

~~~~~~~

#####Request Scope Attribute#####

Assuming there's an attribute with name 'myRequestAttribute' in the Request scope\.


~~~~~~~

<s:property value="%{#request.myRequestAttribute}" />

~~~~~~~

#####Request Parameter#####

Assuming there's a request parameter myParameter (e\.g\. [http://host/myApp/myAction\.action?myParameter=one](http://host/myApp/myAction\.action?myParameter=one))\.


~~~~~~~

<s:property value="%{#parameters.myParameter}" />

~~~~~~~

#####Context Scope Parameter#####

Assuming there's a parameter with the name myContextParam in our context\.


~~~~~~~

<s:property value="%{#myContextParam}" />

~~~~~~~

####Tag Support####

See the [JSP Tags](#PAGE_13973) documentation for information on how to use the generic [Struts Tags](#PAGE_14248) provided by the framework\. 

####Exposing the ValueStack####

There are a couple of ways to obtain _access to ValueStack from JSPs_ \.

####Next:####

###Access to ValueStack from JSPs### {#PAGE_14315}

To access the ValueStack from third\-party JSP taglibs, expose property values to JSP using the 

~~~~~~~
<s:set
~~~~~~~
 tag\.

**Set a request scoped parameter 'a' to list of integers**


~~~~~~~
<s:set name="'a'" value="{ 1, 2, 3, 4 }" scope="request"/>

~~~~~~~

After setting parameters, third\-party JSP taglibs can access variables or use JSP 2\.0 EL (Expression Language)\. This is convenient as short hand EL expression syntax


~~~~~~~
${expression
~~~~~~~
\}

can be used in a text or inside of tag attributes:


~~~~~~~
a[0] = ${a[0]}

<sample:tag value="${a[1]}"/>

~~~~~~~

In practice, several variables must be exposed to make effective use of third party taglibs like [DisplayTag](http://displaytag\.sourceforge\.net/11/)^[http://displaytag\.sourceforge\.net/11/]\. Unfortunately, this approach leads to a lot of 

~~~~~~~
<ww:set/>
~~~~~~~
 tags\.



| Unfortunately, it isn't that simple\. we tinkered with JSPFactory\.setDefault() to wrap around getPageContext() and create ExpressionEvaluator that would use OGNL\. This strategy works in practice, but code generated by Jasper2 doesn't call JSPFactory\.getPageContext()\.getExpressionEvaluator() but goes directly to static method that is hardwired to Jakarta Commons\-EL implementation\.

| 

| 

| Even if this approach did work, it wouldn't be _clean_  as JSPFactory\.setDefault() should only be called by JSP implementation\.

| 

There is a simple, if not elegant, solution available in JSP 2\.0 EL, for exposing ValueStack to OGNL\. It is possible to create custom functions that can be called from EL expressions\. Functions have to be 'public static' and specified in a TLD file\.
 To use a function, import the TLD in a JSP file where you've want to use a function\. For example, you could access Action properties by evaluating OGNL expression by a function 'vs' (for valuestack) in EL\.


~~~~~~~
<%@ taglib uri="/WEB-INF/tld/wwel.tld" prefix="x" %>

a[0] = ${x:vs('a[0]')}
a[0] * 4 = ${x:vs('a[0] * 4')}

Current action name: ${x:name()}
Top of ValueStack: ${x:top()}

~~~~~~~

To use this code you've got to add 

~~~~~~~
wwel.tld
~~~~~~~
 and 

~~~~~~~
Functions.java
~~~~~~~
 to your webapp project\.



| If someone were interested, it would be helpful for a developer (like you\!) to define a set of functions that we could include in a future release of the framework\.

| 

**wwel\.tld**


~~~~~~~
<?xml version="1.0"?>
<taglib xmlns="http://java.sun.com/xml/ns/j2ee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-jsptaglibrary_2_0.xsd"
	version="2.0">

<description>
This taglib enables access to the ValueStack
from JSP 2.0 Expression Language
</description>

<tlib-version>1.0</tlib-version>

<short-name>wwel</short-name>

<function>
	<name>vs</name>
	<function-class>com.nmote.wwel.Functions</function-class>
	<function-signature>
		java.lang.Object findOnValueStack(java.lang.String)
	</function-signature>
</function>

<function>
	<name>name</name>
	<function-class>com.nmote.wwel.Functions</function-class>
	<function-signature>
		java.lang.Object getActionName()
	</function-signature>
</function>

<function>
	<name>top</name>
	<function-class>com.nmote.wwel.Functions</function-class>
	<function-signature>
		java.lang.Object getTopOfValueStack()
	</function-signature>
</function>

</taglib>

~~~~~~~

**Functions\.java**


~~~~~~~
package com.nmote.wwel;

import com.opensymphony.xwork.ActionContext;

/**
 * Utility functions for accessing value stack and action context
 * from JSP 2.0 EL taglibs.
 */
public class Functions {

	public static Object findOnValueStack(String expr) {
		ActionContext a = ActionContext.getContext();
		Object value = a.getValueStack().findValue(expr);
		return value;
	}

	public static Object getTopOfValueStack() {
		ActionContext a = ActionContext.getContext();
		Object value = a.getValueStack().peek();
		return value;
	}

	public static Object getActionName() {
		ActionContext a = ActionContext.getContext();
		Object value = a.getName();
		return value;
	}
}

~~~~~~~

##JSP Tags## {#PAGE_13973}

JSP tags are extensions of the generic tags provided by the framework\. You can get started almost immediately by simply knowing the generic structure in which the tags can be accessed: \<s:tag\> \.\.\. \</s:tag\>, where tag is any of the tags supported by the framework\.

####Tag Library Definition (TLD)####

The JSP TLD is included in the 

~~~~~~~
struts-core.jar
~~~~~~~
\. To use, just include the usual red\-tape at the top of your JSP\.


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <body>
    <p>Now you can use the tags, like so:</p>
    <s:iterator value="people">
      <s:property value="lastName"/>, <s:property value="firstName"/>
    </s:iterator>
    ...

~~~~~~~

####Next:####

##OGNL## {#PAGE_14198}

OGNL is the Object Graph Navigation Language (see [http://commons\.apache\.org/proper/commons\-ognl/](http://commons\.apache\.org/proper/commons\-ognl/) for the full documentation of OGNL)\. Here, we will cover a few examples of OGNL features that co\-exist with the framework\. To review basic concepts, refer to [OGNL Basics](#PAGE_14000)\.

The framework uses a standard naming context to evaluate OGNL expressions\. The top level object dealing with OGNL is a Map (usually referred as a context map or context)\. OGNL has a notion of there being a root (or default) object within the context\. In expression, the properties of the root object can be referenced without any special "marker" notion\. References to other objects are marked with a pound sign (

~~~~~~~
#
~~~~~~~
)\.

The framework sets the OGNL context to be our ActionContext, and the value stack to be the OGNL root object\. (The value stack is a set of several objects, but to OGNL it appears to be a single object\.) Along with the value stack, the framework places other objects in the ActionContext, including Maps representing the application, session, and request contexts\. These objects coexist in the ActionContext, alongside the value stack (our OGNL root)\.


~~~~~~~
                     |
                     |--application
                     |
                     |--session
       context map---|
                     |--value stack(root)
                     |
                     |--action (the current action)
                     |
                     |--request
                     |
                     |--parameters
                     |
                     |--attr (searches page, request, session, then application scopes)
                     |

~~~~~~~

(information) There are other objects in the context map\. The diagram is for example only\.

The Action instance is always pushed onto the value stack\. Because the Action is on the stack, and the stack is the OGNL root, references to Action properties can omit the 

~~~~~~~
#
~~~~~~~
 marker\. But, to access other objects in the ActionContext, we must use the 

~~~~~~~
#
~~~~~~~
 notation so OGNL knows not to look in the root object, but for some other object in the ActionContext\.

**Referencing an Action property**


~~~~~~~
<s:property value="postalCode"/>

~~~~~~~

Other (non\-root) objects in the ActionContext can be rendered use the 

~~~~~~~
#
~~~~~~~
 notation\.


~~~~~~~
<s:property value="#session.mySessionPropKey"/> or
<s:property value="#session['mySessionPropKey']"/> or
<s:property value="#request['myRequestPropKey']"/>

~~~~~~~

The ActionContext is also exposed to Action classes via a static method\.


~~~~~~~
ActionContext.getContext().getSession().put("mySessionPropKey", mySessionObject);

~~~~~~~

You can also put expression for attributes that don't support dynamic content, like below:


~~~~~~~
<c:set var="foo" value="bar" scope="request"/>
<s:textfield name="username" label="%{#request.foo}" />

~~~~~~~

####Collections (Maps, Lists, Sets)####

Dealing with Collections (Maps, Lists, and Sets) in the framework comes often, so below please there are a few examples using the select tag\. The [OGNL documentation](http://commons\.apache\.org/proper/commons\-ognl/language\-guide\.html\#Collection\_Construction)^[http://commons\.apache\.org/proper/commons\-ognl/language\-guide\.html\#Collection\_Construction] also includes some examples\.

Syntax for list: \{e1,e2,e3\}\. This idiom creates a List containing the String "name1", "name2" and "name3"\. It also selects "name2" as the default value\.


~~~~~~~
<s:select label="label" name="name" list="{'name1','name2','name3'}" value="%{'name2'}" />

~~~~~~~

Syntax for map: \#\{key1:value1,key2:value2\}\. This idiom creates a map that maps the string "foo" to the string "foovalue" and "bar" to the string "barvalue":


~~~~~~~
<s:select label="label" name="name" list="#{'foo':'foovalue', 'bar':'barvalue'}" />

~~~~~~~

To determine if an element exists in a Collection, use the operations 

~~~~~~~
in
~~~~~~~
 and 

~~~~~~~
not in
~~~~~~~
\.


~~~~~~~
<s:if test="'foo' in {'foo','bar'}">
   muhahaha
</s:if>
<s:else>
   boo
</s:else>

<s:if test="'foo' not in {'foo','bar'}">
   muhahaha
</s:if>
<s:else>
   boo
</s:else>

~~~~~~~

To select a subset of a collection (called projection), use a wildcard within the collection\.

+ ? \- All elements matching the selection logic

+ ^ \- Only the first element matching the selection logic

+ \$ \- Only the last element matching the selection logic

To obtain a subset of just male relatives from the object person:


~~~~~~~
person.relatives.{? #this.gender == 'male'}

~~~~~~~

####Lambda Expressions####

OGNL supports basic lamba expression syntax enabling you to write simple functions\.

(Dedicated to all you math majors who didn't think you would ever see this one again\.)

Fibonacci: if n==0 return 0; elseif n==1 return 1; else return fib(n\-2)\+fib(n\-1);
 fib(0) = 0
 fib(1) = 1
 fib(11) = 89

**(i) How the expression works**


> 

> 

> The lambda expression is everything inside the square brackets\. The \#this variable holds the argument to the expression, which in the following example is the number 11 (the code after the square\-bracketed lamba expression, \#fib(11))\.

> 

~~~~~~~
<s:property value="#fib =:[#this==0 ? 0 : #this==1 ? 1 : #fib(#this-2)+#fib(#this-1)], #fib(11)" />

~~~~~~~

####Next:####

###OGNL Basics### {#PAGE_14000}

#####XWork\-specific language features#####

The biggest addition that XWork provides on top of OGNL is the support for the ValueStack\. While OGNL operates under the assumption there is only one "root", XWork's ValueStack concept requires there be many "roots"\.

For example, suppose we are using standard OGNL (not using XWork) and there are two objects in the OgnlContext map: "foo" \-\> foo and "bar" \-\> bar and that the foo object is also configured to be the single **root** object\. The following code illustrates how OGNL deals with these three situations:


~~~~~~~
#foo.blah // returns foo.getBlah()
#bar.blah // returns bar.getBlah()
blah      // returns foo.getBlah() because foo is the root

~~~~~~~

What this means is that OGNL allows many objects in the context, but unless the object you are trying to access is the root, it must be prepended with a namespaces such as @bar\. Now let's talk about how XWork is a little different\.\.\.

**(i) Useful Information**


> 

> 

> In XWork, the entire ValueStack is the root object in the context\. Rather than having your expressions get the object you want from the stack and then get properties from that (ie: peek()\.blah), XWork has a special OGNL PropertyAccessor that will automatically look at the all entries in the stack (from the top down) until it finds an object with the property you are looking for\.

> 

For example, suppose the stack contains two objects: Animal and Person\. Both objects have a "name" property, Animal has a "species" property, and Person has a "salary" property\. Animal is on the top of the stack, and Person is below it\. The follow code fragments help you get an idea of what is going on here:


~~~~~~~
species    // call to animal.getSpecies()
salary     // call to person.getSalary()
name       // call to animal.getName() because animal is on the top

~~~~~~~

In the last example, there was a tie and so the animal's name was returned\. Usually this is the desired effect, but sometimes you want the property of a lower\-level object\. To do this, XWork has added support for indexes on the ValueStack\. All you have to do is:


~~~~~~~
[0].name   // call to animal.getName()
[1].name   // call to person.getName()

~~~~~~~

With expression like \[0\] \.\.\. \[3\] etc\. Struts 2 will cut the stack and still return back a CompoundRoot object\. To get the top of that particular stack cut, use _0_ \.top

|ognl expression|description|
|---------------|-----------|
|\[0\]\.top|would get the top of the stack cut starting from element 0 in the stack (similar to top in this case)|
|\[1\]\.top|would get the top of the stack cut starting from element 1 in the stack|

#####Accessing static properties#####

OGNL supports accessing static properties as well as static methods\.

By default, Struts 2 is configured to disallow this\-\-to enable OGNL's static member support you must set the 

~~~~~~~
struts.ognl.allowStaticMethodAccess
~~~~~~~
 constant to 

~~~~~~~
true
~~~~~~~
 via any of the _Constant Configuration_  methods\.

OGNL's static access looks like this:


~~~~~~~
@some.package.ClassName@FOO_PROPERTY
@some.package.ClassName@someMethod()

~~~~~~~

However, XWork allows you to avoid having to specify the full package name and call static properties and methods of your action classes using the "vs" prefix:


~~~~~~~
<at:var at:name="vs" />FOO_PROPERTY
<at:var at:name="vs" />someMethod()

<at:var at:name="vs1" />FOO_PROPERTY
<at:var at:name="vs1" />someMethod()

<at:var at:name="vs2" />BAR_PROPERTY
<at:var at:name="vs2" />someOtherMethod()

~~~~~~~

"vs" stands for "value stack"\. The important thing to note here is that if the class name you specify is just "vs", the class for the object on the top of the stack is used\. If you specify a number after the "vs" string, an object's class deeper in the stack is used instead\.

#####Differences from the WebWork 1\.x EL#####

Besides the examples and descriptions given above, there are a few major changes in the EL since WebWork 1\.x\. The biggest one is that properties are no longer accessed with a forward slash (/) but with a dot (\.)\. Also, rather than using "\.\." to traverse down the stack, we now use "\[n\]" where n is some positive number\. Lastly, in WebWork 1\.x one could access special named objects (the request scope attributes to be exact) by using "@foo", but now special variables are accessed using "\#foo"\. However, it is important to note that "\#foo" does NOT access the request attributes\. Because XWork is not built only for the web, there is no concept of "request attributes", and thus "\#foo" is merely a request to another object in the OgnlContext other than the root\.

|Old Expression|New Expression|
|--------------|--------------|
|foo/blah|foo\.blah|
|foo/someMethod()|foo\.someMethod()|
|\.\./bar/blah|\[1\]\.bar\.blah|
|@baz|not directly supported, but \#baz is similar|
|\.|'top' or \[0\]|

#####Struts 2 Named Objects#####

Struts 2 places request parameters and request, session, and application attributes on the OGNL stack\. They may be accessed as shown below\.

|name|value|
|----|-----|
|\#action\['foo'\] or \#action\.foo|current action getter (getFoo())|
|\#parameters\['foo'\] or \#parameters\.foo|request parameter \['foo'\] (request\.getParameter())|
|\#request\['foo'\] or \#request\.foo|request attribute \['foo'\] (request\.getAttribute())|
|\#session\['foo'\] or \#session\.foo|session attribute 'foo'|
|\#application\['foo'\] or \#application\.foo|ServletContext attributes 'foo'|
|\#attr\['foo'\] or \#attr\.foo|Access to PageContext if available, otherwise searches request/session/application respectively|

###OGNL Expression Compilation### {#PAGE_61661}

This document is meant as a development/integration guide for anyone wanting to use the new OGNL 2\.7 features for doing byte code runtime enhancements on OGNL statements\.  This is _not_  meant for general user reference as it covers what are mostly internal API development concerns\.

##### Basic Usage#####

By default there isn't much you have to do to use the new compilation abilities in OGNL\.  Following is an example of compiling a simple property expression and invoking it\.


~~~~~~~

SimpleObject root = new SimpleObject();
OgnlContext context =  (OgnlContext) Ognl.createDefaultContext(null);

Node node =  (Node) Ognl.compileExpression(context, root, "user.name");
String userName = node.getAccessor().get(context, root);

~~~~~~~

You'll notice that this example references the new 

~~~~~~~
ognl.enhance.ExpressionAccessor
~~~~~~~
 class\.  This is the interface used to create the enhanced expression versions of any given expression via javassist and should be used to set/get expression values from the compiled versions of the code\.  Although the old 

~~~~~~~
Ognl.getValue(node, context, root)
~~~~~~~
 method of getting/setting values will correctly detect a compiled expression and use the accessor directly as well,  it's not going to be as fast as you doing it directly\.

##### ognl\.enhance\.OgnlExpressionCompiler#####

The core class involved in doing the management of these expression compilations by default is 

~~~~~~~
ognl.enhance.ExpressionCompiler
~~~~~~~
, which implements 

~~~~~~~
ognl.enhance.OgnlExpressionCompiler
~~~~~~~
\.  Although you can in theory use this default implementation it is not recommended for more robust integration points \- such as being incorporated within a web framework\.  The majority of examples here are going to be based around the strategy that Tapestry has used to integrate these new features\.

__ Tapestry OGNL Integration__

There are only small handful of classes/services involved in the Tapestry implementation of these features, so hopefully using them as a reference will help anyone trying to get started with this:

+ [org\.apache\.tapestry\.services\.impl\.HiveMindExpressionCompiler](http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/services/impl/HiveMindExpressionCompiler\.java?view=markup)^[http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/services/impl/HiveMindExpressionCompiler\.java?view=markup] The Tapestry implementation of 

~~~~~~~
ognl.enhance.OgnlExpressionCompiler
~~~~~~~
 \- which is a subclass of the 

~~~~~~~
ognl.enhance.ExpressionCompiler
~~~~~~~
 default implementation\.

+ [org\.apache\.tapestry\.services\.impl\.ExpressionEvaluatorImpl](http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/services/impl/ExpressionEvaluatorImpl\.java?view=markup)^[http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/services/impl/ExpressionEvaluatorImpl\.java?view=markup] Main service point involved in compiling/evaluating OGNL expressions\.  This is the core service that the rest of Tapestry uses when dealing with OGNL expressions\.

+ [org\.apache\.tapestry\.services\.impl\.ExpressionCacheImpl](http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/services/impl/ExpressionCacheImpl\.java?view=markup)^[http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/services/impl/ExpressionCacheImpl\.java?view=markup] Service responsible for caching OGNL statements where appropriate\.

+ [org\.apache\.tapestry\.binding\.ExpressionBinding](http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/binding/ExpressionBinding\.java?view=markup)^[http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/binding/ExpressionBinding\.java?view=markup] Wrapper class which represents a single OGNL binding expression within Tapestry templates/annotations/html/etc\.  Anything formally specified in an html attribute for components in Tapestry is represented by a specific type of 

~~~~~~~
IBinding
~~~~~~~
, 

~~~~~~~
ExpressionBinding
~~~~~~~
 represents the type of bindings for OGNL expressions\.

\*[org\.apache\.tapestry\.bean\.BeanProviderPropertyAccessor](http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/bean/BeanProviderPropertyAccessor\.java?view=markup)^[http://svn\.apache\.org/viewvc/tapestry/tapestry4/trunk/tapestry\-framework/src/java/org/apache/tapestry/bean/BeanProviderPropertyAccessor\.java?view=markup] One of the custom 

~~~~~~~
PropertyAccessor
~~~~~~~
 classes Tapestry registers with OGNL\.  This will be a good reference for the new source code generation methods you will need to implement for your 

~~~~~~~
PropertyAccessor
~~~~~~~
 classes if you want to compile expressions\.

__ ExpressionEvaluator__

If you look at the 

~~~~~~~
ExpressionEvaluator
~~~~~~~
 source you'll see a block of initialization where the 

~~~~~~~
HiveMindExpressionCompiler
~~~~~~~
 and 

~~~~~~~
OgnlContext
~~~~~~~
 pools are setup:


~~~~~~~

OgnlRuntime.setCompiler(new HiveMindExpressionCompiler(_classFactory));

_contextPool = new GenericObjectPool(new PoolableOgnlContextFactory(_ognlResolver, _typeConverter));

_contextPool.setMaxActive(-1);
_contextPool.setMaxIdle(-1);
_contextPool.setMinEvictableIdleTimeMillis(POOL_MIN_IDLE_TIME);
_contextPool.setTimeBetweenEvictionRunsMillis(POOL_SLEEP_TIME);

~~~~~~~

Some things like null handlers/property accessor configuration has been left out but you should have enough there to get a good idea of what is going on\.  Because creating new OgnlContext objects for every expression evaluation can be needlessly expensive Tapestry uses the Apache commons\-pool library to manage pooling of these instances\.  It is recommended that you do the same where you can\.  You will also notice in other portions of the source some new method calls made on 

~~~~~~~
OgnlRuntime
~~~~~~~
:


~~~~~~~

OgnlRuntime.clearCache();
Introspector.flushCaches();

~~~~~~~

The OgnlRuntime class stores static 

~~~~~~~
Map
~~~~~~~
\-like instances of reflection meta cache information for all objects evaluated in OGNL expressions\.  The new 

~~~~~~~
clearCache
~~~~~~~
 method clears these caches out as the memory footprint can get quite large after a while\.  How often/when to call this will largely depend on how your framework works \- just keep in mind that calling it too often will have a big impact on runtime performance of your app if you are doing normal application development sort of things with it\.

__ HiveMindExpressionCompiler__

Perhaps the most important class to examine is Tapestrys implementation of 

~~~~~~~
OgnlExpressionCompiler
~~~~~~~
\.  This class still extends the default 

~~~~~~~
ExpressionCompiler
~~~~~~~
 provided by OGNL \- but does a few more things that can't be made generic enough to live in the default implementation\.

One of these important differences is how Javassist is used to compile the expressions and the ClassLoader/ClassResolver it uses\.  Because these expressions are being compiled against what are already Javassist enhanced Tapestry component class instances this implementation needed to re\-use existing hivemind Javassist services so that these enhanced classes could be correctly resolved while OGNL is evaluating them\.

If you don't have a need to provide this kind of classloading functionality you will probably still need to modify at least how the javassist 

~~~~~~~
ClassPool
~~~~~~~
 is being managed in your own implementations\.  The internal functionality of that library is such that the memory consumption of the pool is very large and will get unwieldy especially in development of web apps\.  Tapestry has a special state that users are used to which is known as "disable caching" \- more or less meaning that javassist enhancements happen for every request instead of only once\.

Another very important piece of logic that this class handles is the generation of "fail safe" getters/setters when expressions just can't be compiled because of either internal errors or a specific syntax type used isn't yet able to support javassist compilations\.  This logic can sometimes get tricky in that in many instances OGNL expressions won't be compilable because the full expression contains a null reference\.  The basic idea is that the compiler keeps trying to compile these kinds of expressions until it either gets a fatal exception thrown or the full expression is able to be resolved\.  For example, the following expression would throw a 

~~~~~~~
UnsupportedCompilationException
~~~~~~~
 if the "user" object returned was null \- resulting in no direct compilation being done at all:


~~~~~~~

"user.firstName"

~~~~~~~

That doesn't mean that the user object might not be resolvable the next time this expression is invoked though,  so the next time the compiler tries it may succeed in which case the whole expression is enhanced and the new 

~~~~~~~
ExpressionAccessor
~~~~~~~
 instance is attached to the root 

~~~~~~~
Node
~~~~~~~
 object by calling 

~~~~~~~
SimpleNode.setAccessor(newInstance)
~~~~~~~
\.

The fail safe logic is there for expressions that are likely to never be resolvable for one reason or another\.  In these instances a 

~~~~~~~
ExpressionAccessor
~~~~~~~
 class instance is still created \- with the major difference being that instead of pure java object expressions being compiled the get/set methods on the instance just call back to the standard OGNL getValue/setValue methods:


~~~~~~~

public Object get(OgnlContext context, Object root)
{
  return _node.getValue($1, $2);
}

~~~~~~~

The 

~~~~~~~
$1, $2
~~~~~~~
 references are Javassist constructs which allow you to specify the first and second argument passed in to the calling method\.

__ ExpressionBinding__

As stated previously, this class represents a single OGNL expression in Tapestry when used directly in html templates \- such as:


~~~~~~~

<div jwcid="@Input" value="ognl:user.firstName" />

~~~~~~~

What you will want to examine in this class is how it deals with incrementally attempting expression evaluations using the local members 

~~~~~~~
_writeFailed, _accessor
~~~~~~~
\.  Looking through the source of this implementation will probably be the best documentation available \- but keep in mind that in many instances this object also has to deal with the possibility that a write statement may never happen\.

__ BeanProviderPropertyAccessor / Custom PropertyAccessor implementations__

Besides the 

~~~~~~~
OgnlExpressionCompiler
~~~~~~~
 logic this will probably be the second most impactual area people will have to deal with in terms of having to write new code\.  In this specific instance there are three new 

~~~~~~~
PropertyAccessor
~~~~~~~
 methods you must implement in order to compile your expressions:


~~~~~~~

public Class getPropertyClass(OgnlContext context, Object target, Object name)
{
  IBeanProvider provider = (IBeanProvider)target;
  String beanName = ((String)name).replaceAll("\"", "");

  if (provider.canProvideBean(beanName))
    return provider.getBean(beanName).getClass();

  return super.getPropertyClass(context, target, name);
}

public String getSourceAccessor(OgnlContext context, Object target, Object name)
{
   IBeanProvider provider = (IBeanProvider)target;
   String beanName = ((String)name).replaceAll("\"", "");

   if (provider.canProvideBean(beanName)) {

       Class type = OgnlRuntime.getCompiler().getInterfaceClass(provider.getBean(beanName).getClass());

       ExpressionCompiler.addCastString(context, "((" + type.getName() + ")");

       context.setCurrentAccessor(IBeanProvider.class);
       context.setCurrentType(type);

       return ".getBean(" + name + "))";
   }

   return super.getSourceAccessor(context, target, name);
}

public String getSourceSetter(OgnlContext context, Object target, Object name)
{
  throw new UnsupportedCompilationException("Can't set beans on IBeanProvider.");
}

~~~~~~~

Although this example may not provide with all of the possible use cases you may need to learn to properly implement these methods in your own 

~~~~~~~
PropertyAccessor
~~~~~~~
 implementations \- the built in OGNL versions like 

~~~~~~~
ObjectPropertyAccessor, MapPropertyAccessor, ListPropertyAccessor, etc
~~~~~~~
 should provide more than enough data to work from\. [http://svn\.opensymphony\.com/svn/ognl/trunk/](http://svn\.opensymphony\.com/svn/ognl/trunk/)

The most important part of the above logic you will want to look at is in how the new 

~~~~~~~
OgnlContext
~~~~~~~
 methods for setting object/accessor types are being set:


~~~~~~~

context.setCurrentAccessor(IBeanProvider.class);
context.setCurrentType(type);

~~~~~~~

This meta information is used by the 

~~~~~~~
OgnlExpressionCompiler
~~~~~~~
 to correctly cast your specific expression object types during compilation\.  This process of casting/converting in to and out of native types is the most complicated part of this new logic and also the source of the greatest number of bugs reported in the OGNL jira\. [http://jira\.opensymphony\.com/browse/OGNL](http://jira\.opensymphony\.com/browse/OGNL)

In this property accessor example the goal is to turn general statements like 

~~~~~~~
beans.emailValidator
~~~~~~~
 in to their pure source form \- which would look something like this when all is said and done:


~~~~~~~

((ValidatingBean)beanProvider.getBean("emailValidator"))

~~~~~~~

There is also the ever important cast handling which you must do:


~~~~~~~

Class type = OgnlRuntime.getCompiler().getInterfaceClass(provider.getBean(beanName).getClass());

ExpressionCompiler.addCastString(context, "((" + type.getName() + ")");

~~~~~~~

In this example the 

~~~~~~~
PropertyAccessor
~~~~~~~
 is trying to determine the class type and manually adding the cast string for the specific type to the overall statement by invoking the utility method 

~~~~~~~
addCastString(OgnlContext, String)
~~~~~~~
 on 

~~~~~~~
ExpressionCompiler
~~~~~~~
\.  In many instances of expression compilation you might also be dealing with unknown method calls, where the more preferred way to do this kind of logic would be something like this: (taken from the OGNL ObjectPropertyAccessor implementation)


~~~~~~~

Method m = ...(various reflection gynamistics used to find a java.reflect.Method instance)

context.setCurrentType(m.getReturnType());
context.setCurrentAccessor(OgnlRuntime.getCompiler().getSuperOrInterfaceClass(m, m.getDeclaringClass()));

~~~~~~~

When dealing with method calls it is very important that you do this specific kind of type setting on the 

~~~~~~~
OgnlContext
~~~~~~~
 class so that the casting done on your statements (which happens outside of the ObjectPropertyAccessor in this instance) can be done on the highest level interface defining that method\.  This becomes important when you are dealing with expressions that you would like to re\-use against different object instances\.  For example, suppose we had an ognl expression like this (for Tapestry):


~~~~~~~

user.firstName

~~~~~~~

and the object it was compiled against was an instance of something looking like this:


~~~~~~~

public abstract LoginPage extends BasePage implements UserPermissions {

  public abstract User getUser();

}

..
/**
 * Interface for any page/component that holds references to the current system
 * User.
 */
public interface UserPermissions {
   User getUser();
}

~~~~~~~



~~~~~~~
BasePage
~~~~~~~
 is a Tapestry specific class which is unimportant in this example\.  What is important to know is that if we had done something like this in the previous context setting example:


~~~~~~~

context.setCurrentType(m.getReturnType());
context.setCurrentAccessor(m.getDeclaringClass());

~~~~~~~

It would have resulted in a compiled expression of:


~~~~~~~

public void get(OgnlContext context, Object root)
{
  return ((LoginPage)root).getUser();
}

~~~~~~~

This is undesirable in situations where you would like to re\-use OGNL expressions across many different class instances (which is what Tapestry does via the 

~~~~~~~
ExpressionCacheImpl
~~~~~~~
 listed above)\.  The better/more re\-usable compiled version should really look like:


~~~~~~~

public void get(OgnlContext context, Object root)
{
  return ((UserPermissions)root).getUser();
}

~~~~~~~

These are the more delicate parts of the compiler API that the majority of people will need to worry about during any integration efforts\.

##### Known Issues / Limitations#####

+ **Compiler Errors** \- Despite the substantially large number of unit tests set up and thorough usage of many different types of expressions Tapestry users are still currently running in to fatal/non caught runtime errors when some of their OGNL expressions are compiled\.  In some instances these errors are blockers and they must either wait for someone to fix the bug (after being posted to [http://jira\.opensymphony\.com/browse/OGNL](http://jira\.opensymphony\.com/browse/OGNL) correctly) or re\-work their expression to get around the error\.  I (jesse) generally try to fix these reported errors within a day or two (or sooner) when I can and immediately deploy the fixes to the OGNL snapshot maven2 repository\.  This doesn't mean that the vast majority of expressions won't compile fine, but it is something to keep in mind when you decide how to integrate the compiler logic in to your own framework\.

+ **Compile vs\. normal expression evaluation** \- The current Tapestry implementation compiles OGNL expressions in both development AND production modes\.  This has the undesirable side effect of causing needless multiple method invocations on objects when compiling as well as the general overhead of performing compilations at all when people are just developing applications and not serving them in production environments\.  It is hoped that when OGNL becomes final this special development mode can go back to using normal OGNL expression evaluation during development and save compilation for production environments,  but until then we've been worried about giving people false positives when testing their applications\.  Meaning \- something may evaluate just fine when using 

~~~~~~~
Ognl.getValue(OgnlContext, Object root, String expression
~~~~~~~
 but fail completely when they deploy their app to production and the compiler kicks in\.  If you framework doesn't handle separate modes or have this kind of state set up it is something to keep in mind\.  The number of JIRA issues reported has gone way down since this all started but they do still trickle in which is enough to know that things aren't yet 100% reliable\.  I'm sure the plethora of Struts/WebWork/etc users available should be enough to iron out any remaining issues found but it's something to keep in mind\.

+ **Snapshot Repository** \- The current maven2 location of the OGNL development/snapshot release are all made to [http://opencomponentry\.com/repository/m2\-snapshot\-repo/](http://opencomponentry\.com/repository/m2\-snapshot\-repo/), while releases go out to ibiblio as per normal\.  If someone has a better place for these release to be made please feel free to contact jesse ( jkuhnert at gmail\.com) with accessor information / instructions\.

##Struts Tags## {#PAGE_14248}

The framework provides a tag library decoupled from the view technology\. In this section, we describe each tag in general terms, such as the attributes it supports, what the behaviors are, and so forth\. Most tags are supported in all template languages (see [JSP Tags](#PAGE_13973), [Velocity Tags](#PAGE_13950), and [FreeMarker Tags](#PAGE_14294)), but some are currently only specific to one language\. Whenever a tag doesn't have complete support for every language, it is noted on the tag's reference page\.

The types of tags can be broken in to two types: generic and UI\. Besides function and responsibility, the biggest difference between the two is that the HTML tags support _templates_  and _themes_ \. In addition to the general tag reference, we also provide examples for using these generic tags in each of the support languages\.

 (ok)  Be sure to read the [Tag Syntax](#PAGE_13927) document to learn how tag attribute syntax works\.

####FAQs####

+ _Why do the form tags put table tags around controls_ ?

+ _How can I put a String literal in a Javascript call, for instance in an onChange attribute_ ?

+ _Why won't the 'if' tag evaluate a one char string_ ?

+ _Why does FreeMarker complain that there's an error in my user\-directive when I used JSP Tag_ ?

+ _Can an action tag run another method apart from the default execute method_ ?

+ _Why didn't my action tag get executed when I have validation errors_ ?

+ _Why are request parameters appended to our hyperlinks_ ?

####Resources####

+ [Creating a UI Component in Struts 2](http://www\.vitarara\.org/cms/struts\_2\_cookbook/creating\_a\_ui\_component)^[http://www\.vitarara\.org/cms/struts\_2\_cookbook/creating\_a\_ui\_component] (Mark Menard)

+ [Struts 2 Tags](http://www\.roseindia\.net/struts/struts2/struts\-2\-tags\.shtml)^[http://www\.roseindia\.net/struts/struts2/struts\-2\-tags\.shtml] (Rose India)

####Next:####

###Ajax Tags### {#PAGE_31510}

**(\!) Dojo plugin is deprecated**


> 

> 

> The Dojo plugin will be deprecated on Struts 2\.1

> 


| 

| The easiest way to get documentation for Struts 2\.0 Dojo tag usage is to look at older Struts 2 documentation, like the [Struts 2\.0\.11 Ajax tags wiki documentation](http://struts\.apache\.org/2\.0\.11/docs/ajax\-tags\.html)^[http://struts\.apache\.org/2\.0\.11/docs/ajax\-tags\.html]\.

| 

| 

| **Please** check that documentation and the Dojo tag examples in the showcase app of the appropriate Struts 2 version before asking questions on the struts\-user mailing list\!

| 
---


| 

| **THE WIKI IS NOT VERSIONABLE** (in a practical way)\.

| 

| 

| The documentation here is for the most current Struts 2, not necessarily the most current _release_ \. We try to add version\-specific documentation notes but have undoubtedly missed some locations\.

| 

#####Description#####

To use the AJAX tags from 2\.1 on you must:

+ Include the Dojo Plugin distributed with Struts 2 in your /WEB\-INF/lib folder\.

+ Add _\<%@ taglib prefix="sx" uri="/struts\-dojo\-tags" %\>_  to your page\.

+ Include the [head](#PAGE_66757) tag on the page, which can be configured for performance or debugging purposes\.

#####Handling AJAX Responses#####

The following attributes affect the handling of all ajax responses\.

|Attribute|Default Value|Description|
|---------|-------------|-----------|
|parseContent|true|When true, Dojo will parse the response into an XHTML Document Object and traverse the nodes searching for Dojo Widget markup\.  The parse and traversal is performed prior to inserting the nodes into the DOM\. This attribute must be enabled to nest Dojo widgets (dojo tags) within responses\. There's significant processing involved to create and parse the document so switch this feature off when not required\. Note also that the response must be valid XHTML for cross\-browser support and widgets must have unique IDs\.|
|separateScripts|true|When true, Dojo will extract the \<script\> tags from the response, concatenate the extracted code into one block, create a new Function whose body is the extracted code and immediately invoke the function\. The invocation is performed after the DOM has been updated with the XHTML\. The function is executed within the scope of the widget (that is, the  **this** variable points to the widget instance)\.\
\
When false, Dojo will extract the \<script\> tags from the response, concatenate the extracted code into one block and:\
\
\*in IE:  invoke window\.execScript() on the code\
\
\*in other browsers: create a \<script\> node containing the code and insert that node into the DOM\
\
This invocation occurs after the DOM has been updated with the XHTML\. Note that scripts may not be executed if it is not valid to create a \<script\> node in the DOM at the destination\.|
|executeScripts|false|When true, Dojo will extract code from the \<script\> tags from the response and execute it based on the separateScripts value\.\
\
When false, the XHTML response is inserted into the DOM and \<script\> nodes are ignored\. |


It's possible that the updated DOM will not include \<script\> nodes even though the inline code has been executed\.

| 


Ensure the response is XHTML\-compliant (including, for example, thead and tbody tags in tables)\.

| 
 If you intend to run inline javascript:

| 
 \*Ensure the  javascript can be concatenated and executed in one block,

| 
 \*set executeScripts=true,

| 
 \*set separateScripts=true (the reliable option)

| 

#####Topics#####

Most of the AJAX tags use Dojo topics for event notification and communication between them, to learn about topics visit [Dojo's documentation](http://dojotoolkit\.org/book/dojo\-book\-0\-4/part\-5\-connecting\-pieces/event\-system/topics)^[http://dojotoolkit\.org/book/dojo\-book\-0\-4/part\-5\-connecting\-pieces/event\-system/topics]

#####Examples#####

Examples can be found on the documentation for each tag in the [UI Tag Reference](#PAGE_19738) page, for additional examples see [Ajax and JavaScript Recipes](#PAGE_56182) and the Showcase application distributed with Struts 2\.

#####Tags#####

+ [a](#PAGE_66791)

+ [autocompleter](#PAGE_46753)

+ [bind](#PAGE_66798)

+ [datetimepicker](#PAGE_14274)

+ [div](#PAGE_66929)

+ [head](#PAGE_66757)

+ [submit](#PAGE_66801)

+ _tabbedpanel_ 

+ [textarea](#PAGE_66931)

+ [tree](#PAGE_14168)

+ [treenode](#PAGE_14288)

####Ajax and JavaScript Recipes#### {#PAGE_56182}

**(\!) Dojo plugin is deprecated**


> 

> 

> The Dojo plugin will be deprecated on Struts 2\.1

> 

__Common__

All examples on this page assume the following JSP fragment is on the same page as the example\.


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>

<head>
    <sx:head />
</head>

<s:url id="url" value="/MyAction.action" />

~~~~~~~

__Requests__

__Request is triggered by a topic__



~~~~~~~

<s:submit value="Make Request" onclick="dojo.event.topic.publish('/request')" />
<sx:bind listenTopics="/request" href="%{#url}" />

~~~~~~~

__Attached to an event__



~~~~~~~

<s:submit value="Make Request" id="submit" />
<sx:bind sources="submit" events="onclick" href="%{#url}" />

~~~~~~~

__Attached to an event on multiple sources__



~~~~~~~

<s:submit value="Make Request" id="submit0" />
<s:submit value="Make Request" id="submit1" />
<sx:bind sources="submit0,submit1" events="onclick" href="%{#url}" />

~~~~~~~

__Attached to multiple events on multiple sources__



~~~~~~~

<s:textarea id="area0" />
<s:textarea id="area1" />
<sx:bind sources="area0,area1" events="onfocus,onchange" href="%{#url}" />

~~~~~~~

__Update target element with content returned from url__



~~~~~~~

<s:div id="div" />

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind targets="div" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit targets="div" value="Make Request" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a targets="div" value="Make Request" href="%{#url}" />

~~~~~~~

__Update multiple target elements with content returned from url__



~~~~~~~

<s:div id="div0" />
<s:div id="div1" />

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind targets="div0,div1" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit targets="div0,div1" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a targets="div0,div1" href="%{#url}" />

~~~~~~~

__Show indicator while request is in progress__



~~~~~~~

<img id="indicator" src="${pageContext.request.contextPath}/images/indicator.gif" style="display:none" />

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind indicator="indicator" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit indicator="indicator" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a indicator="indicator" href="%{#url}" />

~~~~~~~

__Highlight content of target with blue color, for 2 seconds__



~~~~~~~

<s:div id="div" />

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind highlightColor="blue" highlightDuration="2000" targets="div" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit highlightColor="blue" highlightDuration="2000" targets="div" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a highlightColor="blue" highlightDuration="2000" targets="div" href="%{#url}" />

~~~~~~~

__Execute JavaScript in the returned content__



~~~~~~~

<s:div id="div" />

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind executeScripts="true" targets="div" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit executeScripts="true" targets="div" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a executeScripts="true" targets="div" href="%{#url}" />

~~~~~~~

__Publish a topic before the request__



~~~~~~~

<script type="text/javascript">
dojo.event.topic.subscribe("/before", function(event, widget){
   alert('inside a topic event. before request');
   //event: event object
   //widget: widget that published the topic
});
</script>

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind beforeNotifyTopics="/before" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit beforeNotifyTopics="/before" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a beforeNotifyTopics="/before" href="%{#url}" />

~~~~~~~

__Publish a topic after the request__



~~~~~~~

<script type="text/javascript">
dojo.event.topic.subscribe("/after", function(data, request, widget){
   alert('inside a topic event. after request');
   //data : text returned from request
   //request: XMLHttpRequest object
   //widget: widget that published the topic
});
</script>

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind afterNotifyTopics="/after" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit afterNotifyTopics="/after" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a afterNotifyTopics="/after" href="%{#url}" />

~~~~~~~

__Publish a topic on error__



~~~~~~~

<script type="text/javascript">
dojo.event.topic.subscribe("/error", function(error, request, widget){
   alert('inside a topic event. on error');
   //error : error object (error.message has the error message)
   //request: XMLHttpRequest object
   //widget: widget that published the topic
});
</script>

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind errorNotifyTopics="/error" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit errorNotifyTopics="/error" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a errorNotifyTopics="/error" href="%{#url}" />

~~~~~~~

__Show a fixed error message on error__



~~~~~~~

<div id="div" />

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind errorText="Error Loading" targets="div" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit errorText="Error Loading" targets="div" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a errorText="Error Loading" targets="div" href="%{#url}" />

~~~~~~~

__Prevent a request__



~~~~~~~

<script type="text/javascript">
dojo.event.topic.subscribe("/before", function(event, widget){
   alert('I will stop this request');
   event.cancel = true;
});
</script>


<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind beforeNotifyTopics="/before" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit beforeNotifyTopics="/before" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a beforeNotifyTopics="/before" href="%{#url}" />

~~~~~~~

__Submit a form (plain form)__



~~~~~~~

<form id="form">
  <input type=textbox name="data">
</form>

<!-- With a bind tag -->
<s:submit value="Make Request" id="submit" />
<sx:bind formId="form" sources="submit" events="onclick" href="%{#url}" />

<!-- With a submit tag -->
<sx:submit formId="form" href="%{#url}" />

<!-- With an anchor tag -->
<sx:a formId="form" href="%{#url}" />

~~~~~~~

__Submit a form (using s:form tag)__



~~~~~~~

<!-- With a submit tag -->
<s:form namespace="/mynamespace" action="MyAction">
  <input type=textbox name="data">
  <sx:submit />
</s:form>

<!-- With an anchor tag -->
<s:form namespace="/mynamespace" action="MyAction">
  <input type=textbox name="data">
  <sx:a />
</s:form>

~~~~~~~

__Div__

__Loads its content after page is loaded__



~~~~~~~

<sx:div href="%{#url}">
  Initial Content
</sx:div>

~~~~~~~

__Reloads content when topic is published__



~~~~~~~

<sx:div href="%{#url}" listenTopics="/refresh">
  Initial Content
</sx:div>

<s:submit value="Refresh" onclick="dojo.event.topic.publish('/refresh')" />

~~~~~~~

__Updates its content every 2 seconds, shows indicator while loading content__



~~~~~~~

<img id="indicator" src="${pageContext.request.contextPath}/images/indicator.gif" style="display:none"/>
<sx:div href="%{#url}" updateFreq="2000">
  Initial Content
</sx:div>

~~~~~~~

__Loads its content after a delay of 2 seconds__



~~~~~~~

<sx:div href="%{#url}" delay="2000">
  Initial Content
</sx:div>

~~~~~~~

__Show some text while content is loaded__



~~~~~~~

<sx:div href="%{#url}" loadingText="reloading" showLoadingText="true">
  Initial Content
</sx:div>

~~~~~~~

__Fixed error message__



~~~~~~~

<sx:div href="noaction" errorText="Error loading content">
  Initial Content
</sx:div>

~~~~~~~

__Execute JavaScript in the returned content__



~~~~~~~

<sx:div href="%{#url}" executeScripts="true">
  Initial Content
</sx:div>

~~~~~~~

__Control refresh timer using topics__



~~~~~~~

<sx:div href="%{#url}"
        listenTopics="/refresh"
	startTimerListenTopics="/startTimer"
	stopTimerListenTopics="/stopTimer"
	updateFreq="3000">
  Initial Content
</sx:div>

<s:submit value="Refresh" onclick="dojo.event.topic.publish('/refresh')" />
<s:submit value="Start refresh timer" onclick="dojo.event.topic.publish('/startTimer')" />
<s:submit value="Stop refresh timer" onclick="dojo.event.topic.publish('/stopTimer')" />

~~~~~~~

__Date and Time picker__

__Date picker__



~~~~~~~

<sx:datetimepicker name="picker" />

~~~~~~~

__Time picker__



~~~~~~~

<sx:datetimepicker type="time" name="picker" />

~~~~~~~

__Set value from an String__



~~~~~~~

<sx:datetimepicker value="%{'2007-01-01'}" name="picker" />

~~~~~~~

__Set value from stack (value must evaluate to either a Date, Calendar, or an String that can be parsed using the formats defined in SimpleDateFormat, and RFC 3339)__



~~~~~~~

<sx:datetimepicker value="date" name="picker" />

~~~~~~~

__Set/Get value using JavaScript__



~~~~~~~

<script type="text/javascript">
  function setValue() {
     var picker = dojo.widget.byId("picker");
     
     //string value
     picker.setValue('2007-01-01');
     
     //Date value
     picker.setValue(new Date());
  }
  
  function showValue() {
     var picker = dojo.widget.byId("picker");
     
     //string value
     var stringValue = picker.getValue();
     alert(stringValue);
      
     //date value
     var dateValue = picker.getDate();
     alert(dateValue);
  }
</script>

<sx:datetimepicker id="picker" />

~~~~~~~

__Style the textbox__



~~~~~~~

<sx:datetimepicker id="picker" cssStye="background:red" cssClass="someclass"/>

~~~~~~~

__Publish topic when value changes__



~~~~~~~

<script type="text/javascript">
  dojo.event.topic.subscribe("/value", function(text, date, widget){
      alert('value changed');
      //textEntered: String entered in the textbox
      //date: JavaScript Date object with the value selected
      //widget: widget that published the topic 
  });
</script> 

<sx:datetimepicker label="Order Date" valueNotifyTopics="/value"/>

~~~~~~~

__Use other locales\.__

Locales must be specified in the sx:head tag\.

> 

~~~~~~~

<sx:head extraLocales="en-us,nl-nl,de-de" />

<sx:datetimepicker label="In German" name="dddp7" value="%{'2006-06-28'}" language="de-de" />
<sx:datetimepicker label="In Dutch"  name="dddp8" value="%{'2006-06-28'}" language="nl-nl" />

~~~~~~~

__Tabbed Panel__

__Local Tabs__



~~~~~~~

<sx:tabbedpanel id="tabContainer">
   <sx:div label="Tab 1" >
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2" >
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Local and remote tabs__



~~~~~~~

<sx:tabbedpanel id="tabContainer">
   <sx:div label="Local Tab 1" >
       Tab 1
   </sx:div>   
   <sx:div label="Remote Tab 2" href="%{#url}">
       Remote Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Fixed size (size does not adjust to current tab)__



~~~~~~~

<sx:tabbedpanel cssStyle="width: 500px; height: 300px;" doLayout="true" id="tabContainer">
   <sx:div label="Tab 1" >
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2" >
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Do not load tab 2 when page loads (it will be loaded when selected)__



~~~~~~~

<sx:tabbedpanel id="tabContainer">
   <sx:div label="Remote Tab 1" href="%{#url}">
       Remote Tab 1
   </sx:div>  
   <sx:div label="Remote Tab 2" href="%{#url}" preload="false">
       Remote Tab 1
   </sx:div>      
</sx:tabbedpanel>

~~~~~~~

__Reload tabs content when selected__



~~~~~~~

<sx:tabbedpanel id="tabContainer">
   <sx:div label="Remote Tab 1" href="%{#url}" refreshOnShow="true">
       Remote Tab 1
   </sx:div>  
   <sx:div label="Remote Tab 2" href="%{#url}" refreshOnShow="true">
       Remote Tab 2
   </sx:div>      
</sx:tabbedpanel>

~~~~~~~

__Disabled tabs__



~~~~~~~

<sx:tabbedpanel id="tabContainer">
   <sx:div label="Tab 1" >
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2" disabled="true">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Enable/Disable tabs using JavaScript__



~~~~~~~

<script type="text/javascript">
   function enableTab(param) {
      var tabContainer = dojo.widget.byId('tabContainer');
      tabContainer.enableTab(param);
   }
    
   
   function disableTab(param) {
      var tabContainer = dojo.widget.byId('tabContainer');
      tabContainer.disableTab(param);
   }
</script>

<sx:tabbedpanel id="tabContainer" id="tabContainer">
   <sx:div id="tab1" label="Tab 1">
       Local Tab 1
   </sx:div>   
   <sx:div id="tab2" label="Tab 2" disabled="true">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

<!-- By Tab Index -->
<input type="button" onclick="enableTab(1)" value="Enable Tab 2 using Index" />
<input type="button" onclick="disableTab(1)" value="Disable Tab 2 using Index" />
    
<!-- By Tab Id -->
<input type="button" onclick="enableTab('tab2')" value="Enable Tab 2 using Id" />
<input type="button" onclick="disableTab('tab2')" value="Disable Tab 2 using Id" />
   
<!-- By Widget -->
<input type="button" onclick="enableTab(dojo.widget.byId('tab2'))" value="Enable Tab 2 using widget" />
<input type="button" onclick="disableTab(dojo.widget.byId('tab2'))" value="Disable Tab 2 using widget" />

~~~~~~~

__Set Tab labels position to bottom (can be: top, right, bottom, left)__



~~~~~~~

<sx:tabbedpanel labelposition="bottom" id="tabContainer">
   <sx:div label="Tab 1" >
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2" >
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Allow tab 2 to be removed(closed)__



~~~~~~~

<sx:tabbedpanel id="tabContainer">
   <sx:div label="Tab 1" >
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2"  closable="true">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Publish topics when tab is selected__



~~~~~~~

<script type="text/javascript">
   dojo.event.topic.subscribe('/before', function(event, tab, tabContainer) {
      alert("Before selecting tab");
   });

   dojo.event.topic.subscribe('/after', function(tab, tabContainer) {
      alert("After tab was selected");
   });
</script>
<sx:tabbedpanel beforeSelectTabNotifyTopics="/before" afterSelectTabNotifyTopics="/after" id="tabContainer">
   <sx:div label="Tab 1">
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Select tab using JavaScript__



~~~~~~~

<script type="text/javascript">
   function selectTab(id) {
     var tabContainer = dojo.widget.byId("tabContainer");
     tabContainer.selectTab(id);
   }
</script>
<sx:tabbedpanel id="tabContainer">
   <sx:div label="Tab 1" id="tab1">
       Local Tab 1
   </sx:div>   
   <sx:div label="Tab 2" id="tab2">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

<input type="button" onclick="selectTab('tab1')" value="Select tab 1" />
<input type="button" onclick="selectTab('tab2')" value="Select tab 2" />

~~~~~~~

__Prevent tab 2 from being selected__



~~~~~~~

<script type="text/javascript">
   dojo.event.topic.subscribe('/before', function(event, tab, tabContainer) {
      event.cancel = tab.widgetId == "tab2" ;
   });
</script>
<sx:tabbedpanel beforeSelectTabNotifyTopics="/before" id="tabContainer">
   <sx:div id="tab1" label="Tab 1">
       Local Tab 1
   </sx:div>   
   <sx:div id="tab2" label="Tab 2">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Customize template css path (Dojo widget template css)__



~~~~~~~

<sx:tabbedpanel templateCssPath="%{#cssUrl}" id="tabContainer">
   <sx:div id="tab1" label="Tab 1">
       Local Tab 1
   </sx:div>   
   <sx:div id="tab2" label="Tab 2">
       Local Tab 2
   </sx:div>   
</sx:tabbedpanel>

~~~~~~~

__Autocompleter__

__Fixed list__



~~~~~~~

<sx:autocompleter list="{'apple','banana','grape','pear'}" />

~~~~~~~

__Set initial value__



~~~~~~~

<sx:autocompleter list="{'apple','banana','grape','pear'}" value="apple"/>

~~~~~~~

__Force valid option (restore option when focus is lost)__



~~~~~~~

<sx:autocompleter list="{'apple','banana','grape','pear'}" forceValidOption="true"/>

~~~~~~~

__Using the JSON plugin to generate the values (one of the possible ways)__

The action

**AutocompleterExample\.java**


~~~~~~~

public class AutocompleterExample extends ActionSupport {

   public Map<String, String> getOptions() {
      Map<String,String> options = new HashMap<String,String>();
      options.put("Florida", "FL");
      options.put("Alabama", "AL");

      return options;
   }
}

~~~~~~~

The mapping:

**struts\.xml**


~~~~~~~

<struts>
...
   <package name="autocompleter" namespace="/autocompleter" extends="json-default">
       <action name="getStates" class="AutocompleterExample">
           <result type="json">
               <param name="root">options</param></result>
       </action>
   </package>
...
</struts>

~~~~~~~

The JSP (fragment):


~~~~~~~

<s:url id="optionsUrl" namespace="/autocompleter" action="getStates" />

<sx:autocompleter href="%{#optionsUrl}" />

~~~~~~~

__Example action__

When a form containing an autocompleter is submitted, two values will be submitted for each autocompleter, one for the selected value, and one for its associated key\.

The action:

**MyAction\.java**


~~~~~~~

public MyAction extends ActionSupport {
    private String optionsKey;
    private String options;

    ...    
}

~~~~~~~

The JSP:


~~~~~~~

<s:form id="form">
  <sx:autocompleter name="options" label="Options" />
</s:form>

~~~~~~~

__Set initial key and value__



~~~~~~~

<s:url id="optionsUrl" namespace="/autocompleter" action="getStates" />

<sx:autocompleter href="%{#optionsUrl}" value="Florida" keyValue="FL"/>

~~~~~~~

__Change default key name__

The action:

**MyAction\.java**


~~~~~~~

public MyAction extends ActionSupport {
    private String superKey;
    private String options;

    ...    
}

~~~~~~~

The JSP:


~~~~~~~

<s:form id="form">
  <sx:autocompleter keyName="superKey" name="options" label="Options" />
</s:form>

~~~~~~~

__JSON accepted__

for this autocompleter:


~~~~~~~

<sx:autocompleter name="state" />

~~~~~~~

The following JSON will be accepted:

**Map(recommended as it is the easiest one to generate)**


~~~~~~~

{
    "Alabama" : "AL",
    "Alaska" : "AK"
}

~~~~~~~

**Array of arrays**


~~~~~~~

[
    ["Alabama", "AL"],
    ["Alaska", "AK"]
]

~~~~~~~

**Array inside object, same name as field**


~~~~~~~

{
    "state" : [
        ["Alabama","AL"],
        ["Alaska","AK"]
    ]
}     

~~~~~~~

**Map inside object, same name as field**


~~~~~~~

{
    "state" : {
        "Alabama" : "Alabama",
        "Alaska" : "AK"
    }
}    

~~~~~~~

**Array inside object, field in response starts with the name of the autocompleter("state" in this example)**


~~~~~~~

{
    "states" : [
        ["Alabama","AL"],
        ["Alaska","AK"]
    ]
}     

~~~~~~~

**No name match, use first array found, and hope for the best**


~~~~~~~

{
    "Australopithecus" : [
       ["Alabama","AL"],
       ["Alaska","AK"]
    ]
}     

~~~~~~~

__Load characters while user types (when text size \>= 3)__



~~~~~~~

<sx:autocompleter href="%{#url}" loadOnTextChange="true" loadMinimumCount="3" />

~~~~~~~

__Hide dropdown arrow__



~~~~~~~

<sx:autocompleter href="%{#url}" showDownArrow="false" />

~~~~~~~

__Limit options shown to 3__



~~~~~~~

<sx:autocompleter href="%{#url}" resultsLimit="3" />

~~~~~~~

__All matching options are shown__



~~~~~~~

<sx:autocompleter href="%{#url}" resultsLimit="-1" />

~~~~~~~

__Set dropdown height and width, in pixels__



~~~~~~~

<sx:autocompleter href="%{#url}" dropdownHeight="180" dropdownWidth="200" />

~~~~~~~

__Disable it when page is loaded__



~~~~~~~

<sx:autocompleter href="%{#url}" disabled="true" />

~~~~~~~

__Disable it/enable it using JavaScript__



~~~~~~~

<script type="text/javascript">
  function enableit() {
     var autoCompleter = dojo.widget.byId("auto");
     autoCompleter.enable();
  }

  function disableit() {
     var autoCompleter = dojo.widget.byId("auto");
     autoCompleter.disable();
  }
</script>

<sx:autocompleter id="auto" href="%{#url}" />

~~~~~~~

__Reload options when topic is published__



~~~~~~~

<sx:autocompleter listenTopics="/reload" href="%{#url}" />

~~~~~~~

__Submit form when options are loaded__



~~~~~~~

<s:form id="form">
  <input type="textbox" name="data">
</s:form>

<sx:autocompleter formId="form" href="%{#url}"  />

~~~~~~~

__Filter fields top be submitted when options are loaded (return true to include)__



~~~~~~~

<script type="text/javascript">
  function filter(input) {
     return input.name == "data1";
  }
</script>

<s:form id="form">
  <input type="textbox" name="data0">
  <input type="textbox" name="data1">
</s:form>

<sx:autocompleter formId="form" formFilter="filter" href="%{#url}" />

~~~~~~~

__Link two autocompleters, using topics__



~~~~~~~

<form id="selectForm">
   <sx:autocompleter  name="select" list="{'fruits','colors'}"  valueNotifyTopics="/changed" />
</form>

<sx:autocompleter  href="%{#url}" formId="selectForm" listenTopics="/changed" />

~~~~~~~

__Show options, but don't make suggestion (autocomple) in the textbox__



~~~~~~~

<sx:autocompleter autoComplete="false" href="%{#url}" />

~~~~~~~

__Prevent options from loading when page loads__



~~~~~~~

<sx:autocompleter preload="false" href="%{#url}" />

~~~~~~~

###Generic Tags### {#PAGE_19745}

#####Generic Tags#####

Generic tags are used for controlling the execution flow when the pages render\. These tags also allow for data extraction from places other than your action or the value stack, such as _Localization_ , JavaBeans, and including additional URLs or action executions\.

+ Control Tags provide control flow, such as 

~~~~~~~
if
~~~~~~~
, 

~~~~~~~
else
~~~~~~~
, and 

~~~~~~~
iterator
~~~~~~~
\.

+ Data Tags allow for data manipulation or creation, such as 

~~~~~~~
bean
~~~~~~~
, 

~~~~~~~
push
~~~~~~~
, and 

~~~~~~~
i18n
~~~~~~~
\.

#####Next#####

###Tag Reference### {#PAGE_19705}

__Generic Tags__

__UI Tags__

#####Next#####

####Generic Tag Reference#### {#PAGE_19735}


Struts Generic Tags control the execution flow as pages render\.

|Control Tags |\
\
+ [if](#PAGE_14179)\
\
+ [elseif](#PAGE_13964)\
\
+ [else](#PAGE_13845)\
\
+ [append](#PAGE_14241)\
\
+ [generator](#PAGE_13883)\
\
+ [iterator](#PAGE_13893)\
\
+ [merge](#PAGE_14143)\
\
+ [sort](#PAGE_14132)\
\
+ [subset](#PAGE_14071)\
| Data Tags |\
\
+ [a](#PAGE_14027)\
\
+ [action](#PAGE_14034)\
\
+ [bean](#PAGE_13979)\
\
+ [date](#PAGE_13821)\
\
+ [debug](#PAGE_13823)\
\
+ [i18n](#PAGE_13880)\
\
+ [include](#PAGE_13864)\
\
+ [param](#PAGE_13825)\
\
+ [property](#PAGE_13960)\
\
+ [push](#PAGE_14121)\
\
+ [set](#PAGE_14256)\
\
+ [text](#PAGE_14044)\
\
+ [url](#PAGE_13898)\
|
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


__Next:__

#####Control Tags##### {#PAGE_14108}

Controls tags provide the ability to manipulate collections and conditionally produce content\.



| Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

1. [if](#PAGE_14179)

2. [elseIf / elseif](#PAGE_13964)

3. [else](#PAGE_13845)

4. [append](#PAGE_14241)

5. [generator](#PAGE_13883)

6. [iterator](#PAGE_13893)

7. [merge](#PAGE_14143)

8. [sort](#PAGE_14132)

9. [subset](#PAGE_14071)

@see src/META\-INF/taglib\.tld 

__Next:__

#####a##### {#PAGE_14027}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Anchor}
~~~~~~~



| While this tag can be used with the [simple theme](#PAGE_14291), [xhtml theme](#PAGE_13834), and others, it is really designed to work best with the [ajax theme](#PAGE_14205)\. We recommend reading the _ajax a template_  documentation for more details\.

| 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/a.html}
~~~~~~~

__Usage__

To get started, use the [head](#PAGE_13997) tag and the [ajax theme](#PAGE_14205)\. See _ajax head template_  for more information\. Then look at the usage details for the _ajax a template_ \.

 

If you want to use additional parameters in your s:a the best practice is to use a s:url to create your url and then leverage this url into your s:a tag\. This is done by creating a s:url and specifying an id attribute\.\. like "testUrlId" in this example\. Then in the s:a tag reference this id in the href attribute via " %\{testUrlId\}"


~~~~~~~

<s:url var="testUrlId" namespace="/subscriber" action="customField" method="delete">
    <s:param name="customFieldDefinition.id" value="${id}"/>
</s:url>
<s:a errorText="Sorry your request had an error." preInvokeJS="confirm('Are you sure you want to delete this item?')" href="%{testUrlId}">
    <img src="<s:url value="/images/delete.gif"/>" border="none"/>
</s:a>

<img xsrc="<s:url value="/images/delete.gif"/>" border="none"/><s:a><img xsrc="<s:url value="/images/delete.gif"/>" border="none"/></s:a>

~~~~~~~

#####action##### {#PAGE_14034}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.ActionComponent}
~~~~~~~

Parameters can be passed to the action using nested [param](#PAGE_13825) tags\.

__Placement in context__

The action will not be published to the context until the whole tag is evaluated, meaning that inside the body of the tag, the action cannot be accessed, For example:


~~~~~~~

<s:action var="myAction" name="MyAction" namespace="/">
    Is "myAction" null inside the tag? <s:property value="#myAction == null" />
</s:action>
    Is "myAction" null outside the tag? <s:property value="#myAction == null" />

~~~~~~~

Will print:

Is "myAction" null inside the tag? true

Is "myAction" null outside the tag? false

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/action.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=javacode|javadoc=true|lang=java|url=org.apache.struts2.components.ActionComponent}
~~~~~~~


~~~~~~~
{snippet:id=strutsxml|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent}
~~~~~~~


~~~~~~~
{snippet:id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.ActionComponent}
~~~~~~~

#####append##### {#PAGE_14241}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.AppendIterator}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/append.html}
~~~~~~~

__Example__



~~~~~~~
{snippet:id=code|lang=java|javadoc=true|url=org.apache.struts2.components.AppendIterator}
~~~~~~~


~~~~~~~
{snippet:id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.AppendIterator}
~~~~~~~

#####bean##### {#PAGE_13979}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Bean}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/bean.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=examples|javadoc=true|lang=xml|url=org.apache.struts2.components.Bean}
~~~~~~~


~~~~~~~
{snippet:id=examplesdescription|javadoc=true|url=org.apache.struts2.components.Bean}
~~~~~~~

#####date##### {#PAGE_13821}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Date}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/date.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Date}
~~~~~~~

#####debug##### {#PAGE_13823}

Outputs the content of the Value Stack\.

#####else##### {#PAGE_13845}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Else}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/else.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Else}
~~~~~~~

#####elseif##### {#PAGE_13964}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.ElseIf}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/elseif.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ElseIf}
~~~~~~~

#####generator##### {#PAGE_13883}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.IteratorGeneratorTag}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/generator.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.IteratorGeneratorTag}
~~~~~~~

#####i18n##### {#PAGE_13880}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.I18n}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/i18n.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.I18n}
~~~~~~~

#####if##### {#PAGE_14179}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__

Perform basic condition flow\. 'If' tag could be used by itself or can be followed by zero or more 'Else if' Tags followed by zero or one 'Else' Tag\.

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/if.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=struts2/core/src/main/java/org/apache/struts2/components/If.java}
~~~~~~~

#####include##### {#PAGE_13864}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Include}
~~~~~~~

**(\!) How To access parameters**


> 

> 

> Parameters are passed as request parameters, so use the \$\{param\.ParamName\} notation to access them\. Do not use the **property** tag to access parameters in included files\.

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/include.html}
~~~~~~~

__Example__



~~~~~~~
{snippet:id=example|lang=java|javadoc=true|url=org.apache.struts2.components.Include}
~~~~~~~


~~~~~~~
{snippet:id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Include}
~~~~~~~

#####iterator##### {#PAGE_13893}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


The id attribute is deprecated in Struts 2\.1\.x, and has been replaced by the var attribute\.

| 

The begin, end and step attributes are only available from 2\.1\.7 on

> 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/iterator.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example1description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example1code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example2description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example2code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example3description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example3code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example4description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example4code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example5description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example5code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example6description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example6code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example7description|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~


~~~~~~~
{snippet:id=example7code|lang=xml|javadoc=true|url=org.apache.struts2.components.IteratorComponent}
~~~~~~~

#####merge##### {#PAGE_14143}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.MergeIterator}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/merge.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=javacode|lang=java|javadoc=true|url=org.apache.struts2.components.MergeIterator}
~~~~~~~


~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.MergeIterator}
~~~~~~~

#####param##### {#PAGE_13825}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Param}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/param.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Param}
~~~~~~~


~~~~~~~
{snippet:id=exampledescription|javadoc=true|url=org.apache.struts2.components.Param}
~~~~~~~

#####property##### {#PAGE_13960}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Property}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/property.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Property}
~~~~~~~


~~~~~~~
{snippet:id=exampledescription|lang=none|javadoc=true|url=org.apache.struts2.components.Property}
~~~~~~~

#####push##### {#PAGE_14121}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/push.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example1description|lang=none|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example2description|lang=none|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example3description|lang=none|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~


~~~~~~~
{snippet:id=example4description|lang=none|javadoc=true|url=org.apache.struts2.components.Push}
~~~~~~~

#####set##### {#PAGE_14256}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Set}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/set.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Set}
~~~~~~~

#####sort##### {#PAGE_14132}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SortIteratorTag}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|url=struts2-tags/sort.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SortIteratorTag}
~~~~~~~

#####subset##### {#PAGE_14071}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/subset.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=action|lang=java|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~


~~~~~~~
{snippet:id=example5|lang=xml|javadoc=true|url=org.apache.struts2.views.jsp.iterator.SubsetIteratorTag}
~~~~~~~

#####text##### {#PAGE_14044}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Text}
~~~~~~~

For more details on using resource bundles with Struts 2 read the _localization guide_ \.

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/text.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Text}
~~~~~~~


~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Text}
~~~~~~~

Other example


~~~~~~~

<s:text name="format.money"><s:param name="value" value="myMoneyValue"/></s:text>

~~~~~~~

where the following is in a regular (possibly locale\-specific) properties file:


~~~~~~~

format.money={0,number,currency}

~~~~~~~

For more about formatting text, see

1. [http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html](http://java.sun.com/j2se/1.4.2/docs/api/java/text/MessageFormat.html)

2. [http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html](http://java.sun.com/docs/books/tutorial/i18n/format/decimalFormat.html)

__If you wish to use i18n in your tag attributes__

This will **not** work:


~~~~~~~

<s:textfield name="lastName" label="<s:text name="person.lastName"/>" ../>

~~~~~~~

Instead, you should use the getText() method that you inherit when your Action extends XWork's ActionSupport:


~~~~~~~

<s:textfield name="lastName" label="getText('person.lastName')" ../>

~~~~~~~

#####url##### {#PAGE_13898}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


The id attribute is deprecated in Struts 2\.1\.x, and has been replaced by the var attribute\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.URL}
~~~~~~~

__Setting a default value for includeParams__

The property _struts\.url\.includeParams_  can be used to set the default value of the _includeParams_  attribute\.

**Setting the default value of includeParams**


~~~~~~~

<struts>
   ...
   <constant name="struts.url.includeParams" value="none" />
   ...
</struts>

~~~~~~~

See _Constant Configuration_  for further information\.


> 

> 

>  As of Struts 2\.1\.3 the includeParams constant defaults to "none"\. 

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/url.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.URL}
~~~~~~~

####UI Tag Reference#### {#PAGE_19738}


Struts UI Tags display data in rich and reusable HTML\.

| 

| 

| |Form Tags|\
\
+ [checkbox](#PAGE_14029)\
\
+ [checkboxlist](#PAGE_13969)\
\
+ [combobox](#PAGE_14259)\
\
+ [datetextfield](#PAGE_40506485)\
\
+ [doubleselect](#PAGE_14005)\
\
+ [head](#PAGE_13997)\
\
+ [file](#PAGE_14283)\
\
+ [form](#PAGE_14201)\
\
+ [hidden](#PAGE_14313)\
\
+ [inputtransferselect](#PAGE_17268774)\
\
+ [label](#PAGE_14167)\
\
+ [optiontransferselect](#PAGE_13943)\
\
+ [optgroup](#PAGE_14170)\
\
+ [password](#PAGE_13826)\
\
+ [radio](#PAGE_14226)\
\
+ [reset](#PAGE_13833)\
\
+ [select](#PAGE_14127)\
\
+ [submit](#PAGE_14054)\
\
+ [textarea](#PAGE_13926)\
\
+ [textfield](#PAGE_13912)\
\
+ [token](#PAGE_13998)\
\
+ [updownselect](#PAGE_13884)\
|Non\-Form UI Tags|\
\
+ [actionerror](#PAGE_14130)\
\
+ [actionmessage](#PAGE_14023)\
\
+ [component](#PAGE_14033)\
\
+ [div](#PAGE_13908)\
\
+ [fielderror](#PAGE_14151)\
|Ajax Tags|\
\
+ [a](#PAGE_66791)\
\
+ [autocompleter](#PAGE_46753)\
\
+ [bind](#PAGE_66798)\
\
+ [datetimepicker](#PAGE_14274)\
\
+ [div](#PAGE_66929)\
\
+ [head](#PAGE_66757)\
\
+ [submit](#PAGE_66801)\
\
+ [tabbedPanel](#PAGE_14222)\
\
+ [textarea](#PAGE_66931)\
\
+ [tree](#PAGE_14168)\
\
+ [treenode](#PAGE_14288)\
|
|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


| 

(light\-on) For detailed descriptions of each tag, including usage examples, see the [Tag Reference](#PAGE_19705)\.

__Next:__

#####actionerror##### {#PAGE_14130}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.ActionError}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/actionerror.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ActionError}
~~~~~~~

#####actionmessage##### {#PAGE_14023}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.ActionMessage}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/actionmessage.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ActionMessage}
~~~~~~~

#####ajax common header##### {#PAGE_66934}


To use this tag:

+ Add: _\<%@ taglib prefix="sx" uri="/struts\-dojo\-tags" %\>_  to your page\.

+ The [head](#PAGE_66757) tag must be included on the page, which can be configured for performance or debugging purposes\.

+ If the parseContent parameter for the [head](#PAGE_66757) tag is false (it is false by default), then the **id** tag is required\.


For more examples see [Ajax and JavaScript Recipes](#PAGE_56182)

| 


#####autocompleter##### {#PAGE_46753}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/autocompleter.html}
~~~~~~~

__Examples__

Get list from an action:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Uses a list:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Autocompleter that reloads its content everytime the text changes (and the length of the text is greater than 3):


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Linking two autocompleters:


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Set/Get selected values using JavaScript:


~~~~~~~
{snippet:id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Using beforeNotifyTopics:


~~~~~~~
{snippet:id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Using errorNotifyTopics:


~~~~~~~
{snippet:id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Using errorNotifyTopics:


~~~~~~~
{snippet:id=example8|lang=html|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

Using valueNotifyTopics:


~~~~~~~
{snippet:id=example9|lang=html|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java}
~~~~~~~

__Caveats__

+ The service that is producing the HTTP Response with JSON response to the Autocompleter tag must set the HTTP Header Response Content\-Type to 

~~~~~~~
text/json
~~~~~~~
\. JSON has its own MIME type, which this tag expects\.

+ Since 2\.0\.9, there is a change in the value:key order\. Now, the value **must** come before the key\.

#####bind##### {#PAGE_66798}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ \. Resulting in an "undefined" message in the content's, instead of the result of the request\.

One possible alternative is to set _showLoadingText="false"_  and set the indicator attribute to an element showing the desired loading text or image (outside the div)\.


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <s:submit id="btn" />
        <sx:bind sources="btn" events="onclick" targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/bind.html}
~~~~~~~

__Examples__

Without attaching to an event, listening to a topic (used to make an Ajax call):


~~~~~~~
{snippet:id=example0|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Attached to event 'onclick' on submit button:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Submit form:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Using beforeNotifyTopics:


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Using afterNotifyTopics and highlight:


~~~~~~~
{snippet:id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

Using errorNotifyTopics and indicator:


~~~~~~~
{snippet:id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java}
~~~~~~~

#####checkbox##### {#PAGE_14029}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Checkbox}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/checkbox.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Checkbox}
~~~~~~~

#####checkboxlist##### {#PAGE_13969}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


\{snippet:id=javadoc|javadoc=true|url=org\.apache\.struts2\.components\.ListUIBean\}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.CheckboxList}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/checkboxlist.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.CheckboxList}
~~~~~~~

#####combobox##### {#PAGE_14259}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.ComboBox}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/combobox.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ComboBox}
~~~~~~~

#####component##### {#PAGE_14033}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.GenericUIBean}
~~~~~~~

\{snippet:id=note|javadoc=true|url=org\.apache\.struts2\.components\.GenericUIBean\}

**(\!) templateDir and theme attribute**


> 

> 

> The final path to the template will be built using the _templateDir_  and _template_  attributes, like \$\{templateDir\}/\$\{theme\}/\$\{template\}\. If for example your component is under /components/html/option\.jsp, you would have to set templateDir="components", theme="html" and template="options\.jsp"\. 

> 

> 

> For any Struts tag that you use in your component, make sure that you set its templateDir="template"

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/component.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.GenericUIBean}
~~~~~~~

#####datetextfield##### {#PAGE_40506485}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.DateTextField}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/datetextfield.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DateTextField}
~~~~~~~

#####datetimepicker##### {#PAGE_14274}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/datetimepicker.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java}
~~~~~~~

Getting and getting the datetimepicker value, from JavaScript:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java}
~~~~~~~

Publish topic when value changes


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java}
~~~~~~~

#####div##### {#PAGE_13908}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Div}
~~~~~~~



| While this tag can be used with the [simple theme](#PAGE_14291), [xhtml theme](#PAGE_13834), and others, it is really designed to work best with the [ajax theme](#PAGE_14205)\. We recommend reading the _ajax div template_  documentation for more details\.

| 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/div.html}
~~~~~~~

#####dojo div##### {#PAGE_66929}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/div.html}
~~~~~~~

__Examples__

Simple div that loads its content once:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

div that reloads its content every 2 seconds, and shows an indicator while reloading:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

div that uses topics to control the timer, highlights its content in red after reload, and submits a form:


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java}
~~~~~~~

#####dojo head##### {#PAGE_66757}

__Description__


\{snippet:id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head\.java\}



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java}
~~~~~~~


> 

> 

> If you are planning to nest tags from the Dojo plugin, make sure you set parseContent="false", otherwise each request made by the inner tags will be performed twice\.

> 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java}
~~~~~~~


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java}
~~~~~~~

#####dojo textarea##### {#PAGE_66931}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TextArea.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/textarea.html}
~~~~~~~

#####doubleselect##### {#PAGE_14005}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


\{snippet:id=javadoc|javadoc=true|url=org\.apache\.struts2\.components\.DoubleListUIBean\}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleSelect}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/doubleselect.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DoubleSelect}
~~~~~~~

#####fielderror##### {#PAGE_14151}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.FieldError}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/fielderror.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.FieldError}
~~~~~~~


~~~~~~~
{snippet:id=description|javadoc=true|url=org.apache.struts2.components.FieldError}
~~~~~~~

#####file##### {#PAGE_14283}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.File}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/file.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.File}
~~~~~~~

#####form##### {#PAGE_14201}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Form}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/form.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form}
~~~~~~~

__Validation__

There are two flavours _Client Side Validation_ , depending on the theme you are using (xhtml, ajax, etc)\. If you are using the [xhtml theme](#PAGE_13834) or [css\_xhtml theme](#PAGE_14215), pure client side validation will be used\. If you are using the [ajax theme](#PAGE_14205), a special AJAX\-based validation will take place\. Read the _Client Side Validation_  docs for more information\.

#####head##### {#PAGE_13997}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Head}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/head.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Head}
~~~~~~~

#####hidden##### {#PAGE_14313}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Hidden}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/hidden.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Hidden}
~~~~~~~

#####inputtransferselect##### {#PAGE_17268774}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.InputTransferSelect}
~~~~~~~

\{snippet:id=notice|javadoc=true|url=org\.apache\.struts2\.components\.InputTransferSelect\}

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/inputtransferselect.html}
~~~~~~~

__Example__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.InputTransferSelect}
~~~~~~~

#####label##### {#PAGE_14167}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Label}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/label.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Label}
~~~~~~~


~~~~~~~
{snippet:id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Label}
~~~~~~~

#####optgroup##### {#PAGE_14170}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.OptGroup}
~~~~~~~

\{snippet:id=notice|javadoc=true|url=org\.apache\.struts2\.components\.OptGroup\}

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/optgroup.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptGroup}
~~~~~~~

#####optiontransferselect##### {#PAGE_13943}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


\{snippet:id=javadoc|javadoc=true|url=org\.apache\.struts2\.components\.DoubleListUIBean\}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect}
~~~~~~~


~~~~~~~
{snippet:id=notice|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/optiontransferselect.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect}
~~~~~~~

#####password##### {#PAGE_13826}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Password}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/password.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=exdescription|javadoc=true|lang=none|url=org.apache.struts2.components.Password}
~~~~~~~


~~~~~~~
{snippet:id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Password}
~~~~~~~

#####radio##### {#PAGE_14226}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


\{snippet:id=javadoc|javadoc=true|url=org\.apache\.struts2\.components\.ListUIBean\}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Radio}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/radio.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=exdescription|javadoc=true|url=org.apache.struts2.components.Radio}
~~~~~~~


~~~~~~~
{snippet:id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio}
~~~~~~~


~~~~~~~
{snippet:id=example_fmt|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio}
~~~~~~~

#####reset##### {#PAGE_13833}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Reset}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/reset.html}
~~~~~~~

__Examples__

__Example 1__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset}
~~~~~~~

__Example 2__



~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset}
~~~~~~~

#####select##### {#PAGE_14127}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Select}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/select.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=exnote|javadoc=true|lang=none|url=org.apache.struts2.components.Select}
~~~~~~~


~~~~~~~
{snippet:id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Select}
~~~~~~~

#####submit##### {#PAGE_14054}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Submit}
~~~~~~~



| To use method attribute (to use multiple submit buttons which direct to different action methods) you must set **struts\.enable\.DynamicMethodInvocation** to **true** but this can lead to [security vulnerability](http://www\.brucephillips\.name/blog/index\.cfm/2011/2/19/Struts\-2\-Security\-Vulnerability\-\-Dynamic\-Method\-Invocation)^[http://www\.brucephillips\.name/blog/index\.cfm/2011/2/19/Struts\-2\-Security\-Vulnerability\-\-Dynamic\-Method\-Invocation] \- use with care\! Instead you can try to use _Multiple Submit Buttons_  solution\.

| 


This tag works with all themes, but has special importance when combined with the [form](#PAGE_14201) tag in the [ajax theme](#PAGE_14205)\. Please read up on the [ajax theme](#PAGE_14205) for more information\.

| 

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/submit.html}
~~~~~~~

#####tabbedPanel##### {#PAGE_14222}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html}
~~~~~~~

__Examples__

The following is an example of a tabbedpanel and panel tag utilizing local and remote content:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java}
~~~~~~~

Use notify topics to prevent a tab from being selected:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java}
~~~~~~~

#####textarea##### {#PAGE_13926}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.TextArea}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/textarea.html}
~~~~~~~

__Example__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextArea}
~~~~~~~

#####textfield##### {#PAGE_13912}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.TextField}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/textfield.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.TextField}
~~~~~~~


~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextField}
~~~~~~~

#####token##### {#PAGE_13998}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.Token}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/token.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Token}
~~~~~~~

#####tree##### {#PAGE_14168}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/tree.html}
~~~~~~~

__Examples__

Static tree:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java}
~~~~~~~

Dynamic tree (rendered on the server):


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java}
~~~~~~~

Dynamic tree loaded with AJAX (one request is made for each node):


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java}
~~~~~~~

#####treenode##### {#PAGE_14288}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/treenode.html}
~~~~~~~

__Examples__

Update target content with html returned from an action:


~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java}
~~~~~~~

#####updownselect##### {#PAGE_13884}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 


\{snippet:id=javadoc|javadoc=true|url=org\.apache\.struts2\.components\.ListUIBean\}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=org.apache.struts2.components.UpDownSelect}
~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/updownselect.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.UpDownSelect}
~~~~~~~

####dojo anchor#### {#PAGE_66791}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ \. Resulting in an "undefined" message in the content's, instead of the result of the request\.

One possible alternative is to set _showLoadingText="false"_  and set the indicator attribute to an element showing the desired loading text or image (outside the div)\.


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <sx:a targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html}
~~~~~~~

__Examples__

Update target content with html returned from an action:


~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

Submit form(anchor inside the form):


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

Submit form(anchor outside the form):


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

Using beforeNotifyTopics:


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

Using afterNotifyTopics and highlights target:


~~~~~~~
{snippet:id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

Using errorNotifyTopics and indicator:


~~~~~~~
{snippet:id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java}
~~~~~~~

####dojo submit#### {#PAGE_66801}

__Description__



~~~~~~~
{snippet:id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ \. Resulting in an "undefined" message in the content's, instead of the result of the request\.

One possible alternative is to set _showLoadingText="false"_ (the default) and set the indicator attribute to an element showing the desired loading text or image (outside the div)\.


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <sx:submit  targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



~~~~~~~
{snippet:id=tagattributes|javadoc=false|url=struts2-tags/ajax/submit.html}
~~~~~~~

__Examples__



~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Render an image submit:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Render a button submit:


~~~~~~~
{snippet:id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Update target content with html returned from an action:


~~~~~~~
{snippet:id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Submit form(inside the form):


~~~~~~~
{snippet:id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Submit form(outside the form):


~~~~~~~
{snippet:id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Using beforeNotifyTopics:


~~~~~~~
{snippet:id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Using afterNotifyTopics and highlight target:


~~~~~~~
{snippet:id=example8|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

Using errorNotifyTopics and indicator:


~~~~~~~
{snippet:id=example9|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java}
~~~~~~~

###UI Tags### {#PAGE_19736}

Unlike _generic tags_ , UI tags do not provide much control structure or logic\. Rather, they are focussed on using data, either from your action/value stack or from the Data Tags, and displaying data in rich and reusable HTML\. All UI tags are driven by _templates_  and _themes_ \. While generic tags simply output some content directly from the tag (if there is any content to output), the UI tags defer to a template, often grouped together as a theme, to do the actual rendering\.

Template support allows UI tags to build a rich set of reusable HTML components that can be customized to fit exact requirements\. For details, see [Themes and Templates](#PAGE_14247)\.

|[Themes and Templates](#PAGE_14247)| A must\-read explanation of how themes and templates are used when rendering UI tags\. |
|-----------------------------------|----------------------------------------------------------------------------------------|
|[Form Tags](#PAGE_14230)| provide all form\-related UI output, such as _form_ , _textfield_ , and _select_ \. |
| Non Form Tags | provide all non\-form\-related UI output, such as _a_ , _div_ , and _tabbedPanel_ \. |

#####Language Specific Tag Support#####

The framework strives to support multiple development environments\. The framework does not impose a single template language\. Almost any common language can be used, and there are hooks for new languages\. By default, almost every single tag is supported in JSP, Velocity, and FreeMarker\. In each of these sections, you'll find examples and techniques for applying the generic tag reference toward your specific language or template choice\.

+ [JSP Tags](#PAGE_13973)

+ [Velocity Tags](#PAGE_13950)

+ [FreeMarker Tags](#PAGE_14294)


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

Within the form tags, there are two classes of tags: the form tag itself, and all other tags, which make up the individual form elements\. The behavior of the form tag is different than the elements enclosed within it\.

#####Next:#####

####Form Tags#### {#PAGE_14230}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works\.

| 

Within the form tags, there are two classes of tags: the form tag itself, and all other tags, which make up the individual form elements\. The behavior of the form tag is different than the elements enclosed within it\.

__Form Tag Themes__

As explained in [Themes and Templates](#PAGE_14247), the HTML Tags (which includes Form Tags) are all driven by templates\. Templates are grouped together to create themes\. The framework bundles three themes in the distribution\.

|simple|Sometimes _too_  simple|
|------|-----------------------|
|xhtml|Extends simple|(default)|
|ajax|Extends xhtml|

The predefined themes can be used "as is" or customized\.



| The xhtml theme renders out a two\-column table\. If a different layout is needed, do _not_  write your own HTML\. Create a new theme or utilize the simple theme\.

| 

__Simple theme caveats__

The downside of using the simple theme is that it doesn't support as many of the attributes that the other themes do\. For example, the 

~~~~~~~
label
~~~~~~~
 attribute does nothing in the simple theme, and the automatic display of error messages is not supported\.

__Common Attributes__

All the form tags extend the UIBean class\. This base class provides a set of common attributes, that can be grouped in to three categories: 

~~~~~~~
templated-related
~~~~~~~
, javascript\-related, and general attributes\. The individual attributes are documented on each tag's reference page\.

In addition to the common attributes, a special attribute exists for all form element tags: 

~~~~~~~
form
~~~~~~~
 (\$\{parameters\.form\})\. The 

~~~~~~~
form
~~~~~~~
 property represents the attributes used to render the form tag, such as the form's id\. In a template, the form's ID can be found by calling \$\{parameters\.form\.id\}\.

__Template\-Related Attributes__



~~~~~~~
{snippet:id=templateRelatedAttributes|javadoc=true|url=org.apache.struts2.components.UIBean}
~~~~~~~

__Javascript\-Related Attributes__



~~~~~~~
{snippet:id=javascriptRelatedAttributes|javadoc=true|url=org.apache.struts2.components.UIBean}
~~~~~~~

__Tooltip Related Attributes__



~~~~~~~
{snippet:id=tooltipattributes|javadoc=true|url=org.apache.struts2.components.UIBean}
~~~~~~~

__General Attributes__



~~~~~~~
{snippet:id=generalAttributes|javadoc=true|url=org.apache.struts2.components.UIBean}
~~~~~~~



| Some tag attributes may not be utilized by all, or any, of the templates\. For example, the form tag supports the tabindex attribute, but none of the themes render the tabindex\.

| 

__Value/Name Relationship__

In many of the tags (except for the form tag) there is a unique relationship between the 

~~~~~~~
name
~~~~~~~
 and 

~~~~~~~
value
~~~~~~~
 attributes\. The 

~~~~~~~
name
~~~~~~~
 attribute provides the name for the tag, which in turn is used as the control attribute when the form is submitted\. The value submitted is bound to the 

~~~~~~~
name
~~~~~~~
\. In most cases, the 

~~~~~~~
name
~~~~~~~
 maps to a simple JavaBean property, such as "postalCode"\. On a submit, the value would be set to the property by calling the 

~~~~~~~
setPostalCode
~~~~~~~
 mutator\.

Likewise, a form control could be populated by calling a JavaBean accessor, like 

~~~~~~~
getPostalCode
~~~~~~~
\. In the expression language, we can refer to the JavaBean property by name\. An expression like "%\{postalCode\}" would in turn call 

~~~~~~~
getPostalCode
~~~~~~~
\.


~~~~~~~
<@s.form action="updateAddress">
    <@s.textfield label="Postal Code" name="postalCode" value="%{postalCode}"/>
    ...
</@s.form>

~~~~~~~

However, since the tags imply a relationship between the 

~~~~~~~
name
~~~~~~~
 and 

~~~~~~~
value
~~~~~~~
, the 

~~~~~~~
value
~~~~~~~
 attribute is optional\. If a 

~~~~~~~
value
~~~~~~~
 is not specified, by default, the JavaBean accessor is used instead\.


~~~~~~~
<@s.form action="updateAddress">
    <@s.textfield label="Postal Code" name="postalCode"/>
    ...
</@s.form>

~~~~~~~

While most attributes are exposed to the underlying templates as the same key as the attribute (\$\{parameters\.label\}), the 

~~~~~~~
value
~~~~~~~
 attribute is not\. Instead, it can be accessed via the 

~~~~~~~
nameValue
~~~~~~~
 key (\$\{parameters\.nameValue\})\. The 

~~~~~~~
nameValue
~~~~~~~
 key indicates that the value may have been generated from the 

~~~~~~~
name
~~~~~~~
 attribute rather than explicitly defined in the 

~~~~~~~
value
~~~~~~~
 attribute\.

__ID Name Assignment__

All form tags automatically assign an ID to the control, but the ID can be overridden if needed\.

|Forms|The default ID is the action name\. For example, "updateAddress"\.|
|-----|------------------------------------------------------------------|
|Controls|The default ID is the form's name concatenated with the tag name\. For example, "updateAddress\_postalCode"\.|

__Form labelposition propagation__

When 

~~~~~~~
labelposition
~~~~~~~
 attribute was defined for 

~~~~~~~
<s:form>
~~~~~~~
 tag it will be propagated to all form elements, but if form element defines its own 

~~~~~~~
labelposition
~~~~~~~
 it will take precedence over 

~~~~~~~
<s:form>
~~~~~~~
's attribute\. Since 2\.3\.17\.

__Required Attribute__

The 

~~~~~~~
required
~~~~~~~
 attribute on many UI tags defaults to true only if you have client\-side validation enabled, and a validator is associated with that particular field\.

__Tooltip__



~~~~~~~
{snippet:id=tooltipdescription|javadoc=true|url=org.apache.struts2.components.UIBean}
~~~~~~~


~~~~~~~
{snippet:id=tooltipexample|lang=xml|javadoc=true|url=org.apache.struts2.components.UIBean}
~~~~~~~

__Next:__

####Themes and Templates#### {#PAGE_14247}

The notions of "themes" and "templates" are at the core of the HTML [Struts Tags](#PAGE_14248) provided by the framework\.

__Definitions__

| tag | A small piece of code executed from within [JSP](#PAGE_14141), [FreeMarker](#PAGE_14078), or [Velocity](#PAGE_13894)\. |
|-----|------------------------------------------------------------------------------------------------------------------------|
| template | A bit of code, usually written in [FreeMarker](#PAGE_14078), that can be rendered by certain tags (HTML tags) |
| theme | A  collection of _templates_  packaged together to provide common functionality |

(light\-on) See [Struts Tags](#PAGE_14248) for more about the HTML and other tags provided by the framework\.

__Template Basics__

|[Template Loading](#PAGE_13817)| How templates are loaded |
|-------------------------------|--------------------------|
|[Selecting Template Directory](#PAGE_14227)| How the template directories are loaded |
|[Selecting Themes](#PAGE_14016)| How you can pick a theme when writing your results |
|[Extending Themes](#PAGE_13962)| How to create your own themes based on existing themes |

__More About Themes__

|[simple theme](#PAGE_14291)| A minimal theme with no "bells and whistles" |
|---------------------------|----------------------------------------------|
|[xhtml theme](#PAGE_13834)| The default theme that uses common HTML practices |
|[css\_xhtml theme](#PAGE_14215)| The [xhtml theme](#PAGE_13834) re\-implemented using strictly CSS for layout |
|[ajax theme](#PAGE_14205)| A theme based on the [xhtml theme](#PAGE_13834) that provides advanced AJAX features |

__Next:__

#####Extending Themes##### {#PAGE_13962}


Most often, an application may just need to override a template (see [Template Loading](#PAGE_13817)) so that a certain control renders differently\. Or, an application may need to add a new template to an existing theme\. Other times, you might want to create an entirely new theme, perhaps because you are building a rich set of unique and reusable templates for your organization\.

There are three ways to create new themes:

+ Create a new theme from scratch (**hard\!**)

+ Wrap an existing theme

+ Extend an existing theme

__Creating a New Theme from Scratch__


It's probably never a good idea to create a new theme from scratch\. Instead, use the [simple theme](#PAGE_14291) as a starting point\. The simple theme provides just enough foundation to make it easy to create new controls by extending or wrapping the basic controls\. Before starting a new theme, be sure to review the source templates for all of the provided themes\. The existing themes are your best guide to creating new themes\.

| 

__Wrapping an Existing Theme__

The [xhtml theme](#PAGE_13834) provides several good examples of the "wrapping" technique\. The [simple theme](#PAGE_14291) renders the basic control\. The xhtml theme "dresses up" many of the controls by adding a header and footer\.

**Wrapping a control**


~~~~~~~
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlheader.ftl" />
<#include "/${parameters.templateDir}/simple/xxx.ftl" />
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlfooter.ftl" />

~~~~~~~

Wrapping is a great way to augment the basic HTML elements provided by the simple theme\.

__Extending an Existing Theme__

One benefit of object\-orientated programming is that it lets us "design by difference\." We can extend an object and code only the behaviour that changes\. Themes provide a similar capability\. The subdirectory that hosts a theme can contain a 

~~~~~~~
theme.properties
~~~~~~~
 file\. A 

~~~~~~~
parent
~~~~~~~
 entry can be added to the property file to designate a theme to extend\. The [ajax theme](#PAGE_14205) extends the [xhtml theme](#PAGE_13834) using this technique\.

**/template/ajax/theme\.properties**


~~~~~~~
parent = xhtml

~~~~~~~

An extended theme does not need to implement every single template that the [Struts Tags](#PAGE_14248) expect\. It only needs to implement the templates that change\. The other templates are loaded from the parent template\.

__Special parameters__

[UIBean](http://struts\.apache\.org/development/2\.x/struts2\-core/apidocs/org/apache/struts2/components/UIBean\.html)^[http://struts\.apache\.org/development/2\.x/struts2\-core/apidocs/org/apache/struts2/components/UIBean\.html] provides few special parameters which can be used to build a new template (they are already used in 

~~~~~~~
xhtml
~~~~~~~
 and 

~~~~~~~
css_xhtml
~~~~~~~
 theme):

+ 

~~~~~~~
templateDir
~~~~~~~
 \- current value of templateDir parameter, see [Selecting Template Directory](#PAGE_14227)

+ 

~~~~~~~
theme
~~~~~~~
 \- used theme, see [Selecting Themes](#PAGE_14016)

+ 

~~~~~~~
template
~~~~~~~
 \- name of the template file to use (i\.e\. text)

+ 

~~~~~~~
themeExpansionToken
~~~~~~~
 \- special token used to indicate to search for a template also in parent theme (when used with 

~~~~~~~
<#include />
~~~~~~~
 directive)

+ 

~~~~~~~
expandTheme
~~~~~~~
 \- tells internal template loader mechanism to try load template from current theme and then from parent theme (and parent theme, and so on)

Using 

~~~~~~~
expandTheme
~~~~~~~
 parameter allows to override only some parts of the theme's templates, e\.g\. css\.ftl\. You can define a new theme (set theme\.properties) and override just single file\.

\$\{parameters\.expandTheme\} is a recurrence which tells ThemeManager to load template from current theme and then from parent theme (defined in theme\.properties) and so on\.

Please also notice that the ThemeManager builds list of possible templates based on current theme and inherited themes (/template/custom/textarea\.ftl, /template/xhtml/textarea\.ftl, /template/simple/textarea\.ftl)\. This is also true for templates which are loaded via \$\{parameters\.expandTheme\}\.

 (ok)  See also example _Struts 2 Themes_  or [Creating a Theme in Struts 2](http://www\.vitarara\.org/cms/struts\_2\_cookbook/creating\_a\_theme)^[http://www\.vitarara\.org/cms/struts\_2\_cookbook/creating\_a\_theme] (Mark Menard)

#####Selecting Template Directory##### {#PAGE_14227}

Template directory can be selected using several different rules, in this order:

1. The 

~~~~~~~
templateDir
~~~~~~~
 attribute on the specific tag

2. The page-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

3. The request-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

4. The session-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

5. The application-scoped attribute named 

~~~~~~~
templateDir
~~~~~~~

6. The 

~~~~~~~
struts.ui.templateDir
~~~~~~~
 property in _struts.properties_  (defaults to _template_ )

__Tips__

+ To change the template directory for the entire application, modify the _struts\.properties_ \.

#####Selecting Themes##### {#PAGE_14016}

Themes can be selected using several different rules, in this order:

1. The 

~~~~~~~
theme
~~~~~~~
 attribute on the specific tag

2. The 

~~~~~~~
theme
~~~~~~~
 attribute on a tag's surrounding [form](#PAGE_14201) tag

3. The page-scoped attribute named "theme"

4. The request-scoped attribute named "theme"

5. The session-scoped attribute named "theme"

6. The application-scoped attribute named "theme"

7. The 

~~~~~~~
struts.ui.theme
~~~~~~~
 property in _struts.properties_  (defaults to _xhtml_ )

See "_Can I change theme on a per\-page basis_ " page for using scoped "theme" attribute\.

__Tips__

+ To override an entire form's theme, change the "theme" attribute of the form\. (Convenient for using the [ajax theme](#PAGE_14205) for specific forms, for example\.)

+ To support user\-selected themes, set the theme in the user's session\.

+ To change the theme for the entire application, modify the _struts\.properties_ \.

#####Template Loading##### {#PAGE_13817}


Templates are loaded first by searching the application and then by searching the classpath\. If a template needs to be overridden, an edited copy can be placed in the application, so that is found first\.

**(i) One for all**


> 

> 

> FreeMarker is the default templating engine\. The FreeMarker templates are used regardless of what format the view may use\. Internally, the JSP, FTL, Velocity tags are all rendered using FreeMarker\.

> 

__Template and Themes__

Templates are loaded based the template directory and theme name (see [Selecting Themes](#PAGE_14016))\. The template directory is defined by the 

~~~~~~~
struts.ui.templateDir
~~~~~~~
 property in _struts\.properties_  (defaults to 

~~~~~~~
template
~~~~~~~
)\. If a tag is using the 

~~~~~~~
xhtml
~~~~~~~
 theme, the following two locations will be searched (in this order):

|In the application|/template/xhtml/template\.ftl|
|------------------|-----------------------------|
|In the classpath|/template/xhtml/template\.ftl|

 (\!)  For performance reasons, you may want to prefer the first location, although the second one is more flexible\. See _Performance Tuning_  for a discussion on this topic\.

__Overriding Templates__

The default templates provided in the 

~~~~~~~
struts-core.jar
~~~~~~~
 should suit the needs of many applications\. However, if a template needs to be modified, it's easy to plug in a new version\. Extract the template you need to change from the 

~~~~~~~
struts-core.jar
~~~~~~~
, make the modifications, and save the updated copy to 

~~~~~~~
/template/$theme/$template.ftl
~~~~~~~
\. If you are using the xhmtl theme and need to change how the select tags render, edit that template and save it to 

~~~~~~~
/template/xhtml/select.ftl
~~~~~~~
\.

 (\!)  It is easier and better to edit and override an existing template than provide a new one of your own\.

__Altering Template Loading Behaviour__

It is possible to load template from other locations, like the file system or a URL\. Loading templates from alternate locations can be useful not only for tags, but for custom results\. For details, see the [FreeMarker](#PAGE_14078) documentation and consult the section on extending the FreeMarkerManager\.

__Alternative Template Engines__

The framework provides for template rendering engines other than FreeMarker\. (Though, there is rarely a need to use another system\!)

**(\!) Don't try this at home\!**


> 

> 

> Alternative template engines are best left to advanced users with special needs\!

> 

The framework supports three template engines, which can be controlled by the 

~~~~~~~
struts.ui.templateSuffix
~~~~~~~
 in _struts\.properties_ \.

|ftl (default)|[FreeMarker](#PAGE_14078)\-based template engine|
|-------------|------------------------------------------------|
|vm|[Velocity](#PAGE_13894)\-based template engine|
|jsp|[JSP](#PAGE_14141)\-based template engine|

The only set of templates and themes provided in the distribution is for FreeMarker\. In order to use another template engine, you must provide your own template and theme for that engine\.



| Don't feel that you need to rewrite the templates to match your view format\. If you need to customize the template, try copying and modifying the FreeMarker template first\. Most changes should be obvious\.

| 

#####ajax theme##### {#PAGE_14205}


The ajax theme is deprecated\!

| 

The ajax theme extends the [xhtml theme](#PAGE_13834) with AJAX features\. The theme uses the popular DOJO AJAX/JavaScript toolkit\. AJAX features include:

+ _AJAX Client Side Validation_ 

+ Remote [form](#PAGE_14201) submission support (works with the [submit](#PAGE_14054) tag as well)

+ An advanced [div](#PAGE_13908) template that provides dynamic reloading of partial HTML

+ An advanced [a](#PAGE_14027) template that provides the ability to load and evaluate JavaScript remotely

+ An AJAX\-only [tabbedPanel](#PAGE_14222) implementation

+ A rich pub\-sub event model

+ Interactive autocomplete tag

 (ok)  See also: _Ajax tags_ 

__Browser Compatibility__

AJAX (as a technology) uses a browser\-side scripting component that varies between browers (and sometimes versions)\. To hide those differences from the developer, we utilize the dojo toolkit ([http://www\.dojotoolkit\.org](http://www\.dojotoolkit\.org))\. Several browsers are supported by dojo, and any UI's created with the ajax theme should act the same way for supported browsers\. The supported browsers are:

+ IE 5\.5\+

+ FF 1\.0\+

+ Latest Safari (on up\-to\-date OS versions)

+ Latest Opera

+ Latest Konqueror

__Extending the AJAX Theme__

The wrapping technique utilized by the ajax theme is much like [xhtml theme](#PAGE_13834), but the 

~~~~~~~
controlheader.ftl
~~~~~~~
 is a wee bit different\.


~~~~~~~

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

~~~~~~~

The header provides for _AJAX Client Side Validation_  by checking if the 

~~~~~~~
validate
~~~~~~~
 attribute is set to true\. If it is, a validation request is made on each 

~~~~~~~
onblur
~~~~~~~
 event for a HTML [Struts Tags](#PAGE_14248)\. Some people don't like the 

~~~~~~~
onblur
~~~~~~~
 behavior; they would rather a more advanced timer (say, 200ms) be kicked off after every keystroke\. You can override this template and provide that type of behavior if you would like\.

__Special Interest__

Three ajax\_xhtml templates of special interest are 

~~~~~~~
head
~~~~~~~
, 

~~~~~~~
div
~~~~~~~
, and 

~~~~~~~
a
~~~~~~~
\.



| Especially with the ajax theme, it is important to use the [head](#PAGE_13997) tag\. (See the _ajax head template_  for more information\.) Without it, AJAX support may not be set up properly\.

| 

+ _ajax head template_ 

+ _ajax div template_ 

+ _ajax a template_ 

 (ok)  In addition to these templates, be familiar with the _ajax event system_  provided by the framework and Dojo\.

__ajax a template__


The ajax theme is experimental\. Feedback is appreciated\.

| 

The ajax a template is used to make asynchronous calls to the server when the user clicks on the a href link\.  It is useful when you need to communicate information back to the application from the UI, without requiring the entire page to be re\-rendered\.  An example would be removing an item from a list\.

The _preInvokeJS_  attribute is used to determine whether the URL specified should be called or not, and must contain Javascript that returns _true_  or _false_ \.  If you want to call a JavaScript function, use the format preInvokeJS='yourMethodName(data,type)'\. An example would be to show a confirm dialog to the user to double check whether they want to remove a user from a list\.

**Remember**: the content returned by the _href_  attribute must be JavaScript\. That JavaScript will then be evaluated within the webpage\. If you only wish to publish an event to the topic specified, then simply return no result (or NONE) from your action and utilize the _notifyTopics_  attribute to specific the topic names\.

For an example of the interaction between the [div](#PAGE_13908) tag and the [a](#PAGE_14027) tag using the topic pub/sub model, see the examples in the _ajax div template_ \.

__ajax div template__


The Ajax theme is experimental\. Feedback is appreciated\.

| 

The ajax [div](#PAGE_13908) template provides a much more interesting div rendering option that the other themes do\. Rather than simply rendering a 

~~~~~~~
<div>
~~~~~~~
 tag, this template relies on advanced AJAX features provided by the [Dojo Toolkit](http://dojotoolkit\.org)^[http://dojotoolkit\.org]\. While the [div](#PAGE_13908) tag could be used outside of the [ajax theme](#PAGE_14205), it is usually not very useful\. See the [div](#PAGE_13908) tag for more information on what features are provided\.

__Features__

The remote div has a few features, some of which can be combined with the [a](#PAGE_14027) tag and the _ajax a template_ \. These uses are:

+ Retrieve remote data

+ Initialize the div with content before the remote data is retrieved

+ Display appropriate error and loading messages

+ Refresh data on a timed cycle

+ Listen for events and refresh data

+ JavaScript control support

__Retrieve Remote Data__

The simplest way to use the div tag is to provide an _href_  attribute\. For example:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"/>

~~~~~~~

What this does after the HTML page is completely loaded, the specified URL will be retrieved asynchronously in the browser\. The entire contents returned by that URL will be injected in to the div\.

__Initializing the Div__

Because the remote data isn't loaded immediately, it is sometimes useful to have some placeholder content that exists before the remote data is retrieved\. The content is essentially just the body of the div element\. For example:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239">
    Placeholder...
</saf:div>

~~~~~~~

If you wish to load more complex initial data, you can use the [action](#PAGE_14034) tag and the _executeResult_  attribute:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239">
    <ww:action id="weather" name="weatherBean" executeResult="true">
        <ww:param name="zip" value="97239"/>
    </ww:action>
</saf:div>

~~~~~~~

__Loading and Error Messages__

If you'd like to display special messages when the data is being retrieved or when the data cannot be retrieved, you can use the _errorText_  and _loadingText_  attributes:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"
        loadingText="Loading weather information..."
        errorText="Unable to contact weather server">
    Placeholder...
</saf:div>

~~~~~~~

__Refresh Timers__

Another feature this div template provides is the ability to refresh data on a timed basis\. Using the _updateFreq_  and the _delay_ attributes, you can specify how often the timer goes off and when the timer starts (times in milliseconds)\. For example, the following will update every minute after a two second delay:


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"
        loadingText="Loading weather information..."
        errorText="Unable to contact weather server">
        delay="2000"
        updateFreq="60000"
    Placeholder...
</saf:div>

~~~~~~~

__Listening for Events__

The [a](#PAGE_14027) tag (specifically the _ajax a template_ ) and the div tag support an _ajax event system_ , providing the ability to broadcast events to topics\. You can specify the **topics** to listen to using a comma separated list in the _listenTopics_  attribute\. What this means is that when a topic is published, usually through the _ajax a template_ , the URL specified in the _href_  attribute will be re\-requested\.


~~~~~~~

<saf:div theme="ajax" id="weather" href="http://www.weather.com/weather?zip=97239"
        loadingText="Loading weather information..."
        errorText="Unable to contact weather server"
        listenTopics="weather_topic,some_topic">
    Placeholder...
</saf:div>
<saf:a id="link1"
      theme="ajax"
      href="refreshWeather.action"
      notifyTopics="weather_topic,other_topic"
      errorText="An Error ocurred">Refresh</saf:a>

~~~~~~~

__JavaScript Support__

There are also javascript functions to refresh the content and stop/start the refreshing of the component\. For the remote div with the component id "remotediv1":

To start refreshing use the javascript:


~~~~~~~

remotediv1.startTimer();

~~~~~~~

To stop refreshing use the javascript:


~~~~~~~

remotediv1.stopTimer();

~~~~~~~

To refresh the content use the javascript:


~~~~~~~

remotediv1.refresh();

~~~~~~~

__JavaScript Examples:__

To further illustrate these concepts here is an example\. Say you want to change the url of a div at runtime via javascript\. Here is what you need to do:

What you will need to do is add a JS function that listens to a JS event that publishes the id from the select box that was selected\.  It will modify the URL for the div (adding the id so the correct data is obtained) and then bind() the AJAX div so it refreshes\.


~~~~~~~

<saf:head theme="ajax" />

<script type="text/javascript">
    function updateReports(id) {
       var reportDiv= window['reportDivId'];
       reportDiv.href = '/../reportListRemote.action?selectedId='+id;
       reportDiv.refresh();
    }
    dojo.event.topic.getTopic("updateReportsListTopic").subscribe(null, "updateReports");
</script>

<form ... >
<saf:select .... onchange="javascript: dojo.event.topic.publish("updateReportsListTopic", this.value); " />

<saf:div id="reportDivId" theme="ajax" href="/.../reportListRemote.action" >
  Loading reports...
</saf:div>
</form>

~~~~~~~

__ajax event system__

As you may have seen with the _ajax div template_  and _ajax a template_ , the framework and Dojo provide a nice way to subscribe and notify of topics from within the browser\. A benifit of using Dojo as the basis of many of these components is being able to loosely couple UI components\.  There are two attributes of importance: 

~~~~~~~
listenTopics
~~~~~~~
 and 

~~~~~~~
notifyTopics
~~~~~~~
\.

+ If a component has a 

~~~~~~~
notifyTopics
~~~~~~~
 attribute, then after the processing has been completed a message with be published to the topic names supplied as a value (comma delimited)\.

+ If a component has a 

~~~~~~~
listenTopics
~~~~~~~
 attribute, then when a message is published to the topic names supplied as a value (comma delimited), the component will perform custom tag\-specific logic ( i\.e a DIV tag will re\-fresh its content)\.

As well as this, you can publish and subscribe to topic names with javascript code\.  To publish to the 

~~~~~~~
topic_name
~~~~~~~
 topic:


~~~~~~~

dojo.event.topic.publish("topic_name", "content");

~~~~~~~

The topic\_name attribute is required, the content attribute is not and most elements are triggered without having this attribute\. See the _ajax div template_  for an example of this type of interaction\.

To subscribe to the _topic\_name_  topic:


~~~~~~~

function doSomethingWithEvent(data) {
...
}

dojo.event.topic.getTopic("topic_name").subscribe(null, "doSomethingWithEvent");

~~~~~~~

The 

~~~~~~~
subscribe
~~~~~~~
 method takes 2 parameters, the first is the JavaScript object variable (or null if the function is not from an object) and the second is the name of the function to call when an event is recieved on the topic\.

__ajax head template__

The ajax [head](#PAGE_13997) template builds upon the _xhtml head template_  by providing additional JavaScript includes for the [Dojo Toolkit](http://dojotoolkit\.org)^[http://dojotoolkit\.org], which is used by the _ajax a template_ , _ajax div template_  , and the _ajax tabbedPanel template_ \. It is required to use this tag, 

~~~~~~~
<ww:head theme="ajax"/>
~~~~~~~
, in your HTML 

~~~~~~~
<head>
~~~~~~~
 block if you wish to use AJAX feature\. The contents of **head\.ftl** are:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/plugins/dojo/src/main/resources/template/ajax/head.ftl}
~~~~~~~



| If you are having trouble getting the AJAX theme to work, you should include the above JavaScript in your page manually, changing "isDebug: false" to "isDebug: true"\.  This will log out debugging information directly to the screen\.

| 

Note that Dojo is configured to use the same character encoding specified in _struts\.properties_ , typically UTF\-8\. For a simple example of how to use the [head](#PAGE_13997) tag with the AJAX theme, simply do the following in your HTML:


~~~~~~~
{snippet:id=common-include|lang=xml|url=struts2/apps/showcase/src/main/webapp/ajax/commonInclude.jsp}
~~~~~~~


> 

> 

> The above sample is from Struts trunk; for 2\.0\.6 you should use \<s:head debug="true"/\>\.

> 

__ajax tabbedPanel template__

TODO: Describe the Ajax TabbedPanel template

__ajax submit template__

TODO: Describe the Ajax Submit template

#####css\_xhtml theme##### {#PAGE_14215}

The css\_xhtml theme provides all the basics that the [simple theme](#PAGE_14291) provides and adds several features\.

+ Standard two\-column CSS\-based layout, using 

~~~~~~~
<div>
~~~~~~~
 for the HTML [Struts Tags](#PAGE_14248) ([form](#PAGE_14201), [textfield](#PAGE_13912), [select](#PAGE_14127), etc)

+ Labels for each of the HTML [Struts Tags](#PAGE_14248), placed according to the CSS stylesheet

+ _Validation_  and error reporting

+ _Pure JavaScript Client Side Validation_  using 100% JavaScript on the browser

__Wrapping the Simple Theme__

The xhtml theme uses the "wrapping" technique described by [Extending Themes](#PAGE_13962)\. Let's look at how the HTML tags are wrapped by a standard header and footer\. For example, in the [textfield](#PAGE_13912) template, 

~~~~~~~
text.ftl
~~~~~~~
, the 

~~~~~~~
controlheader.ftl
~~~~~~~
 and 

~~~~~~~
controlfooter.ftl
~~~~~~~
 templates are wrapped around the simple template\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/simple/text.ftl}
~~~~~~~

__CSS XHTML theme header__

The header used by the HTML tags in the css\_xhtml theme is complicated\. Unlike the [xhtml theme](#PAGE_13834), the CSS theme does not use a 

~~~~~~~
labelposition
~~~~~~~
 attribute\. Instead, the label position is defined by CSS rules\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/controlheader.ftl}
~~~~~~~

Note that the 

~~~~~~~
fieldErrors
~~~~~~~
, usually caused by _Validation_ , are displayed in a 

~~~~~~~
div
~~~~~~~
 block before the element is displayed\.

__CSS XHTML theme footer__

And the 

~~~~~~~
controlfooter.ftl
~~~~~~~
 contents:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/controlfooter.ftl}
~~~~~~~

__Special Interest__

Two css\_xhtml templates of special interest are 

~~~~~~~
head
~~~~~~~
 and 

~~~~~~~
form
~~~~~~~
\.

__Head template__

The css\_xhtml [head](#PAGE_13997) template is similar to the xhtml head template\. The difference is that CSS is used to provide the layout\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/head.ftl}
~~~~~~~

The head includes a style sheet\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/styles.css}
~~~~~~~

__Form template__

The css\_xhtml [form](#PAGE_14201) template is almost exactly like the _xhtml form template_ , including support for _Pure JavaScript Client Side Validation_ \. The difference is that instead of printing out an opening and closing 

~~~~~~~
<table>
~~~~~~~
 element, there are no elements\. Instead, the CSS rules for the individual HTML tags are assumed to handle all display logic\. However, as noted, client\-side validation is still supported\.

__css\_xhtml form template__

The css\_xhtml [form](#PAGE_14201) template is almost exactly like the _xhtml form template_ , including support for _Pure JavaScript Client Side Validation_ \. The only difference is that instead of printing out an opening and closing 

~~~~~~~
<table>
~~~~~~~
 element, there are no elements\. Instead, the CSS rules for the individual HTML tags are assumed to handle all dislay logic\. However, as noted, client side validation is still supported\.

__css\_xhtml head template__

The css\_xhtml [head](#PAGE_13997) template is very similar to the _xhtml head template_ \. The only difference is that CSS that is included is specifically designed to provide the layout for the [css\_xhtml theme](#PAGE_14215)\. The contents of **head\.ftl** are:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/head.ftl}
~~~~~~~

The contents of **styles\.css** are:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/css_xhtml/styles.css}
~~~~~~~

#####simple theme##### {#PAGE_14291}

The simple theme renders "bare bones" HTML elements\. The simple theme is most often used as a starting point for other themes\. (See [Extending Themes](#PAGE_13962) for more\.)

For example, the [textfield](#PAGE_13912) tag renders the HTML 

~~~~~~~
<input/>
~~~~~~~
 tag without a label, validation, error reporting, or any other formatting or functionality\.



| Both the [xhtml theme](#PAGE_13834) and [css\_xhtml theme](#PAGE_14215) extend the simple theme\. Look to them for examples of how to build on the foundation laid by the simple theme\.

| 

__Head Tag__

The simple theme [head](#PAGE_13997) template prints out a javascript include required for the [datetimepicker](#PAGE_14274) tag to render properly\.

__simple head template__

The [simple theme](#PAGE_14291)[head](#PAGE_13997) template only does one thing: it loads the minimal Ajax/Dojo support so that tags can import Dojo widgets easily\.

The source of the simple head\.ftl template is:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/simple/head.ftl}
~~~~~~~

#####xhtml theme##### {#PAGE_13834}

The xhtml provides all the basics that the [simple theme](#PAGE_14291) provides and adds several features\.

+ Standard two\-column table layout for the HTML [Struts Tags](#PAGE_14248) ([form](#PAGE_14201), [textfield](#PAGE_13912), [select](#PAGE_14127), and so forth)

+ Labels for each of the HTML [Struts Tags](#PAGE_14248) on the left hand side (or top, depending on the 

~~~~~~~
labelposition
~~~~~~~
 attribute)

+ _Validation_  and error reporting

+ _Pure JavaScript Client Side Validation_  using 100% JavaScript on the browser

__Wrapping the Simple Theme__

The xhtml theme uses the "wrapping" technique described by [Extending Themes](#PAGE_13962)\. Let's look at how the HTML tags are wrapped by a standard header and footer\. For example, in the 

~~~~~~~
text.ftl
~~~~~~~
 template, the 

~~~~~~~
controlheader.ftl
~~~~~~~
 and 

~~~~~~~
controlfooter.ftl
~~~~~~~
 templates are wrapped around the simple template\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/text.ftl}
~~~~~~~

 (?)  The 

~~~~~~~
controlheader.ftl
~~~~~~~
 is referenced using \$\{parameters\.theme\} so that the code can be reused by the [ajax theme](#PAGE_14205)\.

__XHTML Theme Header__

Now let's look at the 

~~~~~~~
controlheader.ftl
~~~~~~~
 and 

~~~~~~~
controlheader-core.ftl
~~~~~~~
\. Again, these are split up for easy re\-use with the [ajax theme](#PAGE_14205)) contents:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/controlheader.ftl}
~~~~~~~


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/controlheader-core.ftl}
~~~~~~~

The header used by the HTML tags in the xhtml theme is complicated\. However, a close look reveals that the logic produces two behaviors: either a two\-column format or a two\-row format\. Generally the two\-column approach is what we want, so that is the default option\. To use the two\-row approach, change the 

~~~~~~~
labelposition
~~~~~~~
 parameter to 

~~~~~~~
top
~~~~~~~
\.



| The fieldErrors, usually caused by _Validation_ , are printed out as a row above the HTML form element\. Some people prefer that the errors display elsewhere, such as in a third column\. If you wish to place these elsehwere, overriding the headers is easy, allowing you to continue to use the other features provided by this theme\. See [Template Loading](#PAGE_13817) for more information on how to do this\.

| 

__XHTML Theme Footer__

The primary objective of 

~~~~~~~
controlfooter.ftl
~~~~~~~
 is to close the table\. But, before the table closes, the template checks for an 

~~~~~~~
after
~~~~~~~
 parameter\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/controlfooter.ftl}
~~~~~~~

While "after" isn't an attribute supported by any of the [Struts Tags](#PAGE_14248), if you are using [FreeMarker Tags](#PAGE_14294), [Velocity Tags](#PAGE_13950), or the [param](#PAGE_13825) tag in any template language, you can add an 

~~~~~~~
after
~~~~~~~
 parameter to place any content you like after the [simple theme](#PAGE_14291) template renders\. The 

~~~~~~~
after
~~~~~~~
 attribute makes it easier to fine\-tune HTML forms for your specific environment\.

__Special Interest__

Two xhtml templates of special interest are 

~~~~~~~
head
~~~~~~~
 and 

~~~~~~~
form
~~~~~~~
\.

__head template__

The xhtml [head](#PAGE_13997) template extends the _simple head template_  and provides an additional CSS that helps render the  form elements\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/head.ftl}
~~~~~~~

The head template imports a style sheet\.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/styles.css}
~~~~~~~

__form template__

The xhtml form template sets up the wrapping table around all the other  form elements\. In addition to creating this wrapping table, the opening and closing templates also, if the 

~~~~~~~
validate
~~~~~~~
 parameter is set to true, enable _Pure JavaScript Client Side Validation_ \.


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form.ftl}
~~~~~~~

The closing template, 

~~~~~~~
form-close.ftl*
~~~~~~~
:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form-close.ftl}
~~~~~~~

__xhtml form template__

The xhtml form template sets up the wrapping table around all the other [xhtml theme](#PAGE_13834) form elements\. In addition to creating this wrapping table, the opening and closing templates also, if the _validate_  parameter is set to true, enable _Pure JavaScript Client Side Validation_ \. See the **form\.ftl** contents:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form.ftl}
~~~~~~~

The closing template, **form\-close\.ftl**:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/core/src/main/resources/template/xhtml/form-close.ftl}
~~~~~~~

__xhtml head template__

The xhtml [head](#PAGE_13997) template extends the _simple head template_  and provides an additional CSS that helps render the [xhtml theme](#PAGE_13834) form elements\. The contents of **head\.ftl** are:


~~~~~~~
{snippet:id=all|lang=xml|url=webwork/src/java/template/xhtml/head.ftl}
~~~~~~~

The contents of **styles\.css** are:


~~~~~~~
{snippet:id=all|lang=xml|url=webwork/src/java/template/xhtml/styles.css}
~~~~~~~

##Tag Syntax## {#PAGE_13927}

The tags are designed to display dynamic data\. To create a input field that displays the property "postalCode", we'd pass the String "postalCode" to the textfield tag\.

**Creating a dynamic input field**


~~~~~~~

<s:textfield name="postalCode"/>

~~~~~~~

If there is a "postalCode" property on the value stack, its value will be set to the input field\. When the field is submitted back to the framework, the value of the control will be set back to the "postalCode" property\.

Sometimes, we want to pass the dynamic data to a tag\. For example, we might want to display a label with the input field, and we might want to obtain the label from the application's messages resources\. Accordingly, the framework will parse expressions found in the tag attributes, so that we can merge dynamic data into the tag attributes at runtime\. The expression escape sequence is "%\{ \.\.\. \}"\.  Any text embedded in the escape sequence is evalulated as an expression\.

**Using an expression to set the label**


~~~~~~~

<s:textfield key="postalCode.label" name="postalCode"/>

~~~~~~~

The expression language ([OGNL](#PAGE_14198)) lets us call methods and evaluate properties\. The method 

~~~~~~~
getText
~~~~~~~
 is provided by ActionSupport, which is the base class for most Actions\. Since the Action is on the stack, we can call any of its methods from an expression, including 

~~~~~~~
getText
~~~~~~~
\.

####Non\-String Attributes####

The HTTP protocol is text\-based, but some tags have non\-String attribute types, like 

~~~~~~~
bool
~~~~~~~
 or 

~~~~~~~
int
~~~~~~~
\. To make using non\-String attributes intuitative, the framework evaulates **all** non\-String attributes as an expression\. In this case, you do not need to use the escape notation\. (But, if you do anyway , the framework will just strip it off\.)

**Evaluating booleans**


~~~~~~~

<s:select key="state.label" name="state" multiple="true"/>

~~~~~~~

Since the attribute 

~~~~~~~
multiple
~~~~~~~
 maps to a boolean property, the framework does not interpret the value as a String\. The value is evaluated as an expression and automtically converted to a boolean\.

Since it's easy to forget which attributes are String and which are non\-String, you can still use the escape notation\.

**Evaluating booleans (verbose)**


~~~~~~~

<s:select key="state.label" name="state" multiple="%{true}"/>

~~~~~~~

**Evaluating booleans (with property)**


~~~~~~~

<s:select key="state.label" name="state" multiple="allowMultiple"/>

~~~~~~~

**Evaluating booleans (verbose with property)**


~~~~~~~

<s:select key="state.label" name="state" multiple="%{allowMultiple}"/>

~~~~~~~

####value is an Object\!####

Most often, the 

~~~~~~~
value
~~~~~~~
 attribute is set automatically, since 

~~~~~~~
name
~~~~~~~
 attribute usually tells the framework which property to call to set the 

~~~~~~~
value
~~~~~~~
\. But, if there is a reason to set the 

~~~~~~~
value
~~~~~~~
 directly, be advised that 

~~~~~~~
value
~~~~~~~
**is an Object****_NOT_ ****a String**\.

 (\!)  Since 

~~~~~~~
value
~~~~~~~
 is not a String, whatever is passed to 

~~~~~~~
value
~~~~~~~
 is evaluated as an expression \- **NOT** a String literal\.

**Probably wrong\!**


~~~~~~~

<s:textfield key="state.label" name="state" value="ca"/>

~~~~~~~

If a 

~~~~~~~
textfield
~~~~~~~
 is passed the value attribute 

~~~~~~~
"ca"
~~~~~~~
, the framework will look for a property named 

~~~~~~~
getCa
~~~~~~~
\. Generally, this is not what we mean\. What we mean to do is pass a literal String\. In the expression language, literals are placed within quotes

**Passing a literal value the right way**


~~~~~~~

<s:textfield key="state.label" name="state" value="%{'ca'}" />

~~~~~~~

Another approach would be to use the idiom 

~~~~~~~
value="'ca'"
~~~~~~~
, but, in this case, using the expression notation is recommended\.

Boiled down, the tag attributes are evaluated using three rules\.

1. All _String_  attribute types are _parsed_  for the "%{ ... }" notation.

2. All _non-String_  attribute  types are **not** parsed, but evaluated directly as an expression

3. The exception to rule #2 is that if the _non-String_  attribute uses the escape notion "%{}", the notation is ignored as redundant, and the content evaluated.


Please remember about _altSyntax_  option that can change when value is evaluated as an expression \- _Alt Syntax_ 

| 

####Expression Language Notations####

|\<p\>Username: \$\{user\.username\}\</p\>| A JavaBean object in a standard context in Freemarker, Velocity, or JSTL EL (Not OGNL)\. |
|-----------------------------------------|------------------------------------------------------------------------------------------|
|\<s:textfield name="username"/\>| A username property on the Value Stack\. |
|\<s:url id="es" action="Hello"\>\
  \<s:param name="request\_locale"\>\
    es\
  \</s:param\>\
\</s:url\>\
\<s:a href="%\{es\}"\>Espanol\</s:a\>|  Another way to refer to a property placed on the Value Stack\. |
|\<s:property\
  value="\#session\.user\.username" /\>| The username property of the User object in the Session context\. |
|\<s:select\
  label="FooBar" name="foo"\
  list="\#\{'username':'trillian',\
    'username':'zaphod'\}" /\>|  A static Map, as in put("username","trillian")\. |

####Disallowed property names####

The following names of property are disallowed:

+ parameters

+ application

+ session

+ struts

+ request

+ servletRequest

+ servletResponse

The below code will not work:


~~~~~~~

<s:iterator value="parameters"/>

~~~~~~~


~~~~~~~

public class MyAction {

    private String[] parameters;

    public String[] getParameters() {
        return parameters;
    }

}

~~~~~~~

####Next:####

##Velocity## {#PAGE_13894}

Velocity is a templating language for Java\.

For more information on Velocity itself, please visit the [Velocity website](http://velocity\.apache\.org/)^[http://velocity\.apache\.org/]\.


> 

> 

> Velocity is similar to [FreeMarker](#PAGE_14078), as both are template languages that can be used outside of a Servlet container\. The framework uses FreeMarker internally since it has better error reporting\. Developers may also like that FreeMarker supports JSP taglibs\. However, both are good alternatives to JSP\.

> 

####Getting Started####

Getting started with Velocity is as simple as ensuring all the dependencies are included in your project's classpath\. Other than that, _struts\-default\.xml_  already configures the _Velocity Result_ \.

**struts\.xml**


~~~~~~~

<action name="test" class="com.acme.TestAction">
    <result name="success" type="velocity">test-success.vm</result>
</action>

~~~~~~~

**test\-success\.vm**


~~~~~~~

<html>
<head>
    <title>Hello</title>
</head>
<body>

Hello, ${name}

</body>
</html>

~~~~~~~

Where 

~~~~~~~
name
~~~~~~~
 is a property on the Action class\. That's it\!

There are few more details of interest, such as how templates are loaded and variables are resolved\.

####Template Loading####

The framework looks for Velocity templates in two locations (in this order):

1. Web application

2. Class path

The ordering is designed so that a default set of templates can be placed in a JAR (perhaps shared between applications)\. If a template needs to be overridden, a different version can be placed in the web application\.



| Unlike JSPs, templates can be loaded from a JAR\. Templates are a great way to support "plugins", since the entire module can be delivered in a single JAR, and the views easily customized by the host application\.

| 

####Variable Resolution####

In Velocity, there are three sources for variables, searched in a specific order\.

1. The value stack

2. The action context

3. Built-in variables

Since the action context is resolved after the value stack, you can reference the variable without the typical preceding marker (\#) that has to be used with the JSP 

~~~~~~~
s:property
~~~~~~~
 tag\. Omitting the marker can be convenient, but it can also trip you up, if used carelessly\.


~~~~~~~

#surl "id=url" "value=http://www.yahoo.com"
Click <a href="${url}">here</a>!

~~~~~~~

The Stuts2\-Velocity integration layer provides several implicit variables\.

| Variable | Description |
|----------|-------------|
| stack | The value stack itself, useful for calls like \$\{stack\.findString('ognl expr')\} |
| action | The action most recently executed |
| response | The HttpServletResponse |
| res | Same as response |
| request | The HttpServletRequest |
| req | Same as request |
| session | The HttpSession |
| application | The ServletContext |
| base | The request's context path |

####Configuring Velocity####

You can configure Velocity by placing configuration items in _velocity\.properties_ \.

####Next:####

###CeWolf charts using Velocity templates### {#PAGE_13816}

#####Setup CeWolf#####

**This currently only works with the most recent CVS version of WebWork but should be available in the upcoming 2\.0 beta2**

1. Go to [http://cewolf.sourceforge.net](http://cewolf.sourceforge.net) and grab a stable release of CeWolf (at the time of writing, the unstable builds do not work with WebWork).

2. Edit your webwork.properties file and add "de.laures.cewolf.taglib.tags" to the  property "webwork.velocity.tag.path"

Lastly add the CeWolf servlet to web\.xml:


~~~~~~~

<servlet>
    <servlet-name>CewolfServlet</servlet-name>
    <servlet-class>de.laures.cewolf.CewolfRenderer</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>CewolfServlet</servlet-name>
    <url-pattern>/cewolf/*</url-pattern>
</servlet-mapping>

~~~~~~~

#####Create a DatasetProducer#####

This is the default DatasetProducer from the CeWolf tutorial\.


~~~~~~~

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.jfree.data.DefaultCategoryDataset;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;

public class PageViewCountData implements DatasetProducer, Serializable {

	// These values would normally not be hard coded but produced by
	// some kind of data source like a database or a file
	private final String[] categories =    {"mon", "tue", "wen", "thu", "fri", "sat", "sun"};
	private final String[] seriesNames =    {"cewolfset.jsp", "tutorial.jsp", "testpage.jsp", "performancetest.jsp"};
	private final Integer[] [] values = new Integer[OS:seriesNames.length] [OS:categories.length];

	public Object produceDataset(Map params) throws DatasetProduceException {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (int series = 0; series < seriesNames.length; series ++) {
			int lastY = (int)(Math.random() * 1000 + 1000);
			for (int i = 0; i < categories.length; i++) {
				final int y = lastY + (int)(Math.random() * 200 - 100);
				lastY = y;
				dataset.addValue((double)y, seriesNames[OS:series], categories[i]);
			}
		}
		return dataset;
	}

	public boolean hasExpired(Map params, Date since) {		
		return (System.currentTimeMillis() - since.getTime())  > 5000;
	}

	public String getProducerId() {
		return "PageViewCountData DatasetProducer";
	}
}

~~~~~~~

#####Create the Velocity template#####

With the new WebWork refactorings, nested JSP tags with arbitrary parameters can be used, so we convert the CeWolf tutorial JSP script to Velocity\.


~~~~~~~

<jsp:useBean id="pageViews" class="de.laures.cewolf.example.PageViewCountData"/>
<cewolf:chart 
    id="line" 
    title="Page View Statistics" 
    type="line" 
    xaxislabel="Page" 
    yaxislabel="Views">
    <cewolf:data>
        <cewolf:producer id="pageViews"/>
    </cewolf:data>
</cewolf:chart>

<cewolf:img chartid="line" renderer="cewolf" width="400" height="300"/>

~~~~~~~

In Velocity it looks like this:


~~~~~~~

#set( $pageViews = $stack.findValue("new com.PageViewCountData()") )
$req.session.setAttribute("pageViews", $pageViews ) 

#bodytag( SimpleChart "id=line" "title=Page View Statistics" "type=line" "xaxislabel=Page" "yaxslabel=Views" )
  #bodytag( Data )
    #tag( Producer "id=pageViews" )
  #end
#end

#tag( ChartImg "chartid=line" "renderer=cewolf" "width=400" "height=300" ) 

~~~~~~~

As you may notice, CeWolf looks up it's DatasetProducer in the request attributes \- it has no knowledge of the Velocity context\. That's why we call \$req\.session\.setAttribute()\. The other attributes (such as the chartid) will be set by CeWolf, so we don't need to care about them\.

#####Setup an action to disply the template#####

Now you should be able to fire up an action in the usual way with this template as the result and a nice chart should appear\.

##Velocity Tags## {#PAGE_13950}

Velocity tags are extensions of the generic [Struts Tags](#PAGE_14248) provided by the framework\. You can get jump right in just by knowing the structure in which the tags can be accessed: **\#s\*****tag** **\*(\.\.\.) \.\.\. \#end**, where **tag**  is any of the [Struts Tags](#PAGE_14248) supported by the framework\.

For example, in JSP you might create a form using Struts tags\.

**JSP Form**


~~~~~~~

<s:form action="updatePerson">
    <s:textfield label="First name" name="firstName"/>
    <s:submit value="Update"/>
</s:form>

~~~~~~~

In Velocity, the same form can also be built using macros\.

**VM Form**


~~~~~~~

#sform ("action=updatePerson")
    #stextfield ("label=First name" "name=firstName")
    #ssubmit ("value=Update")
#end

~~~~~~~

####Block and Inline Tags####

Some VM tags require an \#end statement while others do not\. The inconsistency arises from a limitation in Velocity where tags must declare if they are a _block_  or _inline_  tag up front\. As such, by default all tags are _inline_  except for a few key ones, such as the [form](#PAGE_14201) tag\.

####Back To:####

