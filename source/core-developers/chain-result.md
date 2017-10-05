---
layout: core-developers
title: Chain Result
---

# Chain Result

This result invokes an entire other action, complete with it's own interceptor stack and result.

### Parameters

- `actionName` (default) - the name of the action that will be chained to.
- `namespace` - used to determine which namespace the Action is in that we're chaining. If namespace is null, this defaults to the current namespace.
- `method` - used to specify another method on target action to be invoked. If null, this defaults to execute method.
- `skipActions` - (optional) the list of comma separated action names for the actions that could be chained to.

### Examples

```xml
<package name="public" extends="struts-default">
    <!-- Chain creatAccount to login, using the default parameter -->
    <action name="createAccount" class="...">
        <result type="chain">login</result>
    </action>
 
    <action name="login" class="...">
        <!-- Chain to another namespace -->
        <result type="chain">
            <param name="actionName">dashboard</param>
            <param name="namespace">/secure</param>
        </result>
    </action>
</package>
 
<package name="secure" extends="struts-default" namespace="/secure">
    <action name="dashboard" class="...">
        <result>dashboard.jsp</result>
    </action>
</package>
```
