---
layout: core-developers
title: Model Driven
---

# Model Driven

Struts 2 does not have "forms" like Struts 1 did\. In Struts 2 request parameters are bound directly to fields in the actions class, and this class is placed on top of the stack when the action is executed\.

If an action class implements the interface `com.opensymphony.xwork2.ModelDriven` then it needs to return an object from the `getModel()` method\. Struts will then populate the fields of this object with the request parameters, and this object will be placed on top of the stack once the action is executed\. Validation will also be performed on this model object, instead of the action\. Please read about [VisitorFieldValidator Annotation](visitor-field-validator-annotation) which can help you validate model's fields\.

## Interceptor

To use `ModelDriven` actions, make sure that the [Model Driven Interceptor](model-driven-interceptor) is applied to your action\. This interceptor is part of the default interceptor stack `defaultStack` so it is applied to all actions by default\.

## Example

Action class:


```java
public class ModelDrivenAction implements ModelDriven { 
    public String execute() throws Exception {
        return SUCCESS;
    }

    public Object getModel() {
        return new Gangster();
    }
}

```

Gangster class (model):


```java
public class Gangster implements Serializable {
    private String name;
    private int age;
    private String description;
    private boolean bustedBefore;

    public int getAge() {
        return age;
    }
    public void setAge(int age) {
        this.age = age;
    }
    public boolean isBustedBefore() {
        return bustedBefore;
    }
    public void setBustedBefore(boolean bustedBefore) {
        this.bustedBefore = bustedBefore;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}

```

JSP for creating a Gangster:


```jsp
<s:form action="modelDrivenResult" method="POST" namespace="/modelDriven">   
    <s:textfield label="Gangster Name" name="name" />
    <s:textfield label="Gangster Age"  name="age" />
    <s:checkbox  label="Gangster Busted Before" name="bustedBefore" />
    <s:textarea  cols="30" rows="5" label="Gangster Description" name="description" />           
    <s:submit />
</s:form>

```
