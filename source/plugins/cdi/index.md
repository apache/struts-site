---
layout: plugin
title: CDI Plugin
---

# CDI Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Overview

CDI - short for Contexts and Dependency Injection - is the new standard for Java EE (though not limited to it) dependency injection frameworks. It was introduced as [JSR 299](http://jcp.org/en/jsr/summary?id=299), being a part of the [Java EE 6](http://jcp.org/en/jsr/detail?id=316) umbrella specification. It is also important to note that it builds on top of JSR 330 (Dependency Injection for Java SE), often referenced as [@Inject](http://jcp.org/en/jsr/summary?id=330).

It can be used as standalone solution packed with your web applications to run in lightweight servlet containers such as Apache Tomcat or Jetty, utilizing standalone CDI implementations such as [JBoss Weld](http://seamframework.org/Weld) (the JSR 299 reference implementation) or [Apache OpenWebBeans](http://openwebbeans.apache.org/). On the other hand, each JEE 6 compliant application server such as [Glassfish](http://glassfish.java.net/), [JBoss AS](http://www.jboss.org/jbossas) or [Apache TomEE](http://openejb.apache.org/apache-tomee.html) is required to have a CDI container on board, making it easy for developers to pack lightweight web or enterprise archives while being able to use a compelling dependency injection feature set.

With the Struts 2 CDI plugin, your application is open to be embedded into this modern, comprehensive and type safe framework and take full use of it.

## Setup

As with all Struts 2 plugins, usage of the CDI plugin is as easy as delivering the right jars with your web application. The plugin then registers itself as the standard ObjectFactory for your Struts 2 application.

> Don't mess up Object Factory Providers

Struts 2 delivers integration into all relevant dependency injection containers via plugins, such as the [Spring Plugin](../spring) or the externally provided [Guice Struts 2 Plugin](http://code.google.com/p/google-guice/wiki/Struts2Integration). Be aware that the central feature of all those, as well as the CDI plugin, is to register itself as Struts 2 Object factory. Usually you will want to use **exactly one of those plugins** in your application, since there will only be **one ObjectFactory** implementation for Struts 2 to chose. If you pack more than one of those plugins, the factory to be chosen will be undetermined. One will win in the end, but who knows which ...

### Maven Setup

The most easy and recommended way use is to simply add a maven dependency for it, along with a dependency to the CDI API for development time usage:

**pom.xml**


```xml

<dependencies>
    ...
    <dependency>
        <groupId>org.apache.struts</groupId>
        <artifactId>struts2-cdi-plugin</artifactId>
        <version>${struts2.version}</version>
    </dependency>
    <dependency>
        <groupId>javax.enterprise</groupId>
        <artifactId>cdi-api</artifactId>
        <version>1.0-SP1</version>
        <scope>provided</scope>
    </dependency>
    ...
</dependencies>

```

whereas `${struts2.version}` should be set either as a property in your pom (recommended) or substituted by a concrete version information, such as 2.3.2 by the time of writing of this document. If you want to use CDI without an application server providing it, you may also want to add a dependency to a CDI implementation of your choice, for example Weld:

**pom.xml with CDI implementation**


```xml

<dependencies>
    ...
    <dependency>
        <groupId>org.apache.struts</groupId>
        <artifactId>struts2-cdi-plugin</artifactId>
        <version>${struts2.version}</version>
    </dependency>
    <dependency>
        <groupId>javax.enterprise</groupId>
        <artifactId>cdi-api</artifactId>
        <version>1.0-SP1</version>
        <scope>provided</scope>
    </dependency>
    <dependency>
        <groupId>org.jboss.weld</groupId>
        <artifactId>weld-core</artifactId>
        <version>1.0.1-Final</version>
    </dependency>
    <dependency>
        <groupId>org.jboss.weld</groupId>
        <artifactId>weld-se</artifactId>
        <version>1.0.1-Final</version>
    </dependency>
    ...
</dependencies>

```

### Manual Integration

Ensure that the struts2-cdi-plugin jar matching your used Struts 2 framework version - it is part of the [Struts 2 distribution](/download.cgi) - is packed within the application archive that will be delivered. If a CDI implementation is provided within your container, no other dependencies are needed. If the latter is not the case, you may want to install a CDI container into your container (as commmon installation or packed with your app) according to the installation instructions of the CDI provider of choice.

For IDE integration, be sure to add both the struts2-cdi-plugin-VERSION.jar as well as the cdi-api.jar to your project setup. Remember, the API jar should not be delivered with your application archive since you will have the API provided by the CDI container your application will be running with.

### Configuration

Not much to see here. The CDI specification requires the CDI container to be exposed via JNDI context, and the CDI plugin will pick it up just there. Nevertheless, since there are different JNDI namespaces in use, the plugin will try to automatically find the right one among known references, that is

+ java:comp/BeanManager as the CDI docs point out

+ java:app/BeanManager as the Weld docs point out

+ java:comp/env/BeanManager for containers limited to that namespace, such as tomcat

If your container of choice uses other naming references, the plugin has a single configuration option to point to the right name. Just add a constant like this to your struts.xml to be on the happy path again:

**struts.xml**


```xml

    <constant name="struts.objectFactory.cdi.jndiKey" value="java:comp/some/weird/BeanManagerReference" />

```

## Usage

CDI has an extremely rich feature set, and this section is not intended as a replacement for the CDI reference documentation or the excellent documentation found on the [JBoss Weld](http://seamframework.org/Weld) homepage. The whole Struts 2 CDI integration works just as you would think it works, using JSR-299 and JSR-330 Annotations in your Struts 2 actions or interceptors. Be aware of the following, though:

> Remember to provide beans.xml

CDI is designed to act in a type safe and modern way, thus using annotations for all aspects of the framework. Nevertheless, you are allowed to eternalize configuration into a XML file called beans.xml to be placed in your WEB-INF directory. Even if you don't intend to use such external configuration, it is an **inevitable requirement to provide at least an empty beans.xml in WEB-INF !**

### Example Usage

Implement your Struts 2 actions or interceptors just as usual, enriched with CDI and @Inject annotations:

**NumberGuess.java**


```java

package org.apache.struts2.example.cdi;

import com.opensymphony.xwork2.ActionSupport;
import javax.inject.Inject;

public class NumberGuess extends ActionSupport {

    @Inject
    Game game;

    public Game getGame() {
        return game;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    public String guess() throws Exception {
        final String errorMessage = game.check();
        addActionError(errorMessage);

        if (Game.CORRECT.equals(errorMessage)) {
            game.reset();
        } else if (game.getRemainingGuesses() == 0) {
            addActionError("The correct guess was " + game.getGuess() + ". Game is reset.");
            game.reset();
        }


        return SUCCESS;
    }


}

```

See the @Inject annotation from javax.inject.Inject? While you could use all the other nice stuff, we usually would - following the separation of concerns principle - use @Inject most of the time only in our actions, keeping the more fancy stuff in the business layer as shown below. Using @Inject brings us to the most common pitfall when using Struts 2 together with JSR-330 / CDI:

> Use the right @Inject

Struts 2 and it's core component XWork use it's own internal dependency injection container. Interestingly, you could name it JSR-330's grandma, since it is an early pre-release version of [Google Guice](http://code.google.com/p/google-guice/) once developed by [Crazybob Lee](http://blog.crazybob.org/) - the same Bob Lee that, together with SpringSource's Rod Johnson, lead the JSR-330 specification.

That said, you will find the @Inject annotation both as com.opensymphony.xwork2.inject.Inject and javax.inject.Inject. **Don't mix up those two - javax.inject.Inject is the one you want to use with your Struts 2 CDI plugin and CDI integration in general!** While you could use Struts' internal annotation as well, the effect may be strange to undefined - so check your imports!

Now that you are aware of that, here is the rest of the inevitable NumberGuess CDI example in Struts 2 flavour. Add a JSP view similar to this:


```jsp

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Numberguess</title>
</head>

<body>
<h2>Numberguess Game - Struts 2 CDI Example</h2>

<h3>I've picked a number between <s:property value="game.smallest"/> and <s:property value="game.biggest"/>.
    You have <s:property value="game.remainingGuesses"/>remaining guesses.</h3>

<s:form action="guess">
    <s:textfield name="game.guess" label="Your Guess"/>
    <s:submit/>
</s:form>
<p/>
<s:actionerror/>

</body>
</html>

```

along - if not using the fabulous and recommended Struts 2 [Convention Plugin](../convention) - with a struts.xml like this


```xml

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE struts PUBLIC
          "-//Apache Software Foundation//DTD Struts Configuration 2.3//EN"       
          "http://struts.apache.org/dtds/struts-2.3.dtd">
<struts>
  <constant name="struts.enable.DynamicMethodInvocation" value="false"/>
  <constant name="struts.devMode" value="true"/>
  
    <package name="numberguess" extends="struts-default">

        <action name="NumberGuess" class="org.apache.struts2.example.cdi.NumberGuess">
            <result>/WEB-INF/pages/NumberGuess.jsp</result>
        </action>

        <action name="guess" class="org.apache.struts2.example.cdi.NumberGuess" method="guess">
            <result>/WEB-INF/pages/NumberGuess.jsp</result>
        </action>

    </package>

</struts>

```

Now you can add the business logic we want to be managed and injected by CDI. Start with two qualifier annotations:


```java

package org.apache.struts2.example.cdi;

import javax.inject.Qualifier;
import java.lang.annotation.Documented;
import static java.lang.annotation.ElementType.*;
import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Target;

@Target( { TYPE, METHOD, PARAMETER, FIELD })
@Retention(RUNTIME)
@Documented
@Qualifier
public @interface Random {}

```


```java

package org.apache.struts2.example.cdi;

import javax.inject.Qualifier;
import java.lang.annotation.Documented;
import static java.lang.annotation.ElementType.*;
import java.lang.annotation.Retention;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Target;

@Target( { TYPE, METHOD, PARAMETER, FIELD })
@Retention(RUNTIME)
@Documented
@Qualifier
public @interface MaxNumber {}

```

Now on to the actual business beans, the Game and the Generator bean:


```java

package org.apache.struts2.example.cdi;

import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.enterprise.inject.Instance;
import javax.inject.Inject;
import javax.inject.Named;
import java.io.Serializable;

@Named
@SessionScoped
public class Game implements Serializable {

    public static final String CORRECT = "Correct !!!";
    public static final String WRONG = "Sorry, wrong number !!!";

    private int number;
    private int guess;
    private int smallest;

    @MaxNumber
    @Inject
    private int maxNumber;

    private int biggest;
    private int remainingGuesses;

    @Random
    @Inject
    Instance<Integer> randomNumber;

    public Game() {
    }

    public int getNumber() {
        return number;
    }

    public int getGuess() {
        return guess;
    }

    public void setGuess( int guess ) {
        this.guess = guess;
    }

    public int getSmallest() {
        return smallest;
    }

    public int getBiggest() {
        return biggest;
    }

    public int getRemainingGuesses() {
        return remainingGuesses;
    }

    public String check() throws InterruptedException {
        if (guess > number) {
            biggest = guess - 1;
        }
        if (guess < number) {
            smallest = guess + 1;
        }
        if (guess == number) {
            return CORRECT;
        }
        remainingGuesses--;
        return WRONG;
    }

    @PostConstruct
    public void reset() {
        this.smallest = 0;
        this.guess = 0;
        this.remainingGuesses = 10;
        this.biggest = maxNumber;
        this.number = randomNumber.get();
    }

}

```


```java

package org.apache.struts2.example.cdi;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;
import java.io.Serializable;

@ApplicationScoped
public class Generator implements Serializable {
   
   private java.util.Random random = new java.util.Random( System.currentTimeMillis() );
   
   private int maxNumber = 100;
   
   java.util.Random getRandom() {
      return random;
   }
   
   @Produces @Random int next() { 
      return getRandom().nextInt(maxNumber); 
   }
   
   @Produces @MaxNumber int getMaxNumber() {
      return maxNumber;
   }

} 

```

If you understand that code at a glance, you are either already an CDI expert or profit from the readable, natural language oriented way the CDI stack works. If neither of this is the case, now it's time to check the CDI and Weld documentation. Remember, this is a trivial example - there is much more to know about CDI.

Ready you are now - use the Force!
