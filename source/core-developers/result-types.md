---
layout: core-developers
title: Result Types
---

# Result Types
{:.no_toc}

Most use cases can be divided into two phases. First, we need to change or query the application's state, and then we need 
to present an updated view of the application. The Action class manages the application's state, and the Result Type 
manages the view.

* Will be replaced with the ToC, excluding a header
{:toc}

## Predefined Result Types

The framework provides several implementations of the `com.opensymphony.xwork2.Result` interface, ready to use in your 
own applications.

|[Chain Result](chain-result)|Used for [Action Chaining](action-chaining)|
|[Dispatcher Result](dispatcher-result)|Used for web resource integration, including _JSP_  integration|
|[FreeMarker Result](freemarker-result)|Used for _FreeMarker_  integration|
|[HttpHeader Result](httpheader-result)|Used to control special HTTP behaviors|
|[Redirect Result](redirect-result)|Used to redirect to another URL (web resource)|
|[Redirect Action Result](redirect-action-result)|Used to redirect to another action mapping|
|[Stream Result](stream-result)|Used to stream an InputStream back to the browser (usually for file downloads)|
|[Velocity Result](velocity-result)|Used for _Velocity_  integration|
|[XSL Result](xsl-result)|Used for XML/XSLT integration|
|[Plain Result](plain-result)|A plain result which all you to write directly to a HttpResponse using a simplified API (since Struts 6.x)|
|[PlainText Result](plaintext-result)|Used to display the raw content of a particular file/page (i.e jsp, HTML)|
|[Tiles Result](../plugins/tiles/)|Used to provide Tiles integration|
|[Postback Result](postback-result)|Used to postback request parameters as a form to the specified destination|
|[JSON Result](../plugins/json/) |Used to serialize actions into JSON|
|[JasperReports Plugin](../plugins/jasperreports/)|Used for [JasperReports Tutorial](../getting-started/jasper-reports-tutorial) integration|

Additional Result Types can be created and plugged into an application by implementing the `com.opensymphony.xwork2.Result`
interface. Custom Result Types might include generating an email or JMS message, generating images, and so forth.

## How to use results

Once your action has been executed it must either return a result name (as `java.lang.String`) or instance 
of `com.opensymphony.xwork2.Result` and then the result will be executed directly.

If a String has been returned, the framework will try to find a matching result in the configuration and then it will
execute the result of a given type, see example:

```xml
<result name="success" type="dispatcher">/WEB-INF/index.jsp</result>
```

You can define many results per action distinguishing them by different names:

```xml
<result name="success" type="dispatcher">/WEB-INF/index.jsp</result>
<result name="input" type="dispatcher">/WEB-INF/form.jsp</result>
<result name="error" type="dispatcher">/WEB-INF/error.jsp</result>
```

## Default result type

In `struts-default.xml` the Dispatcher result type is registered as a default result type, which means you don't have to
specify the `type` attribute if you want to use it:

```xml
<result name="success">/WEB-INF/index.jsp</result>
```

## Default result name

If you action method returns `success`, which is a default name of the result, you don't have specify the `name` attribute as well:

```xml
<result>/WEB-INF/index.jsp</result>
```

## Default parameters

To minimize configuration, Results can be configured with a single value, which will be converted into a parameter, 
and each Result can specify which parameter this value should be set as. For example, here is a result defined in XML 
that uses a default parameter:

```xml
<result type="freemarker">foo.fm</result>
```

That is the equivalent to this:

```xml
<result type="freemarker">
  <param name="location">foo.vm</param>
</result>
```

Since probably 95% of your actions won't need results that contain multiple parameters, this little shortcut saves you 
a significant amount of configuration. It also follows that if you have specified the default parameter, you don't need 
to set the same parameter as a specifically-named parameter.

## Registering result types

All Result Types are plugged in via the [Result Configuration](result-configuration).

## Extending

You can always extend defined result types and implement whatever logic you need. To simplify process of that, you can 
define your custom `ResultFactory` and use it with connection with custom interface which your Result implements. 
Check [Define dedicated factory](object-factory) to see how to do it.

Struts 2 provides one such extension for you: 

`ParamNameAwareResult` interface when used with `StrutsResultBuilder` can limit parameters assigned to the result. 
So you can simply extend existing result with such a functionality as below:

```java
public class MyResult extends ServletDispatcherResult implements ParamNameAwareResult {

    public boolean acceptableParamName(String name, String value) {
        return "accept".equals(name);
    }

}
```

and then register it and use instead of default `dispatcher` result.
