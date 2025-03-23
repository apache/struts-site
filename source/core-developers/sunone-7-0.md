---
layout: default
title: SunOne 7.0
parent:
  title: Application Servers
  url: application-servers
---

# SunOne 7.0

To use SunOne with the framework, you will need to grant the appropriate permissions. You can simply grant 
all permissions, or just the specific permissions the framework needs\.

## Granting All Permissions

```
grant {
	permission java.security.AllPermission;
};
```

## Granting Specific Permissions

- Grant Write Permissions to `java.util.PropertyPermission`
- Add `java.lang.reflect.ReflectPermission` "suppressAccessChecks"
- Grant all permissions to `OgnlInvokePermission`

```
grant {
	permission java.util.PropertyPermission "*", "read, write";
	permission java.lang.reflect.ReflectPermission "suppressAccessChecks";
	permission ognl.OgnlInvokePermission "*";
};
```
