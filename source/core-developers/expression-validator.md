---
layout: core-developers
title: expression validator
---

# expression validator

### Description

A Non-Field Level validator that validates based on regular expression supplied.

### Parameters

- `expression` - the Ognl expression to be evaluated against the stack (Must evaluate to a Boolean).

### Examples

```
<validators>
      <validator type="expression">
         <param name="expression"> .... </param>
         <message>Failed to meet Ognl Expression  .... </message>
      </validator>
</validators>
```
