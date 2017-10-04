---
layout: core-developers
title: Conversion Error Interceptor
---

# Conversion Error Interceptor

The Struts 2 conversion error interceptor is a subclass of the XWork 2 conversion error interceptor\.

From the Javadocs of the XWork 2 interceptor:


{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ConversionErrorInterceptor {% endcomment %}
<p> ConversionErrorInterceptor adds conversion errors from the ActionContext to the Action's field errors.

 <p>
 This interceptor adds any error found in the {@link ActionContext}'s conversionErrors map as a field error (provided
 that the action implements {@link ValidationAware}). In addition, any field that contains a validation error has its
 original value saved such that any subsequent requests for that value return the original value rather than the value
 in the action. This is important because if the value "abc" is submitted and can't be converted to an int, we want to
 display the original string ("abc") again rather than the int value (likely 0, which would make very little sense to
 the user).
 </p>
 
 <p>
 <b>Note:</b> Since 2.5.2, this interceptor extends {@link MethodFilterInterceptor}, therefore being
 able to deal with excludeMethods / includeMethods parameters. See [Workflow Interceptor]
 (class {@link DefaultWorkflowInterceptor}) for documentation and examples on how to use this feature.
 </p>
 </p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ConversionErrorInterceptor {% endcomment %}

From the Javadocs of the Struts 2 interceptor:


{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}
<p> <p>
 This interceptor extends {@link ConversionErrorInterceptor} but only adds conversion errors from the ActionContext to
 the field errors of the action if the field value is not null, "", or {""} (a size 1 String array with only an empty
 String). See {@link ConversionErrorInterceptor} for more information, as well as the Type Conversion documentation.
 </p></p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}
<p>
 <ul>

 <li>None</li>

 </ul>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}
<p> <p>
 There are no known extension points for this interceptor.
 </p></p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="params"/>
     <interceptor-ref name="conversionError"/>
     <result name="success">good_result.ftl</result>
 </action>
```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.StrutsConversionErrorInterceptor {% endcomment %}
