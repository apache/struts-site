---
layout: default
title: Model Driven Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Model Driven Interceptor

Watches for `ModelDriven` actions and adds the action's model on to the value stack.

> The `ModelDrivenInterceptor` must come before the both `StaticParametersInterceptor` and `ParametersInterceptor`
> if you want the parameters to be applied to the model.

> The `ModelDrivenInterceptor` will only push the model into the stack when the model is not null, else it will be ignored.

To create a Model Driven action, implement the `ModelDriven` interface by adding a model property, or at least the accessor.

```java
public Object getModel();
```

In the implementation of `getModel`, acquire an instance of a business object and return it.

On the page, you can address any JavaBean properties on the business object as if they were coded directly on the Action 
class. The framework pushes the Model object onto the ValueStack.

Many developers use Spring to acquire the business object. With the addition of a `setModel` method, the business logic 
can be injected automatically.

## Parameters

- `refreshModelBeforeResult` - set to true if you want the model to be refreshed on the value stack after action
  execution and before result execution. The setting is useful if you want to change the model instance during the
  action execution phase, like when loading it from the data layer. This will result in `getModel()` being called at
  least twice.

## Extending the Interceptor

There are no known extension points to this interceptor.

## Examples

```xml
<action name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="modelDriven"/>
    <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```
