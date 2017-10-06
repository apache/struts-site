---
layout: core-developers
title: Using Visitor Field Validator
---

# Using Visitor Field Validator

##### Description

The followings show a simple example using Webwork's Field Validators

__Step 1__

Create the jsp page\.

{% comment %}start snippet id=visitorValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/visitorValidatorsExample.jsp {% endcomment %}

```xml

			<s:fielderror cssClass="alert alert-error"/>

			<s:form method="POST" action="submitVisitorValidatorsExamples" namespace="/validation">
				<s:textfield name="user.name" label="User Name"/>
				<s:textfield name="user.age" label="User Age"/>
				<s:textfield name="user.birthday" label="Birthday"/>
				<s:submit label="Submit" cssClass="btn btn-primary"/>
			</s:form>


```

{% comment %}end snippet id=visitorValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/visitorValidatorsExample.jsp {% endcomment %}

__Step 2__

Create the action class\.

{% comment %}start snippet id=visitorValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/VisitorValidatorsExampleAction.java {% endcomment %}

```java

public class VisitorValidatorsExampleAction extends AbstractValidationActionSupport {

	private static final long serialVersionUID = 4375454086939598216L;

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}



```

{% comment %}end snippet id=visitorValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/VisitorValidatorsExampleAction.java {% endcomment %}

__Step 3__

Create the validator\.xml\.

{% comment %}start snippet id=visitorValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/VisitorValidatorsExampleAction-submitVisitorValidatorsExamples-validation.xml {% endcomment %}


```xml



<validators>

	<field name="user">

		<field-validator type="visitor">

			<param name="context">userContext</param>

			<param name="appendPrefix">true</param>

			<message>User:</message>

		</field-validator>

	</field>

</validators>




```


{% comment %}end snippet id=visitorValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/VisitorValidatorsExampleAction-submitVisitorValidatorsExamples-validation.xml {% endcomment %}
