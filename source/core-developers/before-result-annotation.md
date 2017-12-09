---
layout: default
title: BeforeResult Annotation
parent:
    title: Annotations
    url: annotations.html
---

# BeforeResult Annotation

Marks an action method that needs to be executed before the result. Return value is ignored.

## Usage

The `BeforeResult` annotation can be applied at method level.

## Parameters

- `priority` (optional) - Priority order of method execution, default: *10*

## Examples

```java
 public class SampleAction extends ActionSupport {

  @BeforeResult
  public void isValid() throws ValidationException {
    // validate model object, throw exception if failed
  }

  public String execute() {
     // perform action
     return SUCCESS;
  }
 }
```
