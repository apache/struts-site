---
layout: default
title: Roles Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Roles Interceptor

This interceptor ensures that the action will only be executed if the user has the correct role.

## Parameters

 - `allowedRoles` - a comma-separated list of roles to allow
 - `disallowedRoles` - a comma-separated list of roles to disallow

When both `allowedRoles` and `disallowedRoles` are configured, then `disallowedRoles` takes precedence, applying 
the following logic:
 
```
  (if ((inRole(role1) || inRole(role2) || ... inRole(roleN)) &&
       !inRole(roleA) && !inRole(roleB) && ... !inRole(roleZ))
  { //permit ...
```

## Examples

```xml
  <!-- only allows the admin and member roles -->
  <action name="someAction" class="com.examples.SomeAction">
      <interceptor-ref name="completeStack"/>
      <interceptor-ref name="roles">
        <param name="allowedRoles">admin,member</param>
      </interceptor-ref>
      <result name="success">good_result.ftl</result>
  </action>
```
