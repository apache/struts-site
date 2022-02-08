---
layout: default
title: Key Technologies Primer
---

# Key Technologies Primer
{:.no_toc}

  >  *"The time has come," the Walrus said, "To talk of many things:
  >  Of shoes -- and ships -- and sealing-wax -- Of cabbages -- and kings --
  >  And why the sea is boiling hot -- And whether pigs have wings."*

* Will be replaced with the ToC, excluding a header
{:toc}

## Intention

If you would like to get started with Apache Struts you most likely want
to know what technologies you need to learn. This document shall give you
a brief overview what you need to successfully run a Struts project.

If you still can't decide if Struts is for you or if you have any questions,
feel free to contact us via the <a href="mail.html">Struts user mailinglist</a>.

## Key Technologies


### What you need to know

The framework documentation is written for active web developers and assumes
a working knowledge about how Java web applications are built.
Before getting started, you should understand the basics of several key technologies:

  - [HTTP and HTML](#http)
  - [The HTTP Request/Response Cycle](#cycle)
  - [The Java Language and Application Frameworks](#java)
  - [JavaScript, AJAX, and SOAP](#javascript)
  - [Properties Files and ResourceBundles](#resources)
  - [Servlets, Filters and Web Containers](#containers)
  - [Sessions](#session)
  - [JavaServer Pages and JSP Tag Libraries](#jsp)
  - [Extensible Markup Language (XML)](#xml)
  - [JAAS](#jaas)
  - [Model View Controller](#mvc)

This primer briefly defines each of these technologies but does not
describe them in detail. For your convenience, links to further information
are often provided where it makes sense.

### General starting points

If you are not familiar with the Java language generally,then the best starting point is the
[Java Tutorial](http://docs.oracle.com/javase/tutorial/index).

If you are familiar with Java, but not the mentioned technologies,
the best overall starting point is the [Java EE Tutorial](https://docs.oracle.com/javaee/7/tutorial/).

If you've created web applications for other platforms, you
may be able to follow along and visit the other references as needed. The core
technologies used by Struts are also used by most other Java web development products, so
the background information will be useful in any Java project.

### HTTP, HTML and User Agents {#http}

The World Wide Web was built over the Hypertext Transfer Protocol
[(HTTP)](http://www.ietf.org/rfc/rfc2616.txt?number=2616)
and the Hypertext Markup Language [(HTML)](http://www.w3.org/MarkUp/).
A User Agent, like a web browser, uses HTTP to request a HTML document.
The browser then formats and displays the document to its user. HTTP is used to
transport more the HTML, HTML from the browser to render the view.

If you would like to learn HTML, we recommend
[Getting started with HTML](http://www.w3.org/MarkUp/Guide/) by Dave Raggett.

### The HTTP Request/Response cycle {#cycle}

A very important part of HTTP for the web developer is the request/response cycle. To use HTTP
you have to make a request. An HTTP server, like a web server, is then obliged to respond. When you
build your web application, you design it to react to an HTTP request by returning an HTTP response.
Frameworks often abstract much of these nuts and bolts, but it is important to understand
what is happening behind the scenes.

If you are not familiar with the HTTP request/response you should learn about it.
There is a lot of help available in the internet, like
[How does the Internet work?](http://docs.webplatform.org/wiki/tutorials/How_does_the_Internet_work)

### The Java Language and Application Frameworks

Struts is written in the
[Java programming language](http://www.oracle.com/us/technologies/java/overview/index).
Java is an object-orientated language, and the framework makes good use of many
object-orientated techniques. A good understanding of Java, and especially
object-orientated programming (OOP) and threading, will help
you get the most out of Struts.

#### Reflection and Introspection {#reflection}

Reflection is the process of determining which member fields and methods are available on an object.
Introspection is a specialized form of reflection used by the JavaBean API.
Using Introspection, we can determine which methods of a Object are intended to be accessed by other objects.
The getters and the setters, for example.

Struts uses Introspection to convert HTTP parameters into JavaBean properties and to populate HTML
fields from JavaBean properties. This technique makes it easy to "roundtrip" properties
between HTML forms and JavaBeans.

While it is not necessary to have a deep understanding of these concepts when you start with Apache
Struts, it will help you when your application grows and becomes more complex.

#### Properties Files and ResourceBundles {#resources}

Java applications, including web applications, are often
configured using [Properties](https://docs.oracle.com/javase/8/docs/api/java/util/Properties.html)
files. Properties files are the basis for the
[ResourceBundles](https://docs.oracle.com/javase/8/docs/api/java/util/ResourceBundle.html)
that the framework uses to provide message resources to an application.

The Java Tutorials provide a
[great introduction to Properties](http://docs.oracle.com/javase/tutorial/essential/environment/properties).

Java ResourceBundles use one or more Properties files to provide internationalized messages
to users based their [Locale](https://docs.oracle.com/javase/8/docs/api/java/util/Locale.html).
Support for localizing an application was built into the framework from the ground-up.

Again the Java Tutorials provide
[more information](http://docs.oracle.com/javase/tutorial/i18n/resbundle/concept).

#### Threads {#threads}

With Struts 1 you were required to know a lot about how to write code which
can run in a multi-threaded environment. With Struts 2 this is no longer necessary.
In an Struts 2 environment each action caused by a HTTP request
is a plain old Java object which is instanced for each request.

### JavaScript, AJAX, and SOAP {#javascript}

With HTTP and HTML you can already provide static web pages. Today this is much
often not longer enough and your application users might expect a interactive user interface.
Web developers often resort to [JavaScript](http://en.wikipedia.org/wiki/JavaScript)
to make web applications more interesting.

[AJAX](http://en.wikipedia.org/wiki/AJAX) is a technology often used by JavaScript programmers
to create web applications that are as interactive and responsive as desktop applications.
It is possible, to load a view parts of the website or just the data
from the (Struts) application instead of regenerating the whole view.

Apache Struts provides plugins to easily work with AJAX and even JavaScript. Where Struts can't provide
the necessary functionality, third parties provide extensions for the required behavior.

Another technology that can enhance the HTTP request/response cycle is [SOAP](http://en.wikipedia.org/wiki/SOAP).
Using SOAP, an application can access data and invoke business logic on another server using HTTP as transfer
layer. Using AJAX and SOAP together is becoming a popular way for page to submit finely-grained
requests directly to a remote server, while still retaining a separation of concerns between the
the business logic and the page markup. Depending on your applications need, it might be not necessary
for you to learn about SOAP.

### Servlets, Filters, and Web Containers {#containers}

Since Java is an object-orientated language, the
[Java Servlet](http://docs.oracle.com/javaee/6/tutorial/doc/bnafd)
platform strives to cast HTTP into an object-orientated form.
This strategy makes it easier for Java developers to concentrate on what they need their
application to do -- rather than the mechanics of HTTP.

A Java-aware HTTP server can pass a request to a servlet container.
The container can fulfill the request or it can pass the request back to the HTTP server.
The container decides whether it can handle the request by checking its list of servlets.
If there is a servlet registered for the request, the container passes the request to the servlet.

When a request comes in, the container checks to see if there is a servlet registered for that request.
If there is a match, the request is given to the servlet. If not, the request is returned to the HTTP server.

It's the container's job to manages the servlet lifecycle. The container creates the servlets, invokes the servlets,
and ultimately disposes the servlets.

The old Struts 1 version relied heavily on servlets and good knowledge about it usually helped a lot
with developing web applications.

With Struts 2, you'll need only a basic understanding of Servlets. Struts actually uses a so called
ServletFilter to &quot;make things work&quot;. In general you are not required to write Servlets when
using Struts 2. It still helps to know what Servlets, Filters and Containers are.

Filters let you compose a set of components that will process a request or
response. Filters are aggregated into a chain in which each filter
has a chance to process the request and response before and after
it is processed by subsequent filters (and the servlet that is ultimately called).

### Sessions {#session}

One of the key characteristics of HTTP is that it is
*stateless*. In other words, there is nothing built in to
HTTP that identifies a subsequent request from the same user as being
related to a previous request from that user. This makes building an
application that wants to engage in a conversation with the user over
several requests to be somewhat difficult.

To alleviate this difficulty, the servlet API provides a programmatic
concept called a *session*, represented as an object that
implements the `javax.servlet.http.HttpSession`
interface. The servlet container will use one of two techniques
(cookies or URL rewriting) to ensure that the next request from the
same user will include the *session id*
for this session, so that state information saved in the session can be associated with
multiple requests. This state information is stored in
*session attributes* (in JSP, they are known as "session scope beans").

To avoid occupying resources indefinitely when a user fails to
complete an interaction, sessions have a configurable *timeout interval*.
If the time gap between two requests exceeds this interval, the session
will be timed out, and all session attributes removed. You define a
default session timeout in your web application deployment descriptor.

It is important to know that Session data most often occupies RAM memory
of your server. Depending on your container you may have different options to
bypass this.

Struts 2 provides easy ways to create and access a session.

### Web Applications {#webapp}

Just as a HTTP server can be used to host several distinct
websites, a servlet container can be used to host more than one web
application. The Java servlet platform provides a well-defined
mechanism for organizing and deploying web applications.
Each application runs in its own namespace so that they
can be developed and deployed separately.
A web application can be assembled into a Web Application
Archive, or WAR file.
The single WAR can be uploaded to the server and
automatically deployed.

You definitely need to learn how you can build a war file from your Struts
application and deploy it to your server. This might require knowledge of
build tools like [Maven](http://maven.apache.org) and addition reading
in the documentation of your server vendor.

### Security {#security}

One detail that can be configured in the Web application deployment descriptor is container-managed security.
Declarative security can be used to protect requests for URIs that match given patterns.
Pragmatic security can be used to fine-tune security make authorization decisions based on the time of day,
the parameters of a call, or the internal state of a Web component.
It can also be used to restrict authentication based on information in a database.

For more about security you should read the [Java EE tutorial](http://docs.oracle.com/javaee/6/tutorial/doc/gijrp).
Other projects, like [Apache Shiro](http://shiro.apache.org/) or [Spring Security](https://spring.io/projects/spring-security/) 
might also help you to secure your web application.

### JavaServer Pages, JSP Tag Libraries, and JavaServer Faces {#jsp}

If you write a classic web app, you might need a view component.
One of the first of its kind was [JSP](http://www.oracle.com/technetwork/java/javaee/jsp/index).

While still powerful and fully supported by Struts, people might prefer other technologies
like Velocity and Freemarker. Both are also first class citizens for Struts.

All have in common that you would start writing HTML markup and add dynamic features using
JSP tags (same goes for Velocity and Freemarker). While it is not recommended, JSP even supports
adding plain Java to the markup. Reading about the
[JSTL](http://www.oracle.com/technetwork/java/index-jsp-135995) or, even better,
the [Unified expression language](http://docs.oracle.com/javaee/5/tutorial/doc/bnahq)
is recommended.

That said, you can easily access your data model from the view. And render it appropriate.
If you would like to use a more modern approach, you will love to hear Struts 2 provides
features to return [JSON](http://json.org), which usually fuels AJAX driven webpages.
With that it is easily possible to use jQuery or [AngularJS](http://www.angularjs.org)
as a front end layer and even completely discard JSP.

As mentioned, aside from Java Server Pages, there are several other
presentation technologies available to Struts:

  - [Freemarker](http://www.freemarker.org/)
  - [iText (PDF)](http://www.lowagie.com/iText/)
  - [JasperReports](http://jaspersoft.com/)
  - [Velocity](http://velocity.apache.org/)
  - [XSLT](http://www.w3.org/TR/xslt)

### Extensible Markup Language (XML) {#xml}

The features provided by the framework rely on a number of
objects that are sometimes deployed using a configuration file written in
[Extensible Markup Language](http://www.w3.org/XML/).
XML is also used to configure Java web applications; so, this is yet another
familiar approach.

Luckily Struts 2 reduces the need for XML to almost zero. While a basic knowledge on XML is always good,
it is no longer crucial to write long XML documents to create a Struts
application. If you would like to read more about it, please visit the page of the
[Convention plugin](http://struts.apache.org/release/2.1.x/docs/convention-plugin).

### Model View Controller (MVC) {#mvc}

Web applications based on JavaServer Pages sometimes
commingle database code, page design code, and control flow
code. In practice, we find that unless these concerns are
separated, larger applications become difficult to maintain.

One way to separate concerns in a software application is
to use a Model-View-Controller (MVC) architecture. The
Model represents the business or database code, the View
represents the page design code, and the Controller
represents the navigational code.

The term "MVC" originated with the SmallTalk
Model-View-Controller framework.
In Smalltalk MVC, the View updates itself from the Model, via
the "Observer" pattern. The original MVC pattern is like a
closed loop: The View talks to the Controller, which talks to
the Model, which talks to the View.

But, a direct link between the Model and the View is not
practical for web applications, and we modify the classic MVC
arrangement so that it would look less like a loop and more
like a horseshoe with the controller in the middle.

In the MVC/Model 2 design pattern, application flow is mediated
by a central Controller. The Controller delegates requests -
in our case, HTTP requests - to an appropriate handler. The
handlers are tied to a Model, and each handler acts as an
adapter between the request and the Model. The Model
represents, or encapsulates, an application's business logic or
state. Control is usually then forwarded back through the
Controller to the appropriate View. The forwarding can be
determined by consulting a set of mappings, usually loaded from a
database or configuration file. This provides a loose coupling
between the View and Model, which can make applications
significantly easier to create and maintain.

While MVC is a convenient paradigm, many workers find that
applications may utilize more than three layers.
For example, within the Model, there is often distinct business
logic and data access layers.

The framework provides the control layer for a Model 2 web
applications. Developers can use this layer with other standard
technologies to build the business, data access, and presentation layers.

For more about MVC, see

  - [Smalltalk MVC framework](http://st-www.cs.uiuc.edu/users/smarch/st-docs/mvc).
  - [Wikipedia - MVC](http://en.wikipedia.org/wiki/Model_view_controller)

## Business Logic Frameworks {#logic-frameworks}

Most teams still roll their own business logic layer using
plain old JavaBeans (POJOs). Though, business layer frameworks are beginning to emerge,
and now include:

  - [Spring](http://springframework.org/)
  - [Google Guice](http://code.google.com/p/google-guice/‎)
  - [Commons Chain of Responsiblity](http://commons.apache.org/chain/)
  - or you can rely on features of the bundled Struts XWork

## Data Access Frameworks {#data-frameworks}

Most often, the business layer is seen to be distinct from
the data access layer. Some teams roll their own data access objects (DAOs),
but more and more teams are turning to one of the many
data access frameworks. Some popular data access frameworks include:

  - [Apache Cayenne](http://cayenne.apache.org/)
  - [Enterprise Java Beans](http://docs.oracle.com/javaee/5/tutorial/doc/bnblr)
  - [Hibernate](http://www.hibernate.org/)
  - [myBATIS](http://code.google.com/p/mybatis)
