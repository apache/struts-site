---
layout: default
title: Using tags
parent:
    title: Getting started
    url: index
---

# Using Tags
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This tutorial assumes you've completed the [Hello World](hello-world-using-struts) tutorial and have a working **helloworld** project.
The example code for this tutorial, **using-tags**, is available for checkout from the Struts GitHub repository 
at [struts-examples](https://github.com/apache/struts-examples). The example projects use Maven to manage the artifact dependencies and to build the .war files.

In the [Hello World](hello-world-using-struts) lesson, we added a Struts url tag to the `index.jsp` to create 
a hyperlink to the `hello.action`. This tutorial will explore the url and other Struts tags further.

Web applications differ from conventional websites in that web applications can create a dynamic response. To make it 
easier to reference dynamic data from a page, the Struts framework offers a set of tags. Some of the tags mimic standard 
HTML tag while providing added value. Other tags create non-standard, but useful controls.

To use the Struts tags on the view page, you must include a tag library directive. Typically, the taglib directive 
is `<%@ taglib prefix="s" uri="/struts-tags" %>`. So the prefix for all the Struts tags will be `s`. 
If you want to actually read the Struts tag TLD file, you'll find it in the `META-INF` folder of the Struts core jar.

## Struts url Tag

One use of the Struts Tags is to create links to other web resources, especially to other resources in the local application.

While HTML provides a simple a tag for creating hyperlinks, the HTML tag often requires us to include redundant information. 
Also the HTML tag cannot easily access dynamic data provided by the framework.

A very common use case in web applications is linking to other pages. In the [Hello World](hello-world-using-struts) 
tutorial we added a link to `hello.action` inside the `index.jsp` using the Struts url tag. Please refer 
to the [url documentation](../tag-developers/url-tag) for more information about the url tag.

**index.jsp**

```html
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Basic Struts Application - Welcome</title>
  </head>
  <body>
    <h1>Welcome To Struts!</h1>
    <p><a href="<s:url action='hello'/>">Hello World</a></p>
  </body>
</html>
```

When you run the Hello World tutorial in your Servlet container and then mouse over the Hello World hyperlink created 
by the Struts url tag you'll see that the URL created is `hello.action` (relative to the web context's root folder).

Examine the `struts.xml` configuration in the Hello World tutorial and you will find this:

**struts.xml**

```xml
...
<action name="hello" class="org.apache.struts.helloworld.action.HelloWorldAction" method="execute">
    <result name="success">/HelloWorld.jsp</result>
</action>
...
```

The action node above maps the `hello.action` to the execute method of class `HelloWorldAction`. If the execute method 
returns `success`, the view page `HelloWorld.jsp` (in web context root folder) will be returned to the user.

A common use case is that the URL also needs to include a value for a query string parameter such as userName. To add 
a query string parameter and its value use the Struts param tag, nested inside the url tag.

For the Using Tags tutorial add the following to `index.jsp` just after the link for Hello World.

**url tag with param**

```jsp
...
<s:url action="hello" var="helloLink">
  <s:param name="userName">Bruce Phillips</s:param>
</s:url>

<p><a href="${helloLink}">Hello Bruce Phillips</a></p>
...
```

Rather than put the url tag as the value for the anchor tag's href attribute, we've separated out the s:url tag into 
its own code block. Nested inside the url tag is the Struts param tag. This tag lets you specify a parameter name (
e.g. userName) and a value for that parameter (e.g. Bruce Phillips).

Notice the use of the var attribute. The value of the var attribute is a reference we can use later in our code to refer 
to the url created.

Examine the anchor tag above. Notice the value of the href attribute is `${helloLink}`. The view page will substitute 
the hyperlink we created using the url tag for the `${helloLink}` reference. Note that the query string parameter will 
be properly URL-encoded (`Bruce+Phillips`).

In the next tutorial we'll cover how Struts can access the query string parameter value.

## Struts Form Tag

Most applications will use several data entry forms. The Struts tags make creating input forms easy. 
Consult the [Form Tags Reference](../tag-developers/form-tags) for all the details about the Struts form tags.

Each of the Struts form tags has numerous attributes to mimic the normal HTML form tag attributes.

To create the outer shell of the form, use the Struts form tag. The action attribute sets the action name to submit to.

Add the following markup to `index.jsp` after the Hello Bruce Phillips link.

**Struts Form**

```jsp
<p>Get your own personal hello by filling out and submitting this form.</p>

<s:form action="hello">
  <s:textfield name="userName" label="Your name" />
  <s:submit value="Submit" />
</s:form>
```

The Struts textfield tag provides an input html tag of tag text and the submit tag creates a submit button. When the index 
page is returned by the server to the browser you should see:

![Struts Form.png](attachments/using_tags_form.png)

The Struts form, textfield, and submit tags were converted to this HTML.

**Struts Form Tags Converted To HTML**

```html
<form id="hello" name="hello" action="/using-tags/hello.action;jsessionid=6233ot11na1mtshbr292hu1w" method="post">
  <table class="wwFormTable">
    <tr>
      <td class="tdLabel"><label for="hello_userName" class="label">Your name:</label></td>
      <td class="tdInput"><input type="text" name="userName" value="" id="hello_userName"/></td>
    </tr>
    <tr>
      <td colspan="2">
        <div class="formButton">
          <input type="submit" value="Submit" id="hello_0"/>
        </div>
      </td>
    </tr>
  </table>
</form>
```

Note how Struts created a table inside the form to position the form elements. In later tutorials you'll learn how 
to specify the layout (table, CSS). The Struts textfield tag created an HTML input tag of type text with a name value 
that matches the name value of the textfield tag. Struts also created a label HTML tag based on the label value
of the textfield tag.

In the next tutorial we'll cover how to use Struts to process this form submission.

## Struts property tag

In the [Hello World](hello-world-using-struts) tutorial's example application on JSP `HelloWorld.jsp` was this code:

**Struts Property Tag**

```jsp
<s:property value="messageStore.message" />
```

The most common use of the property tag is to "get" the value returned by calling a public get method (of the Action class) 
and then to include that value in the HTML returned to the browser.

As discussed in the [Hello World](hello-world-using-struts) tutorial, the value of `messageStore.message` instructs 
Struts to first call method `getMessageStore` of the Action class. That method call returns a `MessageStore` object. 
The `.message` part instructs Struts to call the `getMessage` method of the `MessageStore` object. The `getMessage` 
method returns a String which will be included in the HTML returned to the browser.

One very useful feature of the Struts property tag is that it will automatically convert the most common data types 
(int, double, boolean) to their String equivalents. To demonstrate this feature let's add a static int variable to class 
`HelloWorldAction`.

**Add Static Field**

```java
private static int helloCount = 0;

public int getHelloCount() {
    return helloCount;
}
```

Each time the execute method is called we'll increase `helloCount` by 1. So add this code to the `execute` method of the 
`HelloWorldAction` class.

**Increase helloCount**

```java
helloCount++;
```

Whenever a user clicks one of the links on the page index.jsp (or submits the form), method `execute` of class `HelloWorldAction` 
will be run and the static field `helloCount` will be increased by 1.

To include the value of the `helloCount` attribute in the `HelloWorld.jsp` we can use the Struts property tag. 
Add the following to `HelloWorld.jsp` after the h2 tag.

**Use Property Tag To Display helloCount Value**

```jsp
<p>I've said hello <s:property value="helloCount" /> times!</p>
```

So even though the `getHelloCount` method returns an integer type, Struts converted it to type String and placed it 
into the body of the p tag.

Note that even though `helloCount` is a static field, the get method for `helloCount` is not static. For Struts to call 
the `getHelloCount` method to get the value of `helloCount`, the `getHelloCount` method cannot be static.

If the value returned by the get method is an object, then the property tag will cause Struts to call the object's 
`toString` method. Of course, you should always override Class Object's `toString` method in your model classes. 
Add the following `toString` method to the `MessageStore` class:

**Add toString Method To Class MessageStore**

```java
public String toString() {
    return message + " (from toString)";
}
```

Add the following to `HelloWorld.jsp`

**Using Property Tag to Call toString**

```html
<p><s:property value="messageStore" /></p>
```

Since `getMessageStore` of `HelloWorldAction` class returns a `MessageStore` object, Struts will call the `toString` 
method of class `MessageStore`. The string returned by that `toString` method will be displayed in the browser.

![using_tags_hello.png](attachments/using_tags_hello.png)

We covered a lot in this tutorial, but we've really only scratched the surface of how to use the Struts tags. 
Consult the [Struts Tag Reference](../tag-developers/tag-reference) for much more information about all the Struts tags.

|Return to [Hello World using Struts](hello-world-using-struts)|or|onward to [Coding Struts Actions](coding-actions)|
