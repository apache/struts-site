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

The placement of the `@StrutsParameter` annotation is crucial and depends on how you want to populate your action properties.

- **On a public setter method:** Place the annotation on a setter method when you want to populate the property with a value from the request. This applies to:
    - Simple types (String, int, boolean, etc.).
    - Checkboxes (single or multiple values).
    - Collections and Maps, when you are populating the whole collection/map from the request.

- **On a public getter method:** Place the annotation on a getter method when you want to allow populating the properties of the object returned by the getter. The `depth` parameter is used to control how deep the object graph can be populated. This is typically used for complex objects or collections of complex objects.

- **On a public field:** For simple types, you can place the annotation directly on the public field as a shorthand for a setter annotation.

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

#### Populating properties of objects within a collection

When populating properties of objects that are already in a collection, annotate the getter.
```java
public class MyAction {
    private List<User> users; // assume this is initialized in the constructor or elsewhere

    @StrutsParameter(depth = 1)
    public List<User> getUsers() {
        return users;
    }
    // ...
}
```
This allows requests like `users[0].name=John`.

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
