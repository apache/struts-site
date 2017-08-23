---
layout: core-developers
title: velocity.properties
---

# velocity.properties

If a `velocity.properties` is provided on the classpath (e.g., `/WEB-INF/classes`), it will be loaded by Velocity.

**velocity.properties**

```
# Velocity Macro libraries.
velocimacro.library = action-default.vm, tigris-macros.vm, myapp.vm
```

> See [struts-default.vm](struts-default-vm.html) and the [Velocity](velocity.html) documentation for more information.
