---
layout: default
title: After Annotation
parent:
    title: Annotations
    url: annotations.html
---

# After Annotation

Marks an action method that needs to be called after the main action method and the result was executed. Return value is ignored.

## Usage

The `After` annotation can be applied at method level.

## Parameters

- `priority` (optional) - Priority order of method execution, default: *10*

## Examples

```java
 public class SampleAction extends ActionSupport {

  @After
  public void isValid() throws ValidationException {
    // validate model object, throw exception if failed
  }

  public String execute() {
     // perform action
     return SUCCESS;
  }
 }
```
