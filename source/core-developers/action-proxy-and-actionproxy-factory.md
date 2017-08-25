---
layout: core-developers
title: Action Proxy & ActionProxy Factory
---

# Action Proxy & ActionProxy Factory

The ActionProxy obtains the Action class and calls the appropriate method. By default, Actions are obtained through 
local instantiation, but an Action could also be obtained remotely if an alternative ActionProxy were provided.

An alternative ActionProxy can be configured through ActionProxyFactory. Typically, an ActionProxy will utilize 
the ActionInvocation to encapsulate the execution of a particular request.

The ActionInvocation determines how an Action is handled: Is it being intercepted?  Is there a PreResultListener 
acting on it?

Essentially, ActionProxy encapsulates how an Action can be obtained. ActionInvocation encapsulates how the Action 
s executed when a request is invoked.

## Customization

### ActionProxyFactory


```java
 ActionProxyFactory.setFactory(new MyActionProxyFactory() {

    // Do something interesting...

 });
```

### ActionProxy

````java
 ActionProxyFactory.getFactory(new MyActionProxyFactory() {
    ....
    public ActionProxy createActionProxy(Configuration config,
           String namespace, String actionName, Map extraContext)
           throws Exception {
        createActionProxy(config, namespace, actionName, extraContext, true);
    }
    public ActionProxy createActionProxy(Configuration config,
           String namespace, String actionName, Map extraContext,
           boolean executeResult, boolean cleanupContext)
           throws Exception {
        ....
   }
   ....
 });
````

### ActionInvocation

```java
 ActionProxyFactory.getFactory(new MyActionProxyFactory() {
    ...
    public ActionInvocation createActionInvocation(ActionProxy actionProxy)
                            throws Exception {
          createActionInvocation(actionProxy, new LinkedHashMap());
    }
    public ActionInvocation createActionInvocation(ActionProxy actionProxy,
                            Map extraContext) throws Exception {
          createActionInvocation(actionProxy, extraContext, true);
    }
    public ActionInvocation createActionInvocation(ActionProxy actionProxy,
                            Map extraContext, boolean pushAction)
                            throws Exception {
          // Do implementation of ActionInvocation here
          .....
    }
    ...
 });
```
