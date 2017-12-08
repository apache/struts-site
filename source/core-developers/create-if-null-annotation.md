---
layout: default
title: CreateIfNull Annotation
parent:
    title: Annotations
    url: annotations.html
---

# CreateIfNull Annotation

Sets the CreateIfNull for type conversion.

## Usage

The CreateIfNull annotation must be applied at field or method level.

## Parameters

<p> <table summary="">
 <thead>
 <tr>
 <th>Parameter</th>
 <th>Required</th>
 <th>Default</th>
 <th>Description</th>
 </tr>
 </thead>
 <tbody>
 <tr>
 <td>value</td>
 <td>no</td>
 <td>false</td>
 <td>The CreateIfNull property value.</td>
 </tr>
 </tbody>
 </table>
</p>

## Examples

```java
 @CreateIfNull( value = true )
 private List<User> users;

```
