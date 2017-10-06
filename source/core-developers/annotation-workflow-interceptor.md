---
layout: core-developers
title: AnnotationWorkflowInterceptor
---

# AnnotationWorkflowInterceptor

{% comment %}start snippet id=javadoc|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor {% endcomment %}
<p> <p>Invokes any annotated methods on the action. Specifically, it supports the following
 annotations:</p>
 <ul>
 <li> @{@link Before} - will be invoked before the action method. If the returned value is not null, it is
 returned as the action result code</li>
 <li> @{@link BeforeResult} - will be invoked after the action method but before the result execution</li>
 <li> @{@link After} - will be invoked after the action method and result execution</li>
 </ul>

 <p>There can be multiple methods marked with the same annotations, but the order of their execution
 is not guaranteed. However, the annotated methods on the superclass chain are guaranteed to be invoked before the
 annotated method in the current class in the case of a {@link Before} annotations and after, if the annotations is
 {@link After}.</p>
</p>
{% comment %}end snippet id=javadoc|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor {% endcomment %}

##### Examples



{% comment %}start snippet id=javacode|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor {% endcomment %}

```java
  public class BaseAnnotatedAction {
  	protected String log = "";

  	@Before
  	public String baseBefore() {
  		log = log + "baseBefore-";
  		return null;
  	}
  }

  public class AnnotatedAction extends BaseAnnotatedAction {
  	@Before
  	public String before() {
  		log = log + "before";
  		return null;
  	}

  	public String execute() {
  		log = log + "-execute";
  		return Action.SUCCESS;
  	}

  	@BeforeResult
  	public void beforeResult() throws Exception {
  		log = log +"-beforeResult";
  	}

  	@After
  	public void after() {
  		log = log + "-after";
  	}
  }

```

{% comment %}end snippet id=javacode|javadoc=true|lang=java|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor {% endcomment %}

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


{% comment %}start snippet id=example|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor {% endcomment %}
<p> <p>With the interceptor applied and the action executed on <code>AnnotatedAction</code> the log
 instance variable will contain <code>baseBefore-before-execute-beforeResult-after</code>.</p>
</p>
{% comment %}end snippet id=example|javadoc=true|url=com.opensymphony.xwork2.interceptor.annotations.AnnotationWorkflowInterceptor {% endcomment %}
