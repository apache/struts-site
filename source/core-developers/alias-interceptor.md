---
layout: core-developers
title: Alias Interceptor
---

# Alias Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}
<p>
 The aim of this Interceptor is to alias a named parameter to a different named parameter. By acting as the glue
 between actions sharing similar parameters (but with different names), it can help greatly with action chaining.

 <p>Action's alias expressions should be in the form of  <code>#{ "name1" : "alias1", "name2" : "alias2" }</code>.
 This means that assuming an action (or something else in the stack) has a value for the expression named <i>name1</i> and the
 action this interceptor is applied to has a setter named <i>alias1</i>, <i>alias1</i> will be set with the value from
 <i>name1</i>.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}
<p>
 <ul>

 <li>aliasesKey (optional) - the name of the action parameter to look for the alias map (by default this is
 <i>aliases</i>).</li>

 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}
<p>
 This interceptor does not have any known extension points.

</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <!-- The value for the foo parameter will be applied as if it were named bar -->
     <param name="aliases">#{ 'foo' : 'bar' }</param>

     <interceptor-ref name="alias"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.AliasInterceptor {% endcomment %}
