---
layout: default
title: Using Visitor Field Validator
parent:
    title: Validation
    url: validation.html
---

# Using Visitor Field Validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The followings show a simple example using Webwork's Field Validators

### Step 1

Create the jsp page.

```html
<s:fielderror cssClass="alert alert-error"/>

<s:form method="POST" action="submitVisitorValidatorsExamples" namespace="/validation">
    <s:textfield name="user.name" label="User Name"/>
    <s:textfield name="user.age" label="User Age"/>
    <s:textfield name="user.birthday" label="Birthday"/>
    <s:submit label="Submit" cssClass="btn btn-primary"/>
</s:form>
```

### Step 2

Create the action class.

```java
public class VisitorValidatorsExampleAction extends AbstractValidationActionSupport {

	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
```

### Step 3

Create the `validator.xml`.

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
