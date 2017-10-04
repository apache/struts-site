---
layout: core-developers
title: Roles Interceptor
---

# Roles Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.RolesInterceptor {% endcomment %}
<p> <p>
 This interceptor ensures that the action will only be executed if the user has the correct role.
 </p></p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.RolesInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.RolesInterceptor {% endcomment %}
<p>
 <ul>

 <li>allowedRoles - a comma-separated list of roles to allow</li>

 <li>disallowedRoles - a comma-separated list of roles to disallow</li>

 </ul>

 <p>
 When both allowedRoles and disallowedRoles are configured, then disallowedRoles
 takes precedence, applying the following logic: 
  (if ((inRole(role1) || inRole(role2) || ... inRole(roleN)) &&
       !inRole(roleA) && !inRole(roleB) && ... !inRole(roleZ))
  { //permit ...
 </p></p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.RolesInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.RolesInterceptor {% endcomment %}

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

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.RolesInterceptor {% endcomment %}
