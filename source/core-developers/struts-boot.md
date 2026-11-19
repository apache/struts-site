---
layout: default
title: Struts Boot
parent:
    title: Core Developers Guide
    url: index.html
---

# Struts Boot
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

> Since Struts 7.5.0

Struts Boot is experimental: its API and defaults may change between minor releases.
{:.alert .alert-warning}

Struts Boot runs a Struts application from a `main()` method on an embedded Tomcat. Actions are registered in Java,
so the application needs no `web.xml` and no `struts.xml`, and it can be packaged as a runnable jar.

## Getting started

### Dependency

Add the starter at the same version as the rest of Struts. Importing the `struts2-bom` keeps the versions aligned,
so the starter needs no version of its own:

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <groupId>org.apache.struts</groupId>
            <artifactId>struts2-bom</artifactId>
            <version>7.5.0</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>

<dependencies>
    <dependency>
        <groupId>org.apache.struts</groupId>
        <artifactId>struts2-boot-starter</artifactId>
    </dependency>
</dependencies>
```

The starter brings `struts2-core` and the embedded Tomcat.

### Application

Implement `StrutsBootApplication`, register the actions and start it from `main()`:

```java
public class HelloApp implements StrutsBootApplication {

    public static void main(String[] args) {
        StrutsBoot.run(HelloApp.class, args);
    }

    @Override
    public void actions(ActionRegistry actions) {
        actions.action("hello", HelloAction.class).success("hello.ftl");
    }
}
```

The action is an ordinary Struts action:

```java
public class HelloAction {

    public String execute() {
        return "success";
    }

    public String getMessage() {
        return "Hello from Struts Boot";
    }
}
```

and the view is a FreeMarker template at `src/main/resources/templates/hello.ftl`:

```ftl
<h1><@s.property value="message"/></h1>
```

Run `main()` and open `http://localhost:8080/hello.action`.

The `StrutsBootApplication` class needs a public no-argument constructor. `StrutsBoot.run()` blocks until the
server stops.

A complete example, `apps/boot-hello`, is in the [Struts source tree](https://github.com/apache/struts/tree/main/apps/boot-hello).
It is not deployed to Maven repositories.

## Registering actions

`ActionRegistry#action(name, class)` registers an action in the root namespace, and `namespace(path, body)` groups
actions under a namespace. Each call returns a definition that is configured fluently:

```java
@Override
public void actions(ActionRegistry actions) {
    actions.action("index", IndexAction.class).success("index.ftl");

    actions.namespace("/orders", orders -> {
        orders.action("list", OrderListAction.class)
                .httpMethods(HttpMethods.GET)
                .success("orders/list.ftl");

        orders.action("save", OrderSaveAction.class)
                .method("save")
                .httpMethods(HttpMethods.POST)
                .result("input", "orders/edit.ftl")
                .redirectAction("success", "list");
    });
}
```

| Method                                | Meaning                                                                                         |
|---------------------------------------|-------------------------------------------------------------------------------------------------|
| `method(name)`                        | Action method to invoke, `execute` by default.                                                  |
| `success(template)`                   | Shortcut for `result("success", template)`.                                                     |
| `result(name, template)`              | Renders a FreeMarker template. The path must end with `.ftl`.                                   |
| `redirectAction(resultName, action)`  | Redirects to another action, like the [Redirect Action Result](redirect-action-result).        |
| `httpMethods(methods...)`             | Restricts the HTTP methods, like the [`http-method` attribute](action-configuration#http-methods). |
| `interceptors(stack)`                 | Interceptor stack for this action. Also available on a namespace, for all its actions.          |

The registry's packages extend `struts-default`, so actions use the `defaultStack` unless `interceptors(...)` names
another stack. All the usual framework rules apply, including [`@StrutsParameter`](struts-parameter-annotation) on
the properties a request may set.

A template path is resolved under `templates/` on the classpath, so `orders/list.ftl` is
`src/main/resources/templates/orders/list.ftl`. Views are FreeMarker only.

The registry is checked at startup, and the application fails to start when:

- an action name is empty, contains `/`, or is registered twice in a namespace;
- a template is missing from the classpath;
- an action class is not public or has no public no-argument constructor;
- an action is registered both in the registry and in a `struts.xml` package with the same namespace.

## Settings

Settings are read from `struts.properties` on the classpath. A `--key=value` program argument overrides the file.

| Key                        | Default         | Meaning                                       |
|----------------------------|-----------------|-----------------------------------------------|
| `struts.boot.port`         | `8080`          | HTTP port; `0` picks a free port              |
| `struts.boot.context-path` | `""`            | Context path the application is served at     |
| `struts.boot.address`      | all interfaces  | Interface to listen on, e.g. `127.0.0.1`      |

```
java -jar my-app.jar --struts.boot.port=9090 --struts.boot.address=127.0.0.1
```

Other Struts [constants](constant-configuration) can be set in the same `struts.properties` file.

## Defaults

- Tomcat listens on all interfaces, not only on localhost. Set `struts.boot.address` to restrict it.
- Only a plain HTTP connector is opened. Terminate TLS in front of the application, and mark the session cookie
  `Secure` there.
- Sessions are tracked by cookie only, never through a `;jsessionid=` URL parameter, and the session cookie carries
  `SameSite=Lax`.
- Error pages show the status only, without stack traces or the Tomcat version.
- Struts Boot does not turn on `struts.devMode`.
- Each start uses a fresh temporary base directory that is deleted on shutdown.

## Starting from tests

`StrutsBoot.start()` starts the server without blocking and returns a `StrutsBootServer`, which is `AutoCloseable`.
Combined with `--struts.boot.port=0` it fits integration tests:

```java
try (StrutsBootServer server = StrutsBoot.start(HelloApp.class, "--struts.boot.port=0")) {
    String url = server.baseUrl() + "/hello.action";
    // send requests to url
}
```

## Packaging

The `boot-hello` example builds a runnable jar with `maven-shade-plugin`. Every Struts plugin ships its own
`META-INF/struts-plugin.xml`, and shading keeps only one file with that name, so with two or more plugins on the
classpath all but one would be silently lost. If your application uses plugins, package it differently: a thin jar
with its dependencies in a `lib/` directory (`maven-dependency-plugin` copies them, `maven-jar-plugin` writes the
`Class-Path` manifest entry), or a distribution built with `maven-assembly-plugin`.

## Logging

Struts logs through the Log4j 2 API and the starter ships no logging backend, so warnings and errors from Struts are
not printed until you add one, for example:

```xml
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-core</artifactId>
    <scope>runtime</scope>
</dependency>
```

with a `log4j2.xml` on the classpath, or `log4j-slf4j2-impl` to route to an SLF4J backend.
