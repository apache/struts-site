---
layout: core-developers
title: Client Validation
---

# Client Validation

Let's create a Client\-Side validation workflow, step by step\.

(information) The `validate` attribute is set to `true`\.

(information) Some themes do not support client\-side validation\.

## Step 1

Create the form\.

{% comment %}start snippet id=clientValidation|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/quiz-client.jsp {% endcomment %}

```xml

<html>
<head>
	<title>Struts2 Showcase - Validation - Basic</title>
	<s:head/>
</head>

<body>

<div class="page-header">
	<h1>Basic validation Example</h1>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">


			<s:form method="post" validate="true">
				<s:textfield label="Name" name="name"/>
				<s:textfield label="Age" name="age"/>
				<s:textfield label="Favorite color" name="answer"/>
				<s:submit cssClass="btn btn-primary"/>
			</s:form>
		</div>
	</div>
</div>
</body>
</html>


```

{% comment %}end snippet id=clientValidation|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/quiz-client.jsp {% endcomment %}
(information) This case uses the default xhtml theme, so the `<s:head >` tag is used to link a style sheet\.

## Step 2

Create the Action class\.

{% comment %}start snippet id=quizAction|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/QuizAction.java {% endcomment %}

```java

public class QuizAction extends ActionSupport {

	private static final long serialVersionUID = -7505437345373234225L;

	String name;
	int age;
	String answer;

	public String getName() {
		return name;
	}

	@StrutsParameter
	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	@StrutsParameter
	public void setAge(int age) {
		this.age = age;
	}

	public String getAnswer() {
		return answer;
	}

	@StrutsParameter
	public void setAnswer(String answer) {
		this.answer = answer;
	}
}


```

{% comment %}end snippet id=quizAction|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/QuizAction.java {% endcomment %}

__Step 3__

Create the `validation.xml` to configure the validators to be used\.

{% comment %}start snippet id=quizValidators|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/QuizAction-validation.xml {% endcomment %}

```xml
<!--
    Add the following DOCTYPE declaration as first line of your XXX-validation.xml file:
    <!DOCTYPE validators PUBLIC "-//Apache Struts//XWork Validator 1.0.2//EN" "http://struts.apache.org/dtds/xwork-validator-1.0.2.dtd">
-->
<validators>
    <field name="name">
        <field-validator type="requiredstring">
            <message>You must enter a name</message>
        </field-validator>
    </field>
    <field name="age">
        <field-validator type="int">
            <param name="min">13</param>
            <param name="max">19</param>
            <message>Only people ages 13 to 19 may take this quiz</message>
        </field-validator>
    </field>
</validators>


```

{% comment %}end snippet id=quizValidators|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/QuizAction-validation.xml {% endcomment %}

__Action and Namespace__

A correct action and namespace attributes must be provided to the \<s:form\> tag\. For example, if the action named "quizClient" is defined in the "/validation" namespace, the form must be configured as:


```jsp
<s:form method="post" validate="true" action="quizClient" namespace="/validation">
   <s:textfield label="Name" name="name"/>
   <s:textfield label="Age" name="age"/>
   <s:textfield label="Favorite color" name="answer"/>
   <s:submit/>
</s:form> 

```

While the following will "work" in the sense that the form will function correctly, **client\-side validation will not**\. That is because Struts must know the exact namespace and action (rather than a URL) to properly support validation\.


```jsp
<s:form method="post" validate="true" action="/validation/quizClient.action">
   <s:textfield label="Name" name="name"/>
   <s:textfield label="Age" name="age"/>
   <s:textfield label="Favorite color" name="answer"/>
   <s:submit/>
</s:form> 

```
