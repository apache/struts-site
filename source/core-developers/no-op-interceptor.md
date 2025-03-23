---
layout: default
title: NoOp Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# NoOp Interceptor

NoOp Interceptor is defined in the `emptyStack` and it performs no computation, it is there to allow create an empty 
stack that can be used with actions that do not required receiving request parameters or are fully stateless,
i.e. when producing a JSON response on public endpoints.
