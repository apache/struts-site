---
layout: default
title: Using Non Field Validators
parent:
    title: Validation
    url: validation.html
---

# Using Non Field Validators
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The followings show a simple example using Struts' Non Field Validators

## Create the jsp page

```html
<s:actionerror/>

<s:form method="POST" action="submitNonFieldValidatorsExamples" namespace="/validation">
    <s:textfield name="someText" label="Some Text"/>
    <s:textfield name="someTextRetype" label="Retype Some Text"/>
    <s:textfield name="someTextRetypeAgain" label="Retype Some Text Again"/>
    <s:submit label="Submit" cssClass="btn btn-primary"/>
</s:form>
```

## Create the action class

```java
public class NonFieldValidatorsExampleAction extends AbstractValidationActionSupport {

    private String someText;
    private String someTextRetype;
    private String someTextRetypeAgain;

    public String getSomeText() {
        return someText;
    }

    @StrutsParameter
    public void setSomeText(String someText) {
        this.someText = someText;
    }

    public String getSomeTextRetype() {
        return someTextRetype;
    }

    @StrutsParameter
    public void setSomeTextRetype(String someTextRetype) {
        this.someTextRetype = someTextRetype;
    }

    public String getSomeTextRetypeAgain() {
        return someTextRetypeAgain;
    }

    @StrutsParameter
    public void setSomeTextRetypeAgain(String someTextRetypeAgain) {
        this.someTextRetypeAgain = someTextRetypeAgain;
    }
}
```

## Create the `validator.xml`.

```xml
<validators>
    <validator type="expression">
        <param name="expression">
            <![CDATA[ ( (someText == someTextRetype) && (someTextRetype == someTextRetypeAgain) ) ]]></param>
        <message><![CDATA[ all three text must be exactly the same ]]></message>
    </validator>
</validators>
```
