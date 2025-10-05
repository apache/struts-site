---
layout: default
title: StrutsParameter Annotation
parent:
    title: Annotations
    url: annotations
---

# StrutsParameter Annotation

`@StrutsParameter` is a security annotation that marks which fields and methods in your Action class can receive values from user requests.

Why it matters: by default (when annotations are required), Struts will only inject request parameters into fields or setter methods that have this annotation. This prevents attackers from setting values on fields you didn't intend to expose.

## Usage

Used to annotate public _getter/setter_ methods or _fields_ on Action classes that are intended for parameter injection

## Parameters

- `depth` controls how deep into nested objects parameters can be set:

## Examples

```java
public class MyAction {
    @StrutsParameter
    public String username;  // ✅ Can receive request parameter

    public String password;  // ❌ Cannot receive request parameter (not annotated)
}
```

The `depth` controls how deep into nested objects parameters can be set:
- `depth = 0` (default): Only sets values directly on your action
  ```
    @StrutsParameter
    public String name;  // Accepts: ?name=value
  ```
- `depth = 1`: Allows one level of nesting
  ```
    @StrutsParameter(depth = 1)
    public User user;  // Accepts: ?user.name=value
  ```
- `depth = 2`: Allows two levels of nesting
  ```
    @StrutsParameter(depth = 2)
    public User user;  // Accepts: ?user.address.city=value
  ```

Rule of thumb: The depth equals the number of dots (or brackets) allowed in the parameter name.
