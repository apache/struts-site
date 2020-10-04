---
layout: core-developers
title: Namespace Annotation
---

# Namespace Annotation

## Namespace Annotation

The `@Namespace` annotation allows the definition of an Action's namespace in the `Action` class rather than based 
on [Convention Plugin](../plugins/convention/)'s conventions.

### Usage

This annotation is placed at the class level.

### Parameters

| Name | Type | Required | Description |
|------|------|----------|-------------|
| value | String | true | The namespace to use for the annotated action class.|
