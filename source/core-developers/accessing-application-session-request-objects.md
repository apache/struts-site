---
layout: default
title: Accessing application, session, request objects
parent:
    title: Core Developers Guide
    url: index.html
---

# Accessing application, session, request objects
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

The framework provides several access helpers to access Request, Session, Application scopes.
See [Servlet Config Interceptor](servlet-config-interceptor) page to find all the supported interfaces.

## Accessing from Java

The best way to access Request, Session or Application scope is to use one of the following interfaces:
- `ServletRequestAware` - to access Request scope
- `ServletResponseAware` - to access Response scope
- `SessionAware` - to access Session scope
- `ApplicationAware` - to access Application scope

Example usage of the interfaces:

```java
public class MyAction implements ApplicationAware {
 
    private Map<String, Object> application;

    public void withApplication(Map<String, Object> application) {
        this.application = application;
    }
    
    public String execute() {
        application.set("myKey", "myValue");
        ...
        return "success";
    }
    
}
```

Implementing `ServletRequestAware` or `ServletResponseAware` will tie your actions to Servlet objects. Yet using these 
interfaces and `SessionAware` or `ApplicationAware` combined with the `servletConfig` interceptor, is the best way 
to access these scopes.

### Avoid using ActionContext

Using `ActionContext` directly is a bad practice and should be avoided, instead of using 

```java
ActionContext.getContext().getSession().put("myAttribute", "myValue");
```

use one of the `*Aware` interfaces above.

## Accessing from the view (JSP, FreeMarker, etc.)

Request and session attributes are accessed via OGNL using the `#session` and `#request` stack values.
Page attributes are accessed via OGNL using the `#attr` stack value, and Application attributes via
the `#application` stack value.

The `#attr` stack value will search the `javax.servlet.jsp.PageContext` for the specified key. If the `PageContext`
doesn't exist, it will search the `request`, `session` and `application` scopes, in that order.

**Accessing attributes in the Application, Session, Request or Page scope from a JSP**

Retrieve the attribute (property), with key `myId`, from the specified scope:

```jsp
<s:property value="#application.myId" />

<s:property value="#session.myId" />

<s:property value="#request.myId" />

<s:property value="#attr.myId" />
```

**Note**: `#attr` is for Page scope attributes first, but will search the remaining scopes, in order, seeking a match.
In opposite using just `#` means you want to fetch a value from the top of the [ValueStack](../tag-developers/access-to-valuestack-from-jsps) 
without searching down the stack.
