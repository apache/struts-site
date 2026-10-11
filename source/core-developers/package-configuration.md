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

## Scoped constants

Since Struts 7.5.0 a package can override selected [constants](constant-configuration) for its own actions with
the `<scoped-constant>` element. Packages that `extends` it inherit the override, and an override declared in
the child package wins.

The element requires the [struts-7.5.dtd](../dtds/struts-7.5.dtd) and must come before any other child of
`<package>`:

```xml
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 7.5//EN"
    "https://struts.apache.org/dtds/struts-7.5.dtd">
<struts>
  <package name="admin" extends="struts-default" namespace="/admin">
    <scoped-constant name="some.scopable.constant" value="x"/>
    ...
  </package>
</struts>
```

| Attribute | Required | Description                               |
|-----------|----------|-------------------------------------------|
| name      | **yes**  | the name of a scopable constant           |
| value     | **yes**  | the value used for actions of the package |

Scoped constants are not a way to override an arbitrary constant per package. Constants are injected into
framework components once, at startup, so a package value only takes effect where a component explicitly reads
it per request. Such a component declares the constants it reads as _scopable_, and only those can appear
in `<scoped-constant>`.

{:.alert .alert-warning}
Struts core does not declare any constant as scopable yet. A `<scoped-constant>` only works with a constant
declared scopable by a plugin or by your own application code.

The configuration is validated at startup, and loading fails when:

- a package declares a constant that nothing has declared scopable. This also applies to abstract packages.
  The error message lists the scopable constants that are available.
- a package declares the same constant more than once.

Values are used as they are. Unlike in `<constant>`, `${...}` [value substitution](constant-configuration#value-substitution)
is not supported.

### Making a constant scopable

A component makes a constant scopable in two steps. First, register a bean that implements
`org.apache.struts2.config.ScopableConstants` and returns the constant names. You can register more than one
such bean. The scopable set is the union of all of them.

```java
public class MyScopableConstants implements ScopableConstants {
    @Override
    public Set<String> getNames() {
        return Set.of("myplugin.theme");
    }
}
```

```xml
<bean type="org.apache.struts2.config.ScopableConstants" name="myplugin"
      class="com.example.MyScopableConstants"/>
```

Second, read the value per request through `org.apache.struts2.config.ScopedConstantProvider`, not through
an `@Inject`-ed constant:

```java
private ScopedConstantProvider scopedConstantProvider;

@Inject
public void setScopedConstantProvider(ScopedConstantProvider scopedConstantProvider) {
    this.scopedConstantProvider = scopedConstantProvider;
}

public String getTheme() {
    return scopedConstantProvider.getValue("myplugin.theme");
}
```

`getValue(name)` returns the value for the package of the action being executed, taking `extends` into account.
Outside an action invocation, or when no package in the hierarchy overrides the constant, it returns the global
constant, or `null` when that is not set. It throws `IllegalArgumentException` for a name that is not scopable.
The global value injected elsewhere is never changed.

Some constants can never be scoped, because they are read before the package of a request is known, for
example the [ActionMapper](action-mapper) or the multipart upload limits. To use a different mapper per URL space,
use the [PrefixBasedActionMapper](action-mapper#prefixbasedactionmapper) instead.

{:.alert .alert-danger}
Do not declare security-related constants scopable, such as `struts.parameters.requireAnnotations`,
`struts.enable.DynamicMethodInvocation` or `struts.devMode`. Otherwise a single package can relax a setting
meant to protect the whole application.

The default `ScopedConstantProvider` implementation can be replaced with the `struts.scopedConstantProvider`
[extension point](../plugins/plugins-architecture#extension-points).
