---
layout: default
title: Logging
parent:
    title: Core Developers
    url: index
---

# Logging

## Logging support

> As from Struts 2.5 version, the logging layer is deprecated and Struts uses Log4j2
> The logging layer will be dropped with the next major release.

> Note: support for a custom logging layer has been removed in Struts 6.x

XWork provides its own layer to support logging - it allows to use many different implementations.

Currently XWork provides support for the following libraries (in that order base on classpath discovery):

- Commons Logging
- [SLF4J](http://www.slf4j.org/)
- [Log4j2](http://logging.apache.org/log4j/2.x/)
- JDK Logger

## Usage

To use given type of library add it as a Maven dependency or drop into WEB-INF/lib folder. XWork LoggerFactory class will 
use given logging provider if available.

To add logging to your application simply declare a Logger as follow:

```java
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

public class MyAction {

    private static final Logger LOG = LoggerFactory.getLogger(MyAction.class);

    private String userName;

    public String execute() {
        LOG.debug("MyAction executed with UserName [#0]", userName);
        return "success";
    }

    // getter / setter

}
```

## Implementing my own factory

You plug in your own logging solution, simple extend LoggerFactory class and provide a delegate which implements Logger 
interface, like below:

**JdkLoggerFactory which adds support for JDK logging**

```java
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

/**
 * Creates jdk loggers
 */
public class JdkLoggerFactory extends LoggerFactory {

    @Override
    protected Logger getLoggerImpl(Class<?> cls) {
        return new JdkLogger(java.util.logging.Logger.getLogger(cls.getName()));
    }
    
    @Override
    protected Logger getLoggerImpl(String name) {
        return new JdkLogger(java.util.logging.Logger.getLogger(name));
    }
}
```

**JdkLogger is a wrapper around java.util.logging.Logger and implements Logger interface**

```java
import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerUtils;

import java.util.logging.Level;

/**
 * Delegates to jdk logger.  Maps fatal to Level.SEVERE along with error.
 */
public class JdkLogger implements Logger {
    
    private java.util.logging.Logger log;
    
    public JdkLogger(java.util.logging.Logger log) {
        this.log = log;
    }

    public void error(String msg, String... args) {
        log.log(Level.SEVERE, LoggerUtils.format(msg, args));
    }

    public void error(String msg, Throwable ex, String... args) {
        log.log(Level.SEVERE, LoggerUtils.format(msg, args), ex);
    }
    
    ...
}
```

Check [the source code](http://struts.apache.org/struts-core/apidocs/com/opensymphony/xwork2/util/logging/package-summary)
to see more details.

## Defining which factory to use

Now you must tell XWork/Struts2 to use your implementation, just define system property like below:

```
-Dxwork.loggerFactory=com.demo.MyLoggerFactory
```

you can use the same to explicit tell the framework which implementation to use and don't depend on class discovery, eg.:

```
-Dxwork.loggerFactory=com.opensymphony.xwork2.util.logging.slf4j.Slf4jLoggerFactory
```

or

```
-Dxwork.loggerFactory=com.opensymphony.xwork2.util.logging.log4j2.Log4j2LoggerFactory
```

will enable Slf4j or Log4j2 even if there is commons-logging on classpath available (commons-logging is the first 
LoggerFactory to look for).
