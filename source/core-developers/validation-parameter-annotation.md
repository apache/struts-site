---
layout: default
title: ValidationParameter annotation
parent:
  title: Custom Validator Annotations
  url: custom-validator-annotation
---

# ValidationParameter annotation

## Usage

The annotation must be embedded into CustomValidator annotations as a parameter.

## Parameters

| Parameter | Required | Default | Notes           |
|-----------|----------|---------|-----------------|
| name      | yes      |         | parameter name  |
| value     | yes      |         | parameter value |

## Examples

```java
 @CustomValidator(
   type ="customValidatorName",
   fieldName = "myField",
   parameters = { @ValidationParameter( name = "paramName", value = "paramValue" ) }
 )
```
