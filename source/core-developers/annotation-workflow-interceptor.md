---
layout: core-developers
title: AnnotationWorkflowInterceptor
---

# AnnotationWorkflowInterceptor

~~~~~~~
{% snippet id=javadoc|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor %}
~~~~~~~

#####Examples#####



~~~~~~~
{% snippet id=javacode|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor %}
~~~~~~~

Configure a stack in struts\.xml that replaces the PrepareInterceptor with the AnnotationWorkflowInterceptor:


~~~~~~~

<interceptor-stack name="annotatedStack">
	<interceptor-ref name="static-params"/>
	<interceptor-ref name="params"/>
	<interceptor-ref name="conversionError"/>
	<interceptor-ref name="annotationWorkflow"/>
</interceptor-stack>

~~~~~~~

Given an Action, AnnotatedAction, add a reference to the AnnotationWorkflowInterceptor interceptor\.


~~~~~~~

<action name="AnnotatedAction" class="com.examples.AnnotatedAction">
   <interceptor-ref name="annotationWorkflow"/>
   <result name="success" type="freemarker">good_result.ftl</result>
</action>

~~~~~~~


~~~~~~~
{% snippet id=example|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor %}
~~~~~~~
