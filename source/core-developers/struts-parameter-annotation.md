---
layout: default
title: StrutsParameter Annotation
parent:
    title: Annotations
    url: annotations
---

# StrutsParameter Annotation
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

`@StrutsParameter` is a security annotation that marks which fields and methods in your Action class can receive values from user requests.

Why it matters: by default (when annotations are required), Struts will only inject request parameters into fields or setter methods that have this annotation. This prevents attackers from setting values on fields you didn't intend to expose.

## Where authorization applies

As of Struts 7.2.0 the `@StrutsParameter` authorization is enforced across every
channel that can populate an action from request data:

- [Parameters Interceptor](parameters-interceptor.html) — request parameters
  (default, governed by `struts.parameters.requireAnnotations`).
- [Chaining Interceptor](chaining-interceptor.html) — value-stack copying during
  action chaining (opt-in via `struts.chaining.requireAnnotations`).
- [Cookie Interceptor](cookie-interceptor.html) — cookie values.
- [JSON](../../plugins/json) and [REST](../../plugins/rest) plugins — per-property
  authorization performed during deserialization, so unauthorized fields are never set.

## Usage

The placement of the `@StrutsParameter` annotation is crucial and depends on how you want to populate your action properties.

- **On a public setter method:** Place the annotation on a setter method when you want to populate the property with a value from the request. This applies to:
    - Simple types (String, int, boolean, etc.).
    - Checkboxes (single or multiple values).
    - Collections and Maps, when you are populating the whole collection/map from the request.

- **On a public getter method:** Place the annotation on a getter method when you want to allow populating the properties of the object (or objects) returned by the getter. The `depth` parameter controls how deep into that object graph population is allowed — see [Understanding the `depth` parameter](#understanding-the-depth-parameter) below. This is typically used for complex objects or collections of complex objects.

- **On a public field:** For simple types, you can place the annotation directly on the public field as a shorthand for a setter annotation.

## Understanding the `depth` parameter

When you annotate a getter, `depth` limits how far Struts may traverse the object
graph reachable from that getter while applying request parameters. **Each
navigation step counts as one level** — following a property *or* indexing into a
collection or map.

To find the value you need, count the segments after the annotated property in the
request expression:

| Request expression      | Annotated getter | Steps beyond the getter        | Required `depth` |
|-------------------------|------------------|--------------------------------|------------------|
| `user.name`             | `getUser()`      | `.name`                        | `1`              |
| `user.address.city`     | `getUser()`      | `.address` → `.city`           | `2`              |
| `users[0].name`         | `getUsers()`     | `[0]` → `.name`                | `2`              |

The key point for collections and maps: **indexing into the collection is itself a
level.** Reaching a property of a collection element therefore always costs one more
level than reaching the same property on a plain object. This holds even when the
element type is a flat POJO with only simple fields — populating `contents[0].title`
still needs `depth = 2` (one level to reach the element, one more to reach its
property), not `depth = 1`.

In the annotation's own terms, `depth` is *the number of periods or brackets that
may appear in the parameter name*. The default is `depth = 0`, which permits only
setters and fields directly on the action class. Reaching a property of a returned
object needs `depth = 1` or more; reaching a property of an object held in a
collection or map needs `depth = 2` or more.

## Examples

### Simple field

Annotating the field:
```java
public class MyAction {
    @StrutsParameter
    public String username;  // ✅ Can receive request parameter
}
```
Annotating the setter:
```java
public class MyAction {
    private String username;
    @StrutsParameter
    public void setUsername(String username) {
        this.username = username;
    }
}
```

### Checkbox

For a single checkbox, the annotation must be on the setter.
```java
public class MyAction {
    private boolean myCheckbox;

    @StrutsParameter
    public void setMyCheckbox(boolean myCheckbox) {
        this.myCheckbox = myCheckbox;
    }
    // ... getter
}
```

### Collections

#### Populating a collection of simple types

When populating a collection of simple types (e.g., from a checkbox list), annotate the setter.
```java
public class MyAction {
    private List<String> mySelection;

    @StrutsParameter
    public void setMySelection(List<String> mySelection) {
        this.mySelection = mySelection;
    }
    // ... getter
}
```

When populating properties of objects that are already in a collection, annotate the
getter. Because reaching an element's property requires indexing into the collection
*and then* following the property, this needs `depth = 2` (see
[Understanding the `depth` parameter](#understanding-the-depth-parameter)).
```java
public class MyAction {
    private List<User> users; // assume this is initialized in the constructor or elsewhere

    @StrutsParameter(depth = 2)
    public List<User> getUsers() {
        return users;
    }
    // ...
}
```
This allows requests like `users[0].name=John`. Note that `depth = 2` is required
even when `User` is a flat object with only simple properties — the extra level pays
for indexing into the collection, not for nesting within the element.

The same rule applies to JSON and REST payloads: a body such as
`{"users":[{"name":"John"}]}` populates `users[0].name`, so the `getUsers()` getter
must be annotated with `depth = 2` for the nested value to be accepted. Annotating
only the setter is not enough — the JSON/REST authorization checks the getter when
descending into the collection's elements.

### Complex object

#### Populating the object itself

To populate the whole object from the request (e.g., using a custom type converter), annotate the setter.
```java
public class MyAction {
    private User user;

    @StrutsParameter
    public void setUser(User user) {
        this.user = user;
    }
    // ... getter
}
```

#### Populating properties of a complex object

To populate the properties of a complex object, annotate the getter.
```java
public class MyAction {
    private User user = new User();

    @StrutsParameter(depth = 1)
    public User getUser() {
        return user;
    }
}
```
This allows requests like `user.name=John`.
