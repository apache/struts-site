---
layout: core-developers
title: Default Workflow Interceptor
---

# Default Workflow Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}
<p> <p>
 An interceptor that makes sure there are not validation, conversion or action errors before allowing the interceptor chain to continue. 
 If a single FieldError or ActionError (including the ones replicated by the Message Store Interceptor in a redirection) is found, the INPUT result will be triggered.
 <b>This interceptor does not perform any validation</b>.
 </p>

 <p>
 This interceptor does nothing if the name of the method being invoked is specified in the <b>excludeMethods</b>
 parameter. <b>excludeMethods</b> accepts a comma-delimited list of method names. For example, requests to
 <b>foo!input.action</b> and <b>foo!back.action</b> will be skipped by this interceptor if you set the
 <b>excludeMethods</b> parameter to "input, back".
 </p>

 <p>
 <b>Note:</b> As this method extends off MethodFilterInterceptor, it is capable of
 deciding if it is applicable only to selective methods in the action class. This is done by adding param tags
 for the interceptor element, naming either a list of excluded method names and/or a list of included method
 names, whereby includeMethods overrides excludedMethods. A single * sign is interpreted as wildcard matching
 all methods for both parameters.
 See {@link MethodFilterInterceptor} for more info.
 </p>

 <p>
 This interceptor also supports the following interfaces which can implemented by actions:
 </p>

 <ul>
     <li>ValidationAware - implemented by ActionSupport class</li>
     <li>ValidationWorkflowAware - allows changing result name programmatically</li>
     <li>ValidationErrorAware - notifies action about errors and also allow change result name</li>
 </ul>

 <p>
 You can also use InputConfig annotation to change result name returned when validation errors occurred.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}


{% comment %}start snippet id=javadocDefaultWorkflowInterceptor|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrefixMethodInvocationUtil {% endcomment %}
<p> 
 <b>In DefaultWorkflowInterceptor</b>
 <p>applies only when action implements {@link com.opensymphony.xwork2.Validateable}</p>
 <ol>
    <li>if the action class have validate{MethodName}(), it will be invoked</li>
    <li>else if the action class have validateDo{MethodName}(), it will be invoked</li>
    <li>no matter if 1] or 2] is performed, if alwaysInvokeValidate property of the interceptor is "true" (which is by default "true"), validate() will be invoked.</li>
 </ol>
 
</p>
{% comment %}end snippet id=javadocDefaultWorkflowInterceptor|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrefixMethodInvocationUtil {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}
<p> <ul>
 <li>inputResultName - Default to "input". Determine the result name to be returned when
 an action / field error is found.</li>
 </ul>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}

##### Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}
<p>
 <p>There are no known extension points for this interceptor.</p>

</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}

##### Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}

```xml

 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>

 <-- In this case myMethod as well as mySecondMethod of the action class
        will not pass through the workflow process -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow">
         <param name="excludeMethods">myMethod,mySecondMethod</param>
     </interceptor-ref name="workflow">
     <result name="success">good_result.ftl</result>
 </action>

 <-- In this case, the result named "error" will be used when
        an action / field error is found -->
 <-- The Interceptor will only be applied for myWorkflowMethod method of action
        classes, since this is the only included method while any others are excluded -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow">
        <param name="inputResultName">error</param>
         <param name="excludeMethods">*</param>
         <param name="includeMethods">myWorkflowMethod</param>
     </interceptor-ref>
     <result name="success">good_result.ftl</result>
 </action>


```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.DefaultWorkflowInterceptor {% endcomment %}
