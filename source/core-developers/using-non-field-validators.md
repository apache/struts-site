---
layout: core-developers
title: Using Non Field Validators
---

# Using Non Field Validators

##### Description

The followings show a simple example using Webwork's Non Field Validators

__Step 1__

Create the jsp page

{% comment %}start snippet id=nonFieldValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/nonFieldValidatorsExample.jsp {% endcomment %}

```xml
			<s:actionerror/>

			<s:form method="POST" action="submitNonFieldValidatorsExamples" namespace="/validation">
				<s:textfield name="someText" label="Some Text"/>
				<s:textfield name="someTextRetype" label="Retype Some Text"/>
				<s:textfield name="someTextRetypeAgain" label="Retype Some Text Again"/>
				<s:submit label="Submit" cssClass="btn btn-primary"/>
			</s:form>



```

{% comment %}end snippet id=nonFieldValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/nonFieldValidatorsExample.jsp {% endcomment %}

__Step 2__

Create the action class

{% comment %}start snippet id=nonFieldValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/NonFieldValidatorsExampleAction.java {% endcomment %}

```java

public class NonFieldValidatorsExampleAction extends AbstractValidationActionSupport {

	private static final long serialVersionUID = -524460368233581186L;

	private String someText;
	private String someTextRetype;
	private String someTextRetypeAgain;

	public String getSomeText() {
		return someText;
	}

	public void setSomeText(String someText) {
		this.someText = someText;
	}

	public String getSomeTextRetype() {
		return someTextRetype;
	}

	public void setSomeTextRetype(String someTextRetype) {
		this.someTextRetype = someTextRetype;
	}

	public String getSomeTextRetypeAgain() {
		return someTextRetypeAgain;
	}

	public void setSomeTextRetypeAgain(String someTextRetypeAgain) {
		this.someTextRetypeAgain = someTextRetypeAgain;
	}
}



```

{% comment %}end snippet id=nonFieldValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/NonFieldValidatorsExampleAction.java {% endcomment %}

__Step 3__

Create the validator\.xml\.

{% comment %}start snippet id=nonFieldValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/NonFieldValidatorsExampleAction-submitNonFieldValidatorsExamples-validation.xml {% endcomment %}

```xml
  		
<validators>
	<validator type="expression">
		<param name="expression"><![CDATA[ ( (someText == someTextRetype) && (someTextRetype == someTextRetypeAgain) ) ]]></param>
		<message><![CDATA[ all three text must be exactly the same ]]></message>
	</validator>
</validators>


```

{% comment %}end snippet id=nonFieldValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/NonFieldValidatorsExampleAction-submitNonFieldValidatorsExamples-validation.xml {% endcomment %}
