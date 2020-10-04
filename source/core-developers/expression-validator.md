---
layout: default
title: expression validator
parent:
    title: Validation
    url: validation.html
---

# expression validator
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

A Non-Field Level validator that validates based on regular expression supplied.

## Parameters

- `expression` - the Ognl expression to be evaluated against the stack (Must evaluate to a Boolean).

## Examples

```xml
<validators>
      <validator type="expression">
         <param name="expression"> .... </param>
         <message>Failed to meet Ognl Expression  .... </message>
      </validator>
</validators>
```
