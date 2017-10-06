---
layout: core-developers
title: Validation Interceptor
---

# Validation Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}
<p>
 <p>
 This interceptor runs the action through the standard validation framework, which in turn checks the action against
 any validation rules (found in files such as <i>ActionClass-validation.xml</i>) and adds field-level and action-level
 error messages (provided that the action implements {@link ValidationAware}). This interceptor
 is often one of the last (or second to last) interceptors applied in a stack, as it assumes that all values have
 already been set on the action.
 </p>

 <p>
 This interceptor does nothing if the name of the method being invoked is specified in the <b>excludeMethods</b>
 parameter. <b>excludeMethods</b> accepts a comma-delimited list of method names. For example, requests to
 <b>foo!input.action</b> and <b>foo!back.action</b> will be skipped by this interceptor if you set the
 <b>excludeMethods</b> parameter to "input, back".
 </p>

 <p>
 The workflow of the action request does not change due to this interceptor. Rather,
 this interceptor is often used in conjunction with the <b>workflow</b> interceptor.
 </p>

 <p>
 <b>NOTE:</b> As this method extends off MethodFilterInterceptor, it is capable of
 deciding if it is applicable only to selective methods in the action class. See
 <code>MethodFilterInterceptor</code> for more info.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}
<p>
 <ul>

 <li>alwaysInvokeValidate - Defaults to true. If true validate() method will always
 be invoked, otherwise it will not.</li>

 <li>programmatic - Defaults to true. If true and the action is Validateable call validate(),
 and any method that starts with "validate".
 </li>
 
 <li>declarative - Defaults to true. Perform validation based on xml or annotations.</li>
 
 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}

##### Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}
<p>
 There are no known extension points for this interceptor.

</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}

##### Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}

```xml
 
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation"/>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>
 
 <-- in the following case myMethod of the action class will not
        get validated -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation">
         <param name="excludeMethods">myMethod</param>
     </interceptor-ref>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>
 
 <-- in the following case only annotated methods of the action class will
        be validated -->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="validation">
         <param name="validateAnnotatedMethodOnly">true</param>
     </interceptor-ref>
     <interceptor-ref name="workflow"/>
     <result name="success">good_result.ftl</result>
 </action>



```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.validator.ValidationInterceptor {% endcomment %}
