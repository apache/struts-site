---
layout: core-developers
title: Interceptors
parent:
    title: Core Developers Guide
    url: index.html
---

# Interceptors
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The default Interceptor stack is designed to serve the needs of most applications. Most applications will **not** need 
to add Interceptors or change the Interceptor stack.

Many Actions share common concerns. Some Actions need input validated. Other Actions may need a file upload 
to be pre-processed. Another Action might need protection from a double submit. Many Actions need drop-down lists 
and other controls pre-populated before the page displays.

The framework makes it easy to share solutions to these concerns using an "Interceptor" strategy. When you request 
a resource that maps to an "action", the framework invokes the Action object. But, before the Action is executed, 
the invocation can be intercepted by another object. After the Action executes, the invocation could be intercepted 
again. Unsurprisingly, we call these objects "Interceptors."

## Understanding Interceptors

Interceptors can execute code before and after an Action is invoked. Most of the framework's core functionality is 
implemented as Interceptors. Features like double-submit guards, type conversion, object population, validation, 
file upload, page preparation, and more, are all implemented with the help of Interceptors. Each and every Interceptor 
is pluggable, so you can decide exactly which features an Action needs to support.

Interceptors can be configured on a per-action basis. Your own custom Interceptors can be mixed-and-matched with 
the Interceptors bundled with the framework. Interceptors "set the stage" for the Action classes, doing much of 
the "heavy lifting" before the Action executes.

**Action Lifecyle**

![overview.png](attachments/att1607_overview.png)

In some cases, an Interceptor might keep an Action from firing, because of a double-submit or because validation failed. 
Interceptors can also change the state of an Action before it executes.

The Interceptors are defined in a stack that specifies the execution order. In some cases, the order of the Interceptors 
on the stack can be very important.

## Configuring Interceptors

**struts.xml**

```xml
<package name="default" extends="struts-default">
   <interceptors>
       <interceptor name="timer" class=".."/>
       <interceptor name="logger" class=".."/>
   </interceptors>

   <action name="login" class="tutorial.Login">
      <interceptor-ref name="timer"/>
      <interceptor-ref name="logger"/>
      <result name="input">login.jsp</result>
      <result name="success" type="redirectAction">/secure/home</result>
   </action>
</package>
```

## Stacking Interceptors

With most web applications, we find ourselves wanting to apply the same set of Interceptors over and over again. Rather 
than reiterate the same list of Interceptors, we can bundle these Interceptors together using an Interceptor Stack.

**struts.xml**

```xml
<package name="default" extends="struts-default">
   <interceptors>
        <interceptor name="timer" class=".."/>
        <interceptor name="logger" class=".."/>
        <interceptor-stack name="myStack">
           <interceptor-ref name="timer"/>
           <interceptor-ref name="logger"/>
        </interceptor-stack>
    </interceptors>

   <action name="login" class="tutuorial.Login">
         <interceptor-ref name="myStack"/>
         <result name="input">login.jsp</result>
         <result name="success" type="redirectAction">/secure/home</result>
   </action>
</package>
```

Looking inside `struts-default.xml`, we can see how it's done.

## The Default Configuration

{% highlight xml %}
{% remote_file_content https://raw.githubusercontent.com/apache/struts/master/core/src/main/resources/struts-default.xml %}
{% endhighlight %}

Since the `struts-default.xml` is included in the application's configuration by default, all of the predefined 
interceptors and stacks are available "out of the box".

## Framework Interceptors

Interceptor classes are also defined using a key-value pair specified in the Struts configuration file. The names 
specified below come specified in [struts-default.xml](struts-default-xml.html). If you extend the `struts-default` 
package, then you can use the names below. Otherwise, they must be defined in your package with a name-class pair 
specified in the `<interceptors/>` tag.

|Interceptor|Name|Description|
|-----------|----|-----------|
|[Alias Interceptor](alias-interceptor.html)|alias|Converts similar parameters that may be named differently between requests.|
|[Annotation Parameter Filter Interceptor](annotation-parameter-filter-interceptor.html)|annotationParameterFilter|Annotation based version of [Parameter Filter Interceptor](parameter-filter-interceptor.html).|
|[Annotation Workflow Interceptor](annotation-workflow-interceptor.html)|annotationWorkflow|Invokes any annotated methods on the action.|
|[Chaining Interceptor](chaining-interceptor.html)|chain|Makes the previous Action's properties available to the current Action. Commonly used together with <result type="chain"> (in the previous Action).|
|[Checckbox Interceptor](checkbox-interceptor.html)|checkbox|Adds automatic checkbox handling code that detect an unchecked checkbox and add it as a parameter with a default (usually 'false') value. Uses a specially named hidden field to detect unsubmitted checkboxes. The default unchecked value is overridable for non-boolean value'd checkboxes.|
|[COEP Interceptor](coep-interceptor.html)|coep|Implements the Cross-Origin Embedder Policy on incoming requests used to protect a document from loading any non-same-origin resources which don't explicitly grant the document permission to be loaded.|
|[Conversion Error Interceptor](conversion-error-interceptor.html)|conversionError|Adds conversion errors from the ActionContext to the Action's field errors|
|[Cookie Interceptor](cookie-interceptor.html)|cookie|Inject cookie with a certain configurable name / value into action. (Since 2.0.7.)|
|[Cookie Provider Interceptor](cookie-provider-interceptor.html)|cookieProvider|Transfer cookies from action to response (Since 2.3.15.)|
|[COOP Interceptor](coop-interceptor.html)|coop|Implements the Cross-Origin Opener Policy on incoming requests used to isolate resources against side-channel attacks and information leaks.|
|[Create Session Interceptor](create-session-interceptor.html)|createSession|Create an HttpSession automatically, useful with certain Interceptors that require a HttpSession to work properly (like the TokenInterceptor)|
|[Clear Session Interceptor](clear-session-interceptor.html)|clearSession|This interceptor clears the HttpSession.|
|[Debugging Interceptor](debugging-interceptor.html)|debugging|Provides several different debugging screens to provide insight into the data behind the page.|
|[Default Workflow Interceptor](default-workflow-interceptor.html)|workflow|Calls the validate method in your Action class. If Action errors are created then it returns the INPUT view.|
|[Exception Interceptor](exception-interceptor.html)|exception|Maps exceptions to a result.|
|[Execute and Wait Interceptor](execute-and-wait-interceptor.html)|execAndWait|Executes the Action in the background and then sends the user off to an intermediate waiting page.|
|[Fetch Metadata Interceptor](fetch-metadata-interceptor.html)|fetchMetadata|Implements the Resource Isolation Policies on incoming requests used to protect against CSRF, XSSI, and cross-origin information leaks.|
|[File Upload Interceptor](file-upload-interceptor.html)|fileUpload|An Interceptor that adds easy access to file upload support.|
|[I18n Interceptor](i18n-interceptor.html)|i18n|Remembers the locale selected for a user's session.|
|[Logging Interceptor](logging-interceptor.html)|logger|Outputs the name of the Action.|
|[Message Store Interceptor](message-store-interceptor.html)|store|Store and retrieve action messages / errors / field errors for action that implements ValidationAware interface into session.|
|[Model Driven Interceptor](model-driven-interceptor.htm)|modelDriven|If the Action implements ModelDriven, pushes the getModel Result onto the Value Stack.|
|[Multiselect Interceptor](multiselect-interceptor.html)|multiselect|Like the checkbox interceptor detects that no value was selected for a field with multiple values (like a select) and adds an empty parameter|
|[NoOp Interceptor](no-op-interceptor.html)|noop|Does nothing, just passes invocation further, used in empty stack|
|[Parameter Filter Interceptor](parameter-filter-interceptor.html)|parameterFilter|Removes parameters from the list of those available to Actions|
|[Parameters Interceptor](parameters-interceptor.html)|params|Sets the request parameters onto the Action.|
|[Parameter Remover Interceptor](parameter-remover-interceptor.html)|paramRemover|Removes a parameter from parameters map.|
|[Prepare Interceptor](prepare-interceptor.html)|prepare|If the Action implements Preparable, calls its prepare method.|
|[Roles Interceptor](roles-interceptor.html)|roles|Action will only be executed if the user has the correct JAAS role.|
|[Scope Interceptor](scope-interceptor.html)|scope|Simple mechanism for storing Action state in the session or application scope.|
|[Scoped Model Driven Interceptor](scoped-model-driven-interceptor.html)|scopedModelDriven|If the Action implements ScopedModelDriven, the interceptor retrieves and stores the model from a scope and sets it on the action calling setModel.|
|[Servlet Config Interceptor](servlet-config-interceptor.html)|servletConfig|Provide access to Maps representing HttpServletRequest and HttpServletResponse.|
|[Static Parameters Interceptor](static-parameters-interceptor.html)|staticParams|Sets the struts.xml defined parameters onto the action. These are the <param> tags that are direct children of the <action> tag.|
|[Timer Interceptor](timer-interceptor.html)|timer|Outputs how long the Action takes to execute (including nested Interceptors and View)|
|[Token Interceptor](token-interceptor.html)|token|Checks for valid token presence in Action, prevents duplicate form submission.|
|[Token Session Interceptor](token-session-interceptor.html)|tokenSession|Same as Token Interceptor, but stores the submitted data in session when handed an invalid token|
|[Validation Interceptor](validation-interceptor.html)|validation|Performs validation using the validators defined in _action_ -validation.xml|

Since 2.0.7, Interceptors and Results with hyphenated names were converted to camelCase. (The former model-driven is 
now modelDriven.) The original hyphenated names are retained as "aliases" until Struts 2.1.0. For clarity, 
the hyphenated versions are not listed here, but might be referenced in prior versions of the documentation.

## Method Filtering

`MethodFilterInterceptor` is an abstract `Interceptor` used as a base class for interceptors that will filter execution 
based on method names according to specified included/excluded method lists.

Settable parameters are as follows:
- excludeMethods - method names to be excluded from interceptor processing
- includeMethods - method names to be included in interceptor processing

> If method name are available in both includeMethods and excludeMethods, it will be considered as an included method: 
> includeMethods takes precedence over excludeMethods.

Interceptors that extends this capability include:
- `TokenInterceptor`
- `TokenSessionStoreInterceptor`
- `DefaultWorkflowInterceptor`
- `ValidationInterceptor`

## Interceptor Parameter Overriding

Interceptor's parameter could be overridden through the following ways :

**Method 1**:

```xml
<action name="myAction" class="myActionClass">
    <interceptor-ref name="exception"/>
    <interceptor-ref name="alias"/>
    <interceptor-ref name="params"/>
    <interceptor-ref name="servletConfig"/>
    <interceptor-ref name="prepare"/>
    <interceptor-ref name="i18n"/>
    <interceptor-ref name="chain"/>
    <interceptor-ref name="modelDriven"/>
    <interceptor-ref name="fileUpload"/>
    <interceptor-ref name="staticParams"/>
    <interceptor-ref name="params"/>
    <interceptor-ref name="conversionError"/>
    <interceptor-ref name="validation">
        <param name="excludeMethods">myValidationExcludeMethod</param>
    </interceptor-ref>
    <interceptor-ref name="workflow">
        <param name="excludeMethods">myWorkflowExcludeMethod</param>
    </interceptor-ref>
</action>
```

**Method 2**:

```xml
<action name="myAction" class="myActionClass">
    <interceptor-ref name="defaultStack">
        <param name="validation.excludeMethods">myValidationExcludeMethod</param>
        <param name="workflow.excludeMethods">myWorkflowExcludeMethod</param>
    </interceptor-ref>
</action>
```

In the first method, the whole default stack is copied and the parameter then changed accordingly.

In the second method, the `interceptor-ref` refers to an existing interceptor-stack, namely `defaultStack` in this 
example, and override the `validator` and `workflow` interceptor `excludeMethods` attribute. Note that in the `param`
tag, the name attribute contains a dot (.) the word before the dot(.) specifies the interceptor name whose parameter is 
to be overridden and the word after the dot (.) specifies the parameter itself. The syntax is as follows:

```
   <interceptor-name>.<parameter-name>
```

Note also that in this case the `interceptor-ref` name attribute is used to indicate an interceptor stack which makes 
sense as if it is referring to the interceptor itself it would be just using Method 1 describe above.

**Method 3**:

```xml
<interceptors>
    <interceptor-stack name="parentStack">
        <interceptor-ref name="defaultStack">
            <param name="params.excludeParams">token</param>
        </interceptor-ref>
    </interceptor-stack>
</interceptors>

<default-interceptor-ref name="parentStack"/>
```

## Interceptor Parameter Overriding Inheritance

Parameters override are not inherited in interceptors, meaning that the last set of overridden parameters will be used. 
For example, if a stack overrides the parameter "defaultBlock" for the "postPrepareParameterFilter" interceptor as:

```xml
<interceptor-stack name="parentStack">
  <interceptor-ref name="postPrepareParameterFilter">
    <param name="defaultBlock">true</param>
  </interceptor-ref>
</interceptor-stack>
```

and an action overrides the "allowed" for "postPrepareParameterFilter":

```xml
<package name="child2" namespace="/child" extends="parentPackage">
  <action name="list" class="SomeAction">
    <interceptor-ref name="parentStack">
      <param name="postPrepareParameterFilter.allowed">myObject.name</param>
    </interceptor-ref>
  </action>
</package>
```

Then, only "allowed" will be overridden for the "postPrepareParameterFilter" interceptor in that action, 
the other params will be null.

## Lazy parameters

This functionality was added in Struts 2.5.9

It is possible to define an interceptor with parameters evaluated during action invocation. In such case 
the interceptor must be marked with `WithLazyParams` interface. This must be developer's decision as interceptor 
must be aware of having those parameters set during invocation and not when the interceptor is created as it happens 
in normal way.

Params are evaluated as any other expression starting with from action as a top object.

```xml
<action name="LazyFoo" class="com.opensymphony.xwork2.SimpleAction">
  <result name="success">result.jsp</result>
  <interceptor-ref name="lazy">
    <param name="foo">${bar}</param>
  </interceptor-ref>
</action>
```

```xml
public class MockLazyInterceptor extends AbstractInterceptor implements WithLazyParams {

    private String foo = "";

    public void setFoo(String foo) {
        this.foo = foo;
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        ....
        return invocation.invoke();
    }
}
```

Please be aware that order of interceptors can matter when want to access parameters passed via request as those 
parameters are set by [Parameters Interceptor](parameters-interceptor.html).

## Order of Interceptor Execution

Interceptors provide an excellent means to wrap before/after processing. The concept reduces code duplication (think AOP).

```xml
<interceptor-stack name="xaStack">
  <interceptor-ref name="thisWillRunFirstInterceptor"/>
  <interceptor-ref name="thisWillRunNextInterceptor"/>
  <interceptor-ref name="followedByThisInterceptor"/>
  <interceptor-ref name="thisWillRunLastInterceptor"/>
</interceptor-stack>
```

> Note that some Interceptors will interrupt the stack/chain/flow ... so the order is very important.

Interceptors implementing `com.opensymphony.xwork2.interceptor.PreResultListener` will run after the Action executes 
but before the Result executes.

```
thisWillRunFirstInterceptor
  thisWillRunNextInterceptor
    followedByThisInterceptor
      thisWillRunLastInterceptor
        MyAction1
        MyAction2 (chain)
        MyPreResultListener
        MyResult (result)
      thisWillRunLastInterceptor
    followedByThisInterceptor
  thisWillRunNextInterceptor
thisWillRunFirstInterceptor
```
