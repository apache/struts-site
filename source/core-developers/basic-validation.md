---
layout: default
title: Basic Validation
parent:
    title: Validation
    url: validation.html
---

# Basic Validation
{:.no_toc}

Let's configure a basic validation workflow, step by step.

* Will be replaced with the ToC, excluding a header
{:toc}

## Step 1

Create the input form.

```html
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

			<p>
				<b>What is your favorite color?</b>

			<p/>

			<s:form method="post">
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

## Step 2

Create the Action class.

```java
public class QuizAction extends ActionSupport {

	private static final long serialVersionUID = -7505437345373234225L;

	String name;
	int age;
	String answer;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
}
```

## Step 3

Create the validators. The `validation.xml` format is either `<ActionClassName>-validation.xml`
or `<ActionClassName>-<ActionAliasName>-validation.xml`.

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

## Step 4

Make sure there is a result for "input" listed in the struts.xml for when the validation fails:

```xml
<action name="HelloWorld" class="tutorial.HelloWorld">
<result name="success">/tutorial/createconfirm.jsp</result>
<result name="error">/tutorial/error.jsp</result>
<result name="input">/tutorial/create.jsp</result>
</action>

```

If you don't have this, you'll get a: "No result defined for action xxx.xxx.tutorial.HellowWorld and result input" error.
