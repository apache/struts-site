---
layout: default
title: Security
---

# Security
{:.no_toc}
[Edit on GitHub]({{ site.repository_url }}/edit/master/source/{{ page.path }}){: .edit-on-gh title="Edit this page on GitHub"}

* Will be replaced with the ToC, excluding a header
{:toc}

## Security tips

The Apache Struts 2 doesn't provide any security mechanism - it is just a pure web framework. Below are few tips 
you should consider during application development with the Apache Struts 2.

### Restrict access to the Config Browser Plugin

[Config Browser Plugin](../plugins/config-browser/) exposes internal configuration and should be used only during 
development phase. If you must use it on production site, we strictly recommend restricting access to it - you can use  
Basic Authentication or any other security mechanism (e.g. [Apache Shiro](https://shiro.apache.org/))

### Don't mix different access levels in the same namespace

Very often access to different resources is controlled based on URL patterns, see snippet below. Because of that 
you cannot mix actions with different security levels in the same namespace. Always group actions in one namespace 
by security level.

```xml
<security-constraint>
    <web-resource-collection>
        <web-resource-name>admin</web-resource-name>
        <url-pattern>/secure/*</url-pattern>
    </web-resource-collection>
    <auth-constraint>
        <role-name>admin</role-name>
    </auth-constraint>
</security-constraint>
```

### Never expose JSP files directly

You must always hide JSP file behind an action, you cannot allow for direct access to the JSP files as this can leads 
to unpredictable security vulnerabilities. You can achieve this by putting all your JSP files under the `WEB-INF` folder 
- most of the JEE containers restrict access to files placed under the `WEB-INF` folder. Second option is to add security 
constraint to the `web.xml` file:


```xml
<!-- Restricts access to pure JSP files - access available only via Struts action -->
<security-constraint>
    <display-name>No direct JSP access</display-name>
    <web-resource-collection>
        <web-resource-name>No-JSP</web-resource-name>
        <url-pattern>*.jsp</url-pattern>
    </web-resource-collection>
    <auth-constraint>
        <role-name>no-users</role-name>
    </auth-constraint>
</security-constraint>

<security-role>
    <description>Don't assign users to this role</description>
    <role-name>no-users</role-name>
</security-role>
```

The best approach is to used the both solutions.

### Disable devMode

The `devMode` is a very useful option during development time, allowing for deep introspection and debugging into you app.

However, in production it exposes your application to be presenting too many informations on application's internals 
or to evaluating risky parameter expressions. Please **always disable** `devMode` before deploying your application 
to a production environment. While it is disabled by default, your 
`struts.xml` might include a line setting it to `true`. The best way is to ensure the following setting is applied 
to our `struts.xml` for production deployment:


```xml
<constant name ="struts.devMode" value="false" />
```
 

### Reduce logging level

 It's a good practice to reduce logging level from **DEBUG** to **INFO** or less. Framework's classes can produce 
 a lot of logging entries which will pollute the log file. You can even set logging level to **WARN** for classes that 
 belongs to the framework, see example Log4j2 configuration:


```xml
<?xml version="1.0" encoding="UTF-8"?>
<Configuration>
    <Appenders>
        <Console name="STDOUT" target="SYSTEM_OUT">
            <PatternLayout pattern="%d %-5p [%t] %C{2} (%F:%L) - %m%n"/>
        </Console>
    </Appenders>
    <Loggers>
        <Logger name="com.opensymphony.xwork2" level="warn"/>
        <Logger name="org.apache.struts2" level="warn"/>
        <Root level="info">
            <AppenderRef ref="STDOUT"/>
        </Root>
    </Loggers>
</Configuration>
```

### Use UTF-8 encoding

Always use `UTF-8` encoding when building an application with the Apache Struts 2, when using JSPs please add the following 
header to each JSP file


```jsp
<%@ page contentType="text/html; charset=UTF-8" %>
```

### Do not define setters when not needed

You should carefully design your actions without exposing anything via setters and getters, thus can leads to potential 
security vulnerabilities. Any action's setter can be used to set incoming untrusted user's value which can contain 
suspicious expression. Some Struts `Result`s automatically populate params based on values in 
`ValueStack` (action in most cases is the root) which means incoming value will be evaluated as an expression during 
this process.

### Do not use incoming values as an input for localisation logic

All `TextProvider`'s `getText(...)` methods (e.g. in`ActionSupport`) perform evaluation of parameters included in a message 
to properly localize the text. This means using incoming request parameters with `getText(...)` methods is potentially 
dangerous and should be avoided. See example below, assuming that an action implements getter and setter for property 
`message`, the below code allows inject an OGNL expression:

```java
public String execute() throws Exception {
    setMessage(getText(getMessage()));
    return SUCCESS;
}
```

Never use value of incoming request parameter as part of your localization logic.

### Use Struts tags instead of raw EL expressions

JSP EL doesn't perform any kind of escaping, you must perform this using a dedicated function, see [this example](https://stackoverflow.com/a/6135001/1805267).
Never use a raw `${}` EL expression on incoming values as this can lead to injecting a malicious code into the page.

The safest option is to use Struts Tags instead.

### Define custom error pages

As mentioned in [S2-006](https://cwiki.apache.org/confluence/display/WW/S2-006) it's a good practicse to define your own 
error pages. This avoids exposing users to XSS attacks as Struts does not escape action's names in automatically 
generated error pages.

You can eaither disable [DMI](../core-developers/action-configuration#dynamic-method-invocation)

```xml
<constant name="struts.enable.DynamicMethodInvocation" value="false" />
``` 

or define an error page

```xml
<global-results>
  <result name="error">/error_page.jsp</result>
</global-results>
 
<global-exception-mappings>
  <exception-mapping exception="java.lang.Exception" result="error"/>
</global-exception-mappings>
```

### Proactively protect from OGNL Expression Injections attacks if easily applicable

The framework has a history of critical security bugs, many tied to its use of OGNL technology; Due to its ability to 
create or change executable code, OGNL is capable of introducing critical security flaws to any framework that uses it. 
Multiple Struts 2 versions have been vulnerable to OGNL security flaws. Consequently, we've equipped OGNL and the 
framework with following proactive optional possibilities since OGNL 3.1.24 and Struts 2.5.22. They're disabled by 
default but via enabling them, you can proactively protect from potential still unknown OGNL Expression Injections flaws:

> **NOTE**: These might break your current app functionality. Before using in production environment, you're recommended to 
comprehensively test your app UI and functionalities with these enabled.

#### Run OGNL expressions inside sandbox

You can do this simply via adding `-Dognl.security.manager` to JVM arguments. OGNL thereupon utilizes Java Security
Manager to run OGNL expressions (which includes your actions either!) inside a sandbox with no permission. It is worth 
noting that it affects only OGNL expression execution and thereafter OGNL reverts Java Security Manager to its previous 
state.

#### Apply a maximum allowed length on OGNL expressions

You can enable this via Struts configuration key `struts.ognl.expressionMaxLength`. OGNL thereupon doesn't evaluate any 
expression longer than specified value. You would choose a value large enough to permit ALL valid OGNL expressions used 
within the application. Values larger than the 200-400 range have diminishing security value (at which point it is 
really only a "style guard" for long OGNL expressions in an application).

## Internal security mechanism

The Apache Struts 2 contains internal security manager which blocks access to particular classes and Java packages - 
it's a OGNL-wide mechanism which means it affects any aspect of the framework ie. incoming parameters, expressions 
used in JSPs, etc.

There are three options that can be used to configure excluded packages and classes:

 - `struts.excludedClasses` - comma-separated list of excluded classes
 - `struts.excludedPackageNamePatterns` - patterns used to exclude packages based on RegEx - this option is slower than 
   simple string comparison but it's more flexible
 - `struts.excludedPackageNames` - comma-separated list of excluded packages, it is used with simple string comparison 
   via `startWith` and `equals`

The defaults are as follow:

```xml
<constant name="struts.excludedClasses"
          value="com.opensymphony.xwork2.ActionContext" />

<!-- this must be valid regex, each '.' in package name must be escaped! -->
<!-- it's more flexible but slower than simple string comparison -->
<!-- constant name="struts.excludedPackageNamePatterns" value="^java\.lang\..*,^ognl.*,^(?!javax\.servlet\..+)(javax\..+)" / -->

<!-- this is simpler version of the above used with string comparison -->
<constant name="struts.excludedPackageNames" value="java.lang,ognl,javax" />
```

Any expression or target which evaluates to one of these will be blocked and you see a WARN in logs:

```
[WARNING] Target class [class example.MyBean] or declaring class of member type [public example.MyBean()] are excluded!
```

In that case `new MyBean()` was used to create a new instance of class (inside JSP) - it's blocked because `target` 
of such expression is evaluated to `java.lang.Class`

It is possible to redefine the above constants in struts.xml but try to avoid this and rather change design of your application!

### Accessing static methods

Support for accessing static methods from expression will be disabled soon, please consider re-factoring your application 
to avoid further problems! Please check [WW-4348](https://issues.apache.org/jira/browse/WW-4348).

### OGNL is used to call action's methods

This can impact actions which have large inheritance hierarchy and use the same method's name throughout the hierarchy, 
this was reported as an issue [WW-4405](https://issues.apache.org/jira/browse/WW-4405). See the example below:

```java
public class RealAction extends BaseAction {  
    @Action("save")
    public String save() throws Exception {
        super.save();
        return SUCCESS;
    }
}

public class BaseAction extends AbstractAction {
    public String save() throws Exception {
        save(Double.MAX_VALUE);
        return SUCCESS;
    }
}

public abstract class AbstractAction extends ActionSupport {
    protected void save(Double val) {
        // some logic
    }
}
```

In such case OGNL cannot properly map which method to call when request is coming. This is do the OGNL limitation. 
To solve the problem don't use the same method's names through the hierarchy, you can simply change the action's method 
from `save()` to `saveAction()` and leaving annotation as is to allow call this action via  `/save.action` request.

### Accepted / Excluded patterns

As from version 2.3.20 the framework provides two new interfaces which are used to accept / exclude param names 
and values - [AcceptedPatternsChecker](../maven/struts2-core/apidocs/com/opensymphony/xwork2/security/AcceptedPatternsChecker.html) 
and [ExcludedPatternsChecker](../maven/struts2-core/apidocs/com/opensymphony/xwork2/security/ExcludedPatternsChecker.html) 
with default implementations. These two interfaces are used by [Parameters Interceptor](../core-developers/parameters-interceptor.html) 
and [Cookie Interceptor](../core-developers/cookie-interceptor.html) to check if param can be accepted or must be excluded. 
If you were using `excludeParams` previously please compare patterns used by you with these provided by the framework in default implementation.

### Strict Method Invocation

This mechanism was introduced in version 2.5. It allows control what methods can be accessed with the bang "!" operator 
via [Dynamic Method Invocation](../core-developers/action-configuration.html#dynamic-method-invocation). Please read 
more in the Strict Method Invocation section of [Action Configuration](../core-developers/action-configuration.html).

### Resource Isolation Using Fetch Metadata

Fetch Metadata is a mitigation against common cross origin attacks such as Cross-Site Request Forgery (CSRF).  It is a web platform security feature designed to help servers defend themselves against cross-origin attacks based on the preferred resource isolation policy. The browser provides information about the context of an HTTP request in a set of `Sec-Fetch-*` headers. This allows the server processing the request to make decisions on whether the request should be accepted or rejected based on the available resource isolation policies.

A Resource Isolation  Policy prevents the resources on a server from being requested by external websites. This policy can be enabled for all endpoints of the application or the endpoints that are meant to be loaded in a cross-site context can be exempted from applying the policy. Read more about Fetch Metadata and resource isolation [here](https://web.dev/fetch-metadata/).

This mechanism is implemented in Struts using the [FetchMetadata Interceptor](../core-developers/fetch-metadata-interceptor.html). Refer to the documentation for [FetchMetadata Interceptor](../core-developers/fetch-metadata-interceptor.html) instructions on how to enable Fetch Metadata. 

### Cross Origin Isolation with COOP and COEP

[Cross-Origin Opener Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Opener-Policy) is a security mitigation that lets developers isolate their resources against side-channel attacks and information leaks. The COOP response header allows a document to request a new browsing context group to better isolate itself from other untrustworthy origins.

[Cross-Origin Embedder Policy](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cross-Origin-Embedder-Policy) prevents a document from loading any cross-origin resources which don't explicitly grant the document permission to be loaded. 

COOP and COEP are independent mechanisms that can be enabled, tested and deployed separately. While enabling one doesn’t require developers to enable the other, when set together COOP and COEP allows developers to use powerful features (such as `SharedArrayBuffer`, `performance.measureMemory()` and the JS Self-Profiling API) securely, without worrying about side channel attacks like [Spectre](https://meltdownattack.com/). Further reading on [COOP/COEP](https://docs.google.com/document/d/1zDlfvfTJ_9e8Jdc8ehuV4zMEu9ySMCiTGMS9y0GU92k/edit#bookmark=id.uo6kivyh0ge2) and [why you need cross-origin isolation](https://web.dev/why-coop-coep/).

The recommended configuration for the policies are:
```
Cross-Origin-Embedder-Policy: require-corp;
Cross-Origin-Opener-Policy: same-origin;
```

COOP and COEP are implemented in Struts using [CoopInterceptor](../core-developers/coop-interceptor.html) and [CoepInterceptor](../core-developers/coep-interceptor.html).
