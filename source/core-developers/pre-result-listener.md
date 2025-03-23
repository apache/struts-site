---
layout: default
title: PreResultListener
parent:
  title: Core Developers
  url: index
---

# PreResultListener

A `PreResultListener` can affect an action invocation between the interceptor/action phase and the result phase. 
Typical uses include switching to a different Result or somehow modifying the Result or Action objects before 
the Result executes. 

## Examples

A `PreResultListener` can be added by an Action or an Interceptor.

### By an Action

```java
  public class MyAction extends ActionSupport {
     ...
     public String execute() throws Exception {
         ActionInvocation invocation = ActionContext.getContext().getActionInvocation();
         invocation.addPreResultListener(new PreResultListener() {
              public void beforeResult(ActionInvocation invocation, 
                                       String resultCode) {
                  // perform operation necessary before Result execution
              }
         });
     }
     ...
  }
```

### By an Interceptor

```java
  public class MyInterceptor extends AbstractInterceptor {
     ...
      public String intercept(ActionInvocation invocation) throws Exception {
         invocation.addPreResultListener(new PreResultListener() {
              public void beforeResult(ActionInvocation invocation, 
                                       String resultCode) {
                  // perform operation necessary before Result execution
              }
         });
      }
     ...
  }
```
