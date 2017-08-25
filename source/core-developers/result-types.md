---
layout: core-developers
title: Result Types
---

# Result Types

Most use cases can be divided into two phases. First, we need to change or query the application's state, and then we need 
to present an updated view of the application. The Action class manages the application's state, and the Result Type 
manages the view.

## Predefined Result Types

The framework provides several implementations of the `com.opensymphony.xwork2.Result` interface, ready to use in your 
own applications.

|[Chain Result](chain-result.html)|Used for [Action Chaining](action-chaining.html)|
|[Dispatcher Result](dispatcher-reult.html)|Used for web resource integration, including _JSP_  integration|
|[FreeMarker Result](freemarker-result.html)|Used for _FreeMarker_  integration|
|[HttpHeader Result](httpheader-result.html)|Used to control special HTTP behaviors|
|[Redirect Result](redirect-result.html)|Used to redirect to another URL (web resource)|
|[Redirect Action Result](redirect-action-result.html)|Used to redirect to another action mapping|
|[Stream Result](stream-result.html)|Used to stream an InputStream back to the browser (usually for file downloads)|
|[Velocity Result](velocity-result.html)|Used for _Velocity_  integration|
|[XSL Result](xsl-result.html)|Used for XML/XSLT integration|
|[PlainText Result](plaintext-result.html)|Used to display the raw content of a particular page (i.e jsp, HTML)|
|[Tiles Result](tiles-result.html)|Used to provide Tiles integration|
|[Postback Result](postback-result.html)|Used to postback request parameters as a form to the specified destination|
|[JSON Result](json-result.html) |Used to serialize actions into JSON|

## Optional

|[JasperReports Plugin]|Used for _JasperReports Tutorial_  integration|Optional, third-party plugin|

Additional Result Types can be created and plugged into an application by implementing the `com.opensymphony.xwork2.Result`
interface. Custom Result Types might include generating an email or JMS message, generating images, and so forth.

## Default Parameters

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

## Registering Result Types

All Result Types are plugged in via the [Result Configuration](result-configuration.html).

## Extending

You can always extend defined result types and implement whatever logic you need. To simplify process of that, you can 
define your custom `ResultFactory` and use it with connection with custom interface which your Result implements. 
Check [Define dedicated factory](object-factory.html) to see how to do it.

Struts 2 provides one such extension for you: 

`ParamNameAwareResult` interface when used with `StrutsResultBuilder` can limit parameters assigned to the result. 
So you can simple extend existing result with such a functionality as below:

```java
public class MyResult extends ServletDispatcherResult implements ParamNameAwareResult {

    public boolean acceptableParamName(String name, String value) {
        return "accept".equals(name);
    }

}
```

and then register it and use instead of default `dispatcher` result.
