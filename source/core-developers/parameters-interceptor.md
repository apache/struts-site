---
layout: default
title: Parameters Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Parameters Interceptor
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

This interceptor sets all parameters on the value stack.

This interceptor gets all parameters from `ActionContext#getParameters()` and sets them on the value stack by calling 
`ValueStack#setValue(String, Object)`, typically resulting in the values submitted in a form request being applied 
to an action in the value stack. Note that the parameter map must contain a `String` key and often containers a `String[]`
for the value.

The interceptor takes one parameter named `ordered`. When set to true action properties are guaranteed to be set top-down 
which means that top action's properties are set first. Then it's subcomponents properties are set. The reason for this 
order is to enable a "factory" pattern. For example, let's assume that one has an action that contains a property named
`modelClass` that allows to choose what is the underlying implementation of model. By assuring that `modelClass`
property is set before any model properties are set, it's possible to choose model implementation during 
`action.setModelClass()` call. Similarly it's possible to use `action.setPrimaryKey()` property set call to actually 
load the model class from persistent storage. Without any assumption on parameter order you have to use patterns 
like [Preparable Interface](prepare-interceptor).

Because parameter names are effectively OGNL statements, it is important that security be taken in to account. This 
interceptor will not apply any values in the parameters map if the expression contains an assignment (=), multiple 
expressions (,), or references any objects in the context (#). This is all done in the `#acceptableName(String)`
method. In addition to this method, if the action being invoked implements the `ParameterNameAware` interface, the action 
will be consulted to determine if the parameter should be set.

In addition to these restrictions, a flag (`ReflectionContextState#DENY_METHOD_EXECUTION`) is set such that no methods 
are allowed to be invoked. That means that any expression such as `person.doSomething()` or `person.getName()` will be 
explicitly forbidden. This is needed to make sure that your application is not exposed to attacks by malicious users.

While this interceptor is being invoked, a flag (`ReflectionContextState#CREATE_NULL_OBJECTS`) is turned on to ensure 
that any null reference is automatically created - if possible. See the type conversion documentation 
and the `InstantiatingNullHandler` javadocs for more information.

Finally, a third flag (`XWorkConverter#REPORT_CONVERSION_ERRORS`) is set that indicates any errors when converting 
the values to their final data type (`String[] -> int`) an unrecoverable error occurred. With this flag set, the type 
conversion errors will be reported in the action context. See the type conversion documentation and the `XWorkConverter`
javadocs for more information.

Since Struts 6.1.0 this interceptor also implements a `ParameterValueAware` interface. This interface, in conjunction with the optional `excludeValuePatterns`, can be used to validate the parameter value(s) being set by the interceptor. If the value being set is excluded / not accepted the entire parameter will be dropped. This can be leveraged to mitigate against forced OGNL evaluation due to unsanitized user input being echoed back as part of the action result. This is not intended to replace good coding habits as described on [Proactively protect from OGNL Expression Injections attacks if easily applicable](https://struts.apache.org/security/#proactively-protect-from-ognl-expression-injections-attacks-if-easily-applicable) and is available as part of a defense in depth methodology. By default excludeValuePatterns is not defined.

If you are looking for detailed logging information about your parameters, turn on `DEBUG` level logging for this
interceptor. A detailed log of all the parameter keys and values will be reported.

Since XWork 2.0.2, this interceptor extends `MethodFilterInterceptor`, therefore being able to deal with 
excludeMethods/includeMethods parameters. See [Default Workflow Interceptor](default-workflow-interceptor) 
for documentation and examples on how to use this feature.

For more information on ways to restrict the parameter names allowed, see the `ParameterNameAware` javadocs.

## Parameters

- `ordered` - set to true if you want the top-down property setter behaviour
- `acceptParamNames` - a comma delimited list of regular expressions to describe a allowlist of accepted parameter names. 
  Don't change the default unless you know what you are doing in terms of security implications
- `excludeParams` - a comma delimited list of regular expressions to describe a denylist of not allowed parameter names
- `acceptedValuePatterns` - a comma delimited list of regular expressions to describe a allowlist of accepted parameter values 
- `excludeValuePatterns` - a comma delimited list of regular expressions to describe a denylist of not allowed parameter values
- `paramNameMaxLength` - the maximum length of parameter names; parameters with longer names will be ignored; 
  the default is 100 characters

## Excluding parameters

This interceptor can be forced to ignore parameters, by setting its `excludeParams` attribute. This attribute accepts 
a comma separated list of regular expressions. When any of these expressions match the name of a parameter, such parameter 
will be ignored by the interceptor. Interceptor stacks defined by Struts already exclude some parameters:

**Default List of Parameters Excluded**

```
dojo..*,^struts..*,^session..*,^request..*,^application..*,^servlet(Request|Response)..*,parameters...*
```

Below is an example of adding a parameter named submit to the list of parameters that should be excluded.

**Setup Interceptor Stack To Exclude submit Parameter**

```xml
<interceptors>
  <interceptor-stack name="appDefault">
    <interceptor-ref name="defaultStack">
       <param name="exception.logEnabled">true</param>
       <param name="exception.logLevel">ERROR</param>
       <param name="params.excludeParams">dojo..*,^struts..*,^session..*,^request..*,^application..*,^servlet(Request|Response)..*,parameters...*,submit</param>
    </interceptor-ref>
  </interceptor-stack>
</interceptors>

<default-interceptor-ref name="appDefault" />
```

## Excluding parameter values

This interceptor can be forced to ignore parameters based on the value, by setting its `excludedValuePatterns` attribute. This attribute accepts 
a comma separated list of regular expressions. When any of these expressions match the value of a parameter, such parameter will be ignored 
by the interceptor.

It's also possible to define `acceptedValuePatterns` to accept only values that match the defined set of patterns.

Below is an example of adding parameter values ${} and %{} to the list of parameter values that should be excluded and only accept **a-z** or **0-9**.

**Setup Interceptor Stack To Exclude ${ and %{ Parameter Values**

```xml
<interceptors>
  <interceptor-stack name="appDefault">
    <interceptor-ref name="defaultStack">
       <param name="exception.logEnabled">true</param>
       <param name="exception.logLevel">ERROR</param>
       <param name="params.excludedValuePatterns">.*\$\{.*?\}.*,.*%\{.*?\}.*</param>
       <param name="params.acceptedValuePatterns">[a-zA-Z0-9]*</param>
    </interceptor-ref>
  </interceptor-stack>
</interceptors>

<default-interceptor-ref name="appDefault" />
```

## Extending the Interceptor

The best way to add behavior to this interceptor is to utilize the `ParameterNameAware` and `ParameterValueAware` interfaces in your actions. 
However, if you wish to apply a global rule that isn't implemented in your action, then you could extend this interceptor 
and override the `#acceptableName(String)` and/or `#acceptableParameterValue(String)` method.

> Using `ParameterNameAware` could be dangerous as `ParameterNameAware#acceptableParameterName(String)` takes precedence 
> over `ParametersInterceptor` which means if `ParametersInterceptor` excluded given parameter name you can accept 
> it with `ParameterNameAware#acceptableParameterName(String)`.

> The best idea is to define very tight restrictions with `ParametersInterceptor` and relax them per action 
> with `ParameterNameAware#acceptableParameterName(String)` and/or `ParameterValueAware#acceptableParameterValue(String)`

## Warning on missing parameters

When there is no setter for given parameter name, a warning message like below will be logged in devMode:

```
SEVERE: Developer Notification (set struts.devMode to false to disable this message):
Unexpected Exception caught setting 'search' on 'class demo.ItemSearchAction: Error setting expression 'search' with value ['search', ]
Error setting expression 'search' with value ['search', ] - [unknown location]
    at com.opensymphony.xwork2.ognl.OgnlValueStack.handleRuntimeException(OgnlValueStack.java:201)
    at com.opensymphony.xwork2.ognl.OgnlValueStack.setValue(OgnlValueStack.java:178)
    at com.opensymphony.xwork2.ognl.OgnlValueStack.setParameter(OgnlValueStack.java:152)
```

Thus is expected behaviour to allow developer to spot missing setter or typo in either parameter name or setter.

### Examples

```xml
<action name="someAction" class="com.examples.SomeAction">
  <interceptor-ref name="params"/>
  <result name="success">good_result.ftl</result>
</action>
```
