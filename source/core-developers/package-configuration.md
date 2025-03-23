---
layout: default
title: Package Configuration
---

# Package Configuration

Packages are a way to group actions, results, result types, interceptors, and interceptor-stacks into a logical 
configuration unit. Conceptually, packages are similar to objects in that they can be extended and have individual 
parts that can be overridden by "sub" packages.

## Packages

The package element has one required attribute `name`, which acts as the key for later reference to the package. 
The `extends` attribute is optional and allows one package to inherit the configuration of one or more previous packages 
- including all interceptor, interceptor-stack, and action configurations.

> Note that the configuration file is processed sequentially down the document, so the package referenced 
> by an "extends" should be defined _above_  the package which extends it.

The optional `abstract` attribute creates a base package that can omit the action configuration.

| Attribute | Required | Description |
|-----------|----------|-------------|
| name |**yes**| key to for other packages to reference |
| extends | no | inherits package behavior of the package it extends |
| namespace | no | see [Namespace Configuration](namespace-configuration)|
| abstract | no | declares package to be abstract (no action configurations required in package) |

### Simple usage

**Package Example (struts.xml)**

```xml
<struts>
  <package name="employee" extends="struts-default" namespace="/employee">
    <default-interceptor-ref name="crudStack"/>

    <action name="list" method="list"
      class="org.apache.struts2.showcase.action.EmployeeAction" >
        <result>/empmanager/listEmployees.jsp</result>
        <interceptor-ref name="basicStack"/>
    </action>
    <action name="edit-*" class="org.apache.struts2.showcase.action.EmployeeAction">
      <param name="empId">{1}</param>
      <result>/empmanager/editEmployee.jsp</result>
        <interceptor-ref name="crudStack">
          <param name="validation.excludeMethods">execute</param>
        </interceptor-ref>
      </action>
      <action name="save" method="save"
          class="org.apache.struts2.showcase.action.EmployeeAction" >
        <result name="input">/empmanager/editEmployee.jsp</result>
        <result type="redirect">edit-${currentEmployee.empId}.action</result>
      </action>
      <action name="delete" method="delete"
        class="org.apache.struts2.showcase.action.EmployeeAction" >
        <result name="error">/empmanager/editEmployee.jsp</result>
        <result type="redirect">edit-${currentEmployee.empId}.action</result>
      </action>
  </package>
</struts>
```

### Inherit from more than one package

**Multi package Example (struts.xml)**

```xml
<struts>
  <package name="employee" extends="struts-default, json-default" namespace="/employee">

    <action name="list" method="list" class="org.apache.struts2.showcase.action.EmployeeAction" >
        <result>/empmanager/listEmployees.jsp</result>
        <result type="json">
            <param name="root">employees</param>
        </result>
    </action>

  </package>
</struts>
```
