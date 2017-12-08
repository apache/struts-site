---
layout: default
title: InputConfig Annotation
parent:
    title: Annotations
    url: annotations.html
---

# InputConfig Annotation

Marks a action method that if it's not validated by `ValidationInterceptor` then execute `input` method or `input` result.

## Usage

The InputConfig annotation can be applied at method level.

## Parameters

- `methodName` (optional) - execute this method if specific
- `resultName` (optional) - return this result if methodName not specific  

## Examples

```java
 public class SampleAction extends ActionSupport {

  public void isValid() throws ValidationException {
    // validate model object, throw exception if failed
  }

  @InputConfig(methodName="input")
  public String execute() {
     // perform action
     return SUCCESS;
  }
  public String input() {
     // perform some data filling
     return INPUT;
  }
 }

```
