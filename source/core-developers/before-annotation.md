---
layout: default
title: Before Annotation
parent:
    title: Annotations
    url: annotations.html
---

# Before Annotation

Marks a action method that needs to be executed before the main action method.

## Usage

The Before annotation can be applied at method level.

## Parameters

- `priority` (optional) - Priority order of method execution, default: *10*

## Examples

```java
 public class SampleAction extends ActionSupport {

  @Before
  public void isAuthorized() throws AuthenticationException {
    // authorize request, throw exception if failed
  }

  public String execute() {
     // perform secure action
     return SUCCESS;
  }
 }
```
