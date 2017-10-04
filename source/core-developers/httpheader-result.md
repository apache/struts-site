---
layout: core-developers
title: HttpHeader Result
---

# HttpHeader Result

A custom Result type for setting HTTP headers and status by optionally evaluating against the ValueStack. This result can also be used to send an error to the client. All the parameters can be evaluated against the ValueStack. 

### Parameters


- `status` - the http servlet response status code that should be set on a response.

- `parse` - true by default. If set to false, the headers param will not be parsed for OGNL expressions.

- `headers` - header values.

- `error` - the http servlet response error code that should be set on a response.

- `errorMessage` - error message to be set on response if 'error' is set.

### Examples

```
<result name="success" type="httpheader">
  <param name="status">204</param>
  <param name="headers.a">a custom header value</param>
  <param name="headers.b">another custom header value</param>
</result>
 
<result name="proxyRequired" type="httpheader">
  <param name="error">305</param>
  <param name="errorMessage">this action must be accessed through a proxy</param>
</result>
```
