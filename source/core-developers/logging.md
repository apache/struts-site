---
layout: default
title: Logging
parent:
    title: Core Developers
    url: index
---

# Logging

## Logging support

Struts logs through [Log4j2](https://logging.apache.org/log4j/2.x/). The `struts2-core` artifact declares `log4j-api`
and `log4j-core`, and configuration is plain Log4j2 configuration — a `log4j2.xml` on the classpath, typically under
`src/main/resources`. See [Debugging Struts](../getting-started/debugging-struts) for an example configuration and the
framework packages worth raising to `DEBUG`.

The pluggable logging layer that XWork used to provide — `com.opensymphony.xwork2.util.logging.LoggerFactory`, the
`xwork.loggerFactory` system property and the Commons Logging / SLF4J / JDK Logger delegates — was deprecated in
Struts 2.5 and **removed in Struts 6.0.0**. There is no framework-level logging abstraction to configure any more, and
setting `-Dxwork.loggerFactory` has no effect.
{:.alert .alert-warning}

The Log4j2 bridges for third-party libraries (`log4j-jcl` for Commons Logging, `log4j-slf4j-impl` for SLF4J) are a
separate concern and remain available. They route logging emitted by transitive dependencies into Log4j2.

Struts 7.3.0 finished the job: the last `java.util.logging` and SLF4J call sites inside the framework — in the
dependency-injection container, its finalizable reference queue and the Tiles plugin's Velocity renderable — now log
through Log4j2, and the `slf4j-api` dependency was dropped from `struts2-core`, see
[WW-5620](https://issues.apache.org/jira/browse/WW-5620). That dependency was declared `optional`, so it was never
propagated to applications and nothing changes on your classpath. Struts 6.11.0 still declares it.

**Removed in Struts 7.3.0**: the internal DI container no longer provides a `Logger` binding. `@Inject`-ing a
`java.util.logging.Logger` into a container-managed bean used to yield a JUL logger named after the declaring class;
that binding was removed along with the JUL usage, so such an injection no longer resolves. Declare a Log4j2 logger
directly instead, as shown below.
{:.alert .alert-warning}

## Usage

Declare a Log4j2 logger in your own classes as usual:

```java
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class MyAction {

    private static final Logger LOG = LogManager.getLogger(MyAction.class);

    private String userName;

    public String execute() {
        LOG.debug("MyAction executed with UserName [{}]", userName);
        return "success";
    }

    // getter / setter

}
```

Note the `{}` placeholder — Log4j2 parameterised messages, not the `#0` syntax used by the removed XWork logger.

## Routing Struts logging elsewhere

Because Struts logs against the Log4j2 API rather than its own abstraction, redirecting its output is a Log4j2
concern: either configure Log4j2 appenders as you need them, or put a bridge to your logging backend of choice on the
classpath in place of `log4j-core`. Nothing needs to be declared in `struts.xml`.
