---
layout: core-developers
title: Prepare Interceptor
---

# Prepare Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}
<p>
 This interceptor calls <code>prepare()</code> on actions which implement
 {@link Preparable}. This interceptor is very useful for any situation where
 you need to ensure some logic runs before the actual execute method runs.

 <p>
 A typical use of this is to run some logic to load an object from the
 database so that when parameters are set they can be set on this object. For
 example, suppose you have a User object with two properties: <i>id</i> and
 <i>name</i>. Provided that the params interceptor is called twice (once
 before and once after this interceptor), you can load the User object using
 the id property, and then when the second params interceptor is called the
 parameter <i>user.name</i> will be set, as desired, on the actual object
 loaded from the database. See the example for more info.
 </p>
 <p>
 <b>Note:</b> Since XWork 2.0.2, this interceptor extends {@link MethodFilterInterceptor}, therefore being
 able to deal with excludeMethods / includeMethods parameters. See [Workflow Interceptor]
 (class {@link DefaultWorkflowInterceptor}) for documentation and examples on how to use this feature.
 </p>

 <p>
 <b>Update</b>: Added logic to execute a prepare{MethodName} and conditionally
 the a general prepare() Method, depending on the 'alwaysInvokePrepare' parameter/property
 which is by default true. This allows us to run some logic based on the method
 name we specify in the {@link com.opensymphony.xwork2.ActionProxy}. For example, you can specify a
 prepareInput() method that will be run before the invocation of the input method.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}


{% comment %}start snippet id=javadocPrepareInterceptor|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrefixMethodInvocationUtil {% endcomment %}
<p> 
 <b>In PrepareInterceptor</b>
 <p>Applies only when action implements Preparable</p>
 <ol>
    <li>if the action class have prepare{MethodName}(), it will be invoked</li>
    <li>else if the action class have prepareDo(MethodName()}(), it will be invoked</li>
    <li>no matter if 1] or 2] is performed, if alwaysinvokePrepare property of the interceptor is "true" (which is by default "true"), prepare() will be invoked.</li>
 </ol>
 
</p>
{% comment %}end snippet id=javadocPrepareInterceptor|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrefixMethodInvocationUtil {% endcomment %}

##### Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}
<p>
 <ul>

 <li>alwaysInvokePrepare - Default to true. If true, prepare will always be invoked,
 otherwise it will not.</li>

 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}

##### Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}
<p>
 There are no known extension points to this interceptor.

</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}

##### Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}

```xml
 <!-- Calls the params interceptor twice, allowing you to
       pre-load data for the second time parameters are set -->
  <action name="someAction" class="com.examples.SomeAction">
      <interceptor-ref name="params"/>
      <interceptor-ref name="prepare"/>
      <interceptor-ref name="basicStack"/>
      <result name="success">good_result.ftl</result>
  </action>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.PrepareInterceptor {% endcomment %}
