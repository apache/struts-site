---
layout: default
title: velocity.properties
parent:
  title: Core Developers
  url: index
---

# velocity.properties

If a `velocity.properties` is provided on the classpath (e.g., `/WEB-INF/classes`), it will be loaded by Velocity.

**velocity.properties**

```
# Velocity Macro libraries.
velocimacro.library = action-default.vm, tigris-macros.vm, myapp.vm
```

> See [struts-default.vm](struts-default-vm) and the [Velocity](velocity) documentation for more information.
