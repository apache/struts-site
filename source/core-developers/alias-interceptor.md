---
layout: default
title: Alias Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Alias Interceptor

The aim of this Interceptor is to alias a named parameter to a different named parameter. By acting as the glue between 
actions sharing similar parameters (but with different names), it can help greatly with action chaining.

Action's alias expressions should be in the form of `#{ "name1" : "alias1", "name2" : "alias2" }`. This means that assuming 
an action (or something else in the stack) has a value for the expression named `name1` and the action this interceptor 
is applied to has a setter named `alias1`, `alias1` will be set with the value from `name1`.

## Parameters

 - `aliasesKey` (optional) - the name of the action parameter to look for the alias map (by default this is `aliases`)

## Ordering relative to the `params` interceptor

The interceptor sets the aliased property on the action at the moment it runs, and so does the `params` interceptor. 
When a request carries both the source name and the target name, whichever of the two interceptors runs last wins:

| Stack order | Request `foo=1&bar=2`, aliases `#{ 'foo' : 'bar' }` | `bar` after both have run |
|---|---|---|
| `alias` before `params` (the `defaultStack` order) | `alias` sets `bar=1`, then `params` sets `bar=2` | `2` — the directly submitted parameter wins |
| `params` before `alias` | `params` sets `bar=2`, then `alias` sets `bar=1` | `1` — the alias overrides the submitted parameter |

To make the alias override a directly submitted parameter, place `alias` after `params` in a custom stack. Keep it 
before `conversionError` so that a conversion failure while binding the aliased property still becomes a field error:

```xml
<interceptor-stack name="aliasOverridesStack">
    <interceptor-ref name="exception"/>
    <interceptor-ref name="servletConfig"/>
    <interceptor-ref name="i18n"/>
    <interceptor-ref name="staticParams"/>
    <interceptor-ref name="actionMappingParams"/>
    <interceptor-ref name="params"/>
    <interceptor-ref name="alias"/>
    <interceptor-ref name="conversionError"/>
    <interceptor-ref name="validation"/>
    <interceptor-ref name="workflow"/>
</interceptor-stack>
```

There is no `overwrite` flag on this interceptor; the ordering above is the supported way to get that behavior.

## Parameter Authorization

The value this interceptor copies onto the alias target can come from two different places, and
each is authorized differently:

- **The source name does not resolve anywhere on the value stack**, so the interceptor falls back
  to the raw HTTP request parameter of that name — the behavior the `foo`/`bar` example above
  relies on. This path requires [`@StrutsParameter`](struts-parameter-annotation.html) on the
  target when `struts.parameters.requireAnnotations` is enabled (the default since Struts 7.0.0),
  the same as the [Parameters Interceptor](parameters-interceptor.html).
- **The source name resolves on the value stack** — typically a property an earlier action in a
  chain already holds. Copying this is the same category of operation as the
  [Chaining Interceptor](chaining-interceptor.html), so it follows the same opt-in constant:

  ```xml
  <constant name="struts.chaining.requireAnnotations" value="true"/>
  ```

  With this off (the default), a stack-resolved value is copied regardless of annotation, matching
  this interceptor's traditional behavior. With it on, an unannotated target is rejected here too,
  not just on the request-parameter fallback.

In both cases a rejected target is skipped and logged at `WARN`, and authorization uses the same
`ParameterAuthorizer` service the Parameters and Chaining interceptors use. While an application is
migrating,
[`struts.parameters.requireAnnotations.transitionMode=true`](../../security/#defining-and-annotating-your-action-parameters)
exempts non-nested alias targets, the same way it exempts any other non-nested setter, on both paths
above. Nested targets — an alias map value such as `'bean.bar'` is valid — still need the
annotation. The `ModelDriven` exemption applies here too.

See also [Where authorization applies](struts-parameter-annotation.html#where-authorization-applies)
for an overview of the channels that can populate an action.

### Upgrading an existing application

If an application already uses this interceptor's documented pattern — the `foo`/`bar` example
above — `bar` now needs [`@StrutsParameter`](struts-parameter-annotation.html) for the alias to
keep working once `struts.parameters.requireAnnotations` is enabled. Without it, the alias is
silently skipped (logged at `WARN`) instead of setting `bar`.

## Extending the Interceptor

This interceptor does not have any known extension points.

## Examples

```xml
 <action name="someAction" class="com.examples.SomeAction">
     <!-- The value for the foo parameter will be applied as if it were named bar -->
     <param name="aliases">#{ 'foo' : 'bar' }</param>

     <interceptor-ref name="alias"/>
     <interceptor-ref name="basicStack"/>
     <result name="success">good_result.ftl</result>
 </action>
```
