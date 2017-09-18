---
layout: default
title: Plugins Developers Guide (WIP)
---

#Plugin Developers Guide# {#PAGE_44163}


Apache Struts 2 provides a simple [plugin architecture](#PAGE_13868) so that developers can extend the framework just by adding a JAR to the application's classpath\. Since plugins are contained in a JAR, they are easy to share with others\. Several plugins are bundled with the framework, and others are available from third\-party sources\.

| 

| 

| + [Plugins](#PAGE_13868)

| 

| + _Extending an Application with Custom Plugins_ 

| 

| 

| 

| __Bundled Plugins__

| 

| 

| 

| |\
\
+ [Bean Validation Plugin](#PAGE_57904184) (2\.5\+)\
\
+ [CDI (JSR 299) Plugin](#PAGE_27842284) (2\.3\.1\+)\
\
+ [Codebehind Plugin](#PAGE_29637) (\< 2\.5)\
\
+ [Config Browser Plugin](#PAGE_44185)\
\
+ [Convention Plugin](#PAGE_105613) (2\.1\.3\+)\
\
+ [DWR Plugin](#PAGE_82454)\
\
+ [Embedded JSP Plugin](#PAGE_2852037) (2\.1\.7\+)\
\
+ [JasperReports Plugin](#PAGE_14258)\
\
+ [Java 8 Support Plugin](#PAGE_50857342) (2\.3\.21 \- 2\.5\.2)\
\
+ [Javatemplates Plugin](#PAGE_105841) (2\.1\.3\+)\
\
+ [JFreeChart Plugin](#PAGE_14300)\
\
+ [JSF Plugin](#PAGE_44198)( \< 2\.5)\
\
+ [JSON Plugin](#PAGE_2850922)  (2\.1\.7\+)\
\
+ [JUnit Plugin](#PAGE_82304)\
|\
\
+ [OVal Plugin](#PAGE_114997) (2\.1\.7\+)\
\
+ [OSGi Plugin](#PAGE_114995) (2\.1\.7\+)\
\
+ [Plexus Plugin](#PAGE_44204)\
\
+ [Portlet Plugin](#PAGE_74033)\
\
+ [Portlet Tiles Plugin](#PAGE_30150178) (2\.3\.5\+)\
\
+ [REST Plugin](#PAGE_70699) (2\.1\.1\+)\
\
+ Deprecated: [SiteGraph Plugin](#PAGE_14137)\
\
+ [SiteMesh Plugin](#PAGE_14142)\
\
+ [Spring Plugin](#PAGE_14281)\
\
+ [Struts 1 Plugin](#PAGE_44227)( \< 2\.5)\
\
+ [TestNG Plugin](#PAGE_82452)\
\
+ [Tiles Plugin](#PAGE_27401)\
\
+ [Tiles 3 Plugin](#PAGE_30750969)  (\< 2\.5)\
|
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|


| 

| 

|  (ok)  For a complete list of bundled and third\-party plugins, visit the [Plugin Registry\.](http://cwiki\.apache\.org/S2PLUGINS/home\.html)^[http://cwiki\.apache\.org/S2PLUGINS/home\.html]\.

| 

###Next:###

##Bean Validation Plugin## {#PAGE_57904184}

###Bean Validation###

The Bean Validation plugin implements a bridge to use Bean Validation in struts actions\. Bean Validation has been specified in JSR 303 and is part of the JavaEE platform\. Full\-fledged application servers already bring validation providers which can be leveraged by this plugin\. The plugin integrates with other struts features like:

+ i18n

+ model driven

+ AJAX Validation

+ workflow

###Setup###

In order to use the Bean Validation plugin, you first need to add the JAR file to the 

~~~~~~~
WEB-INF/lib
~~~~~~~
 directory of your application or include the dependency in your project's Maven POM file\.

**pom\.xml**


~~~~~~~
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-bean-validation-plugin</artifactId>
    <version>X.X.X</version>
</dependency>

~~~~~~~

Where X\.X\.X is the current version of Struts 2\. Please remember that the Bean Validation Plugin is available from version 2\.5\.

###Configuration###

This sample shows the configuration constants the plugin provides\. It also shows how to enable bean\-validation by extending your own application package from 

~~~~~~~
struts-bean-validation
~~~~~~~
 which comes along with the plugin\.

**struts\.xml**


~~~~~~~
    <constant name="struts.beanValidation.providerClass" value="org.hibernate.validator.HibernateValidator"/>
    <constant name="struts.beanValidation.ignoreXMLConfiguration" value="false"/>
    <constant name="struts.beanValidation.convertMessageToUtf" value="false"/>
    <constant name="struts.beanValidation.convertMessageFromEncoding" value="ISO-8859-1"/>
 
	<package name="my-bean-validation" extends="struts-bean-validation">
	</package>
~~~~~~~

Here is another example that shows how you can combine bean\-validation with other plugins by configuring your own Interceptor\-Stack (note: this is just a very short example\. In a real app you should take more care about your stack)\. You can combine bean validation with classic struts validation (or disable either) by putting the according interceptors in your stack (or by removing them from your stack)\.

**struts\.xml**


~~~~~~~
	<package name="my-app-package" extends="struts-default">
		<interceptors>
			<interceptor
				 name="beanValidation"
				 class="org.apache.struts.beanvalidation.validation.interceptor.BeanValidationInterceptor"/>

			<interceptor-stack name="appDefaultStack">
				<interceptor-ref name="beanValidation"/>
				<interceptor-ref name="defaultStack"/>
			</interceptor-stack>
		</interceptors>
	</package>
~~~~~~~

 

###Bean Validation Example###

Here is an example Action that makes use of bean validation\. Note that some of the validation annotations are taken from 

~~~~~~~
javax
~~~~~~~
 package (which is defined in the JSR) while others are taken from the validaton provider (in this case: 

~~~~~~~
hibernate
~~~~~~~
)\. You can specifiy own text keys in the 

~~~~~~~
message
~~~~~~~
 attribute of the annotations\. If you do that the whole struts i18n mechanism kicks in to resolve those text keys\.

**com\.example\.actions\.BeanValidationAction**


~~~~~~~
package com.example.actions;


import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts.beanvalidation.constraints.FieldMatch;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.ScriptAssert;
import org.hibernate.validator.constraints.URL;
import javax.validation.constraints.*;
import java.util.Date;


@Namespace("/bean-validation")
@ParentPackage("my-bean-validation")
@Action(results = {
        @Result(name = "input", location = "bean-validation.jsp"),
        @Result(name = "success", location = "/WEB-INF/validation/successFieldValidatorsExample.jsp")
})
@FieldMatch(first = "fieldExpressionValidatorField", second = "requiredValidatorField", message = "requiredValidatorField and fieldExpressionValidatorField are not matching")
@ScriptAssert(lang = "javascript", script = "_this.dateValidatorField != null && _this.dateValidatorField.before(new java.util.Date())", message = "Date need to before now")
public class BeanValidationExampleAction extends ActionSupport {
    @NotNull
    private String requiredValidatorField = null;

    @NotBlank
    private String requiredStringValidatorField = null;

    @NotNull(message="your.text.key.here")
    @Min(1)
    @Max(10)
    private Integer integerValidatorField = null;

    @NotNull
    private Date dateValidatorField = null;

    @NotNull
    @Size(min = 4, max = 64)
    @Email

    private String emailValidatorField = null;

    @NotNull
    @Size(min = 4, max = 64)
    @URL
    private String urlValidatorField = null;

    @NotNull
    @Size(min = 2, max = 4)
    private String stringLengthValidatorField = null;

    @Pattern(regexp = "[^<>]+")
    private String regexValidatorField = null;

    private String fieldExpressionValidatorField = null;


 public Date getDateValidatorField() {

        return dateValidatorField;
    }
    public void setDateValidatorField(Date dateValidatorField) {
        this.dateValidatorField = dateValidatorField;
    }
    public String getEmailValidatorField() {
        return emailValidatorField;
    }
    public void setEmailValidatorField(String emailValidatorField) {
        this.emailValidatorField = emailValidatorField;
    }
    public Integer getIntegerValidatorField() {
        return integerValidatorField;
    }
    public void setIntegerValidatorField(Integer integerValidatorField) {
        this.integerValidatorField = integerValidatorField;
    }
    public String getRegexValidatorField() {
        return regexValidatorField;
    }
    public void setRegexValidatorField(String regexValidatorField) {
        this.regexValidatorField = regexValidatorField;
    }
    public String getRequiredStringValidatorField() {
        return requiredStringValidatorField;
    }
    public void setRequiredStringValidatorField(String requiredStringValidatorField) {
        this.requiredStringValidatorField = requiredStringValidatorField;
    }
    public String getRequiredValidatorField() {
        return requiredValidatorField;
    }
    public void setRequiredValidatorField(String requiredValidatorField) {
        this.requiredValidatorField = requiredValidatorField;
    }
    public String getStringLengthValidatorField() {
        return stringLengthValidatorField;
    }
    public void setStringLengthValidatorField(String stringLengthValidatorField) {
        this.stringLengthValidatorField = stringLengthValidatorField;
    }
    public String getFieldExpressionValidatorField() {
        return fieldExpressionValidatorField;
    }
    public void setFieldExpressionValidatorField(
            String fieldExpressionValidatorField) {
        this.fieldExpressionValidatorField = fieldExpressionValidatorField;
    }
    public String getUrlValidatorField() {
        return urlValidatorField;
    }
    public void setUrlValidatorField(String urlValidatorField) {
        this.urlValidatorField = urlValidatorField;
    }
}
~~~~~~~

##CDI Plugin## {#PAGE_27842284}

###Overview###

CDI \- short for Contexts and Dependency Injection \- is the new standard for Java EE (though not limited to it) dependency injection frameworks\. It was introduced as [JSR 299](http://jcp\.org/en/jsr/summary?id=299)^[http://jcp\.org/en/jsr/summary?id=299], being a part of the [Java EE 6](http://jcp\.org/en/jsr/detail?id=316)^[http://jcp\.org/en/jsr/detail?id=316] umbrella specification\. It is also important to note that it builds on top of JSR 330 (Dependency Injection for Java SE), often referenced as [@Inject](http://jcp\.org/en/jsr/summary?id=330)^[http://jcp\.org/en/jsr/summary?id=330]\.

It can be used as standalone solution packed with your web applications to run in lightweight servlet containers such as Apache Tomcat or Jetty, utilizing standalone CDI implementations such as [JBoss Weld](http://seamframework\.org/Weld)^[http://seamframework\.org/Weld] (the JSR 299 reference implementation) or [Apache OpenWebBeans](http://openwebbeans\.apache\.org/)^[http://openwebbeans\.apache\.org/]\. On the other hand, each JEE 6 compliant application server such as [Glassfish](http://glassfish\.java\.net/)^[http://glassfish\.java\.net/], [JBoss AS](http://www\.jboss\.org/jbossas)^[http://www\.jboss\.org/jbossas] or [Apache TomEE](http://openejb\.apache\.org/apache\-tomee\.html)^[http://openejb\.apache\.org/apache\-tomee\.html] is required to have a CDI container on board, making it easy for developers to pack lightweight web or enterprise archives while being able to use a compelling dependency injection feature set\.

With the Struts 2 CDI plugin, your application is open to be embedded into this modern, comprehensive and type safe framework and take full use of it\.

###Setup###

As with all Struts 2 plugins, usage of the CDI plugin is as easy as delivering the right jars with your web application\. The plugin then registers itself as the standard ObjectFactory for your Struts 2 application\.

**(i) Don't mess up Object Factory Providers**


> 

> 

> Struts 2 delivers integration into all relevant dependency injection containers via plugins, such as the [Spring Plugin](#PAGE_14281) or the externally provided [Guice Struts 2 Plugin](http://code\.google\.com/p/google\-guice/wiki/Struts2Integration)^[http://code\.google\.com/p/google\-guice/wiki/Struts2Integration]\. Be aware that the central feature of all those, as well as the CDI plugin, is to register itself as Struts 2 Object factory\. Usually you will want to use **exactly one of those plugins** in your application, since there will only be **one ObjectFactory** implementation for Struts 2 to chose\. If you pack more than one of those plugins, the factory to be chosen will be undetermined\. One will win in the end, but who knows which \.\.\.

> 

####Maven Setup####

The most easy and recommended way use is to simply add a maven dependency for it, along with a dependency to the CDI API for development time usage:

**pom\.xml**


~~~~~~~

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

~~~~~~~

whereas 


~~~~~~~
${struts2.version}
~~~~~~~

 should be set either as a property in your pom (recommended) or substituted by a concrete version information, such as 2\.3\.2 by the time of writing of this document\. If you want to use CDI without an application server providing it, you may also want to add a dependency to a CDI implementation of your choice, for example Weld:

**pom\.xml with CDI implementation**


~~~~~~~

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

~~~~~~~

####Manual Integration####

Ensure that the struts2\-cdi\-plugin jar matching your used Struts 2 framework version \- it is part of the [Struts 2 distribution](http://struts\.apache\.org/download\.cgi)^[http://struts\.apache\.org/download\.cgi] \- is packed within the application archive that will be delivered\. If a CDI implementation is provided within your container, no other dependencies are needed\. If the latter is not the case, you may want to install a CDI container into your container (as commmon installation or packed with your app) according to the installation instructions of the CDI provider of choice\.

For IDE integration, be sure to add both the struts2\-cdi\-plugin\-VERSION\.jar as well as the cdi\-api\.jar to your project setup\. Remember, the API jar should not be delivered with your application archive since you will have the API provided by the CDI container your application will be running with\.

####Configuration####

Not much to see here\. The CDI specification requires the CDI container to be exposed via JNDI context, and the CDI plugin will pick it up just there\. Nevertheless, since there are different JNDI namespaces in use, the plugin will try to automatically find the right one among known references, that is

+ java:comp/BeanManager as the CDI docs point out

+ java:app/BeanManager as the Weld docs point out

+ java:comp/env/BeanManager for containers limited to that namespace, such as tomcat

If your container of choice uses other naming references, the plugin has a single configuration option to point to the right name\. Just add a constant like this to your struts\.xml to be on the happy path again:

**struts\.xml**


~~~~~~~

    <constant name="struts.objectFactory.cdi.jndiKey" value="java:comp/some/weird/BeanManagerReference" />

~~~~~~~

###Usage###

CDI has an extremely rich feature set, and this section is not intended as a replacement for the CDI reference documentation or the excellent documentation found on the [JBoss Weld](http://seamframework\.org/Weld)^[http://seamframework\.org/Weld] homepage\. The whole Struts 2 CDI integration works just as you would think it works, using JSR\-299 and JSR\-330 Annotations in your Struts 2 actions or interceptors\. Be aware of the following, though:



| CDI is designed to act in a type safe and modern way, thus using annotations for all aspects of the framework\. Nevertheless, you are allowed to eternalize configuration into a XML file called beans\.xml to be placed in your WEB\-INF directory\. Even if you don't intend to use such external configuration, it is an **inevitable requirement to provide at least an empty beans\.xml in WEB\-INF \!**

| 

####Example Usage####

Implement your Struts 2 actions or interceptors just as usual, enriched with CDI and @Inject annotations:

**NumberGuess\.java**


~~~~~~~

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

~~~~~~~

See the @Inject annotation from javax\.inject\.Inject? While you could use all the other nice stuff, we usually would \- following the separation of concerns principle \- use @Inject most of the time only in our actions, keeping the more fancy stuff in the business layer as shown below\. Using @Inject brings us to the most common pitfall when using Struts 2 together with JSR\-330 / CDI:

**(i) Use the right @Inject**


> 

> 

> Struts 2 and it's core component XWork use it's own internal dependency injection container\. Interestingly, you could name it JSR\-330's grandma, since it is an early pre\-release version of [Google Guice](http://code\.google\.com/p/google\-guice/)^[http://code\.google\.com/p/google\-guice/] once developed by [Crazybob Lee](http://blog\.crazybob\.org/)^[http://blog\.crazybob\.org/] \- the same Bob Lee that, together with SpringSource's Rod Johnson, lead the JSR\-330 specification\.

> 

> 

> That said, you will find the @Inject annotation both as com\.opensymphony\.xwork2\.inject\.Inject and javax\.inject\.Inject\. **Don't mix up those two \- javax\.inject\.Inject is the one you want to use with your Struts 2 CDI plugin and CDI integration in general\!** While you could use Struts' internal annotation as well, the effect may be strange to undefined \- so check your imports\!

> 

Now that you are aware of that, here is the rest of the inevitable NumberGuess CDI example in Struts 2 flavour\. Add a JSP view similar to this:


~~~~~~~

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

~~~~~~~

along \- if not using the fabulous and recommended Struts 2 [Convention Plugin](#PAGE_105613) \- with a struts\.xml like this


~~~~~~~

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

~~~~~~~

Now you can add the business logic we want to be managed and injected by CDI\. Start with two qualifier annotations:


~~~~~~~

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

~~~~~~~


~~~~~~~

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

~~~~~~~

Now on to the actual business beans, the Game and the Generator bean:


~~~~~~~

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

~~~~~~~


~~~~~~~

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

~~~~~~~

If you understand that code at a glance, you are either already an CDI expert or profit from the readable, natural language oriented way the CDI stack works\. If neither of this is the case, now it's time to check the CDI and Weld documentation\. Remember, this is a trivial example \- there is much more to know about CDI\.

Ready you are now \- use the Force\!

##Codebehind Plugin## {#PAGE_29637}

**(\!) Deprecated Plugin**


> 

> 

> Since 2\.1 this plugin has been deprecated in favor of the [Convention Plugin](#PAGE_105613)\. See [this page](#PAGE_106500) for details on how to port your application to the Convention plugin\.

> 

The Codebehind Plugin 

reduces mundane configuration by adding "Page Controller" conventions


There are two common situations where the plugin applies convention over configuration:

1. **Default mappings** - (or "pages with no mappings") These are cases where the page is mostly static and doesn't require an Action class to execute logic.  Common examples are index pages and those that heavily use JSP tags or JSF components.

2. **Default results** - The purpose of most Actions is to execute code to prepare the data for a specific page. The name of this page is often the same as the Action itself.

To improve the first case, the plugin will detect the presence of a page with no corresponding Struts mapping and automatically substitute a mapping that uses the default Action class for the package, which is usually ActionSupport, a NO\-OP Action\.  

For the problem of default results, the plugin will make it unnecessary to define those results by detecting the presence of a page for that Action and creating the appropriate configuration on\-the\-fly\. 

In these two ways, the plugin encourages a page\-based development style, handling the linking of Struts actions with pages and pages with Results in a common way\.

 (ok)  To see the plugin in action, review the "Person Manager" example in the Showcase application\.

####Features####

+ Provides default mappings for pages that don't have Actions

+ Provides default results by auto\-discovering pages

####Usage####

To use this plugin, simply copy its jar into your application\.  The plugin can be used to find default mappings and results\.

#####Default Mappings#####

To better facilitate a code\-behind development approach, the plugin will detect the case where the request has no defined Struts action mapping, yet there exists a corresponding page\.  It will then create a dummy action mapping referencing the default Action class (usually ActionSupport), allowing the page to be displayed normally\.  Additionally, the default interceptor stack for the configured package will be applied, bringing the workflow benefits of interceptor stacks to simple pages\.

When no explicitly configured Action can be found for a request, the plugin searches the web application for a likely page\. Specifically, the following pattern is used to locate a page:



~~~~~~~
/NAMESPACE/ACTION.(jsp|vm|ftl)
~~~~~~~

For example, if the request is for 

~~~~~~~
http://www.company.com/myapp/member/login.action
~~~~~~~
, the plugin will look for the following pages, in this order: 

1. 

~~~~~~~
/member/login.jsp
~~~~~~~

2. 

~~~~~~~
/member/login.vm
~~~~~~~

3. 

~~~~~~~
/member/login.ftl
~~~~~~~

If any of those pages are found, the plugin will construct an ActionConfig object on the fly, using the ActionSupport class for the Action and a single Result that points to the discovered page\.  The ActionConfig will be put in the configured package, meaning that it will inherit the default Interceptor stack for that package\.  The default package is 

~~~~~~~
codebehind-default
~~~~~~~
, however, it can be configured in any _configuration file_  via the 

~~~~~~~
struts.codebehind.defaultPackage
~~~~~~~
 constant\.

#####Default Results#####

In many applications, a majority of Results could have the same root name as the action mapping\.  To reduce this unnecessary configuration, the Struts plugin will try to guess the appropriate Result, if none is explicitly configured\.  This technique works for any result code, including 

~~~~~~~
success
~~~~~~~
\. When combined with the _Zero Configuration_  style, the amount of configuration in an application dwindles to next to nothing\.

When no explicitly configured Result is found for an Action's result code, the plugin, again, searches the web application for a matching page\. Specifically, the following patterns, in the following order, are used to locate a page:

1. 

~~~~~~~
/NAMESPACE/ACTION-RESULT_CODE.(jsp|vm|ftl)
~~~~~~~

2. 

~~~~~~~
/NAMESPACE/ACTION.(jsp|vm|ftl)
~~~~~~~

These two patterns are searched for each of the three default page extensions: jsp, vm, and ftl\.  For example, if the request is for 

~~~~~~~
http://www.company.com/myapp/member/login.action
~~~~~~~
, so that the action name is 

~~~~~~~
login
~~~~~~~
 and the namespace is 

~~~~~~~
member
~~~~~~~
, and the Action class returned a code of 

~~~~~~~
success
~~~~~~~
, the plugin will look for the following pages, in this order: 

1. 

~~~~~~~
/member/login-success.jsp
~~~~~~~

2. 

~~~~~~~
/member/login.jsp
~~~~~~~

3. 

~~~~~~~
/member/login-success.vm
~~~~~~~

4. 

~~~~~~~
/member/login.vm
~~~~~~~

5. 

~~~~~~~
/member/login-success.ftl
~~~~~~~

6. 

~~~~~~~
/member/login.ftl
~~~~~~~

If any of those pages are found, the appropriate Result will be constructed and processed\.

#####Settings#####

The following settings can be customized\.  See the [developer guide](http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files)^[http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files]\.

|Setting|Description|Default|Possible Values|
|-------|-----------|-------|---------------|
|struts\.codebehind\.defaultPackage|The default package to use for created Action mappings|codebehind\-default|Any existing package name|
|struts\.configuration\.classpath\.disableActionScanning|Whether to disable scanning the classpath for Action classes or not|false|true or false|

#####Installation#####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

##Config Browser Plugin## {#PAGE_44185}

The Config Browser Plugin is 

a simple tool to help view an application's configuration at runtime


This plugin should be used only during development phase and access to it should be strictly restricted\!

> 

####Features####

+ Browsable view of loaded configuration

+ Shows all accessible action URLs

####Usage####

To use the plugin, simply copy the jar into your application\.  Once installed, you can access the tool by opening to the action named _index_  in the _config\-browser_  namespace\.

(information) In most cases (if you are using the default _ActionMapper_ ), the URL is something like [http://localhost:8080/starter/config\-browser/index\.action](http://localhost:8080/starter/config\-browser/index\.action) or [http://localhost:8080/starter/config\-browser/index](http://localhost:8080/starter/config\-browser/index)\.

#####Example#####

![config\-browser\-example\.png](/Users/lukaszlenart/Projects/Apache/struts\-site/target/md/attachments/att30966155\_config\-browser\-example\.png)

#####Settings#####

This plugin provides no customizable settings\.

#####Installation#####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

##Convention Plugin## {#PAGE_105613}

This page is DEPRECATED, please refer to the new source [http://struts\.apache\.org/plugins/convention/](http://struts\.apache\.org/plugins/convention/)

> 


###Introduction###

The Convention Plugin is bundled with Struts since 2\.1 and replaces the [Codebehind Plugin](#PAGE_29637) and Zero Config plugins\. It provides the following features:

+ Action location by package naming conventions

+ Result (JSP, FreeMarker, etc) location by naming conventions

+ Class name to URL naming convention

+ Package name to namespace convention

+ SEO compliant URLs (i\.e\. my\-action rather than MyAction)

+ Action name overrides using annotations

+ Interceptor overrides using annotations

+ Namespace overrides using annotations

+ XWork package overrides using annotations

+ Default action and result handling (i\.e\. /products will try com\.example\.actions\.Products as well as com\.example\.actions\.products\.Index)

The Convention Plugin should require no configuration to use\. Many of the conventions can be controlled using configuration properties and many of the classes can be extended or overridden\.

###Setup###

In order to use the Convention plugin, you first need to add the JAR file to the 

~~~~~~~
WEB-INF/lib
~~~~~~~
 directory of your application or include the dependency in your project's Maven POM file\.


~~~~~~~
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-convention-plugin</artifactId>
    <version>X.X.X</version>
</dependency>

~~~~~~~

Where X\.X\.X is the current version of Struts 2\. Please remember that the Convention Plugin is available from version 2\.1\.6\.

###Converting a Codebehind based application to Convention###

See [this page](#PAGE_106500) for the required changes and tips\.

If you are using REST with the Convention plugin, make sure you set these constants in struts\.xml:


~~~~~~~
<constant name="struts.convention.action.suffix" value="Controller"/>
<constant name="struts.convention.action.mapAllMatches" value="true"/>
<constant name="struts.convention.default.parent.package" value="rest-default"/>

~~~~~~~

###Hello world###

Now that the Convention plugin has been added to your application, let's start with a very simple example\. This example will use an actionless result that is identified by the URL\. By default, the Convention plugin assumes that all of the results are stored in **WEB\-INF/content**\. This can be changed by setting the property 

~~~~~~~
struts.convention.result.path
~~~~~~~
 in the Struts properties file to the new location\. Don't worry about trailing slashes, the Convention plugin handles this for you\. Here is our hello world JSP:


~~~~~~~
<html>
<body>
Hello world!
</body>
</html>

~~~~~~~

If you start Tomcat (or whichever J2EE container you are using) and type in [http://localhost:8080/hello\-world](http://localhost:8080/hello\-world) (assuming that your context path is "

~~~~~~~
/
~~~~~~~
", ie\. starting application from Eclipse) into your browser you should get this result:

**WEB\-INF/content/hello\-world\.jsp**


~~~~~~~
Hello world!

~~~~~~~

This illustrates that the Convention plugin will find results even when no action exists and it is all based on the URL passed to Struts\.

###Code behind hello world###

Let's expand on this example and add a code behind class\. In order to do this we need to ensure that the Convention plugin is able to find our action classes\. By default, the Convention plugin will find all action classes that implement 

~~~~~~~
com.opensymphony.xwork2.Action
~~~~~~~
 or whose name ends with the word **Action** in specific packages\.

These packages are located by the Convention plugin using a search methodology\. First the Convention plugin finds packages named 

~~~~~~~
struts
~~~~~~~
, 

~~~~~~~
struts2
~~~~~~~
, 

~~~~~~~
action
~~~~~~~
 or 

~~~~~~~
actions
~~~~~~~
\. Any packages that match those names are considered the root packages for the Convention plugin\. Next, the plugin looks at all of the classes in those packages as well as sub\-packages and determines if the classes implement 

~~~~~~~
com.opensymphony.xwork2.Action
~~~~~~~
 or if their name ends with **Action** (i\.e\. FooAction)\. Here's an example of a few classes that the Convention plugin will find:

**Classes**


~~~~~~~
com.example.actions.MainAction
com.example.actions.products.Display (implements com.opensymphony.xwork2.Action)
com.example.struts.company.details.ShowCompanyDetailsAction

~~~~~~~

Each of the action classes that the plugin finds will be configured to respond to specific URLs\. The URL is based on the package name that the class is defined in and the class name itself\. First the plugin determines the namespace of the URL using the package names between the root package and the package the class is defined in\. For our examples above, the namespaces would be:

**Namespaces**


~~~~~~~
com.example.actions.MainAction -> /
com.example.actions.products.Display -> /products
com.example.struts.company.details.ShowCompanyDetailsAction -> /company/details

~~~~~~~

Next, the plugin determines the URL of the resource using the class name\. It first removes the word **Action** from the end of the class name and then converts camel case names to dashes\. In our example the full URLs would be:

**Full URLs**


~~~~~~~
com.example.actions.MainAction -> /main
com.example.actions.products.Display -> /products/display
com.example.struts.company.details.ShowCompanyDetailsAction -> /company/details/show-company-details

~~~~~~~

You can tell the Convention plugin to ignore certain packages using the property 

~~~~~~~
struts.convention.exclude.packages
~~~~~~~
\. You can also tell the plugin to use different strings to locate root packages using the property 

~~~~~~~
struts.convention.package.locators
~~~~~~~
\. Finally, you can tell the plugin to search specific root packages using the property 

~~~~~~~
struts.convention.action.packages
~~~~~~~
\.

Here is our code behind action class:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorld extends ActionSupport {
  private String message;

  public String getMessage() {
    return message;
  }

  public String execute() {
    message = "Hello World!";
    return SUCCESS;
  }
}

~~~~~~~

If you compile this class and place it into your application in the WEB\-INF/classes, the Convention plugin will find the class and map the URL **/hello\-world** to it\. Next, we need to update our JSP to print out the message we setup in the action class\. Here is the new JSP:

**WEB\-INF/content/hello\-world\.jsp**


~~~~~~~
<html>
<body>
The message is ${message}
</body>
</html>

~~~~~~~



| Please notice that the expression \$\{message\}  will work without adding JSP directive isELIgnored="false"\.

| 

 

If start up the application server and open up [http://localhost:8080/hello\-world](http://localhost:8080/hello\-world) in our browser, we should get this result:

**Result**


~~~~~~~
The message is Hello World!

~~~~~~~

###Results and result codes###

The Convention Plugin will pre\-configure all of you action classes when Struts is started\. By default, this configuration will also contain results for any JSPs that it can find within the application\. The JSPs have an additional feature that allows different JSPs to be used based on the result code of the action\. Since action methods return Strings and these Strings are traditionally used to locate results for the action, the Convention plugin allows you to define different results based on the result code\.

Building on our example from above, let's say we want to provide a different result if the result code from our action is the String 

~~~~~~~
zero
~~~~~~~
 rather than 

~~~~~~~
success
~~~~~~~
\. First, we update the action class to return different result codes:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;

public class HelloWorld extends ActionSupport {
  private String message;

  public String getMessage() {
    return message;
  }

  public String execute() {
    if (System.currentTimeMillis() % 2 == 0) {
      message = "It's 0";
      return "zero";
    }

    message = "It's 1";
    return SUCCESS;
  }
}

~~~~~~~

Next, we add a new JSP to the application named 

~~~~~~~
WEB-INF/content/hello-world-zero.jsp
~~~~~~~
\. Notice that the first part of the file name is the same as the URL of the action and the last part of the name is the result code\. This is the convention that the plugin uses to determine which results to render\. Here is our new JSP:

**WEB\-INF/content/hello\-world\.jsp**


~~~~~~~
<html>
<body>
The error message is ${message}
</body>
</html>

~~~~~~~

Now, if you compile the action and restart the application, based on the current time, you'll either see the result from 

~~~~~~~
WEB-INF/content/hello-world.jsp
~~~~~~~
 or 

~~~~~~~
WEB-INF/content/hello-world-zero.jsp
~~~~~~~
\.

The result type is based on the extension of the file\. The supported extensions are: jsp,ftl,vm,html,html\. Examples of Action and Result to Template mapping:

|URL|Result|File that could match|Result Type|
|---|------|---------------------|-----------|
|/hello|success|/WEB\-INF/content/hello\.jsp|Dispatcher|
|/hello|success|/WEB\-INF/content/hello\-success\.htm|Dispatcher|
|/hello|success|/WEB\-INF/content/hello\.ftl|FreeMarker|
|/hello\-world|input|/WEB\-INF/content/hello\-world\-input\.vm|Velocity|
|/test1/test2/hello|error|/WEB\-INF/content/test/test2/hello\-error\.html|Dispatcher|

#####Multiple names#####

It is possible to define multiple names for the same result:


~~~~~~~
@Action(results = {
    @Result(name={"error", "input"}, location="input-form.jsp"),
    @Result(name="success", location="success.jsp")
})
~~~~~~~

Such functionality was added in Struts 2\.5

###Chaining###

If one action returns the name of another action in the same package, they will be chained together, if the first action doesn't have any result defined for that code\. In the following example:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class HelloAction extends ActionSupport {
    @Action("foo")
    public String foo() {
        return "bar";
    }

    @Action("foo-bar")
    public String bar() {
        return SUCCESS;
    }
}

~~~~~~~

The "foo" action will be executed, because no result is found, the Convention plugin tries to find an action named "foo\-bar" on the same package where "foo" is defined\. If such an action is found, it will be invoked using the "chain" result\.

###XWork packages###

Actions are placed on a custom XWork package which prevents conflicts\. The name of this package is based on the Java package the action is defined in, the namespace part of the URL for the action and the parent XWork package for the action\. The parent XWork package is determined based on the property named 

~~~~~~~
struts.convention.default.parent.package
~~~~~~~
(defaults to 

~~~~~~~
convention-default
~~~~~~~
), which is a custom XWork package that extends 

~~~~~~~
struts-default
~~~~~~~
\.

Therefore the naming for XWork packages used by the Convention plugin are in the form:

**XWork package naming**


~~~~~~~
<java-package>#<namespace>#<parent-package>

~~~~~~~

Using our example from above, the XWork package for our action would be:

**XWork package naming**


~~~~~~~
com.example.actions#/#conventionDefault

~~~~~~~

###Annotation reference###

The Convention plugin uses a number of different annotations to override the default conventions that are used to map actions to URLs and locate results\. In addition, you can modify the parent XWork package that actions are configured with\.

####Action annotation####

The Convention plugin allows action classes to change the URL that they are mapped to using the **Action** annotation\. This annotation can also be used inside the **Actions** annotation to allow multiple URLs to map to a single action class\. This annotation must be defined on action methods like this:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;

public class HelloWorld extends ActionSupport {
  @Action("/different/url")
  public String execute() {
    return SUCCESS;
  }
}

~~~~~~~

Our action class will now map to the URL 

~~~~~~~
/different/url
~~~~~~~
 rather than 

~~~~~~~
/hello-world
~~~~~~~
\. If no 

~~~~~~~
@Result
~~~~~~~
 (see next section) is specified, then the namespace of the action will be used as the path to the result, on our last example it would be 

~~~~~~~
/WEB-INF/content/different/url.jsp
~~~~~~~
\.

A single method within an action class can also map to multiple URLs using the **Actions** annotation like this:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;

public class HelloWorld extends ActionSupport {
  @Actions({
    @Action("/different/url"),
    @Action("/another/url")
  })
  public String execute() {
    return SUCCESS;
  }
}

~~~~~~~

Another usage of the **Action** or **Actions** annotation is to define multiple action methods within a single action class, each of which respond to a different URL\. Here is an example of multiple action methods:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;

public class HelloWorld extends ActionSupport {
  @Action("/different/url")
  public String execute() {
    return SUCCESS;


  }

  @Action("url")
  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

The previous example defines a second URL that is not fully qualified\. This means that the namespace for the URL is determined using the Java package name rather than the Action annotation\.

Interceptor and interceptor stacks can be specified using the 

~~~~~~~
interceptorRefs
~~~~~~~
 attribute\. The following example applies the 

~~~~~~~
validation
~~~~~~~
 interceptor and the 

~~~~~~~
defaultStack
~~~~~~~
 interceptor stack to the action:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;

public class HelloWorld extends ActionSupport {
  @Action(interceptorRefs={@InterceptorRef("validation"), @InterceptorRef("defaultStack")})
  public String execute() {
    return SUCCESS;
  }

  @Action("url")
  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

Parameters can be passed to results using the **params** attribute\. The value of this attribute is a string array with an even number of elements in the form \{"key0", "value0, "key1", "value1" \.\.\. "keyN", "valueN"\}\. For example:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;

public class HelloWorld extends ActionSupport {
  @Action(interceptorRefs=@InterceptorRef(value="validation",params={"programmatic", "false", "declarative", "true}))
  public String execute() {
    return SUCCESS;
  }

  @Action("url")
  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

If interceptors are not specified, the default stack is applied\.


> 

> 

> You can specify className parameter which can be especially useful when Spring Framework is used to instantiate actions\.

> 

#####Applying @Action and @Actions at the class level#####

There are circumstances when this is desired, like when using _Dynamic Method Invocation_ \. If an 

~~~~~~~
execute
~~~~~~~
 method is defined in the class, then it will be used for the action mapping, otherwise the method to be used will be determined when a request is made (by Dynamic Method Invocation for example)

####InterceptorRef annotation####

Interceptors can be specified at the method level, using the **Action** annotation or at the class level using the 

~~~~~~~
InterceptorRefs
~~~~~~~
 annotation\. Interceptors specified at the class level will be applied to all actions defined on that class\. In the following example:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;

@InterceptorRefs({
    @InterceptorRef("interceptor-1"),
    @InterceptorRef("defaultStack")
})
public class HelloWorld extends ActionSupport {
  @Action(value="action1", interceptorRefs=@InterceptorRef("validation"))
  public String execute() {
    return SUCCESS;
  }

  @Action(value="action2")
  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

The following interceptors will be applied to "action1": 

~~~~~~~
interceptor-1
~~~~~~~
, all interceptors from 

~~~~~~~
defaultStack
~~~~~~~
, 

~~~~~~~
validation
~~~~~~~
\.
 All interceptors from 

~~~~~~~
defaultStack
~~~~~~~
 will be applied to "action2"\.



| If you get errors like "Unable to find interceptor class referenced by ref\-name XYZ"\. This means that the package where Convention is placing your actions, does not extend the package where the interceptor is defined\. To fix this problem either 1)Use @ParentPackage annotation(or struts\.convention\.default\.parent\.package) passing the name of the package that defines the interceptor, or 2) Create a package in XML that extends the package that defines the interceptor, and use @ParentPackage(or struts\.convention\.default\.parent\.package) to point to it\.

| 

####Result annotation####

The Convention plugin allows action classes to define different results for an action\. Results fall into two categories, global and local\. Global results are shared across all actions defined within the action class\. These results are defined as annotations on the action class\. Local results apply only to the action method they are defined on\. Here is an example of the different types of result annotations:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

@Results({
  @Result(name="failure", location="fail.jsp")
})
public class HelloWorld extends ActionSupport {
  @Action(value="/different/url",
    results={@Result(name="success", location="http://struts.apache.org", type="redirect")}
  )
  public String execute() {
    return SUCCESS;
  }

  @Action("/another/url")

  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

Parameters can be passed to results using the **params** attribute\. The value of this attribute is a string array with an even number of elements in the form \{"key0", "value0, "key1", "value1" \.\.\. "keyN", "valueN"\}\. For example:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

public class HelloWorld extends ActionSupport {
  @Action(value="/different/url",
    results={@Result(name="success", type="httpheader", params={"status", "500", "errorMessage", "Internal Error"})}
  )
  public String execute() {
    return SUCCESS;
  }

  @Action("/another/url")
  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

From 2\.1\.7 on, global results (defined on the class level) defined using annotations will be inherited\. Child classes can override the inherited result(s) by redefining it\. Also, results defined at the method level take precedence (overwrite), over results with the same name at the action level\.

####Namespace annotation####

The namespace annotation allows the namespace for action classes to be changed instead of using the convention of the Java package name\. This annotation can be placed on an action class or within the package\-info\.java class that allows annotations to be placed on Java packages\. When this annotation is put on an action class, it applies to all actions defined in the class, that are not fully qualified action URLs\. When this annotation is place in the package\-info\.java file, it changes the default namespace for all actions defined in the Java package\. Here is an example of the annotation on an action class:

**com\.example\.actions\.HelloWorl**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;

@Namespace("/custom")
public class HelloWorld extends ActionSupport {
  @Action("/different/url")
  public String execute() {
    return SUCCESS;
  }

  @Action("url")
  public String doSomething() {
    return SUCCESS;
  }
}

~~~~~~~

In this example, the action will respond to two different URLs 

~~~~~~~
/different/url
~~~~~~~
 and 

~~~~~~~
/custom/url
~~~~~~~
\.

Here is an example of using this annotation in the package\-info\.java file:

**com/example/actions/package\-info\.java**


~~~~~~~
@org.apache.struts2.convention.annotation.Namespace("/custom")
package com.example.actions;

~~~~~~~

This changes the default namespace for all actions defined in the package 

~~~~~~~
com.example.actions
~~~~~~~
\. This annotation however doesn't apply to sub\-packages\.

####ResultPath annotation####

The ResultPath annotation allows applications to change the location where results are stored\. This annotation can be placed on an action class and also in the package\-info\.java file\. Here is an example of using this annotation:

**com\.example\.actions\.HelloWorl**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ResultPath;

@ResultPath("/WEB-INF/jsps")
public class HelloWorld extends ActionSupport {
  public String execute() {
    return SUCCESS;
  }
}

~~~~~~~

The result for this class will be located in 

~~~~~~~
WEB-INF/jsps
~~~~~~~
 rather than the default of 

~~~~~~~
WEB-INF/content
~~~~~~~
\.

####ParentPackage annotation####

The ParentPackage annotation allows applications to define different parent Struts package for specific action classes or Java packages\. Here is an example of using the annotation on an action class:

**com\.example\.actions\.HelloWorld**


~~~~~~~
package com.example.actions;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;

@ParentPackage("customXWorkPackage")
public class HelloWorld extends ActionSupport {
  public String execute() {
    return SUCCESS;
  }
}

~~~~~~~

To apply this annotation to all actions in a package (and subpackages), add it to package\-info\.java\. An alternative to this annotation is to set 

~~~~~~~
struts.convention.default.parent.package
~~~~~~~
 in XML\.

####ExceptionMapping Annotation####

This annotation can be used to define exception mappings to actions\. See the _exception mapping documentation_  for more details\. These mappings can be applied to the class level, in which case they will be applied to all actions defined on that class:

**ExceptionsActionLevelAction\.java**


~~~~~~~
@ExceptionMappings({
    @ExceptionMapping(exception = "java.lang.NullPointerException", result = "success", params = {"param1", "val1"})
})
public class ExceptionsActionLevelAction {

    public String execute() throws Exception {
        return null;
    }
}

~~~~~~~

The parameters defined by 

~~~~~~~
params
~~~~~~~
 are passed to the result\. Exception mappings can also be applied to the action level:


~~~~~~~
public class ExceptionsMethodLevelAction {
    @Action(value = "exception1", exceptionMappings = {
            @ExceptionMapping(exception = "java.lang.NullPointerException", result = "success", params = {"param1", "val1"})
    })
    public String run1() throws Exception {
        return null;
    }
}

~~~~~~~

###Actions in jar files###

By default the Convention plugin will **not** scan jar files for actions\. For a jar to be scanned, its URL needs to match at least one of the regular expressions in 

~~~~~~~
struts.convention.action.includeJars
~~~~~~~
\. In this example 

~~~~~~~
myjar1.jar
~~~~~~~
 and 

~~~~~~~
myjar2.jar
~~~~~~~
 will be scanned:


~~~~~~~
<constant name="struts.convention.action.includeJars" value=".*?/myjar1.*?jar(!/)?,.*?/myjar2*?jar(!/)?"

~~~~~~~

Note that **the regular expression will be evaluated against the URL of the jar, and not the file name**, the jar URL can contain a path to the jar file and a trailing "\!/"\.

###Automatic configuration reloading###

The Convention plugin can automatically reload configuration changes, made in classes the contain actions, without restarting the container\. This is a similar behavior to the automatic xml configuration reloading\. To enable this feature, add this to your 

~~~~~~~
struts.xml
~~~~~~~
 file:


~~~~~~~
<constant name="struts.devMode" value="true"/>
<constant name="struts.convention.classes.reload" value="true" />

~~~~~~~

This feature is experimental and has not been tested on all container, and it is **strongly** advised not to use it in production environments\.

###JBoss###

When using this plugin with JBoss, you need to set the following constants:


~~~~~~~
<constant name="struts.convention.exclude.parentClassLoader" value="true" />
<constant name="struts.convention.action.fileProtocols" value="jar,vfsfile,vfszip" />

~~~~~~~

You can also check the _JBoss 5_  page for more details\.

###Jetty (embedded)###

When using this plugin with Jetty in embedded mode, you need to set the following constants:


~~~~~~~
<constant name="struts.convention.exclude.parentClassLoader" value="false" />
<constant name="struts.convention.action.fileProtocols" value="jar,code-source" />

~~~~~~~

###Troubleshooting###

####Tips####


Make sure the namespace of the action is matched by one of the locators\. The rest of the namespace after the locator, will be the namespace of the action, and will be used to find the results\. For example, a class called "ViewAction" in the package "my\.example\.actions\.orders" will be mapped to the URL /orders/view\.action, and the results must be under /WEB\-INF/content/orders, like /WEB\-INF/content/orders/view\-success\.jsp\.

| 


Add the [Config Browser Plugin](#PAGE_44185) plugin to the lib folder or maven dependencies, and then visit: [http://localhost:8080/CONTEXT/config\-browser/index\.action](http://localhost:8080/CONTEXT/config\-browser/index\.action), to see the current action mappings\.

| 


The Convention plugin can generate a rather verbose output when set to debug mode for logging\. Use "Trace" logging level if you are using the JDK logger\. If you are using Log4J, you can do something like:

| 

| 

| log4j\.logger\.org\.apache\.struts2\.convention=DEBUG

| 

####Common Errors####

1. I get an error like "There is no Action mapped for namespace /orders and action name view.". This means that the URL 

~~~~~~~
/orders/view.action
~~~~~~~
 is not mapping to any action class. Check the namespace and the name of the action.

2. I get an error like "No result defined for action my.example.actions.orders.ViewAction and result success". This means that the action was mapped to the right URL, but the Convention plugin was unable to find a 

~~~~~~~
success
~~~~~~~
 result for it. Check that the result file exists, like 

~~~~~~~
/WEB-INF/content/orders/view-success.jsp
~~~~~~~
.

3. I get lots of errors like "java.lang.Exception: Could not load org/apache/velocity/runtime/resource/loader/ClasspathResourceLoader.class". This happens when 

~~~~~~~
struts.convention.action.includeJars
~~~~~~~
 is matching jar URLs from external jars.

4. I am using a custom interceptor stack and I get an error like "Unable to find interceptor class referenced by ref-name XYZ". This means that the package where Convention is placing your actions, does not extend the package where the interceptor is defined. To fix this problem either 1)Use @ParentPackage annotation(or 

~~~~~~~
struts.convention.default.parent.package
~~~~~~~
) passing the name of the package that defines the interceptor, or 2) Create a package in XML that extends the package that defines the interceptor, and use @ParentPackage(or 

~~~~~~~
struts.convention.default.parent.package
~~~~~~~
) to point to it.

###Overwriting plugin classes###

The Convention plugin can be extended in the same fashion that Struts does\. The following beans are defined by default:


~~~~~~~
<bean type="org.apache.struts2.convention.ActionConfigBuilder" name="convention" class="org.apache.struts2.convention.PackageBasedActionConfigBuilder"/>
This interface defines how the action configurations for the current web application can be constructed. This must find all actions that are not specifically defined in the struts XML files or any plugins. Furthermore, it must make every effort to locate all action results as well.

<bean type="org.apache.struts2.convention.ActionNameBuilder" name="convention" class="org.apache.struts2.convention.SEOActionNameBuilder"/>
This interface defines the method that is used to create action names based on the name of a class.

<bean type="org.apache.struts2.convention.ResultMapBuilder" name="convention" class="org.apache.struts2.convention.DefaultResultMapBuilder"/>
This interface defines how results are constructed for an Action. The action information is supplied and the result is a mapping of ResultConfig instances to the result name.

<bean type="org.apache.struts2.convention.InterceptorMapBuilder" name="convention" class="org.apache.struts2.convention.DefaultInterceptorMapBuilder"/>
This interface defines how interceptors are built from annotations.

<bean type="org.apache.struts2.convention.ConventionsService" name="convention" class="org.apache.struts2.convention.ConventionsServiceImpl"/>
This interface defines the conventions that are used by the convention plugin. In most cases the methods on this class will provide the best default for any values and also handle locating overrides of the default via the annotations that are part of the plugin.

<constant name="struts.convention.actionConfigBuilder" value="convention"/>
<constant name="struts.convention.actionNameBuilder" value="convention"/>
<constant name="struts.convention.resultMapBuilder" value="convention"/>
<constant name="struts.convention.interceptorMapBuilder" value="convention"/>
<constant name="struts.convention.conventionsService" value="convention"/>

~~~~~~~

To plugin a different implementation for one of these classes, implement the interface, define a bean for it, and set the appropriate constant's value with the name of the new bean, for example:


~~~~~~~
<bean type="org.apache.struts2.convention.ActionNameBuilder" name="MyActionNameBuilder" class="example.SultansOfSwingNameBuilder"/>
<constant name="struts.convention.actionNameBuilder" value="MyActionNameBuilder"/>

~~~~~~~

###Configuration reference###

Add a **constant** element to your struts config file to change the value of a configuration setting, like:


~~~~~~~
<constant name="struts.convention.result.path" value="/WEB-INF/mytemplates/"/>

~~~~~~~

|Name|Default Value|Description|
|----|-------------|-----------|
|struts\.convention\.action\.alwaysMapExecute|true|Set to false, to prevent Convention from creating a default mapping to "execute" when there are other methods annotated as actions in the class|
|struts\.convention\.action\.includeJars| |Comma separated list of regular expressions of jar URLs to be scanned\. eg\. "\.**myJar\-0\\\.2\.**,\.**thirdparty\-0\\\.1\.**"|
|struts\.convention\.action\.packages| |An optional list of action packages that this should create configuration for (they don't need to match a locator pattern)|
|struts\.convention\.result\.path|/WEB\-INF/content/|Directory where templates are located|
|struts\.convention\.result\.flatLayout|true|If set to false, the result can be put in its own directory: resultsRoot/namespace/actionName/result\.extension|
|struts\.convention\.action\.suffix|Action|Suffix used to find actions based on class names|
|struts\.convention\.action\.disableScanning|false|Scan packages for actions|
|struts\.convention\.action\.mapAllMatches|false|Create action mappings, even if no @Action is found|
|struts\.convention\.action\.checkImplementsAction|true|Check if an action implements com\.opensymphony\.xwork2\.Action to create an action mapping|
|struts\.convention\.default\.parent\.package|convention\-default|Default parent package for action mappins|
|struts\.convention\.action\.name\.lowercase|true|Convert action name to lowercase|
|struts\.convention\.action\.name\.separator|\-|Separator used to build the action name, MyAction \-\> my\-action\. This character is also used as the separator between the action name and the result in templates, like action\-result\.jsp|
|struts\.convention\.package\.locators|action,actions,struts,struts2|Packages whose name end with one of these strings will be scanned for actions|
|struts\.convention\.package\.locators\.disable|false|Disable the scanning of packages based on package locators|
|struts\.convention\.exclude\.packages|org\.apache\.struts\.\*, \
 org\.apache\.struts2\.\*, \
 org\.springframework\.web\.struts\.\*, \
 org\.springframework\.web\.struts2\.\*, \
 org\.hibernate\.\*|Packages excluded from the action scanning, packages already excluded cannot be included in other way, eg\. org\.demo\.actions\.exclude is specified as a part of the struts\.convention\.exclude\.packages so all packages below are also excluded, eg\. org\.demo\.actions\.exclude\.include even if **include** is specified as a struts\.convention\.package\.locators or struts\.convention\.action\.packages|
|struts\.convention\.package\.locators\.basePackage| |If set, only packages that start with its value will be scanned for actions|
|struts\.convention\.relative\.result\.types|dispatcher,velocity,freemarker|The list of result types that can have locations that are relative and the result location (which is the resultPath plus the namespace) prepended to them|
|struts\.convention\.redirect\.to\.slash|true|A boolean parameter that controls whether or not this will handle unknown actions in the same manner as Apache, Tomcat and other web servers\. This handling will send back a redirect for URLs such as /foo to /foo/ if there doesn't exist an action that responds to /foo|
|struts\.convention\.classLoader\.excludeParent|true|Exclude URLs found by the parent class loader from the list of URLs scanned to find actions (needs to be set to false for JBoss 5)|
|struts\.convention\.action\.eagerLoading|false|If set, found action classes will be instantiated by the ObjectFactory to accelerate future use, setting it up can clash with Spring managed beans|

###Converting application from Codebehind to Convention Plugin### {#PAGE_106500}

__Changes required__

+ Replace org\.apache\.struts2\.config\.Namespace with org\.apache\.struts2\.convention\.annotation\.Namespace

+ Replace org\.apache\.struts2\.config\.Results with org\.apache\.struts2\.convention\.annotation\.Results

+ Replace org\.apache\.struts2\.config\.Result with org\.apache\.struts2\.convention\.annotation\.Result

+ Update @Result uses to use result **name** instead of Class\<Result\>

+ Update @Result uses to use **location** instead of value attribute

+ Update web\.xml and remove Codebehind params from filter

+ Update CamelCase action results and references to match Convention\. For example:


~~~~~~~

Previously in Codebehind:
Given an action named AnExampleAction, a request to /anExample -> AnExampleAction.execute() -> > anExample-index.ftl

Now in Convention:
Given an action named AnExampleAction, a request to /an-example -> AnExampleAction.execute() -> an-example-index.ftl

~~~~~~~

__When REST plugin is used__

Add these constants to struts\.xml


~~~~~~~

<constant name="struts.convention.action.suffix" value="Controller"/>
<constant name="struts.convention.action.mapAllMatches" value="true"/>
<constant name="struts.convention.default.parent.package" value="rest-default"/>
<constant name="struts.convention.package.locators" value="example"/>

~~~~~~~

##DWR Plugin## {#PAGE_82454}

The DWR plugin 

provides integration with the Ajax framework [Direct Web Remoting](http://getahead\.org/dwr)^[http://getahead\.org/dwr]


This plugin works by allowing DWR to execute a Struts 2 action and return any validation errors\.



| This plugin is only available with Struts 2\.1\.1 or later

| 

####Features####

+ Expose Struts 2 validations via DWR

####Usage####

To expose Struts 2 validations via DWR, add this to your DWR configuration:


~~~~~~~
{snippet:id=dwrConfiguration|javadoc=true|lang=xml|url=struts2/plugins/dwr/src/main/java/org/apache/struts2/validators/DWRValidator.java}
~~~~~~~

####Settings####

This plugin doesn't support any global settings\.

####Installation####

To install, simply include the DWR Plugin in your 

~~~~~~~
WEB-INF/lib
~~~~~~~
 directory\.  Ensure that DWR has been correctly installed and configured\.

##Embedded JSP Plugin## {#PAGE_2852037}

The Embedded JSP plugin 

allows you to use JSPs from the classpath (from jar files)


###Introduction###

JSPs are usually served from the file system\. Using this plugin you can deploy JSPs inside jar files, which is sometimes desired, like when writing a plugin\. 

####Wait\.\.\.what?####

The plugin containes a modified version of Jasper 6, which reads JSPs from the classpath, and generates the java code in memory (no \.java file is written)\. The Java Compiler API is then used to compile the java source code into bytecode (in memory, no \.class file is generated), and it is turned into a Servlet, which is cached for future use\.

####About includes####

Because the JSP files are read from the classpath, "includes" work differently than they do from the file system\. Assume you want to include "Hello\.jsp", when searching for that file in the classpath, multiple files might be found on different jars, like 

~~~~~~~
somejar.jar!/Hello.jsp
~~~~~~~
 and 

~~~~~~~
otherjar.jar!/Hello.jsp
~~~~~~~
\. That's why relative paths do not work in this plugin\. Instead, create directory structures for the JSPs\. For example, given 2 jsps under 

~~~~~~~
org/myexample/jsps
~~~~~~~
 in a jar file:

Who\.jsp:


~~~~~~~

Hello there, I am the Doctor.

~~~~~~~

Hello\.jsp:


~~~~~~~

<jsp:include page="org/myexample/jsps/Who.jsp" />

~~~~~~~

Mapping:


~~~~~~~

 <package name="example" namespace="/example" extends="embeddedjsp-default">
     <action name="HelloWorld" class="example.HelloWorld">
         <result type="embeddedJsp">org/myexample/jsps/Hello.jsp</result>
     </action>
 </package>

~~~~~~~

####Requirements####

1. Java 6 or later

#####Tomcat#####

Tested with Tomcat 6\.0\.20\.

#####Jetty#####

This plugin requires Jetty 7 to work\. And the Tomcat libraries must be deployed with the application, adding this to your 

~~~~~~~
pom.xml
~~~~~~~
 should take care of that: 


~~~~~~~

<dependency>
     <groupId>org.apache.tomcat</groupId>
     <artifactId>jasper</artifactId>
     <version>6.0.18</version>
</dependency>

~~~~~~~

To use Jetty 7 with the maven plugin add this to your 

~~~~~~~
pom.xml
~~~~~~~
:


~~~~~~~

<build>
    <plugins>
        <plugin>
             <groupId>org.mortbay.jetty</groupId>
             <artifactId>jetty-maven-plugin</artifactId>
        </plugin>
    </plugins>
</build>

~~~~~~~

##JFreeChart Plugin## {#PAGE_14300}

[JFreeChart](http://www\.jfree\.org/jfreechart/)^[http://www\.jfree\.org/jfreechart/] is a free 100% Java (LGPL) chart library that makes it easy for developers to display professional quality charts in their applications\.

> 

The JFreeChart plugin 

allows Actions to easily return generated charts and graphs


Instead of streaming a generated chart directly to the HTTP response, this plugin provides a ChartResult, which handles the generation for you\.  This allows you to generate the chart in one class, and render it out in another class, effectively decoupling the view from the Actions\. You can easily render it out to a file or some view other than a web HTTP response if you wish\.

####Features####

+ Handles rendering charts to the HTTP response

+ Can be used in other non\-web contexts

#####Future Work#####

Currently the "chart" property is hardcoded\. There should be a better way of transferring data from the Action to the Result, via some externally defined variable or something\.

As mentioned by John Patterson (mailing list), the Action is still dependant on a JFreeChart Chart class\. This can be improved\. The seperation between Action and View can be made cleaner\. A chart\-agonistic List or Array can be used as the data, and the configuration of the chart details (font, axis, etc\.\.\.) be done via the result properties in the xwork\.xml\.

But hey, the above works for now\. Any suggestions are welcome\.



| You can also create charts via the CeWolf library directly\.  See _CeWolf charts using Velocity templates_ \.

| 

####Usage####

To use the plugin, have your Struts configuration package extend the 

~~~~~~~
jfreechart-default
~~~~~~~
 package, which provides the 

~~~~~~~
chart
~~~~~~~
 result type\.  Next, use it as a result in an action:

**Chart example in struts\.xml**


~~~~~~~

<action name="viewModerationChart" class="myapp.actions.ViewModerationChartAction">
  <result name="success" type="chart">
    <param name="width">400</param>
    <param name="height">300</param> 
  </result>
</action>

~~~~~~~

In your Action class, provide a 

~~~~~~~
getChart()
~~~~~~~
 method that returns the chart to be rendered\.  This method will be called by the chart result\.

#####Example#####

**Struts Action that provides a chart**


~~~~~~~

public class ViewModerationChartAction extends ActionSupport {

	private JFreeChart chart;

	public String execute() throws Exception {
		// chart creation logic...
		XYSeries dataSeries = new XYSeries(new Integer(1)); //pass a key for this serie
		for (int i = 0; i <= 100; i++) {
			dataSeries.add(i, RandomUtils.nextInt());
		}
		XYSeriesCollection xyDataset = new XYSeriesCollection(dataSeries);

		ValueAxis xAxis = new NumberAxis("Raw Marks");
		ValueAxis yAxis = new NumberAxis("Moderated Marks");

		// set my chart variable
		chart =
			new JFreeChart(
				"Moderation Function",
				JFreeChart.DEFAULT_TITLE_FONT,
				new XYPlot(
					xyDataset,
					xAxis,
					yAxis,
					new StandardXYItemRenderer(StandardXYItemRenderer.LINES)),
				false);
		chart.setBackgroundPaint(java.awt.Color.white);

		return super.SUCCESS;
	}

	public JFreeChart getChart() {
		return chart;
	}

}

~~~~~~~

#####Settings#####

This plugin doesn't provides any global settings\.

#####Installation#####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  The JFreeChart library will need to be downloaded separately, as its LGPL license doesn't allow it to be distributed with Struts\.

##JSF Plugin## {#PAGE_44198}

[JavaServer Faces](http://java\.sun\.com/j2ee/javaserverfaces)^[http://java\.sun\.com/j2ee/javaserverfaces] technology simplifies building user interfaces for JavaServer applications\. Developers of various skill levels can quickly build web applications by: assembling reusable UI components in a page; connecting these components to an application data source; and wiring client\-generated events to server\-side event handlers\.

> 

The JSF Plugin 

provides support for JavaServer Faces components with no additional configuration


The JSF support works by breaking up the JSF Licycle class into Struts Interceptors, one for each JSF phase\.  When you include the 

~~~~~~~
jsfStack
~~~~~~~
 stack, you are ensuring the JSF page has its phases execute correctly\.  At the end of the phases, the Struts Action itself is executed just like non\-JSF pages\.  The String return code of the Action is treated like any other Action as well\.  Finally, the JSF "render" phase has been transformed into a Result\.

JavaServer Faces also has a concept of an "action", which are generally executed in response to a button click\.  The handling of the JSF action is preserved through the 

~~~~~~~
jsfStack
~~~~~~~
 Interceptor stack, but its String result code, rather than being applied against a JSF navigation rule, is treated as a Struts result code thereby keeping the navigation responsibility within Struts\.

The limitations of this approach include:

1. Any custom Lifecycle class is ignored

2. Any custom NavigationHandler is delegated to only when a Struts 2 navigation option cannot be found

On the other hand, the rest of the JSF functionality, including PhaseListeners, components, multiple backing beans, etc\. are preserved\.  The Showcase example has a section demonstrating the JSF integration approach\.

####Features####

+ Allows JSF components on normal Struts pages

+ Requires no additional configuration

+ Allows the JSF lifecycle to be completely customized

+ Preserves most JSF framework features so even complex components should work out of the box

####Usage####

The JSF plugin splits the JSF lifecycle into an optional Interceptor stack and Result, yet retains the page's Action and navigation\. Therefore, to use a page with JSF components, you need to:

1. Add the 

~~~~~~~
jsfStack
~~~~~~~
 interceptor stack to your action definition.  This is easiest done by having your package extend 

~~~~~~~
jsf-default
~~~~~~~
.

2. Add a 

~~~~~~~
jsf
~~~~~~~
 result associated with the name 

~~~~~~~
success
~~~~~~~

You can still add additional interceptors and results, including those that don't use JSF at all\.  In fact, the recommended approach is to use regular Struts results to handle inter\-page navigation to avoid a common problem of JSF applications where every page request is a HTTP POST\.

This approach brings an additional advantage to JSF \- every page can have an Action to execute page setup code, and the same Action instance will be automatically available later in the JSF page's expression language as 

~~~~~~~
action
~~~~~~~
\.  This means any common page logic such as retrieving data from a database can remain in your Action, and having that instance available later in your JSF components means the JSF configuration file is completely optional\.  The JSF configuration file, 

~~~~~~~
faces-config.xml
~~~~~~~
, generally contains backing bean definitions and navigation rules, both of which can be solely handled by Struts\.

#####Example#####

The following is an example of a regular Struts Action 2 page definition:

**Regular JSF Action**


~~~~~~~

<action name="employee" class="org.apache.struts.action2.showcase.jsf.EmployeeAction">
    <interceptor-ref name="basicStack"/>
    <result name="success">employee.jsp</result>
    <result name="index" type="redirect-action">index</result>
</action>

~~~~~~~

This is the same action but as a JSF\-enabled page:

**JSF\-enabled Action**


~~~~~~~

<action name="employee" class="org.apache.struts.action2.showcase.jsf.EmployeeAction">
    <interceptor-ref name="basicStack"/>
    <interceptor-ref name="jsfStack"/>
    <result name="success" type="jsf" />
    <result name="index" type="redirect-action">index</result>
</action>

~~~~~~~

Notice the Action\-based navigation remains, but now you can use a page with JSF components and have complete access to the JSF lifecycle\. This even supports JSF components that post back to themselves or add PhaseListeners to provide advanced AJAX support\.

#####Settings#####

This plugin does not have any customizable settings\.

#####Installation#####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

####Resources####

+ [Integrating Struts 2 \+ JSF \+ Facelets](http://raibledesigns\.com/rd/entry/integrating\_struts\_2\_jsf\_facelets)^[http://raibledesigns\.com/rd/entry/integrating\_struts\_2\_jsf\_facelets] (Matt Raible)

##JSON Plugin## {#PAGE_2850922}

This page is DEPRECATED, please refer to the new source [http://struts\.apache\.org/plugins/json/](http://struts\.apache\.org/plugins/json/)

> 

 


The JSON plugin

provides a "json" result type that serializes actions into JSON


1. The "content-type" must be "application/json"

2. The JSON content must be well formed, see [json.org](http://www.json.org)^[http://www.json.org] for grammar.

3. Action must have a public "setter" method for fields that must be populated.

4. Supported types for population are: Primitives (int,long...String), Date, List, Map, Primitive Arrays, Other class (more on this later), and Array of Other class.

5. Any object in JSON, that is to be populated inside a list, or a map, will be of type Map (mapping from properties to values), any whole number will be of type Long, any decimal number will be of type Double, and any array of type List.

Given this JSON string:


~~~~~~~
{
   "doubleValue": 10.10,
   "nestedBean": {
      "name": "Mr Bean"
   },
   "list": ["A", 10, 20.20, {
      "firstName": "El Zorro"
   }],
   "array": [10, 20] 
}

~~~~~~~

The action must have a "setDoubleValue" method, taking either a "float" or a "double" argument (the interceptor will convert the value to the right one)\. There must be a "setNestedBean" whose argument type can be any class, that has a "setName" method taking as argument an "String"\. There must be a "setList" method that takes a "List" as argument, that list will contain: "A" (String), 10 (Long), 20\.20 (Double), Map ("firstName" \-\> "El Zorro")\. The "setArray" method can take as parameter either a "List", or any numeric array\.



| So serialize your objects to JSON in javascript see [json2](http://json\.org/json2\.js)^[http://json\.org/json2\.js]\.

| 


root attribute must be set on the JSONInterceptor when dealing with JSON array\.

| 


This plugin also provides _AJAX Validation_ \.

| 

####Installation####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\. No other files need to be copied or created\.

To use maven, add this to your pom:


~~~~~~~
<dependencies>
   ...
   <dependency>
       <groupId>org.apache.struts</groupId>
       <artifactId>struts2-json-plugin</artifactId>
       <version>STRUTS_VERSION</version>
   </dependency>
   ...
</dependencies>

~~~~~~~

####Customizing Serialization and Deserialization####

Use the JSON annotation to customize the serialization/deserialization process\. Available JSON annotation fields:

|Name|Description|Default Value|Serialization|Deserialization|
|----|-----------|-------------|-------------|---------------|
|name|Customize field name|empty|yes|no|
|serialize|Include in serialization|true|yes|no|
|deserialize|Include in deserialization|true|no|yes|
|format|Format used to format/parse a Date field|"yyyy\-MM\-dd'T'HH:mm:ss"|yes|yes|

#####Excluding properties#####

A comma\-delimited list of regular expressions can be passed to the JSON Result and Interceptor, properties matching any of these regular expressions will be ignored on the serialization process:


~~~~~~~
<!-- Result fragment -->
<result type="json">
  <param name="excludeProperties">
    login.password,
    studentList.*\.sin
  </param>
</result>

<!-- Interceptor fragment -->
<interceptor-ref name="json">
  <param name="enableSMD">true</param>
  <param name="excludeProperties">
    login.password,
    studentList.*\.sin
  </param>
</interceptor-ref>

~~~~~~~

#####Including properties#####

A comma\-delimited list of regular expressions can be passed to the JSON Result to restrict which properties will be serialized\. ONLY properties matching any of these regular expressions will be included in the serialized output\.



| Exclude property expressions take precedence over include property expressions\. That is, if you use include and exclude property expressions on the same result, include property expressions will not be applied if an exclude exclude property expression matches a property first\.

| 



~~~~~~~
<!-- Result fragment -->
<result type="json">
  <param name="includeProperties">
    ^entries\[\d+\]\.clientNumber,
    ^entries\[\d+\]\.scheduleNumber,
    ^entries\[\d+\]\.createUserId
  </param>
</result>

~~~~~~~

#####Root Object#####

Use the "root" attribute(OGNL expression) to specify the root object to be serialized\.


~~~~~~~
<result type="json">
  <param name="root">
    person.job
  </param>
</result>

~~~~~~~

The "root" attribute(OGNL expression) can also be used on the interceptor to specify the object that must be populated, **make sure this object is not null**\.


~~~~~~~
<interceptor-ref name="json">
  <param name="root">bean1.bean2</param>
</interceptor-ref>

~~~~~~~

#####Wrapping#####

For several reasons you might want to wrap the JSON output with some text, like wrapping with comments, adding a prefix, or to use file uploads which require the result to be wrapped in a textarea\. Use _wrapPrefix_  to add content in the beginning and _wrapPostfix_  to add content at the end\. This settings take precedence over "wrapWithComments" and "prefix" which are deprecated from 0\.34 on\. Examples:
 Wrap with comments:


~~~~~~~
<result type="json">
  <param name="wrapPrefix">/*</param>
  <param name="wrapSuffix">*/</param>
</result>

~~~~~~~

Add a prefix:


~~~~~~~
<result type="json">
  <param name="wrapPrefix">{}&&</param>
</result>

~~~~~~~

Wrap for file upload:


~~~~~~~
<result type="json">
  <param name="wrapPrefix"><![CDATA[<html><body><textarea>]]></param>
  <param name="wrapSuffix"><![CDATA[</textarea></body></html>]]></param>
</result>

~~~~~~~

#####Wrap with Comments#####

_wrapWithComments_  is deprecated from 0\.34, use _wrapPrefix_  and _wrapSuffix_  instead\.

> 

> 

> 

> 

> _wrapWithComments_  can turn safe JSON text into dangerous text\. For example,

> 

> 

> _"\*/ alert('XSS'); /\*"_ 

> 

> 

> Thanks to Douglas Crockford for the tip\!\. Consider using **prefix** instead\.

> 

If the serialized JSON is _\{name: 'El Zorro'\}_ \. Then the output will be: _\{\}&& (\{name: 'El Zorro'\}_ 

If the "wrapWithComments" (false by default) attribute is set to true, the generated JSON is wrapped with comments like:


~~~~~~~
/* {
   "doubleVal": 10.10,
   "nestedBean": {
      "name": "Mr Bean"
   },
   "list": ["A", 10, 20.20, {
      "firstName": "El Zorro"
   }],
   "array": [10, 20] 
} */

~~~~~~~

To strip those comments use:


~~~~~~~
var responseObject = eval("("+data.substring(data.indexOf("\/\*")+2, data.lastIndexOf("\*\/"))+")");

~~~~~~~

#####Prefix#####

_prefix_  is deprecated from 0\.34, use _wrapPrefix_  and _wrapSuffix_  instead\.

> 

If the parameter _prefix_  is set to true, the generated JSON will be prefixed with "\{\}&& "\. This will help prevent hijacking\. See [this Dojo Ticket](http://trac\.dojotoolkit\.org/ticket/6380)^[http://trac\.dojotoolkit\.org/ticket/6380] for details:


~~~~~~~
<result type="json">
  <param name="prefix">true</param>
</result>

~~~~~~~

#####Base Classes#####

By default properties defined on base classes of the "root" object won't be serialized, to serialize properties in all base classes (up to Object) set "ignoreHierarchy" to false in the JSON result:


~~~~~~~
<result type="json">
  <param name="ignoreHierarchy">false</param>
</result>

~~~~~~~

#####Enumerations#####

By default, an Enum is serialized as a name=value pair where value = name()\.


~~~~~~~
  public enum AnEnum {
     ValueA,
     ValueB
  }

  JSON:  "myEnum":"ValueA"

~~~~~~~

Use the "enumAsBean" result parameter to serialize Enum's as a bean with a special property \_name with value name()\. All properties of the enum are also serialized\.


~~~~~~~
  public enum AnEnum {
     ValueA("A"),
     ValueB("B");

     private String val;
     
     public AnEnum(val) {
        this.val = val;
     }
     public getVal() {
        return val;
     }
   }

  JSON:  myEnum: { "_name": "ValueA", "val": "A" }

~~~~~~~

Enable this parameter through struts\.xml:


~~~~~~~
<result type="json">
  <param name="enumAsBean">true</param>
</result>

~~~~~~~

#####Compressing the output\.#####

Set the _enableGZIP_  attribute to true to gzip the generated json response\. The request **must** include "gzip" in the "Accept\-Encoding" header for this to work\.


~~~~~~~
<result type="json">
  <param name="enableGZIP">true</param>
</result>

~~~~~~~

#####Preventing the browser from caching the response#####

Set _noCache_  to true(false by default) to set the following headers in the response:

+ Cache\-Control: no\-cache

+ Expires: 0

+ Pragma: No\-cache



~~~~~~~
<result type="json">
  <param name="noCache">true</param>
</result>

~~~~~~~

#####Excluding properties with null values#####

By default fields with null values are serialized like \{property\_name: null\}\. This can be prevented by setting _excludeNullProperties_  to true\.


~~~~~~~
<result type="json">
  <param name="excludeNullProperties">true</param>
</result>

~~~~~~~

#####Status and Error code#####

Use _statusCode_  to set the status of the response:


~~~~~~~
<result type="json">
  <param name="statusCode">304</param>
</result>

~~~~~~~

And _errorCode_  to send an error(the server might end up sending something to the client which is not the serialized JSON):


~~~~~~~
<result type="json">
  <param name="errorCode">404</param>
</result>

~~~~~~~

#####JSONP#####

To enable JSONP, set the parameter _callbackParameter_  in either the JSON Result or the Interceptor\. A parameter with that name will be read from the request, and it value will be used as the JSONP function\. Assuming that a request is made with the parameter "callback"="exec":


~~~~~~~
<result type="json">
  <param name="callbackParameter">callback</param>
</result>

~~~~~~~

And that the serialized JSON is _\{name: 'El Zorro'\}_ \. Then the output will be: _exec(\{name: 'El Zorro'\})_ 

#####Content Type#####

Content type will be set to _application/json\-rpc_  by default if SMD is being used, or _application/json_  otherwise\. Sometimes it is necessary to set the content type to something else, like when uploading files with Dojo and YUI\. Use the _contentType_  parameter in those cases\.


~~~~~~~
<result type="json">
  <param name="contentType">text/html</param>
</result>

~~~~~~~

#####Encoding#####

User can define encoding per result or base on default assigned to struts\.i18n\.encoding\. To define encoding for given result add encoding param as below:


~~~~~~~
<result type="json">
  <param name="encoding">UTF-8</param>
</result>

~~~~~~~

####Example####

#####Setup Action#####

This simple action has some fields:

Example:


~~~~~~~
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.Action;

public class JSONExample {
    private String field1 = "str";
    private int[] ints = {10, 20};
    private Map map = new HashMap();
    private String customName = "custom";

    //'transient' fields are not serialized
    private transient String field2;

    //fields without getter method are not serialized
    private String field3;

    public String execute() {
        map.put("John", "Galt");
        return Action.SUCCESS;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1;
    }

    public int[] getInts() {
        return ints;
    }

    public void setInts(int[] ints) {
        this.ints = ints;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    @JSON(name="newName")
    public String getCustomName() {
        return this.customName;
    }
}

~~~~~~~

#####Write the mapping for the action#####

1. Add the map inside a package that extends "json-default"

2. Add a result of type "json"

Example with Convention Plugin Configuration:


~~~~~~~
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Result;

@Result(type = "json")
public class JSONExample extends ActionSupport {
// action code
}

~~~~~~~

Example with XML Configuration:


~~~~~~~
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">

<struts>

  <package name="example"  extends="json-default">
     <action name="JSONExample" class="example.JSONExample">
        <result type="json"/>
     </action>
  </package>

</struts>

~~~~~~~

__JSON example output__



~~~~~~~
{  
   "field1" : "str", 
   "ints": [10, 20],
   "map": {
       "John":"Galt"
   },
   "newName": "custom"
}

~~~~~~~

__Accepting JSON__

Your actions can accept incoming JSON if they are in package which uses 

~~~~~~~
json
~~~~~~~
 interceptor or by adding reference to it as follow:


~~~~~~~
@InterceptorRef(value="json")
~~~~~~~

By default 

~~~~~~~
Content-Type
~~~~~~~
 of value 

~~~~~~~
application/json
~~~~~~~
 is recognised to be used for de\-serialisation and 

~~~~~~~
application/json-rpc
~~~~~~~
 to execute SMD processing\. You can override those settings be defining 

~~~~~~~
jsonContentType
~~~~~~~
 and 

~~~~~~~
jsonRpcContentType
~~~~~~~
 params, see example:


~~~~~~~
<interceptor-ref name="json">
  <param name="jsonContentType">text/json</param>
  <param name="jsonRpcContentType">text/json-rpc</param>
</interceptor-ref>
~~~~~~~

Please be aware that those are scoped params per stack, which means, once set it will be used by actions in scope of this stack\.

####JSON RPC####

The json plugin can be used to execute action methods from javascript and return the output\. This feature was developed with Dojo in mind, so it uses [Simple Method Definition](http://manual\.dojotoolkit\.org/WikiHome/DojoDotBook/Book9)^[http://manual\.dojotoolkit\.org/WikiHome/DojoDotBook/Book9] to advertise the remote service\. Let's work it out with an example(useless as most examples)\.

First write the action:


~~~~~~~
package smd;

import com.googlecode.jsonplugin.annotations.SMDMethod;
import com.opensymphony.xwork2.Action;

public class SMDAction {
    public String smd() {
        return Action.SUCCESS;
    }
    
    @SMDMethod
    public Bean doSomething(Bean bean, int quantity) {
        bean.setPrice(quantity * 10);
        return bean;
    }
}

~~~~~~~

Methods that will be called remotely **must** be annotated with the _SMDMethod_  annotation, for security reasons\. The method will take a bean object, modify its price and return it\. The action can be annotated with the _SMD_  annotation to customize the generated SMD (more on that soon), and parameters can be annotated with _SMDMethodParameter_ \. As you can see, we have a "dummy", _smd_  method\. This method will be used to generate the Simple Method Definition (a definition of all the services provided by this class), using the "json" result\.

The bean class:


~~~~~~~
package smd;

public class Bean {
    private String type;
    private int price;
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}

~~~~~~~

The mapping:


~~~~~~~
<package name="RPC" namespace="/nodecorate" extends="json-default">
    <action name="SMDAction" class="smd.SMDAction" method="smd">
        <interceptor-ref name="json">
            <param name="enableSMD">true</param>
        </interceptor-ref>
        <result type="json">
             <param name="enableSMD">true</param>
        </result>
    </action>
</package>

~~~~~~~

Nothing special here, except that **both** the interceptor and the result must be applied to the action, and "enableSMD" must be enabled for both\.

Now the javascript code:


~~~~~~~
<s:url id="smdUrl" namespace="/nodecorate" action="SMDAction" />
<script type="text/javascript">
    //load dojo RPC
    dojo.require("dojo.rpc.*");
    
    //create service object(proxy) using SMD (generated by the json result)
    var service = new dojo.rpc.JsonService("${smdUrl}");
    
    //function called when remote method returns
    var callback = function(bean) {
        alert("Price for " + bean.type + " is " + bean.price);
    };
    
    //parameter
    var bean = {type: "Mocca"};
    
    //execute remote method
    var defered = service.doSomething(bean, 5);

    //attach callback to defered object
    defered.addCallback(callback);
</script>

~~~~~~~

Dojo's JsonService will make a request to the action to load the SMD, which will return a JSON object with the definition of the available remote methods, using that information Dojo creates a "proxy" for those methods\. Because of the asynchronous nature of the request, when the method is executed, a deferred object is returned, to which a callback function can be attached\. The callback function will receive as a parameter the object returned from your action\. That's it\.

####Proxied objects####

As annotations are not inherited in Java, some user might experience problems while trying to serialize objects that are proxied\. eg\. when you have attached AOP interceptors to your action\.

In this situation, the plugin will not detect the annotations on methods in your action\.

To overcome this, set the "ignoreInterfaces" result parameter to false (true by default) to request that the plugin inspects all interfaces and superclasses of the action for annotations on the action's methods\.

NOTE: This parameter should only be set to false if your action could be a proxy as there is a performance cost caused by recursion through the interfaces\.


~~~~~~~
<action name="contact" class="package.ContactAction" method="smd">
   <interceptor-ref name="json">
      <param name="enableSMD">true</param>
      <param name="ignoreSMDMethodInterfaces">false</param>
   </interceptor-ref>
   <result type="json">
      <param name="enableSMD">true</param>
      <param name="ignoreInterfaces">false</param>
   </result>
   <interceptor-ref name="default"/>
</action>

~~~~~~~

##JUnit Plugin## {#PAGE_82304}

This page is DEPRECATED, please refer to the new source [http://struts\.apache\.org/plugins/junit/](http://struts\.apache\.org/plugins/junit/)

> 

The JUnit plugin

provides integration with the popular [JUnit](http://junit\.org)^[http://junit\.org] unit testing framework


This plugin provides a base 

~~~~~~~
StrutsTestCase
~~~~~~~
 class that can subclassed for tests that work on Struts 2 components\. It is used within Struts 2 itself to test core framework components and many bundled plugins\. The class 

~~~~~~~
StrutsSpringTestCase
~~~~~~~
 is also provided, to support testing of actions that use Spring as the object factory\.



| See [Testing Actions](#PAGE_2330106) for more details

| 

This plugin is only available with Struts 2\.1\.1 or later

> 

####Features####

+ Base test class that starts up a full Struts 2 instance

+ Great for testing how configuration is loaded and Struts 2 components are used

####Usage####

First, include the plugin your POM (if using Maven 2) under the test scope:


~~~~~~~
<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-junit-plugin</artifactId>
  <version>STRUTS_2_VERSION</version>
  <scope>test</scope>
</dependency>

~~~~~~~

if you are using Spring, also add:


~~~~~~~
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-spring-plugin</artifactId>
    <version>STRUTS_2_VERSION</version>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>jsp-api</artifactId>
    <version>2.0</version>
    <scope>test</scope>
</dependency>

~~~~~~~

If you are not using Maven 2 to build and test your code, ensure the plugin jar and its dependencies (spring\-mock and junit) are in the testing classpath\.

Now, your JUnit tests can subclass the 

~~~~~~~
StrutsTestCase
~~~~~~~
 class, which handles starting and stopping the Struts 2 framework:


~~~~~~~
public class MyTest extends StrutsTestCase {
 // testing code
}

~~~~~~~

####Settings####

This plugin doesn't support any global settings\.

####Installation####

This plugin is meant to be used during unit testing, and not during runtime\. Therefore, include it in your build's classpath, but do not deploy it to 

~~~~~~~
WEB-INF/lib
~~~~~~~
 in your Struts 2 application\.

###Testing Actions### {#PAGE_2330106}

The recommended way to test actions is to instantiate the action classes and test them\. The [JUnit Plugin](#PAGE_82304) supports testing actions within a Struts invocation, meaning that a full request is simulated, and the output of the action can be tested\.

__Struts actions (without Spring)__

To test actions that do not use Spring, extend 

~~~~~~~
StrutsTestCase
~~~~~~~
\. The following example shows different ways of testing an action:
 Mapping:


~~~~~~~
<struts>
    <constant name="struts.objectFactory" value="spring"/>
    <package name="test" namespace="/test" extends="struts-default">
        <action name="testAction" class="org.apache.struts2.TestAction">
            <result type="freemarker">/template.ftl</result>
        </action>
    </package>
</struts>

~~~~~~~

Action:


~~~~~~~
public class TestAction extends ActionSupport {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

~~~~~~~

JUnit:


~~~~~~~
package org.apache.struts2;

import org.apache.struts2.dispatcher.mapper.ActionMapping;

import java.util.HashMap;
import java.io.UnsupportedEncodingException;

import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.Action;

import javax.servlet.ServletException;

public class StrutsTestCaseTest extends StrutsTestCase {
    public void testGetActionMapping() {
        ActionMapping mapping = getActionMapping("/test/testAction.action");
        assertNotNull(mapping);
        assertEquals("/test", mapping.getNamespace());
        assertEquals("testAction", mapping.getName());
    }

    public void testGetActionProxy() throws Exception {
        //set parameters before calling getActionProxy
        request.setParameter("name", "FD");
        
        ActionProxy proxy = getActionProxy("/test/testAction.action");
        assertNotNull(proxy);

        TestAction action = (TestAction) proxy.getAction();
        assertNotNull(action);

        String result = proxy.execute();
        assertEquals(Action.SUCCESS, result);
        assertEquals("FD", action.getName());
    }

    public void testExecuteAction() throws ServletException, UnsupportedEncodingException {
        String output = executeAction("/test/testAction.action");
        assertEquals("Hello", output);
    }

    public void testGetValueFromStack() throws ServletException, UnsupportedEncodingException {
        request.setParameter("name", "FD");
        executeAction("/test/testAction.action");
        String name = (String) findValueAfterExecute("name");
        assertEquals("FD", name);
    }
}

~~~~~~~

__The template__

If you use JSPs as the template engine you won't be able to test the action output outside the container\. The [Embedded JSP Plugin](#PAGE_2852037) can be used to overcome this limitation and be able to use JSPs from the classpath and outside the container\.

There are several utility methods and mock objects defined in StrutsTestCase which can be used to facilitate the testing:
 Methods:

|Method Name|Description|
|-----------|-----------|
|executeAction(String)|Pass the url for the action, and it will return the output of the action\. This output **is not** the action result, like "success", but what would be written to the result stream\. To use this the actions must be using a result type that can be read from the classpath, like FreeMarker, velocity, etc (if you are using the experimental Embedded JSP Plugin, you can use JSPs also)|
|getActionProxy(String)|Builds an action proxy that can be used to invoke an action, by calling execute() on the returned proxy object\. The return value of execute() is the action result, like "success"|
|getActionMapping(String)|Gets an ActionMapping for the url|
|injectStrutsDependencies(object)|Injects Struts dependencies into an object (dependencies are marked with Inject)|
|findValueAfterExecute(String)|Finds an object in the value stack, after an action has been executed|
|applyAdditionalParams(ActionContext)|Can be overwritten in subclass to provide additional params and settings used during action invocation|
|createAction(Class)|Can be used to instantiate an action which requires framework's dependencies to be injected (e\.g\. extending ActionSupport requires inject some internal dependencies)|

|Field|Description|
|-----|-----------|
|MockHttpServletRequest request|The request that will be passed to Struts\. Make sure to set parameters in this object before calling methods like getActionProxy|
|MockHttpServletResponse response|The response object passed to Struts, you can use this class to test the output, response headers, etc|
|MockServletContext servletContext|The servlet context object passed to Struts|

__Struts Actions using Spring__

Make sure to add a dependency to the [Spring Plugin](#PAGE_14281) to your 

~~~~~~~
pom.xml
~~~~~~~
:


~~~~~~~
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-spring-plugin</artifactId>
    <version>STRUTS_VERSION</version>
</dependency>

~~~~~~~

If you use Spring as the object factory, the 

~~~~~~~
StrutsSpringTestCase
~~~~~~~
 class can be used to write your JUnits\. This class extends 

~~~~~~~
StrutsTestCase
~~~~~~~
 and has a 

~~~~~~~
applicationContext
~~~~~~~
 field of type 

~~~~~~~
ApplicationContext
~~~~~~~
\.

The Spring context is loaded from "classpath\*:applicationContext\.xml" by default\. To provide a different location, overwrite 

~~~~~~~
getContextLocations
~~~~~~~
\.

##JasperReports Plugin## {#PAGE_14258}


[JasperReports](http://jasperforge\.org/sf/projects/jasperreports)^[http://jasperforge\.org/sf/projects/jasperreports] is a powerful open source Java (LGPL) reporting tool that has the ability to deliver rich content onto the screen, to the printer or into PDF, HTML, XLS, CSV and XML files\.

| 

The JasperReports plugin 

enables Actions to create high\-quality reports as results


####Features####

+ Allows Actions to be rendered through JasperReports

####Usage####

To use this plugin, have your packages that contain the target actions extend the provided 

~~~~~~~
jasperreports-default
~~~~~~~
 package, which contains the 

~~~~~~~
jasper
~~~~~~~
 result type\.  Then, simply use the result type in the desired actions\.  The result takes the following parameters:


~~~~~~~
{snippet:id=description|javadoc=true|url=struts2/plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java}
~~~~~~~


~~~~~~~
{snippet:id=params|javadoc=true|url=struts2/plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java}
~~~~~~~

#####Examples#####



~~~~~~~
{snippet:id=example1|lang=xml|javadoc=true|url=struts2/plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java}
~~~~~~~

or for pdf:


~~~~~~~
{snippet:id=example2|lang=xml|javadoc=true|url=struts2/plugins/jasperreports/src/main/java/org/apache/struts2/views/jasperreports/JasperReportsResult.java}
~~~~~~~

#####Settings#####

This plugin doesn't provide any global settings\.

#####Installation#####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

---

 (ok)  See also [Compiling JasperReports JRXML Files with Maven](http://www\.vitarara\.org/cms/node/131http://www\.vitarara\.org/cms/node/131)^[http://www\.vitarara\.org/cms/node/131http://www\.vitarara\.org/cms/node/131] (Mark Menard)

##Java 8 Support Plugin## {#PAGE_50857342}

This plugin was dropped in Struts 2\.5\.5 as Struts Core is using ASM5 now which supports Java8\.

> 


| 

| Adds support for Java 8 \- to allow use the latest features of the language with Struts actions\.

| 

####Usage####

You must define it as a dependency in 

~~~~~~~
pom.xml
~~~~~~~
 and exclude the old version of ASM used with 

~~~~~~~
xwork-core
~~~~~~~
, see a code snippet below:


~~~~~~~
<dependency>
    <groupId>org.apache.struts.xwork</groupId>
    <artifactId>xwork-core</artifactId>
    <exclusions>
        <exclusion>
            <groupId>asm</groupId>
            <artifactId>asm</artifactId>
        </exclusion>
        <exclusion>
            <groupId>asm</groupId>
            <artifactId>asm-commons</artifactId>
        </exclusion>
    </exclusions>
</dependency>
~~~~~~~

If you don't use Maven to manage the dependencies, please be sure to replace 

~~~~~~~
asm.jar
~~~~~~~
 and 

~~~~~~~
asm-commons.jar
~~~~~~~
 with appropriated ASM 5 versions\.

####Supported Java 8 features####

+ Lambda Expressions in actions when using them with the Convention plugin

 

##Javatemplates Plugin## {#PAGE_105841}

This plugin provides a

faster Java implementation of tags in the "simple" theme


####Installation####

1\. This plugin can be installed by copying the plugin jar into your application's /WEB\-INF/lib directory\. No other files need to be copied or created\.
 2\. Set these properties in struts\.xml:


~~~~~~~
<constant name="struts.ui.templateSuffix" value="java" />
<constant name="struts.ui.theme" value="simple" />

~~~~~~~

The plugin is a drop in replacement for the supported tags in the simple theme, so no other configuration is required\.

####Supported tags####

+ _a_ 

+ _actionerror_ 

+ _actionmessage_ 

+ _checkbox_ 

+ _datetextfield_ 

+ _div_ 

+ _fielderror_ 

+ _file_ 

+ _form_ 

+ _head_ 

+ _hidden_ 

+ _label_ 

+ _password_ 

+ _select_ 

+ _reset_ 

+ _submit_ 

+ _textfield_ 

+ _textarea_ 

+ _token_ 

####Performance benchmark####

TODO

##OSGi Plugin## {#PAGE_114995}

####Overview####


This plugin is only experimental and can change in the future\.

| 

This plugin provides support for starting an instance of Apache Felix inside a web application, and scanning installed bundles for Struts configuration\. An admin bundle is also provided\. It can be used with Glassfish 3 as well (Glassfish 3 based on Apache Felix as well), but in such a way 

~~~~~~~
struts.osgi.host
~~~~~~~
 must be defined\.

####Features####

+ GUI for bundle administration

+ Web access to Felix Shell

+ Application packages can be divided into bundles

+ Supports Velocity and FreeMarker templates

+ Supports Struts Spring integration

+ Supports integration with the Convention plugin

####Missing Features####

+ Probably can't access application classes from bundles, including Spring classes

+ _constant_  declarations in the bundled XML config files are ignored, these constants need to be set in the application XML config files (struts\.xml)

####About Run levels####

There are two ways of organizing bundles\. If third party bundles will not be used, then the application bundles can just be placed under 

~~~~~~~
/WEB-INF/classes/bundles
~~~~~~~
\. Bundles in this dir will be started in run level 2, the Apache Felix framework's bundles will be loaded in run level 1\. If third parties bundles will be used, or you need to start bundles on different run level, create sub dirs under 

~~~~~~~
/WEB-INF/classes/bundles
~~~~~~~
 with numeric names (starting from "2" because "1" is reserved for Felix), which correspond to the run level number\. For example bundles under 

~~~~~~~
/WEB-INF/classes/bundles/2
~~~~~~~
 will be started in run level 2, and bundles under 

~~~~~~~
/WEB-INF/classes/bundles/3
~~~~~~~
 will be started in run level 3\.

####Simple Usage####

Add these lines to MANIFEST\.MF:


~~~~~~~

Struts2-Enabled: true
Export-Package: com.mycompany.myapp.actions
Bundle-Version: 1.0.0
Bundle-SymbolicName: foo.actions
Import-Package: com.opensymphony.xwork2

~~~~~~~

Now the jar is ready to be deployed\.  Drop the jar into the 

~~~~~~~
/WEB-INF/classes/bundles
~~~~~~~
 directory and it will automatically be installed when the application starts up\.

####Using Spring####

By default Spring OSGi loads its xml config files asynchronously, which causes the OSGi plugin to fail while starting\. To fix this add this line to MANIFEST\.MF:

> 
 > Spring\-Context:\*;create\-asynchronously:=false
 > 

> Or if using The Apache Felix maven plugin (see below for details):

> 
 > \<Spring\-Context\>\*;create\-asynchronously:=false\</Spring\-Context\>
 > 


| Please note that you **do not** need to have the Struts Spring plugin in your application, in order to use Spring with the OSGi plugin\.

| 

If you want to use the Spring as the object factory for your actions, then follow these steps:

1. Place your Spring xml files under 

~~~~~~~
/META-INF/spring
~~~~~~~
 in the **bundle** jar file

2. Place your Spring xml files under 

~~~~~~~
/spring
~~~~~~~
 (they must be in the classpath, if you are using maven, put thme under /src/resources/spring) in the **application**

3. Copy all the bundle jar files into 

~~~~~~~
/WEB-INF/classes/bundles
~~~~~~~
 in your **application**

4. Make sure that the following properties are set in struts.xml or struts.properties in your **application**:


~~~~~~~

<constant name="struts.objectFactory" value="osgi" />
<constant name="struts.objectFactory.delegate" value="springOsgi" />

~~~~~~~

5. Configure your **web.xml** like:


~~~~~~~

<?xml version="1.0" encoding="UTF-8"?>
<web-app id="WebApp_9" version="2.4" xmlns="http://java.sun.com/xml/ns/j2ee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">

    <display-name>Struts Blank</display-name>

    <filter>
        <filter-name>struts2-prepare</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
    </filter>

    <filter>
        <filter-name>struts2-execute</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
    </filter>

     <filter-mapping>
        <filter-name>struts2-prepare</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <filter-mapping>
        <filter-name>struts2-execute</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <listener>
        <listener-class>org.apache.struts2.osgi.StrutsOsgiListener</listener-class>
    </listener>

    <listener>
        <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
    </listener>

    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>

    <context-param>
        <param-name>contextClass</param-name>
        <param-value>org.springframework.osgi.web.context.support.OsgiBundleXmlWebApplicationContext</param-value>
    </context-param>
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>osgibundle:/META-INF/spring/*.xml</param-value>
    </context-param>
    <context-param>
        <param-name>parentContextKey</param-name>
        <param-value>parent-context-bean</param-value>
    </context-param>
</web-app>

~~~~~~~

6. Add the Spring OSGi, and Spring Web dependencies to your web app, if you are using maven:


~~~~~~~

<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-web</artifactId>
    <version>2.5.5</version>
</dependency>
<dependency>
     <groupId>org.springframework.osgi</groupId>
     <artifactId>spring-osgi-web</artifactId>
     <version>1.1.2</version>
</dependency>

~~~~~~~

7. Download Spring OSGi and copy all the required bundles under **/classes/bundles/2**. For Struts OSGi 1.1.2, these are the required bundles:


~~~~~~~

com.springsource.org.aopalliance-1.0.0.jar
com.springsource.org.apache.commons.logging-1.1.1.jar
org.springframework.aop-2.5.5.A.jar
org.springframework.beans-2.5.5.A.jar
org.springframework.context-2.5.5.A.jar
org.springframework.core-2.5.5.A.jar
org.springframework.osgi.core-1.1.2.A.jar
org.springframework.osgi.extender-1.1.2.A.jar
org.springframework.osgi.io-1.1.2.A.jar
org.springframework.osgi.web-1.1.2.A.jar
org.springframework.web-2.5.5.A.jar

~~~~~~~

8. Put your bundles under **/classes/bundles/3**

####Using Velocity####

If you are going to use Velocity results, then add Velocity and Common Digester jars to your application\. Using maven:


~~~~~~~

<dependency>
    <groupId>velocity</groupId>
    <artifactId>velocity</artifactId>
    <version>1.5</version>
</dependency>

<dependency>
    <groupId>velocity-tools</groupId>
    <artifactId>velocity-tools</artifactId>
    <version>1.3</version>
</dependency>

<dependency>
    <groupId>commons-digester</groupId>
    <artifactId>commons-digester</artifactId>
    <version>1.8</version>
</dependency>

~~~~~~~

####Using The Convention Plugin####

The Convention plugin will discover actions in bundles in the same way that it discovers them in normal applications\. The Convention plugin expects result templates to be (by default) stored under _/WEB\-INF/content_ \. When packaging actions inside bundles, there won't be a _WEB\-INF_  folder, so you must let Convention know where the templates are located\. There are two ways of doing so(assuming the templates are under _/content_ ):

1\. Set the templates location constant in struts\.xml (in the application struts\.xml, not a bundled struts\.xml)


~~~~~~~

<constant name="struts.convention.result.path" value="/content/"/>

~~~~~~~

2\. Using the ResultPath annotation


~~~~~~~

@ResultPath("/content")
public class HelloWorldAction extends ActionSupport
...
}

~~~~~~~

####The OSGi interceptor####

The OSGi plugins defines the 

~~~~~~~
osgi
~~~~~~~
 interceptor and 

~~~~~~~
osgiStack
~~~~~~~
(

~~~~~~~
defaultStack
~~~~~~~
 plus the 

~~~~~~~
osgi
~~~~~~~
 interceptor) in the package 

~~~~~~~
osgi-default
~~~~~~~
\. This interceptor will check the action and if it implements 

~~~~~~~
org.apache.struts2.osgi.interceptor.BundleContextAware
~~~~~~~
, it will invoke setBundleContext(BundleContext bundleContext) on the action, passing the BundleContext of the OSGi container\. The interceptor also checks if the class implements 

~~~~~~~
org.apache.struts2.osgi.interceptor.ServiceAware<T>
~~~~~~~
, if it does, setServices(List\<T\> services) will be called, where T is the type of a service published in the OSGi container\. For example, lets assume an installed bundle publishes a service with the interface 

~~~~~~~
BookPriceLookup
~~~~~~~
, to get all the instances of this service, an action would look like:


~~~~~~~

public class BookPriceAction extends ActionSupport implements ServiceAware<BookPriceLookup> {
    private List<BookPriceLookup> services;

    public void setServices(List<BookPriceLookup> services) {
        this.services = services;
    }
}

~~~~~~~


> 

> 

> Keep in mind that the interceptor is not defined in the default struts package, so when using Convention, you need to specify the parent package as "osgi\-default", either using annotations (@ParentPackage), or XML(**this XML fragment must be in the struts XML config file in the application, not the bundle's**, this is a current limitation of the OSGi plugin):

> 
 > \<constant name="struts\.convention\.default\.parent\.package" value="osgi\-default" /\>
 > 
####Admin bundle####

An admin bundle is distributed with struts, which provides a simple interface to list the installed bundles\. Using this interface the bundles can be stopped, started and updated (reloaded from the file system)\. This interface also provides information on the installed bundles, like OSGi metadata, and a list of packages and actions loaded from each bundle\. An interactive AJAX shell is also available, which is just a web interface to the Apache Felix Shell\. To use this bundle, just copy the jar file to /bundles (same place where the application bundles are installed) and open [http://localhost:PORT/CONTEXT/osgi/admin/](http://localhost:PORT/CONTEXT/osgi/admin/) (replace _PORT_  and _context_ )

####About stopping/starting bundles####

When a bundle is started, the OSGi plugin will check for the header 

~~~~~~~
Struts2-Enabled
~~~~~~~
 in it\. If it is set to "true", the bundle will be scanned for XML config and Convention config\. When a bundle is stopped, any actions that were loaded from it will be removed from the runtime configuration\.

####Settings####

The following settings can be customized\.  See the [developer guide](http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files)^[http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files]\.

| Setting | Description | Default | Possible Values |
|---------|-------------|---------|-----------------|
|struts\.objectFactory\.delegate| The alias of the ObjectFactory to wrap |struts| Any configured alias |

The following setting must be set as context parameters in _web\.xml_ , because they are used by the StrutsOsgiListener, for example:


~~~~~~~

<context-param>
    <param-name>struts.osgi.clearBundleCache</param-name>
    <param-value>false</param-value>
</context-param>

~~~~~~~

If you are running your application on Glassfish 3 (which already contains Apache Felix) you must specify 

~~~~~~~
struts.osgi.host
~~~~~~~
, like below:


~~~~~~~

<context-param>
    <param-name>struts.osgi.host</param-name>
    <param-value>Glassfish</param-value>
</context-param>

~~~~~~~

| Setting | Description | Default | Possible Values |
|---------|-------------|---------|-----------------|
|struts\.osgi\.clearBundleCache| Delete all installed bundles when the container starts | true| true or false |
|struts\.osgi\.runLevel| Run level to start the container | 3 | \>=3 |
|struts\.osgi\.logLevel| Log level for Apache Felix | 1 (Error) |1 = error, 2 = warning, 3 = information, and 4 = debug |

####Building bundles with Maven####

Jar files can be turned into bundles using the [Maven Bundle Plugin](http://cwiki\.apache\.org/FELIX/bundle\-plugin\-for\-maven\-bnd\.html)^[http://cwiki\.apache\.org/FELIX/bundle\-plugin\-for\-maven\-bnd\.html] like:

**Maven Bundle Plugin Example**


~~~~~~~

<build>
    <plugins>
        <plugin>
            <groupId>org.apache.felix</groupId>
            <artifactId>maven-bundle-plugin</artifactId>
            <extensions>true</extensions>
            <version>2.0.0</version>
            <configuration>
                <instructions>
                    <manifestLocation>META-INF</manifestLocation>
                    <Struts2-Enabled>true</Struts2-Enabled>
                    <Export-Package>org.apache.struts2.osgi.demo</Export-Package>
                    <Import-Package>*,com.opensymphony.xwork2</Import-Package>
                    <Spring-Context>*;create-asynchronously:=false</Spring-Context>
                </instructions>
            </configuration>
        </plugin>
    </plugins>
</build>

~~~~~~~

####Struts OSGi \+ Spring OSGi diagram####

![struts\-osgi\.jpg](/Users/lukaszlenart/Projects/Apache/struts\-site/target/md/attachments/att10437\_struts\-osgi\.jpg)

####Resources####

+ [OSGi](http://www\.osgi\.org)^[http://www\.osgi\.org]

+ [Apache Felix](http://felix\.apache\.org)^[http://felix\.apache\.org]

+ [Spring OSGi ](http://www\.springsource\.org/osgi)^[http://www\.springsource\.org/osgi]

##OVal Plugin## {#PAGE_114997}

####Overview####

[OVal](http://oval\.sourceforge\.net/)^[http://oval\.sourceforge\.net/] is a pragmatic and extensible validation framework for any kind of Java objects (not only JavaBeans)\. Constraints can be declared with annotations (@NotNull, @MaxLength), POJOs or XML\.Custom constraints can be expressed as custom Java classes or by using scripting languages such as JavaScript, Groovy, BeanShell, OGNL or MVEL\.

The OVal plugin 

provides support for using the [OVal Validation Framework](http://oval\.sourceforge\.net/)^[http://oval\.sourceforge\.net/]


####Interceptors####

The plugin defines the interceptor "ovalValidation" and the interceptor stack "ovalValidationStack" in the "oval\-default" package\. To use this interceptor, extend the "oval\-default" package and apply the interceptor to your action, like:


~~~~~~~

<struts>
   <package namespace="/myactions" name="myactions" extends="oval-default">
        <action name="simpleFieldsXMLChild" class="org.apache.struts2.interceptor.SimpleFieldsXMLChild">
            <interceptor-ref name="ovalValidationStack"/>
            <result type="void"></result>
        </action>
   </package>
</struts>

~~~~~~~

####Annotations####

OVal provides many annotations for validations that can be used out of the box (custom validators can also be defined)\. Once the "ovalValidation" interceptor is applied to an action, you can annotate it:


~~~~~~~

public class SimpleField extends ActionSupport{
    @NotNull()
    @NotEmpty
    @Length(max = 3)
    private String name;
...
}

~~~~~~~

Use the @AssertValid annotation to validate nested objects, like


~~~~~~~

public class MemberObject extends ActionSupport {
    @AssertValid
    private Person person = new Person();

    public Person getPerson() {
        return person;
    }
}

~~~~~~~

####XML Configuration####

OVal provides support for defining the validation via XML\. Validation files must end in "\-validation\.xml" and the rules to find them, are the same rules used to find the validation XML files used by the regular validation mechanisms (default validation in xwork):

1. Per Action class: in a file named ActionName-validation.xml

2. Per Action alias: in a file named ActionName-alias-validation.xml

3. Inheritance hierarchy and interfaces implemented by Action class: The plugin searches up the inheritance tree of the action to find default validations for parent classes of the Action and interfaces implemented

Here is an example of an XML validation file:


~~~~~~~

<?xml version="1.0" encoding="UTF-8"?>
<oval xmlns="http://oval.sf.net/oval-configuration" xmlns:xsi="http://http://www.w3.org/2001/XMLSchema-instance"
 xsi:schemaLocation="http://oval.sf.net/oval-configuration http://oval.sourceforge.net/oval-configuration-1.3.xsd">
    <class type="org.apache.struts2.interceptor.SimpleFieldsXML" overwrite="false"
           applyFieldConstraintsToSetters="true">
        <field name="firstName">
            <notNull/>
        </field>
    </class>
</oval>

~~~~~~~

####Profiles####

A profile is a set of validations, that can be enabled for a method in an action, for example:


~~~~~~~

import org.apache.struts2.validation.Profiles;

public class FieldsWithProfiles extends ActionSupport {
    @NotNull(profiles = "1")
    private String firstName;

    @NotNull(profiles = "2")
    private String middleName;

    @NotNull(profiles = "3")
    private String lastName;

    @Profiles({"1", "3"})
    public String firstAndLast() {
        return SUCCESS;
    }

    @Profiles({"2"})
    public void middle() {
        return SUCCESS;
    }
}

~~~~~~~

In this example, when _firstAndLast()_  is executed, the fields _firstName_  and _lastName_  will be validated\. When _middle()_  is executed, only _middleName_  will be validated\. When a method is annotated with the _Profiles_  annotation, only the validations in the specified profiles will be performed\. If no profile is specified for an action method, all the validations in the class will be evaluated\.

####Internationalization of messages####

The OVal annotations (and corresponding XML tags) have a _message_  attribute that can be used to specify either the error message, or the key of the error message\. If a key is found in a property file, matching the value of the _massage_  attribute, it will be used as the message, otherwise the value will be used as a literal string\. For example, given this property file:

**BookAction\.properties**


~~~~~~~

notnull.field=${field.name} cannot be null

field.too.long=${field.name} value is too long, allowed length is ${max}

~~~~~~~

and this class:

**BookAction\.java**


~~~~~~~

public class BookActionextends ActionSupport {
    @NotNull(message = "notnull.field")
    @Length(max = 3, message = "field.too.long")
    private String title;

    @NotNull(message = "You must enter a valid ISBN")
    private String isbn;
...
}

~~~~~~~

When that action is validated, the field errors would be:

+ "title cannot be null"

+ "You must enter a valid ISBN"

+ "title value is too long, allowed length is 3"

The current OVal "context" object is pushed into the stack for each validator, so it can be accessed from the property file to build the error message\. See the [OVal javadoc](http://oval\.sourceforge\.net/api/net/sf/oval/context/FieldContext\.html)^[http://oval\.sourceforge\.net/api/net/sf/oval/context/FieldContext\.html] for more properties available in the FieldContext class\.

####The OVal Validation Interceptor####

This interceptor runs the action through the standard validation framework, which in turn checks the action against any validation rules (found in files such as ActionClass\-validation\.xml) and adds field\-level and action\-level error messages (provided that the action implements com\.opensymphony\.xwork2\.ValidationAware)\. This interceptor is often one of the last (or second to last) interceptors applied in a stack, as it assumes that all values have already been set on the action\.

This interceptor does nothing if the name of the method being invoked is specified in the _excludeMethods_  parameter\. _excludeMethods_  accepts a comma\-delimited list of method names\. For example, requests to foo\!input\.action and foo\!back\.action will be skipped by this interceptor if you set the excludeMethods parameter to "input, back"\.

Note that this has nothing to do with the com\.opensymphony\.xwork2\.Validateable interface and simply adds error messages to the action\. The workflow of the action request does not change due to this interceptor\. Rather, this interceptor is often used in conjuction with the workflow interceptor\.

NOTE: As this method extends off MethodFilterInterceptor, it is capable of deciding if it is applicable only to selective methods in the action class\. See MethodFilterInterceptor for more info\.

The param _alwaysInvokeValidate_  (default to _true_ ), will make the interceptor invoke _validate()_  on the action, if the action implements _Validateable_ \.

The param _programmatic_  (defaults to _true_ ), will make the plugin call _validateX()_  where _X_  is the name of the method that will be invoked in the action\. If this param is set to _false_ , _alwaysInvokeValidate_  is ignored and _validate()_  won't be invoked\.

####Installation####

The jar plugin needs to be added to the lib directory of your application as well as other dependencies\. If you are using XML validation, XStream needs to be included\. Here is the maven dependency example:


~~~~~~~

<dependency>
    <groupId>com.thoughtworks.xstream</groupId>
    <artifactId>xstream</artifactId>
    <version>1.3.1</version>
</dependency>

~~~~~~~

###Configuration reference###

Add a _constant_  element to your struts config file to change the value of a configuration setting, like:


~~~~~~~

 <constant name="struts.oval.validateJPAAnnotations" value="true" />

~~~~~~~

| Name | Default Value | Description |
|------|---------------|-------------|
| struts\.oval\.validateJPAAnnotations | false | Enables [mapping of JPA annotations to Oval validators](http://oval\.sourceforge\.net/userguide\.html\#d0e242)^[http://oval\.sourceforge\.net/userguide\.html\#d0e242]|

####Resources####

+ [OVal User Guide](http://oval\.sourceforge\.net/userguide\.html)^[http://oval\.sourceforge\.net/userguide\.html]

+ [OVal Javadoc](http://oval\.sourceforge\.net/userguide\.html)^[http://oval\.sourceforge\.net/userguide\.html]

+ [OVal Tutorials](http://oval\.sourceforge\.net/userguide\.html\#d0e1138)^[http://oval\.sourceforge\.net/userguide\.html\#d0e1138]

##Plexus Plugin## {#PAGE_44204}

 (\!)  The Plexus Plugin is experimental\. Feedback is appreciated\!


> 

> 

> While [Plexus](http://plexus\.codehaus\.org/)^[http://plexus\.codehaus\.org/]is similar to other inversion\-of\-control (IoC) or dependency injection frameworks such as the Spring Framework, it's fully\-fledged container supports many more features\.

> 

The Plexus plugin 

enables Struts Actions, Interceptors, and Results to be created and injected by [Plexus](http://plexus\.codehaus\.org/)^[http://plexus\.codehaus\.org/]


This plugin provides an _ObjectFactory_  implementation that tries to create Struts Action, Interceptor, and Result classes as Plexus objects\.

####Features####

+ Allows Actions, Results, and Interceptors to be created and managed by Plexus

####Usage####

To use the plugin, when configuring Struts Actions, Interceptors, or Results in 

~~~~~~~
struts.xml
~~~~~~~
, set the 

~~~~~~~
class
~~~~~~~
 attribute to contain the Plexus object id, rather than the actual Java class\.  This will allow Plexus to create the object and inject any dependencies also managed by Plexus\.

#####Example#####

**A simple Action using a Plexus id**


~~~~~~~

<action name="myAction" class="myPlexusId">
  <result>myAction.jsp</result>
</action>

~~~~~~~

#####Settings#####

The following settings can be customized\.  See the [developer guide](http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files)^[http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files]\.

|Setting|Description|Default|Possible Values|
|-------|-----------|-------|---------------|
|struts\.objectFactory|The name or class name of the ObjectFactory implementation to use|plexus|plexus, struts, or any class that extends ObjectFactory|

#####Installation#####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

##Plugins## {#PAGE_13868}

Struts 2 plugins contain classes and configuration that extend, replace, or add to existing Struts framework functionality\. A plugin can be installed by adding its JAR file to the application's class path, in addition to the JAR files to fulfill whatever dependencies the plugin itself may have\. To configure the plugin, the JAR should contain a 

~~~~~~~
struts-plugin.xml
~~~~~~~
 file, which follows the same format as an ordinary 

~~~~~~~
struts.xml
~~~~~~~
 file\.

Since a plugin can contain the 

~~~~~~~
struts-plugin.xml
~~~~~~~
 file, it has the ability to:

+ Define new packages with results, interceptors, and/or actions

+ Override framework constants

+ Introduce new extension point implementation classes

Many popular but optional features of the framework are distributed as plugins\. An application can retain all the plugins provided with the distribution, or just include the ones it uses\. Plugins can be used to organize application code or to distribute code to third\-parties\.



| Packages defined in a plugin can have parent packages that are defined in another plugin\. Plugins may define configuration elements with classes not contained in the plugin\. Any classes not included in the plugin's JAR must be on the application's classpath at runtime\. As from Struts 2\.3\.5

| 

The framework loads its default configuration first, then any plugin configuration files found in others JARs on the classpath, and finally the "bootstrap" 

~~~~~~~
struts.xml
~~~~~~~
\.

1. 

~~~~~~~
struts-default.xml
~~~~~~~
 (bundled in the Core JAR)

2. 

~~~~~~~
struts-plugin.xml
~~~~~~~
 (as many as can be found in other JARs)

3. 

~~~~~~~
struts.xml
~~~~~~~
 (provided by your application)

Since the 

~~~~~~~
struts.xml
~~~~~~~
 file is always loaded last, it can make use of any resources provided by the plugins bundled with the distribution, or any other plugins available to an application\.

####Static resources####

To include static resources in your plugins add them under "/static" in your jar\. And include them in your page using "/struts" as the path, like in the following example:


~~~~~~~
Assuming /static/main.css is inside a plugin jar, to add it to the page:

<@s.url value="/struts/main.css" var="css" />
<link rel="stylesheet" type="text/css" href="%{#css}" />

~~~~~~~

Read also [StaticContentLoader JavaDoc](http://struts\.apache\.org/2\.x/struts2\-core/apidocs/org/apache/struts2/dispatcher/StaticContentLoader\.html)^[http://struts\.apache\.org/2\.x/struts2\-core/apidocs/org/apache/struts2/dispatcher/StaticContentLoader\.html]\.

####Extension Points####

Extension points allow a plugin to override a key class in the Struts framework with an alternate implementation\. For example, a plugin could provide a new class to create Action classes or map requests to Actions\.

The following extension points are available in Struts 2:


~~~~~~~
{snippet:id=extensionPoints|javadoc=true|url=org.apache.struts2.config.DefaultBeanSelectionProvider}
~~~~~~~

####Plugin Examples####

Let's look at two similar but different plugins bundled with the core distribution\.

#####Sitemesh plugin#####

[SiteMesh](http://opensymphony\.com/sitemesh/)^[http://opensymphony\.com/sitemesh/] is a popular alternative to Tiles\. SiteMesh provides a common look\-and\-feel to an application's pages by automatically wrapping a plain page with common elements like headers and menubars\.

The 

~~~~~~~
sitemesh-plugin.jar
~~~~~~~
 contains several classes, a standard JAR manifest, and a plugin configuration file\.


~~~~~~~
 + META-INF/
   + manifest.mf
 + org
   + apache
     + struts2
       + sitemesh
         + FreeMarkerPageFilter.class
         + TemplatePageFilter.class
         + VelocityPageFilter.class
 + struts-plugin.xml

~~~~~~~

While the SiteMesh Plugin doesn't provide any new results, interceptors, or actions, or even extend any Struts integration points, it does need to know what settings have been enabled in the Struts framework\. Therefore, its 

~~~~~~~
struts-plugin.xml
~~~~~~~
 looks like this:


~~~~~~~
{snippet:id=all|lang=xml|url=struts2/plugins/sitemesh/src/main/resources/struts-plugin.xml}
~~~~~~~

The two bean elements, with the "static" flag enabled, tell Struts to inject the current settings and framework objects into static property setters on startup\. This allows, for example, the FreeMarkerPageFilter class to get an instance of the Struts FreemarkerManager and the current encoding setting\.

#####Tiles plugin#####

[Tiles](http://struts\.apache\.org/struts\-sandbox/tiles/index\.html)^[http://struts\.apache\.org/struts\-sandbox/tiles/index\.html] is a popular alternative to SiteMesh\. Tiles provides a common look\-and\-feel to an application's pages by breaking the page down into common fragments or "tiles"\.

The 

~~~~~~~
tiles-plugin.jar
~~~~~~~
 contains several classes, a standard JAR manifest, and a configuration file\.


~~~~~~~
 + META-INF/
   + manifest.mf
 + org
   + apache
     + struts2
       + tiles
         + StrutsTilesListener.class
         + StrutsTileUtilImpl.class
       + views
         + tiles
           + TilesResult.class
   + struts-plugin.xml

~~~~~~~

Since the Tiles Plugin does need to register configuration elements, a result class, it provides a 

~~~~~~~
struts-plugin.xml
~~~~~~~
 file\.

####Plugin Registry####

 (ok)  For a list of bundled plugins, see the [Plugin Reference Documentation](#PAGE_44163)\. For more about bundled and third\-party plugins, visit the [Apache Struts Plugin Registry](http://cwiki\.apache\.org/S2PLUGINS/home\.html)^[http://cwiki\.apache\.org/S2PLUGINS/home\.html]\.

####Back to####

##Portlet Plugin## {#PAGE_74033}

###Documentation###

**The Portlet Plugin**

> 

> 

> is used for developing JSR286 portlets using Struts 2

> **\.**


####portlet\-class####

To use the Struts 2 Portlet framework, use **_org\.apache\.struts2\.portlet\.dispatcher\.Jsr286Dispatcher_ ** as the portlet class in your portlet\.xml file:

**portlet\.xml**


~~~~~~~
<?xml version="1.0" encoding="UTF-8"?>

<portlet-app id="my-portlet-app"
	xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0"
	xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_2_0.xsd">

    <portlet id="MyPortlet">
        <description xml:lang="EN">My Portlet</description>
        <portlet-name>MyPortlet</portlet-name>
        <display-name xml:lang="EN">my-portlet</display-name>
    
        <portlet-class>org.apache.struts2.portlet.dispatcher.Jsr286Dispatcher</portlet-class>
        
        <!-- SNIP -->

    </portlet>
</portlet-app>

~~~~~~~

####Portlet Init Parameters####

Below is the init\-param elements that you can set up in _portlet\.xml_  for configuring the portlet mode \-\> xwork namespace mappings for the portlet\. Basically, you can think of the different portlet modes as different sub\-applications, so it can be useful to set up the 

~~~~~~~
struts.xml
~~~~~~~
 configuration with different namespaces for the different portlets and modes:

|Key|Description|Default|
|---|-----------|-------|
|portletNamespace|The namespace for the portlet in the action configuration\. This namespace is prepended to all action lookups, and makes it possible to host multiple portlets in the same portlet application\. If this parameter is set, the complete namespace will be _/portletNamespace/modeNamespace/actionName_ |The default namespace\.|
|viewNamespace|The namespace in the xwork config for the view portlet mode\.|The default namespace\.|
|editNamespace|The namespace in the xwork config for the edit portlet mode\.|The default namespace\.|
|helpNamespace|The namespace in the xwork config for the help portlet mode\.|The default namespace\.|
|defaultViewAction|Name of the action to use as default for the view portlet mode, when no action name is present\.|default|
|defaultEditAction|Name of the action to use as default for the edit portlet mode, when no action name is present\.|default|
|defaultHelpAction|Name of the action to use as default for the help portlet mode, when no action name is present\.|default|

e\.g\.

**portlet\.xml**


~~~~~~~
<init-param>
    <!-- Portlet namespace -->
    <name>portletNamespace</name>
    <value>/portletA</value>
</init-param>
<init-param>
    <!-- The base namespace of the view portlet mode -->
    <name>viewNamespace</name>
    <value>/view</value>
</init-param>
<init-param>
    <!-- The default action to invoke in view mode -->
    <name>defaultViewAction</name>
    <value>index</value>
</init-param>

~~~~~~~

This snippet from 

~~~~~~~
portlet.xml
~~~~~~~
 will set up the portlet with a namespace of _/portletA/\. This means that all requests to this portlet will get the namespace prepended when looking up the action\. In addition, the \_view_  portlet mode will map to the _/view_  namespace, so a request for action 

~~~~~~~
myAction
~~~~~~~
 will resolve to the namespace and action _/portletA/view/myAction_ \. It also means that if no action is requested, the default action of 

~~~~~~~
index
~~~~~~~
 will be used for the request\.

####web\.xml####

If you want to access to expose the value stack through request attributes (e\.g\. if you want to use regular JSTL tags to access values in the stack), you have to configure the dispatcher servlet in your web application descriptor:

**web\.xml**


~~~~~~~
<servlet id="Struts2PortletDispatcherServlet">
    <servlet-name>Struts2PortletDispatcherServlet</servlet-name>
    <servlet-class>org.apache.struts2.portlet.dispatcher.DispatcherServlet</servlet-class>
</servlet>

~~~~~~~



| **If you're only using Struts 2 tags, configuring the dispatcher servlet is optional**

| 

####Portlet Phases####

The portlet specification describes that a portlet request cycle can consist of two phases, an _event_  phase and a _render_  phase\. In case of an _event_  in the portlet, it will always execute before the _render_  phase\. The _event_  phase is typically for changing the state of the application\. In a portlet, this is typically when a form is submitted\. The _render_  phase will then prepare and dispatch to the view\. It's recommended that you set up the result from an action that is executed in the _event_  phase to point to another action that is executed in the _render_  phase, which again is responsible for dispatching to the actual view\.

####Portlet Result Dispatching####

The _struts\-portlet\-default_  package defines a special default Result Type, which is responsible for performing the result logic of an Action execution\. Typically, this involves including a JSP for rendering, or preparing a render action if one is configured for the current event action\.

This result type has three main modes of execution\.

+ If the Action is executed in the render phase, it will perform a PortletRequestDispatcher\.include(req, res) to the resource specified in the _location_  attribute\.

+ If the Action is executed in the event phase, and the result is an action mapping, it will set a render parameter on the ActionResponse to indicate which Action should be executed in the render phase\. This follows good web application design, which promotes the use of a redirect after an event, which in this case means that an Action executed in the event phase will be followed by a redirect to an Action executed in the render phase\.

+ If the Action is executed in the event phase, and the result is not an action mapping, the result will prepare a special Action called "renderDirect" (specified in the _struts\-portlet\-default_  package) whose sole purpose is to render the specified web resource (usually a JSP)\.

#####redirectAction#####

The action executed in event mode can pass render parameters to the next action to execute in render mode through parameters using the _redirectAction_  result type:

**struts\.xml**


~~~~~~~
<result type="redirectAction" name="success">
    <param name="actionName">displayCart</param>
    <param name="userId">${userId}</param>  
    <!-- If you want to redirect to a different portlet mode, use the portletMode parameter 
    <param name="portletMode">view</param>
    -->
</result>

~~~~~~~

This will set up a _render parameter_  called _userId_  with the value of the _userId_  property on the value stack\.

You can also use the _portletMode_  parameter to change to a different portlet mode\.

####s:url and s:form tags####

URLs in a portlet is handled quite different than for a regular web application\. There's no such thing as "extension", there's simply an action name and a namespace, and they have to be specified using the respective tag attributes\. URLs using the _value_  attribute will be encoded as a resource URL and is only suitable for additional resources such as images and style sheets\.

Example:

|Servlet|Portlet|
|-------|-------|
|\<s:url value="hello\.action"/\>|\<s:url action="hello"/\>|
|\<s:url value="style\.css"/\>|\<s:url value="style\.css"/\>|

In addition, there are some additional tag attributes that are portlet specific\. These are:

|Name|Description|
|----|-----------|
|portletMode|The resulting portlet mode of the url|
|windowState|The resulting window state of the url|
|portletUrlType|Specifies if this is a _render_  or an _action_  url|

Typical usage for the _portletUrlType_  is if you have a _delete_  link that removes something from a database\. To ensure this is done in the event phase, as recommended by the portlet specification (since it is a change of state), the url can use this attribute, e\.g\. \<s:url action="deleteEntry" portletUrlType="action"/\>

####Security####

Basically the Struts2 Portlet Plugin doesn't support different auth level in the same portlet\. If you want to achieve that you must create two separated portlets and configure access level with portlet engine for each of them\.

####Other resources####

[Struts 2 Portlet Tutorial](#PAGE_71458)
[ JSR168 Specification](http://jcp\.org/aboutJava/communityprocess/final/jsr168/index\.html)^[http://jcp\.org/aboutJava/communityprocess/final/jsr168/index\.html]
[JSR286 Specification](http://jcp\.org/aboutJava/communityprocess/final/jsr286/index\.html)^[http://jcp\.org/aboutJava/communityprocess/final/jsr286/index\.html]

###Struts 2 Portlet Tutorial### {#PAGE_71458}

####Struts 2 Portlet Tutorial \- Creating a simple Bookmark Portlet####


Using version 2\.1\.1\-SNAPSHOT of the portlet plugin

| 

**(i) Note that this tutorial assumes that you're familiar with basic Struts 2 web application programming\.**


> 

> 

> If you have not used Struts 2 before, please check out some of the other Struts 2 tutorials first\.

> 

#####Preparations#####

In this tutorial we will use eclipse as our IDE\. If you do not have Eclipse, you can download it from [http://www\.eclipse\.org](http://www\.eclipse\.org)\. 

The project itself will be set up using Maven 2\. Maven 2 is available from [http://maven\.apache\.org](http://maven\.apache\.org)\.

If you have not used the maven\-eclipse\-plugin before, you need to set up the Eclipse workspace with a variable that points to the Maven 2 repository\. To do this, type 


~~~~~~~
mvn -Declipse.workspace=<path-to-eclipse-workspace> eclipse:add-maven-repo
~~~~~~~

#####Creating the project#####

We'll use Maven 2 with the Struts 2 Portlet Archetype to create a skeleton project for our portlet application\. From the command line, issue the command:


~~~~~~~
mvn archetype:create -DarchetypeGroupId=org.apache.struts -DarchetypeArtifactId=struts2-archetype-portlet -DarchetypeVersion=2.1.1-SNAPSHOT -DartifactId=bookmark-portlet 
    -DgroupId=com.mycompany -DremoteRepositories=http://people.apache.org/repo/m2-snapshot-repository
~~~~~~~

This will set up the maven 2 structure for us and also set up the basic configuration needed to create a Struts 2 portlet\. The archetype creates a sample HelloWorld portlet that shows off some of the basic principles of Struts 2 portlet programming\. To test the set up, type 


~~~~~~~
mvn jetty:run -P pluto-embedded
~~~~~~~

 in a command prompt\. Open a browser and point your browser to [http://localhost:8080/bookmark\-portlet/pluto/index\.jsp](http://localhost:8080/bookmark\-portlet/pluto/index\.jsp) and play around\.

#####Looking at the basics#####

To see how the basic HelloWorld example works, let's look at some of the configuration files, starting with the JSR168 portlet descriptor

**src/main/webapp/WEB\-INF/portlet\.xml**


~~~~~~~

<?xml version="1.0" encoding="UTF-8"?>

<portlet-app
   version="1.0"
   xmlns="http://java.sun.com/xml/ns/portlet/portlet-app_1_0.xsd"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://java.sun.com/xml/ns/portlet/portlet-app_1_0.xsd http://java.sun.com/xml/ns/portlet/portlet-app_1_0.xsd"
   id="bookmark-portlet">

   <portlet id="HelloPortlet">
      <description xml:lang="EN">Simple hello world portlet</description>
      <portlet-name>HelloPortlet</portlet-name>
      <display-name xml:lang="EN">bookmark-portlet</display-name>
		
      <portlet-class>org.apache.struts2.portlet.dispatcher.Jsr168Dispatcher</portlet-class>
		
      <!-- The namespace for the actions configured for view mode -->
      <init-param>
         <name>viewNamespace</name>
         <value>/view</value>
      </init-param>
		
      <!-- The default action to invoke in view mode. -->
      <init-param>
         <name>defaultViewAction</name>
         <value>index</value>
      </init-param>
		
      <!-- The namespace for the actions configured for edit mode -->
      <init-param>
         <name>editNamespace</name>
         <value>/edit</value>
      </init-param>
		
      <!-- The default action to invoke in edit mode. -->
      <init-param>
         <name>defaultEditAction</name>
         <value>index!input</value>
      </init-param>
		
      <expiration-cache>0</expiration-cache>
		
      <supports>
         <mime-type>text/html</mime-type>
         <portlet-mode>view</portlet-mode>
         <portlet-mode>edit</portlet-mode>
      </supports>
		
      <supported-locale>en</supported-locale>
		
      <portlet-info>
         <title>HelloPortlet</title>
         <short-title>HelloPortlet</short-title>
         <keywords>struts 2,portlet,hello,world</keywords>
      </portlet-info>
   </portlet>  
</portlet-app>

~~~~~~~

The important parts to notice are the _portlet\-class_  and _init\-param_  elements\. The _portlet\-class_  element is always **_org\.apache\.struts2\.portlet\.dispatcher\.Jsr168Dispatcher_ ** (or a subclass, if you have added some custom functionality)\. This is the portlet that acts as the dispatcher for the Struts 2 framework, and translates incoming user interaction to action requests that Struts 2 understands\. The init\-params _viewNamespace_ , _defaultViewAction_ , _editNamespace_  and _defaultEditAction_  set up some defaults for the dispatcher when the portlet encounters a portlet mode without a specific action\. Here, we set up the _view_  portlet mode to map to the _/view_  action namespace, and the _edit_  portlet mode to map to the _/edit_  action namespace\. We also specify that the default actions for the mentioned portlet modes are _index_  and _index\!input_  respectively\. We will recognize these namespaces in the next file:

**src/main/resources/struts\.xml**


~~~~~~~

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">

<struts>
   <package name="default" extends="struts-portlet-default" namespace="/view">
        <action name="index" class="com.mycompany.HelloAction">
	    <result>/WEB-INF/jsp/view/index.jsp</result>
	</action>
   </package>
	
   <package name="edit" extends="struts-portlet-default" namespace="/edit">
	<action name="index" class="com.mycompany.UpdateNameAction">
	    <result type="redirectAction">
	        <param name="actionName">index</param>
		<param name="portletMode">view</param>
	    </result>
	    <result name="input">/WEB-INF/jsp/edit/index.jsp</result>
	</action>
    </package>
</struts>

~~~~~~~

As we can see, the actions for the _view_  portlet mode is in the _default_  package, with _/view_  as namespace, and the actions for the _edit_  portlet mode is in the _edit_  package, with _/edit_  as namespace\.

#####Import the project into Eclipse#####

Now let's import the project into Eclipse\. First, type 


~~~~~~~
mvn eclipse:eclipse -P pluto-embedded
~~~~~~~

Then start Eclipse (if you have not already done so), and import the project using "File \-\> Import \-\> General \-\> Existing Projects into Workspace"\. Browse to the folder where you created the project and press finish\. Your portlet project should now be setup up with all dependencies in place\.

#####Creating the Bookmark domain object#####

To represent the bookmarks, we'll create a simple domain object\. We'll keep it really simple, so the Bookmark object will only have a _name_  and a _url_  property:

**src/main/java/com/mycompany/domain/Bookmark\.java**


~~~~~~~

public class Bookmark {
   private String name;
   private String url;

   public Bookmark(String name, String url) {
      this.name = name;
      this.url = url;
   }
	
   public String getName() {
      return name;
   }

   public String getUrl() {
      return url;
   }
}

~~~~~~~

#####Adding bookmarks#####

Adding bookmarks is an operation that logically belongs to the _edit_  portlet mode\. So we'll create a simple action for this purpose, and configure it in the _edit_  configuration package\. In normal Struts 2 fashion, we'll create an action object with the properties we need:

**src/main/java/com/mycompany/AddBookmark\.java**


~~~~~~~

public class AddBookmarkAction extends DefaultActionSupport {

   private String name;
   private String url;

   public void setName(String name) {
      this.name = name;
   }

   public void setUrl(String url) {
      this.url = url;
   }

   @Override
   public String execute() throws Exception {
      return SUCCESS;
   }
}

~~~~~~~

And in struts\.xml, remove the existing configuration for the edit package and add an entry for the action:

**struts\.xml**


~~~~~~~

<package name="edit" extends="struts-portlet-default" namespace="/edit">
	
   <action name="index" class="com.mycompany.AddBookmarkAction">
      <result name="input">/WEB-INF/jsp/edit/index.jsp</result>
   </action>

</package>

~~~~~~~

Let's create the input form so we have something to display\. The form is really simple, with a label and a text field for each of the properties in the _Bookmark_  domain object:

**src/main/webapp/WEB\-INF/jsp/edit/index\.jsp**


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>

<h2>Manage bookmarks</h2>

<s:form action="index">
   <table>
      <s:textfield name="name" label="Name"/>
      <s:textfield name="url" label="URL"/>
      <s:submit value="Add"/>
   </table>
</s:form>

~~~~~~~

The textfields maps to the property names we have defined in _AddBookmarkAction_ \. Before we continue, let's check that everything is configured correctly and check that our portlet can be run\. In a command prompt, change into the directory where you have created the project and issue the command _mvn jetty:run \-P pluto\-embedded_ \. Then open [http://localhost:8080/bookmark\-portlet/pluto/index\.jsp](http://localhost:8080/bookmark\-portlet/pluto/index\.jsp) and click on the _edit_  portlet window control\. If everything is set up correctly, you should see a form like this:

![AddBookmarkForm\.jpg](/Users/lukaszlenart/Projects/Apache/struts\-site/target/md/attachments/att59671071\_AddBookmarkForm\.jpg)

If you try to submit data in the form, it will obviously not work since we have not implemented any logic to add bookmarks yet\. That will be our next task\. Since we'll need a PortletPreferences reference, we'll have the action implement the _PortletPreferencesAware_  interface that will instruct Struts 2 to inject this into our action, without the need for us to look it up manually\. When we have the reference to the _PortletPreferences_  object, we'll implement logic to store the bookmark (or rather the bookmark's properties, since we can only store Strings in the preferences object):

**src/main/java/com/mycompany/AddBookmarkAction\.java**


~~~~~~~

public class AddBookmarkAction extends DefaultActionSupport implements PortletPreferencesAware {

   private String name;
   private String url;
	
   private PortletPreferences portletPreferences;

   public void setName(String name) {
      this.name = name;
   }

   public void setUrl(String url) {
      this.url = url;
   }
	
   public void setPortletPreferences(PortletPreferences portletPreferences) {
      this.portletPreferences = portletPreferences;	
   }

   @Override
   public String execute() throws Exception {
      portletPreferences.setValue(name, url);
      portletPreferences.store();
      return SUCCESS;
   }
}

~~~~~~~

After the bookmark has been stored, we'll just redirect back to the input form:

**src/main/resources/struts\.xml**


~~~~~~~

<package name="edit" extends="struts-portlet-default" namespace="/edit">
	
   <action name="index" class="com.mycompany.AddBookmarkAction">
      <result type="redirectAction">
         <param name="actionName">index!input</param>
      </result>
      <result name="input">/WEB-INF/jsp/edit/index.jsp</result>
   </action>

</package>

~~~~~~~

We use a _redirectAction_  result type to redirect back to the input form in proper PRG (Post \- Redirect \- Get) manner\.

Now we can add some bookmarks\. We don't get much feedback though, so let's proceed\.\.\.

#####Listing the bookmarks#####

The bookmarks will be listed in the _view_  portlet mode, so we'll create a _ListBookmarksAction_  and configure it in the default package:

**src/main/java/com/mycompany/ListBookmarksAction\.java**


~~~~~~~

public class ListBookmarksAction extends DefaultActionSupport implements PortletPreferencesAware {
   private List<Bookmark> bookmarks = new ArrayList<Bookmark>();
   private PortletPreferences portletPreferences;

   public List<Bookmark> getBookmarks() {
      return bookmarks;
   }

   public void setPortletPreferences(PortletPreferences portletPreferences) {
      this.portletPreferences = portletPreferences;
   }

   @Override
   public String execute() throws Exception {
      // For simplicity, we'll assume that only bookmarks are stored in the preferences.
      Map<String, String[]> preferencesMap = portletPreferences.getMap();
      for(Map.Entry<String, String[]> entry : preferencesMap.entrySet()) {
         bookmarks.add(new Bookmark(entry.getKey(), entry.getValue()[0]));
      }
      return SUCCESS;
   }
}

~~~~~~~

Again we use the _PortletPreferencesAware_  to get the _PortletPreferences_  injected in our action\. Then we just get all the values from the preferences and add them as a _Bookmark_  instance in an _ArrayList_ \.

Obviously, we'll need a jsp to view the list of bookmarks:

**src/main/webapp/WEB\-INF/jsp/view/index\.jsp**


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>

<strong>Bookmarks</strong>
<p>
   <table>
   <s:iterator value="%{bookmarks}" var="bookmark">
      <tr>
         <td><s:property value="%{name}"/></td>
         <td><a href="<s:property value="%{url}"/>" target="_blank"><s:property value="%{url}"/></a></td>
      </tr>
   </s:iterator>
   </table>
</p>

~~~~~~~

In the JSP, we just iterate over the list of Bookmarks and print the properties in the iterator loop\. 

In struts\.xml, remove the _default_  package, and add this instead:

**src/main/resources/struts\.xml**


~~~~~~~

<package name="view" extends="struts-portlet-default" namespace="/view">
   <action name="index" class="com.mycompany.ListBookmarksAction">
      <result>/WEB-INF/jsp/view/index.jsp</result>
   </action>
</package>

~~~~~~~

When you're ready, go back to a command prompt and start the server again (_mvn jetty:run \-P pluto\-embedded_ ), open a browser and start adding some bookmarks\. When you go back to _view_  mode after adding a few, you'll see the bookmarks listed:

![ListBookmarks\.jpg](/Users/lukaszlenart/Projects/Apache/struts\-site/target/md/attachments/att59671072\_ListBookmarks\.jpg)

#####Preparing for bookmark management#####

It would be nice to be able to manage the list of bookmarks, so we'll add delete and edit functionality\. All modifications will happen in the _edit_  portlet mode\. We'll start by displaying the list of bookmarks in the _edit_  mode as well\. The plan is to extend this list to add a _delete_  and an _edit_  link to modify the bookmark entries\. We'll do it really simple and just copy the code from the _index\.jsp_  for view into the index\.jsp for _edit_  and add the links in a new table column:

**src/main/webapp/WEB\-INF/jsp/edit/index\.jsp**


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>

<h2>Manage bookmarks</h2>

<p>
   <table>
   <s:iterator value="%{bookmarks}" var="bookmark">
      <s:url action="editBookmark!input" id="editUrl">
         <s:param name="oldName" value="%{name}"/>
      </s:url>
      <s:url action="deleteBookmark" portletUrlType="action" id="deleteUrl">
         <s:param name="bookmarkName" value="%{name}"/>
      </s:url>
      <tr>
         <td><s:property value="%{name}"/></td>
         <td><a href="<s:property value="%{url}"/>" target="_blank"><s:property value="%{url}"/></a></td>
         <td><a href="<s:property value="%{editUrl}"/>">Edit</a></td>
         <td><a href="<s:property value="%{deleteUrl}"/>">Delete</a></td>
      </tr>
   </s:iterator>
   </table>
</p>

<s:form action="addBookmark">
   <table>
      <s:textfield name="name" label="Name"/>
      <s:textfield name="url" label="URL"/>
      <s:submit value="Add"/>
   </table>
</s:form>

~~~~~~~

For the _delete_  url we need to specify that it is a portlet action url since portlet preferences cannot be changed in the render phase\. We also need to change our configuration a bit since we'll use this page as index page for _edit_  mode, and not only as the input form for the _AddBookmarkAction_ :

**src/main/resources/struts\.xml**


~~~~~~~

<package name="edit" extends="struts-portlet-default" namespace="/edit">

   <action name="index" class="com.mycompany.ListBookmarksAction">
      <result>/WEB-INF/jsp/edit/index.jsp</result>
   </action>

   <action name="addBookmark" class="com.mycompany.AddBookmarkAction">
      <result type="redirectAction">
         <param name="actionName">index</param>
      </result>
   </action>

</package>

~~~~~~~

Here we have added the _ListBookmarksAction_  as the _index_  action, which will display the bookmark list with the input form\. When the form is submitted, it will invoke the _addBookmark_  action, and upon success, control is redirected back to the _index_  action\. With this new structure, we'll also need to updated the portlet descriptor to use _index_  instead of _index\!input_  as the default action for _edit_  mode:

**src/main/webapp/WEB\-INF/portlet\.xml**


~~~~~~~

<!-- The default action to invoke in edit mode. -->
<init-param>
   <name>defaultEditAction</name>
   <value>index</value>
</init-param>

~~~~~~~

Now you can (re)start the server and see how it works\. This is how it looks in _edit_  mode after adding a few entries:

![ListBookmarksInEditMode\.jpg](/Users/lukaszlenart/Projects/Apache/struts\-site/target/md/attachments/att59671070\_ListBookmarksInEditMode\.jpg)

#####Deleting bookmarks#####

Let's create the action that handles deletion of bookmarks\. It's pretty simple\. As with our other actions, we need to get a reference to the _PortletPreferences_  and simply remove the bookmark values from it:

**src/main/java/com/mycompany/DeleteBookmarkAction\.java**


~~~~~~~

public class DeleteBookmarkAction extends DefaultActionSupport implements PortletPreferencesAware{

   private String bookmarkName;
	
   private PortletPreferences portletPreferences;

   public void setBookmarkName(String bookmarkName) {
      this.bookmarkName = bookmarkName;
   }
	
   public void setPortletPreferences(PortletPreferences portletPreferences) {
      this.portletPreferences = portletPreferences;
   }
	
   @Override
   public String execute() throws Exception {
      portletPreferences.reset(bookmarkName);
      portletPreferences.store();
      return SUCCESS;
   }

}

~~~~~~~

Pretty simple and straight forward\. Next, add a configuration entry for the action in the _edit_  package:

**src/main/resources/struts\.xml**


~~~~~~~

<action name="deleteBookmark" class="com.mycompany.DeleteBookmarkAction">
   <result type="redirectAction">
      <param name="actionName">index</param>
   </result>
</action>

~~~~~~~

After a bookmark has been deleted, we redirect back to the _index_  action\. Now you should be able to click the _Delete_  link to remove individual entries\.

#####Editing bookmarks#####

The final step is to edit bookmark entries\. When the user clicks the _edit_  link, the portlet will display a new page with an input form and the bookmark values already filled in the text fields\. We'll start by creating the jsp file:

**src/main/webapp/WEB\-INF/jsp/edit\.jsp**


~~~~~~~

<%@ taglib prefix="s" uri="/struts-tags" %>

<h2>Edit bookmark</h2>

<s:form action="editBookmark">
   <input type="hidden" name="oldName" value="<s:property value="%{oldName}"/>"/>
   <table>
      <s:textfield name="name" label="Name" value="%{oldName}"/>
      <s:textfield name="url" label="URL"/>
      <s:submit value="Update"/>
   </table>
</s:form>

~~~~~~~

The _oldName_  hidden field keeps track of which bookmark is beeing edited, since the name is also our id to the entry beeing edited\. The actual update of the bookmark will be a "delete and add a new entry":

**src/main/java/com/mycompany/EditBookmarkAction\.java**


~~~~~~~

public class EditBookmarkAction extends DefaultActionSupport implements PortletPreferencesAware, Preparable, ParameterAware {

   private String oldName;
   private String name;
   private String url;
	
   private PortletPreferences portletPreferences;
   private Map<String, String[]> parameters;
	
   public String getOldName() {
      return oldName;
   }
	
   public void setOldName(String oldName) {
      this.oldName = oldName;
   }
	
   public String getUrl() {
      return url;
   }

   public void setUrl(String url) {
      this.url = url;
   }

   public void setName(String name) {
      this.name = name;
   }
	
   public void setPortletPreferences(PortletPreferences portletPreferences) {
      this.portletPreferences = portletPreferences;
   }
	
   public void setParameters(Map<String, String[]> parameters) {
      this.parameters = parameters;
   }
	
   public void prepare() throws Exception {
      // Since the prepare interceptor is run before the parameter interceptor, 
      // we have to get the parameter "manually".
      this.oldName = parameters.get("oldName")[0];
      this.url = portletPreferences.getValue(oldName, null);
   }
	
   public String execute() throws Exception {
      // The modification is handled as remove/add
      portletPreferences.reset(oldName);
      portletPreferences.setValue(name, url);
      portletPreferences.store();
      return SUCCESS;
   }
}

~~~~~~~

There's a couple of new things here, but nothing unfamiliar if you have worked with Struts 2 before\. We use the _Preparable_  interface to pre\-populate the vaules in the edit form, and we use the _ParameterAware_  interface to get a reference to the request parameter map\. Other than that, the _execute_  method simply resets the old value for the bookmark and add it with the (possibly) new name\.

The last thing we need to do is to add the configuration in the _edit_  package for the new action:

**src/main/resources/struts\.xml**


~~~~~~~

<action name="editBookmark" class="com.mycompany.EditBookmarkAction">
   <result type="redirectAction">
      <param name="actionName">index</param>
   </result>
   <result name="input">/WEB-INF/jsp/edit/edit.jsp</result>
</action>

~~~~~~~

#####Summary#####

Using Struts 2, we built a simple bookmark portlet utilizing the _edit_  portlet mode for management operations\. The tutorial should have given you a basic understanding of portlet development with Struts 2, and that it is not very different from using Struts 2 in a regular web application\. 

#####Notes#####

Instead of using the Maven 2 Jetty plugin to run the tutorial, you can check out the _JettyPlutoLauncher_  which is included in the test sources\. Just launch it as a regular Java class in your IDE\. And to debug, just launch it in debug mode\.

#####Links#####

_S2PLUGINS:Source code for the tutorial_ 
[JSR168 Specification](http://jcp\.org/aboutJava/communityprocess/final/jsr168/index\.html)^[http://jcp\.org/aboutJava/communityprocess/final/jsr168/index\.html]
[Struts 2 Portlet Configuration options](http://struts\.apache\.org/2\.x/docs/portlet\-configuration\.html)^[http://struts\.apache\.org/2\.x/docs/portlet\-configuration\.html]
[Author's blog about portlet related development](http://portletwork\.blogspot\.com)^[http://portletwork\.blogspot\.com]
[Old tutorial for WebWork 2](http://struts\.apache\.org/2\.x/docs/portlet\-tutorial\-webwork\-22\.html)^[http://struts\.apache\.org/2\.x/docs/portlet\-tutorial\-webwork\-22\.html]

##Portlet Tiles Plugin## {#PAGE_30150178}

Tiles is a templating framework designed to easily allow the creation of web application pages with a consistent look and feel\. It can be used for both page decorating and componentization\.

> 

####Features####

+ Supports Tiles in Portlet environment

####Usage####

The following steps must be taken in order to enable tiles support within your Struts2 Portlet application:

1. Include the struts-portlet-tiles-plugin as a dependency in your web application.  If you are using maven2, the dependency configuration will be similar to:


~~~~~~~

<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-portlet-tiles-plugin</artifactId>
  <version>${struts2.version}</version>
</dependency>

~~~~~~~

2. All package definitions which require tiles support must either extend the struts-portlet-tiles-default package or must register the _Tiles Result_  type definition dedicated for Portlets.


~~~~~~~

<result-types>
  <result-type name="tiles" class="org.apache.struts2.views.tiles.PortletTilesResult"/>
</result-types>

~~~~~~~

3. and dedicated action to support Tiles in portlet environment


~~~~~~~

<action name="tilesDirect" class="org.apache.struts2.portlet.dispatcher.DirectRenderFromEventAction">
    <result type="tiles" name="success">$\{location\}</result>
</action>

~~~~~~~

4. Configure your actions to utilize a tiles definition:


~~~~~~~

<action name="sample" class="org.apache.struts2.tiles.example.SamplePortletAction" >
  <result name="success" type="tiles">tilesWorks</result>
</action>

~~~~~~~

####Installation####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

##REST Plugin## {#PAGE_70699}

This plugin is only available with Struts 2\.1\.1 or later

> 


####Overview####

The REST Plugin

provides high level support for the implementation of RESTful resource based web applications
[Convention Plugin](#PAGE_105613)


If you prefer to see a working code example, instead of reading through an explanation, you can download the [struts2 sample apps](http://struts\.apache\.org/download\.cgi\#struts\-ga)^[http://struts\.apache\.org/download\.cgi\#struts\-ga] and check out the 

~~~~~~~
struts2-rest-showcase
~~~~~~~
 application, a complete WAR file, that demonstrates a simple REST web program\.

#####Features#####

+ Ruby on Rails REST\-style URLs

+ Zero XML config when used with Convention Plugin

+ Built\-in serialization and deserialization support for XML and JSON

+ Automatic error handling

+ Type\-safe configuration of the HTTP response

+ Automatic conditional GET support

#####Mapping REST URLs to Struts 2 Actions#####

The main functionality of the REST plugin lies in the interpretation of incoming request URL's according the RESTful rules\. In the Struts 2 framework, this 'mapping' of request URL's to Actions is handled by in implementation of the [

~~~~~~~
ActionMapper
~~~~~~~
](http://struts\.apache\.org/maven/struts2\-core/apidocs/org/apache/struts2/dispatcher/mapper/ActionMapper\.html)^[http://struts\.apache\.org/maven/struts2\-core/apidocs/org/apache/struts2/dispatcher/mapper/ActionMapper\.html] interface\. Out of the box, Struts 2 uses the [

~~~~~~~
DefaultActionMapper
~~~~~~~
](http://struts\.apache\.org/maven/struts2\-core/apidocs/org/apache/struts2/dispatcher/mapper/DefaultActionMapper\.html)^[http://struts\.apache\.org/maven/struts2\-core/apidocs/org/apache/struts2/dispatcher/mapper/DefaultActionMapper\.html] to map URL's to Actions via the logic you are probably already familiar with\.



| _Actions or Controllers_ ? Most Struts 2 developers are familiar with the Action\. They are the things that get executed by the incoming requests\. In the context of the REST plugin, just to keep you on your toes, we'll adopt the RESTful lingo and refer to our Actions as _Controllers_ \. Don't be confused; it's just a name\!

| 

The REST plugin provides an alternative implementation, [

~~~~~~~
RestActionMapper
~~~~~~~
](http://struts\.apache\.org/maven/struts2\-plugins/struts2\-rest\-plugin/apidocs/org/apache/struts2/rest/RestActionMapper\.html)^[http://struts\.apache\.org/maven/struts2\-plugins/struts2\-rest\-plugin/apidocs/org/apache/struts2/rest/RestActionMapper\.html], that provides the RESTful logic that maps a URL to a give action class ( aka 'controller' in RESTful terms ) and, more specifically, to the invocation of a method on that controller class\. The following section, which comes from the Javadoc for the class, details this logic\.

__RESTful URL Mapping Logic__

This Restful action mapper enforces Ruby\-On\-Rails REST\-style mappings\. If the method is not specified (via '\!' or 'method:' prefix), the method is "guessed" at using REST\-style conventions that examine the URL and the HTTP method\. Special care has been given to ensure this mapper works correctly with the codebehind plugin so that XML configuration is unnecessary\.

This mapper supports the following parameters:

+ 

~~~~~~~
struts.mapper.idParameterName
~~~~~~~
 \- If set, this value will be the name  of the parameter under which the id is stored\. The id will then be removed  from the action name\. Whether or not the method is specified, the mapper will  try to truncate the identifier from the url and store it as a parameter\.

+ 

~~~~~~~
struts.mapper.indexMethodName
~~~~~~~
  \- The method name to call for a GET  request with no id parameter\. Defaults to **index**\.

+ 

~~~~~~~
struts.mapper.getMethodName
~~~~~~~
  \- The method name to call for a GET  request with an id parameter\. Defaults to **show**\.

+ 

~~~~~~~
struts.mapper.postMethodName
~~~~~~~
  \- The method name to call for a POST  request with no id parameter\. Defaults to **create**\.

+ 

~~~~~~~
struts.mapper.putMethodName
~~~~~~~
  \- The method name to call for a PUT  request with an id parameter\. Defaults to **update**\.

+ 

~~~~~~~
struts.mapper.deleteMethodName
~~~~~~~
  \- The method name to call for a DELETE  request with an id parameter\. Defaults to **destroy**\.

+ 

~~~~~~~
struts.mapper.editMethodName
~~~~~~~
  \- The method name to call for a GET  request with an id parameter and the **edit** view specified\. Defaults to **edit**\.

+ 

~~~~~~~
struts.mapper.newMethodName
~~~~~~~
  \- The method name to call for a GET  request with no id parameter and the **new** view specified\. Defaults to **editNew**\.

The following URL's will invoke its methods:

+ 

~~~~~~~
GET: /movies
~~~~~~~
 =\> method=**index**

+ 

~~~~~~~
GET: /movies/Thrillers
~~~~~~~
 =\> method=**show**, id=**Thrillers**

+ 

~~~~~~~
GET: /movies/Thrillers;edit
~~~~~~~
  =\> method=**edit**, id=**Thrillers**

+ 

~~~~~~~
GET: /movies/Thrillers/edit
~~~~~~~
  =\> method=**edit**, id=**Thrillers**

+ 

~~~~~~~
GET: /movies/new
~~~~~~~
  =\> method=**editNew**

+ 

~~~~~~~
POST: /movies
~~~~~~~
  =\> method=**create**

+ 

~~~~~~~
PUT: /movies/Thrillers
~~~~~~~
  =\> method=**update**, id=**Thrillers**

+ 

~~~~~~~
DELETE: /movies/Thrillers
~~~~~~~
  =\> method=**destroy**, id=**Thrillers**


To simulate the HTTP methods PUT and DELETE, since they aren't supported by HTML, the HTTP parameter "\_method" will be used\.

| 

Or, expressed as a table:

|HTTP method|URI|Class\.method|parameters|
|-----------|---|-------------|----------|
|GET|/movie|Movie\.index| |
|POST|/movie|Movie\.create| |
|PUT|/movie/Thrillers|Movie\.update|id="Thrillers"|
|DELETE|/movie/Thrillers|Movie\.destroy|id="Thrillers"|
|GET|/movie/Thrillers|Movie\.show|id="Thrillers"|
|GET|/movie/Thrillers/edit|Movie\.edit|id="Thrillers"|
|GET|/movie/new|Movie\.editNew| |

#####Content Types#####

In addition to providing mapping of RESTful URL's to Controller ( Action ) invocations, the REST plugin also provides the ability to produce multiple representations of the resource data\. By default, the plugin can return the resource in the following content types:

+ HTML

+ XML 

+ JSON

 There is nothing configure here, just add the conent type extension to your RESTful URL\. The framework will take care of the rest\. So, for instance, assuming a Controller called Movies and a movie with the id of superman, the following URL's will all hit the


~~~~~~~
http://my.company.com/myapp/movies/superman
http://my.company.com/myapp/movies/superman.xml
http://my.company.com/myapp/movies/superman.xhtml
http://my.company.com/myapp/movies/superman.json

~~~~~~~



| Note, these content types are supported as incoming data types as well\. And, if you need, you can extend the functionality by writing your own implementations of org\.apache\.struts2\.rest\.handler\.ContentTypeHandler and registering them with the system\.

| 

####Usage####

This section will walk you through a quick demo\. Here are the steps in the sequence that we will follow\.

+ Setting Up your Project

+ Configuring your Project

+  Writing your Controllers

#####Setting Up#####

Assuming you have a normal Struts 2 application, all you need to do for this REST demo is to add the following two plugins:

+ Struts 2 Rest Plugin

+ [Struts 2 Convention Plugin](http://struts\.apache\.org/2\.3\.8/docs/convention\-plugin\.html)^[http://struts\.apache\.org/2\.3\.8/docs/convention\-plugin\.html]

Note, you can download the jars for these plugins from [Maven Central](http://search\.maven\.org/\#search%7Cga%7C1%7Cstruts2\-convention\-plugin)^[http://search\.maven\.org/\#search%7Cga%7C1%7Cstruts2\-convention\-plugin]

__Configuration ( struts\.xml )__

Just dropping the plugin's into your application may not produce exactly the desired effect\. There are a couple of considerations\. The first consideration is whether you want to have any non\-RESTful URL's coexisting with your RESTful URL's\. We'll show two configurations\. The first assumes all you want to do is REST\. The second assumes you want to keep other non\-RESTful URL's alive in the same Struts 2 application\.



| As with all configuration of Struts 2, we prefer using \<constant/\> elements in our struts\.xml\.

| 

__REST Only Configuration__

Instruct Struts to use the REST action mapper:


~~~~~~~
<constant name="struts.mapper.class" value="rest" />

~~~~~~~

At this point, the REST mapper has replaced the DefaultActionMapper so all incoming URL's will be interpreted as RESTful URL's\.

We're relying on the Convention plugin to find our controllers, so we need to configure the convention plugin a bit:


~~~~~~~
<constant name="struts.convention.action.suffix" value="Controller"/>
<constant name="struts.convention.action.mapAllMatches" value="true"/>
<constant name="struts.convention.default.parent.package" value="rest-default"/>
<constant name="struts.convention.package.locators" value="example"/>

~~~~~~~



| Note, you don't have to use the Convention plugin just to use the REST plugin\. The actions of your RESTful application can be defined in XML just as easily as by convention\. The REST mapper doesn't care how the application came to know about your actions when it maps a URL to an invocation of one of it's methods\.

| 

__REST and non\-RESTful URL's Together Configuration__

If you want to keep using some non\-RESTful URL's alongside your REST stuff, then you'll have to provide for a configuration that utilizes to mappers\.



| Plugins contain their own configuration\. If you look in the Rest plugin jar, you'll see the struts\-plugin\.xml and in that you'll see some configuration settings made by the plugin\. Often, the plugin just sets things the way it wants them\. You may frequently need to override those settings in your own struts\.xml\.

| 

First, you'll need to re\-assert the extensions that struts knows about because the rest plugin will have thrown out the default 

~~~~~~~
action
~~~~~~~
 extension\.


~~~~~~~
  <constant name="struts.action.extension" value="xhtml,,xml,json,action"/>

~~~~~~~

Next, we will configure the 

~~~~~~~
PrefixBasedActionMapper
~~~~~~~
, which is part of the core Struts 2 distribution, to have some URL's routed to the Rest mapper and others to the default mapper\.


~~~~~~~
  <constant name="struts.mapper.class" value="org.apache.struts2.dispatcher.mapper.PrefixBasedActionMapper" />
  <constant name="struts.mapper.prefixMapping" value="/rest:rest,:struts"/>

~~~~~~~

And, again, we're relying on the Convention plugin to find our controllers, so we need to configure the convention plugin a bit:


~~~~~~~
<constant name="struts.convention.action.suffix" value="Controller"/>
<constant name="struts.convention.action.mapAllMatches" value="true"/>
<constant name="struts.convention.default.parent.package" value="rest-default"/>
<constant name="struts.convention.package.locators" value="example"/>

~~~~~~~

#####Write Your Controller Actions#####

Once everything is configured, you need to create the controllers\. Controllers are simply actions created with the purpose of handling requests for a give RESTful resource\. As we saw in the mapping logic above, various REST URL's will hit different methods on the controller\. Traditionally, normal Struts 2 actions expose the 

~~~~~~~
execute
~~~~~~~
 method as their target method\. Here's a sample controller for a _orders_  resource\. Note, this sample doesn't implement all of the methods that can be hit via the RESTful action mapper's interpretation of URL's\.


~~~~~~~
package org.apache.struts2.rest.example;

public class OrdersController implements ModelDriven<Order> {

    private OrderManager orderManager;
    private String id;
    private Order model;

    // Handles /orders/{id} GET requests
    public HttpHeaders show() {
        model = orderManager.findOrder(id);
        return new DefaultHttpHeaders("show")
            .withETag(model.getUniqueStamp())
            .lastModified(model.getLastModified());
    }

    // Handles /orders/{id} PUT requests
    public String update() {
        orderManager.updateOrder(model);
        return "update";
    }

    // getters and setters
}

~~~~~~~

In this example, the 

~~~~~~~
ModelDriven
~~~~~~~
 interface is used to ensure that only my model, the Order object in this case, is returned to the client, otherwise, the whole 

~~~~~~~
OrdersController
~~~~~~~
 object would be serialized\.



| Where's ActionSupport? Normally, you extend ActionSupport when writing Struts 2 actions\. In these case, our controller doesn't do that\. Why, you ask? ActionSupport provides a bunch of important functionality to our actions, including support for i18n and validation\. All of this functionality, in the RESTful case, is provided by the default interceptor stack defined in the REST plugin's struts\-plugin\.xml file\. Unless you willfully break your controller's membership in the rest\-default package in which that stack is defined, then you'll get all that functionality you are used to inheriting from ActionSupport\.

| 

You may wonder why the 

~~~~~~~
show()
~~~~~~~
 method returns a 

~~~~~~~
HttpHeaders
~~~~~~~
 object and the 

~~~~~~~
update()
~~~~~~~
 method returns the expected result code String\. The REST Plugin adds support for action methods that return 

~~~~~~~
HttpHeaders
~~~~~~~
 objects as a way for the action to have more control over the response\. In this example, we wanted to ensure the response included the ETag header and a last modified date so that the information will be cached properly by the client\. The 

~~~~~~~
HttpHeaders
~~~~~~~
 object is a convenient way to control the response in a type\-safe way\.

Also, notice we aren't returning the usual "success" result code in either method\. This allows us to use the special features of the [Codebehind Plugin](#PAGE_29637) to intuitively select the result template to process when this resource is accessed with the 

~~~~~~~
.xhtml
~~~~~~~
 extension\. In this case, we can provide a customized XHTML view of the resource by creating 

~~~~~~~
/orders-show.jsp
~~~~~~~
 and 

~~~~~~~
/orders-update.jsp
~~~~~~~
 for the respective methods\.

####Advanced Topics####

The following sections describe some of the non\-standard bells and whistles that you might need to utilize for your application's more non\-standard requirements\.

#####Custom ContentTypeHandlers#####

If you need to handle extensions that aren't supported by the default handlers, you can create your own 

~~~~~~~
ContentTypeHandler
~~~~~~~
 implementation and define it in your 

~~~~~~~
struts.xml
~~~~~~~
:


~~~~~~~
<bean name="yaml" type="org.apache.struts2.rest.handler.ContentTypeHandler" class="com.mycompany.MyYamlContentHandler" />

~~~~~~~

If the built\-in content type handlers don't do what you need, you can override the handling of any extension by providing an alternate handler\. First, define your own 

~~~~~~~
ContentTypeHandler
~~~~~~~
 and declare with its own alias\. For example:


~~~~~~~
<bean name="myXml" type="org.apache.struts2.rest.handler.ContentTypeHandler" class="com.mycompany.MyXmlContentHandler" />

~~~~~~~

Then, tell the REST Plugin to override the handler for the desired extension with yours\. In 

~~~~~~~
struts.properties
~~~~~~~
, it would look like this:


~~~~~~~
struts.rest.handlerOverride.xml=myXml

~~~~~~~

#####Use Jackson framework as JSON ContentTypeHandler#####

The default JSON Content Handler is build on top of the [JSON\-lib](http://json\-lib\.sourceforge\.net/)^[http://json\-lib\.sourceforge\.net/]\. If you prefer to use the [Jackson framework](http://jackson\.codehaus\.org/)^[http://jackson\.codehaus\.org/] for JSON serialisation, you can configure the JacksonLibHandler as Content Handler for your json requests\. 

First you need to add the jackson dependency to your web application by downloading the jar file and put it under WEB\-INF/lib or by adding following xml snippet to your dependencies section in the pom\.xml when you are using maven as build system\.


~~~~~~~
<dependency>
    <groupId>org.codehaus.jackson</groupId>
    <artifactId>jackson-jaxrs</artifactId>
    <version>1.9.13</version>
</dependency>

~~~~~~~

Now you can overwrite the Content Handler with the Jackson Content Handler in the struts\.xml:


~~~~~~~
<bean type="org.apache.struts2.rest.handler.ContentTypeHandler" name="jackson" class="org.apache.struts2.rest.handler.JacksonLibHandler"/>
<constant name="struts.rest.handlerOverride.json" value="jackson"/>

<!-- Set to false if the json content can be returned for any kind of http method -->
<constant name="struts.rest.content.restrictToGET" value="false"/> 

<!-- Set encoding to UTF-8, default is ISO-8859-1 -->
<constant name="struts.i18n.encoding" value="UTF-8"/> 


~~~~~~~

 

#####Settings#####

The following settings can be customized\. See the [developer guide](http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files)^[http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files]\.
 For more configuration options see the [Convention Plugin Documentation](#PAGE_105613)

|Setting|Description|Default|Possible Values|
|-------|-----------|-------|---------------|
|struts\.rest\.handlerOverride\.EXTENSION|The alias for the ContentTypeHandler implementation that handles the EXTENSION value|N/A|Any declared alias for a ContentTypeHandler implementation|
|struts\.rest\.defaultExtension|The default extension to use when none is explicitly specified in the request|xhtml|Any extension|
|struts\.rest\.validationFailureStatusCode|The HTTP status code to return on validation failure|400|Any HTTP status code as an integer|
|struts\.rest\.namespace|Optional parameter to specify namespace for REST services|/|eg\. /rest|
|struts\.rest\.content\.restrictToGET|Optional parameter, if set to true blocks returning content from any other methods than GET, if set to false, the content can be returned for any kind of method|true|eg\. put struts\.rest\.content\.restrictToGET = false in struts\.properties|

####Resources####

+ [http://www\.b\-simple\.de/documents](http://www\.b\-simple\.de/documents) \- Short RESTful Rails tutorial (PDF, multiple languages)

+ [RESTful Web Services](http://www\.amazon\.com/RESTful\-Web\-Services\-Leonard\-Richardson/dp/0596529260)^[http://www\.amazon\.com/RESTful\-Web\-Services\-Leonard\-Richardson/dp/0596529260] \- Highly recommend book from O'Reilly

+ [Go Light with Apache Struts 2 and REST](http://raibledesigns\.com/rd/entry/go\_light\_with\_apache\_struts)^[http://raibledesigns\.com/rd/entry/go\_light\_with\_apache\_struts] \- Presentation by Don Brown at ApacheCon US 2008

####Version History####

From Struts 2\.1\.1\+

##SiteGraph Plugin## {#PAGE_14137}


This plugin got marked as deprecated since Struts 2\.5\.11\!

| 

 

The SiteGraph plugin

generates graphical diagrams representing the flow of your web application


SiteGraph works by parsing your configuration files, Action classes, and view files (JSP, Velocity, and FreeMarker), and displaying a visual map\.

Additional information can be found in the JavaDocs:

~~~~~~~
{snippet:id=javadocs-intro|javadoc=true|url=org.apache.struts2.sitegraph.SiteGraph}
~~~~~~~

__Understanding the Output__

There are several key things to notice when looking at the output from SiteGraph:

+ Boxes: those shaded red indicate an action; those shaded green indicate a view file (JSP, etc)\.

+ Links: arrows colored green imply that no new HTTP request is being made; black arrows indicate a new HTTP request\.

+ Link labels: labels may sometimes contain additional useful information\. For example, a label of **href** means that the link behavior is that of a hyper\-text reference\. The complete label behaviors are provided:

  + **href** \- a view file references an action by name (typically ending with the extension "\.action")

  + **action** \- a view file makes a call to the _action_  tag

  + **form** \- a view file is linked to an action using the _form_  tag

  + **redirect** \- an action is redirecting to another view or action

  + **\! notation** \- a link to an action overrides the method to invoke

__Requirements__

SiteGraph requires that your view files be structured in a very specific way\. Because it has to read these files, only certain styles are supported\. The requirements are:

+ The JSP tags must use the "s" namespace\.

  + In JSP: \<s:xxx/\>

  + In FreeMarker: \<@s\.xxx/\>

  + In Velocity: N/A

+ Use of the _form_  tag and _action_  tag must be linking directly to the action name (and optional namespace)\. This means that \<s:form action="foo"/\> is OK, but \<s:form action="foo\.action"/\> is not\.
 Here is also a short overview of what it does and why a developer would want to use it\.

__Features__

+ Generates a graphical view of your web application

####Usage####

You can use SiteGraph with the following command:


~~~~~~~
java -cp ... -jar struts2-sitegraph-plugin-x.x.x.jar
     -config CONFIG_DIR
     -views VIEWS_DIRS
     -output OUTPUT
     [-ns NAMESPACE]

~~~~~~~

Where:

~~~~~~~
{snippet:id=sitegraph-usage|lang=none|url=struts2/plugins/sitegraph/src/main/resources/org/apache/struts2/sitegraph/sitegraph-usage.txt}
~~~~~~~


You must either supply the correct classpath when invoking the SiteGraph tool or place the Sitegraph plugin in the same directory as the dependent jars\. Specifically, the XWork jar, Struts jar, and their dependencies must be included in the classpath\. Futhermore, **you must also include your Action class files referenced in**struts\.xml\. Without the proper class path entries, SiteGraph will not function properly\.

| 

Once you have run SiteGraph, check the directory specified in the "output" argument (OUTPUT)\. In there you will find two files: **out\.dot** and **out\.gif**\. You may immediately open up **out\.gif** and view the web application flow\. However, you may also wish to either run the **out\.dot** file through a different GraphVis layout engine (neato, twopi, etc), so the original dot file is provided as well\. You may also wish to edit the dot file before rendering the final flow diagram\.

__Automatic Execution__

Some advanced users may wish to execute SiteGraph from within their application \- this could be required if you are developing an application that supports plugin capabilities\. This can easily be done\. See the JavaDocs for more info:

~~~~~~~
{snippet:id=javadocs-api|javadoc=true|url=org.apache.struts2.sitegraph.SiteGraph}
~~~~~~~
The command line version of SiteGraph does exactly this (except for overriding the Writer):

~~~~~~~
{snippet:id=example-api|javadoc=true|lang=java|url=org.apache.struts2.sitegraph.SiteGraph}
~~~~~~~

__Example__


__Settings__

This plugin doesn't allow for any global settings\.

__Installation__

The SiteGraph plugin jar is distributed with Struts, so if you're up and running, you don't need to do download any additional Java packages\. However, SiteGraph does require the "dot" package by [GraphViz](http://www\.graphviz\.org)^[http://www\.graphviz\.org]\.

You'll need to download the latest version of GraphViz and make sure that the dot executable (dot\.exe in Windows) is in your command path\. In Windows the GraphViz installer typically automatically adds 

~~~~~~~
dot.exe
~~~~~~~
 to your path\. However, you may need to do this by hand depending on your system configuration\.

##SiteMesh Plugin## {#PAGE_14142}

**(i) About SiteMesh**


> 

> 

> [SiteMesh](http://www\.sitemesh\.org/)^[http://www\.sitemesh\.org/] is a web\-page layout and decoration framework and web application integration framework to aid in creating large sites consisting of many pages for which a consistent look/feel, navigation and layout scheme is required\.

> 

The Sitemesh plugin 

allows Sitemesh templates to access framework resources


The framework stores all its value stack information as request attributes, meaning that if you wish to display data that is on the stack (or even the ActionContext), you can do so by using the normal tag libraries that come with the framework\. That's it\!

####Features####

+ Can use Struts tags in Sitemesh decorator templates

+ Sitemesh decorators can be written in FreeMarker as well as Velocity and JSP

####Usage####

From 2\.2\+ the new 

~~~~~~~
com.opensymphony.sitemesh.webapp.SiteMeshFilter
~~~~~~~
 filter and Struts 

~~~~~~~
org.apache.struts2.dispatcher.ng.listener.StrutsListener
~~~~~~~
 context listener must be added to 

~~~~~~~
web.xml
~~~~~~~
, like:


~~~~~~~

<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
</filter> 
...
<listener>
    <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
</listener> 

~~~~~~~

####FreeMarker  and Velocity Decorators####

The plugin provides an extension of the SiteMesh _Velocity_  and _FreeMarker_  servlets\. These servlets provide the standard variables and _Struts Tags_  that you used to create views in your favourite template language\.

#####FreeMarker#####

From 2\.2\+ the recommended way to use Freemarker with Sitemesh is through the 

~~~~~~~
org.apache.struts2.sitemesh.FreemarkerDecoratorServlet
~~~~~~~
 servlet, which can be configured like this in 

~~~~~~~
web.xml
~~~~~~~
:


~~~~~~~

<servlet>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.FreemarkerDecoratorServlet</servlet-class>
    <init-param>
 	<param-name>default_encoding</param-name>
 	<param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet> 

<servlet-mapping>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <url-pattern>*.ftl</url-pattern>
</servlet-mapping> 

~~~~~~~

#####Velocity#####

From 2\.2\+ the recommended way to use Velocity with Sitemesh is through the 

~~~~~~~
org.apache.struts2.sitemesh.VelocityDecoratorServlet
~~~~~~~
 servlet, which can be configured like this in 

~~~~~~~
web.xml
~~~~~~~
:


~~~~~~~

<servlet>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.VelocityDecoratorServlet</servlet-class>
    <init-param>
 	<param-name>default_encoding</param-name>
 	<param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet> 

<servlet-mapping>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <url-pattern>*.ftl</url-pattern>
</servlet-mapping> 

~~~~~~~

#####Full integration with SiteMesh 2 \+ Freemarker 2\.4\.2 \+ Velocity 1\.3 , including Struts 2 Tags, ValueStack, and FreemarkerManager statics\.#####

Such configuration is available as from Struts 2\.2\.0, please refer to [WW\-3296](https://issues\.apache\.org/jira/browse/WW\-3296)^[https://issues\.apache\.org/jira/browse/WW\-3296] for me details\.


~~~~~~~

    <filter>
        <filter-name>struts-prepare</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
    </filter>

    <filter>
        <filter-name>sitemesh</filter-name>
        <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
    </filter>

    <filter>
        <filter-name>struts-execute</filter-name>
        <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
    </filter>

    <filter-mapping>
        <filter-name>struts-prepare</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <filter-mapping>
        <filter-name>sitemesh</filter-name>
        <url-pattern>/*</url-pattern>
        <dispatcher>REQUEST</dispatcher>
        <dispatcher>FORWARD</dispatcher>
        <dispatcher>INCLUDE</dispatcher>
    </filter-mapping>

    <filter-mapping>
        <filter-name>struts-execute</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

    <servlet>
        <servlet-name>sitemesh-freemarker</servlet-name>
        <servlet-class>org.apache.struts2.sitemesh.FreemarkerDecoratorServlet</servlet-class>
        <init-param>
            <param-name>default_encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>sitemesh-freemarker</servlet-name>
        <url-pattern>*.ftl</url-pattern>
    </servlet-mapping>

    <servlet>
        <servlet-name>JspSupportServlet</servlet-name>
        <servlet-class>org.apache.struts2.views.JspSupportServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>

    <listener>
        <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
    </listener>

~~~~~~~

####Example####

Here is an example of how to configure the filter chains in 

~~~~~~~
web.xml
~~~~~~~
:


~~~~~~~

<filter>
    <filter-name>struts-prepare</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
</filter>

<filter>
    <filter-name>struts-execute</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
</filter>


<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts-prepare</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>sitemesh</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>struts-execute</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<listener>
    <listener-class>org.apache.struts2.dispatcher.ng.listener.StrutsListener</listener-class>
</listener>

<servlet>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.FreemarkerDecoratorServlet</servlet-class>
    <init-param>
        <param-name>default_encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>

<servlet>
    <servlet-name>sitemesh-velocity</servlet-name>
    <servlet-class>org.apache.struts2.sitemesh.VelocityDecoratorServlet</servlet-class>
    <init-param>
        <param-name>default_encoding</param-name>
        <param-value>UTF-8</param-value>
    </init-param>
    <load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
    <servlet-name>sitemesh-freemarker</servlet-name>
    <url-pattern>*.ftl</url-pattern>
</servlet-mapping>

<servlet-mapping>
    <servlet-name>sitemesh-velocity</servlet-name>
    <url-pattern>*.vm</url-pattern>
</servlet-mapping>

~~~~~~~

Struts 2\.1 web\.xml filter chain example:


~~~~~~~

<filter>
    <filter-name>struts-prepare</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
</filter>

<filter>
    <filter-name>struts-execute</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
</filter>

<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.module.sitemesh.filter.PageFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts-prepare</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>sitemesh</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>struts-execute</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

~~~~~~~

You do not need the struts2\-sitmesh\-plugin if you are using JSP for your decorators\.

Here are the only only changes needed to web\.xml


~~~~~~~

<filter>
    <filter-name>struts2-prepare</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareFilter</filter-class>
</filter>

<filter>
    <filter-name>sitemesh</filter-name>
    <filter-class>com.opensymphony.sitemesh.webapp.SiteMeshFilter</filter-class>
</filter>

<filter>
    <filter-name>struts2-execute</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsExecuteFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts2-prepare</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

<filter-mapping>
    <filter-name>sitemesh</filter-name>
    <url-pattern>/*</url-pattern>
    <dispatcher>REQUEST</dispatcher>
    <dispatcher>FORWARD</dispatcher>
    <dispatcher>INCLUDE</dispatcher>
</filter-mapping>

<filter-mapping>
    <filter-name>struts2-execute</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>

~~~~~~~

####Settings####

This plugin doesn't support any global settings\.

####Installation####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  No other files need to be copied or created\.

##Spring Plugin## {#PAGE_14281}


####Description####

[Spring](http://www\.springframework\.org)^[http://www\.springframework\.org] is a lightweight container, providing centralized, automated configuration and wiring of your application objects, using a technique called "Dependency Injection"

> 

The Spring Plugin works by overriding the Struts _ObjectFactory_  to enhance the creation of core framework objects\. When an object is to be created, it uses the 

~~~~~~~
class
~~~~~~~
 attribute in the Struts configuration to correspond to the 

~~~~~~~
id
~~~~~~~
 attribute in the Spring configuration\. If not found, the class will try to be created as usual, then be autowired by Spring\. In the case of Actions, Spring 2's [bean scope feature](http://www\.springframework\.org/docs/reference/beans\.html\#beans\-factory\-scopes)^[http://www\.springframework\.org/docs/reference/beans\.html\#beans\-factory\-scopes] can be used to scope an Action instance to the session, application, or a custom scope, providing advanced customization above the default per\-request scoping\.



| Remember: **registering Actions with Spring is not required**\. The Spring alternative is there if you need it, but the framework will automatically create Actions objects from the action mappings\. But, if you want to use Spring to inject your Actions, the option is there\.

| 

__Features__

+ Allow Actions, Interceptors, and Results to be created by Spring

+ Struts\-created objects can be autowired by Spring after creation

+ Provides two interceptors that autowire actions, if not using the Spring ObjectFactory

####Usage####

To enable Spring integration, simply include struts2\-spring\-plugin\-x\-x\-x\.jar in your application\.

If you are using more than one object factory, (for example, by including both the Spring and Plexus plugins in your application,) you will need to set the struts\.objectFactory property in _struts\.properties_  or in one of several XML files via _Constant Configuration_ :

**struts\.properties**


~~~~~~~
struts.objectFactory = spring
~~~~~~~

**struts\.xml**


~~~~~~~
<struts>
  <constant name="struts.objectFactory" value="spring" />
  ... 
</struts>

~~~~~~~

__Autowiring__

The framework enables "autowiring" by default\. (Autowiring means to look for objects defined in Spring with the same name as your object property)\. To change the wiring mode, modify the 

~~~~~~~
spring.autowire
~~~~~~~
 property\.

**Wiring Mode**


~~~~~~~
struts.objectFactory.spring.autoWire = type
~~~~~~~

The 

~~~~~~~
autowire
~~~~~~~
 property can be set to several options\.

|name|Auto\-wire by matching the name of the bean in Spring with the name of the property in your action\. **This is the default**|
|----|----------------------------------------------------------------------------------------------------------------------------|
|type|Auto\-wire by looking for a bean registered with Spring of the same type as the property in your action\. This requires you to have only one bean of this type registered with Spring|
|auto|Spring will attempt to auto\-detect the best method for auto\-wiring your action|
|constructor|Spring will auto\-wire the parameters of the bean's constructor|
|no|Turn off externally defined autowiring\. Annotation\-driven injection and injection based on Springs \*Aware\-interfaces still applies|

By default, the framework will at least try to use Spring to create all its objects\. If the object cannot be created by Spring, then the framework will create the object itself\.

Enabling Spring integration for other application objects is a two\-step process\.

+ Configure the Spring listener

**web\.xml**


~~~~~~~
<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>

~~~~~~~

+ Register your objects via the Spring configuration

**applicationContext\.xml**


~~~~~~~
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
<beans default-autowire="autodetect">
    <bean id="personManager" class="com.acme.PersonManager" scope="prototype"/>
    ...
</beans>

~~~~~~~



| Since the Spring integration uses a standard Listener, it can be configured to support configuration files other than applicationContext\.xml\. Adding the following to your web\.xml will cause Spring's ApplicationContext to be inititalized from all files matching the given pattern:

| \<\!\-\- Context Configuration locations for Spring XML files \-\-\>
 \<context\-param\>
     \<param\-name\>contextConfigLocation\</param\-name\>
     \<param\-value\>/WEB\-INF/applicationContext\-\*\.xml,classpath\*:applicationContext\-\*\.xml\</param\-value\>
 \</context\-param\>
 

| See the Spring documentation for a full description of this parameter\.

| 

__Initializing Actions from Spring__

Normally, in 

~~~~~~~
struts.xml
~~~~~~~
 you specify the class for each Action\. When using the default SpringObjectFactory, the framework will ask Spring to create the Action and wire up dependencies as specified by the default auto\-wire behavior\.



| We **strongly** recommend that you find declarative ways of letting Spring know what to provide for your actions\. This includes making your beans able to be autowired by either naming your dependent properties on your action the same as the bean defined in Spring which should be provided (to allow for name\-based autowiring), or using autowire\-by\-type and only having one of the required type registered with Spring\. It also can include using JDK5 annotations to declare transactional and security requirements rather than having to explicitly set up proxies in your Spring configuration\. If you can find ways to let Spring know what it needs to do for your action without needing any explicit configuration in the Spring applicationContext\.xml, then you won't have to maintain this configuration in both places\.

| 

However, sometimes you might want the bean to be completely managed by Spring\. This is useful, for example, if you wish to apply more complex AOP or Spring\-enabled technologies, such as Acegi, to your beans\. To do this, all you have to do is configure the bean in your Spring 

~~~~~~~
applicationContext.xml
~~~~~~~
 and then _change_  the class attribute from your Action in the 

~~~~~~~
struts.xml
~~~~~~~
 to use the bean name defined in Spring instead of the class name\.

Your 

~~~~~~~
struts.xml
~~~~~~~
 file would then have the Action class attributes changed\.

**struts\.xml**


~~~~~~~
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>
    <include file="struts-default.xml"/>

    <package name="default" extends="struts-default">
        <action name="foo" class="com.acme.Foo">
            <result>foo.ftl</result>
        </action>
    </package>

    <package name="secure" namespace="/secure" extends="default">
        <action name="bar" class="bar">
            <result>bar.ftl</result>
        </action>
    </package>
</struts>

~~~~~~~

Where you have a Spring bean defined in your 

~~~~~~~
applicationContext.xml
~~~~~~~
 named "bar"\. Note that the 

~~~~~~~
com.acme.Foo
~~~~~~~
 Action did not need to be changed, because it can be autowired\.

A typical spring configuration for bar could look as following\.

**applicationConext\.xml**


~~~~~~~
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE beans PUBLIC "-//SPRING//DTD BEAN//EN" "http://www.springframework.org/dtd/spring-beans.dtd">
<beans default-autowire="autodetect">
    <bean id="bar" class="com.my.BarClass" singleton="false"/>
    ...
</beans>

~~~~~~~

To use session\-scoped components with Spring and Struts, see the [Spring Session Components Workarounds](#PAGE_4588171) analysis\.

__Class Reloading__

The Spring plugin can be configured to automatically reload classes that change in the file system\. This feature will enable code changes to be "hot deployed" without having to restart the web container\. To enable this feature follow these steps:

1. Set "struts.devMode" to "true"

2. Set "struts.class.reloading.watchList" to a comma separated list of directories, or jar files (absolute or relative paths)

3. Add this to web.xml:


~~~~~~~
   <context-param>
       <param-name>contextClass</param-name>
       <param-value>org.apache.struts2.spring.ClassReloadingXMLWebApplicationContext</param-value>
   </context-param> 

~~~~~~~

4. Add Apache Commons JCI FAM to the classpath. If you are using maven, add this to pom.xml


~~~~~~~
   <dependency>
       <groupId>org.apache.commons</groupId>
       <artifactId>commons-jci-fam</artifactId>
       <version>1.0</version>
   </dependency> 

~~~~~~~

Letting the reloading class loader handle all the classes can lead to ClassCastException(s) because instances of the same classes loaded by different class loaders can not be assigned to each other\. To prevent this problem we suggest that 

~~~~~~~
struts.class.reloading.acceptClasses
~~~~~~~
 is used to limit the classes loaded by the reloading class loader, so only actions are handled by it\. This constant supports a comma separated list of regular expressions:


~~~~~~~
<constant name="struts.class.reloading.acceptClasses" value="com\.myproject\.example\.actions\..*" />

~~~~~~~


> 

> 

> This feature is experimental, and **should never** be used in production systems\.

> 

__Settings__

The following settings can be customized\. See the [developer guide](http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files)^[http://cwiki\.apache\.org/confluence/display/WW/Configuration\+Files]\.

|Setting|Description|Default|Possible Values|
|-------|-----------|-------|---------------|
|struts\.objectFactory\.spring\.autoWire|The autowire strategy|name|name,type,auto, or constructor|
|struts\.objectFactory\.spring\.autoWire\.alwaysRespect|Whether the autowire strategy should always be used, or if the framework should try to guess the best strategy based on the situation|false for backwards\-compatibility|true or false|
|struts\.objectFactory\.spring\.useClassCache|Whether to have Spring use its class cache or not|true|true or false|
|struts\.class\.reloading\.watchList|List of jar files or directories to watch for changes|null|Comma separated list of absolute or relative paths to jars or directories|
|struts\.class\.reloading\.acceptClasses|List of regular expressions of accepted class names|null|Comma separated list of regular expressions of classes that will be loaded by the reloading class loader(we suggest to add regular expressions so only action classes are handled by the reloading class loader)|
|struts\.class\.reloading\.reloadConfig|Reload the runtime configuration (action mappings, results etc) when a change is detected in one of the watched directories|false|true or false|
|DEPRECATED: struts\.objectFactory\.spring\.enableAopSupport|Uses different logic to construct beans to allow support AOP, it uses an old approach to create a bean, switch this flag if you have problems with Spring beans and AOP|false|true or false|

__Installation__

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\. No other files need to be copied or created\.

###Spring Session Components Workarounds### {#PAGE_4588171}

##Struts 1 Plugin## {#PAGE_44227}

The Struts 1 plugin 

allows you to use existing Struts 1 Actions and ActionForms in Struts 2 applications


This plugin provides a generic Struts 2 Action class to wrap an existing Struts 1 Action, 

~~~~~~~
org.apache.struts2.s1.Struts1Action
~~~~~~~
\.  The wrapper class provides the expected calls to the legacy Struts 1 Action and ActionForm, converting incoming and outgoing objects into the expected forms\.  It works by using the _scoped model driven_  technique that uses a single Object as the model for every page, very similar to how the Struts 1 ActionForm works\.  The plugin also provides several interceptors to emulate Struts 1 logic:

+ 

~~~~~~~
org.apache.struts2.s1.ActionFormValidatorInterceptor
~~~~~~~
 \- Integrates the validation of ActionForms into the workflow of Struts 2

+ 

~~~~~~~
org.apache.struts2.s1.ActionFormResetInterceptor
~~~~~~~
 \- Calls the 

~~~~~~~
reset()
~~~~~~~
 method on any discovered ActionForms


The Struts 1 plugin is currently only intended to allow you to run Strust 1 actions inside a Struts 2 application\. It DOES NOT allow you to continue to use the Struts 1 tag libraries in your JSPs\. Your JSPs must be converted to use the Struts 2 tag library\.

| 

| 

| There is a [JIRA ticket](https://issues\.apache\.org/struts/browse/WW\-2157)^[https://issues\.apache\.org/struts/browse/WW\-2157] open for enhancing this plugin to allow a more seamless transition from Struts 1 to Struts 2 by supporting continued use of the Struts 1 tag libraries in JSPs, however, there is not a scheduled time frame for that functionality to be made available\. (Patches are welcomed\!) 

| 

####Features####

+ Can use Struts 1 Actions and ActionForms with no code changes

+ Supports Commons Validator\-enabled ActionForms

####Usage####

To use existing Struts 1 Actions and ActionForms in a Struts 2 application, create a normal Struts 2 configuration package in 

~~~~~~~
struts.xml
~~~~~~~
, but have it extend 

~~~~~~~
struts1-default
~~~~~~~
\.  The 

~~~~~~~
struts1-default
~~~~~~~
 package contains several interceptors and a default interceptor stack that work the plugin into the Struts 2 request process\.

In the most simple case, where you have a Struts 1 Action that you want to use in Struts 2, configure a Struts 2 action using the wrapper:


~~~~~~~

<action name="myAction" class="org.apache.struts2.s1.Struts1Action">
  <param name="className">com.mycompany.myapp.MyAction</param>
  <result>myAction.jsp</result>
</action>

~~~~~~~

Most likely, you will have an ActionForm that your Struts 1 Action expects\.  To use an ActionForm, the setup is a little more complicated because you'll need an interceptor that manages the creation and scope (to support request and session scoping like Struts 1) of the ActionForm\. 


~~~~~~~


<action name="myFormAction" class="org.apache.struts2.s1.Struts1Action">
  <param name="className">com.mycompany.myapp.MyAction</param>

  <interceptor-ref name="scopedModelDriven">
    <param name="className">com.mycompany.myapp.MyForm</param>
    <param name="name">gangsterForm</param>
    <param name="scope">session</param>
  </interceptor-ref>
  <interceptor-ref name="struts1-default"/>

  <result>myAction.jsp</result>
</action>

~~~~~~~

####Example####

This example shows a few Struts 1 Actions, a session\-scoped ActionForm, and validation that uses Commons Validator:


~~~~~~~
{snippet:url=struts2/apps/showcase/src/main/resources/struts-integration.xml|lang=xml}
~~~~~~~

####Settings####

This plugin doesn't support any global settings\.

####Installation####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\.  It will need the Struts 1 jar in order to function correctly\.

##TestNG Plugin## {#PAGE_82452}

The TestNG plugin 

provides integration with the popular [TestNG](http://testng\.org)^[http://testng\.org] unit testing framework


This plugin provides a base 

~~~~~~~
StrutsTestCase
~~~~~~~
 class that can subclassed for tests that work on Struts 2 components\.  


> 

> 

> This plugin is only available with Struts 2\.1\.1 or later

> 

####Features####

+ Base test class that starts up a full Struts 2 instance

+ Great for testing how configuration is loaded and Struts 2 components are used

####Usage####

First, include the plugin your POM (if using Maven 2) under the test scope:


~~~~~~~

<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-testng-plugin</artifactId>
  <version>STRUTS_2_VERSION</version>
  <scope>test</scope>
</dependency>

~~~~~~~

If you are not using Maven 2 to build and test your code, ensure the plugin jar and its dependencies (spring\-mock and testng) are in the testing classpath\.

Now, your unit tests can subclass the 

~~~~~~~
StrutsTestCase
~~~~~~~
 class, which handles starting and stopping the Struts 2 framework:


~~~~~~~

public class MyTest extends StrutsTestCase {
 // testing code
}

~~~~~~~

####Settings####

This plugin doesn't support any global settings\.

####Installation####

This plugin is meant to be used during unit testing, and not during runtime\.  Therefore, include it in your build's classpath, but do not deploy it to 

~~~~~~~
WEB-INF/lib
~~~~~~~
 in your Struts 2 application\.

##Tiles 3 Plugin## {#PAGE_30750969}

This plugin was dropped in Struts 2\.5, instead please use [Tiles Plugin](#PAGE_27401) which was extended and upgraded to Tiles 3\.

> 

> 

> 

> 

> Tiles is a templating framework designed to easily allow the creation of web application pages with a consistent look and feel\. It can be used for both page decorating and componentization\. This is the first release of the plugin\!

> 

The Tiles 3 plugin

allows actions to return Tiles 3 pages


####Features####

+ Supports Tiles in Freemarker, JSP, and Velocity \- more testing is needed

####Usage####

The following steps must be taken in order to enable Tiles 3 support within your Struts2 application:

1. Include the struts-tiles3-plugin as a dependency in your web application, do not include the old struts2-tiles-plugin! If you are using maven3, the dependency configuration will be similar to:


~~~~~~~
<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-tiles3-plugin</artifactId>
  <version>${version.tiles}</version>
  <scope>compile</scope>
</dependency>

~~~~~~~

2. Register the tiles listener.


~~~~~~~
<listener>
    <listener-class>org.apache.tiles.extras.complete.CompleteAutoloadTilesListener</listener-class>
</listener>

~~~~~~~

3. All package definitions which require tiles support must either extend the tiles-default package or must register the _Tiles 3 Result_  type definition.


~~~~~~~
<result-types>
  <result-type name="tiles" class="org.apache.struts2.views.tiles.TilesResult"/>
</result-types>

~~~~~~~

4. Configure your actions to utilize a tiles definition:


~~~~~~~
<action name="sample" class="org.apache.struts2.tiles.example.SampleAction" >
  <result name="success" type="tiles">tilesWorks</result>
</action>

~~~~~~~

####Example####

TBD

####Settings####

This plugin does inherits settings from [Tiles configuration](http://tiles\.apache\.org/config\-reference\.html)^[http://tiles\.apache\.org/config\-reference\.html]\.

####Installation####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\. No other files need to be copied or created\.

##Tiles Plugin## {#PAGE_27401}


Tiles is a templating framework designed to easily allow the creation of web application pages with a consistent look and feel\. It can be used for both page decorating and componentization\.

The Tiles plugin

allows actions to return Tiles pages


####Features####

+ Supports Tiles in Freemarker, JSP, and Velocity

+ Provides annotations to keep tiles\.xml short and put definitons into actions

####Usage####

The following steps must be taken in order to enable tiles support within your Struts2 application:

1. Include the struts-tiles-plugin as a dependency in your web application. If you are using maven2, the dependency configuration will be similar to:


~~~~~~~
<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-tiles-plugin</artifactId>
  <version>${version.tiles}</version>
</dependency>

~~~~~~~

2. Register the tiles listener. This listener will typically either be the standard tiles listener (org.apache.tiles.listener.TilesListener) or the Struts2 replacement (org.apache.struts2.tiles.TilesListener). The latter provides tighter integration with Struts features such as freemarker integration.


~~~~~~~
<listener>
  <listener-class>org.apache.struts2.tiles.StrutsTilesListener</listener-class>
</listener>

~~~~~~~

3. All package definitions which require tiles support must either extend the tiles-default package or must register the _Tiles Result_  type definition.


~~~~~~~
<result-types>
  <result-type name="tiles" class="org.apache.struts2.views.tiles.TilesResult"/>
</result-types>

~~~~~~~

4. Configure your actions to utilize a tiles definition:


~~~~~~~
<action name="sample" class="org.apache.struts2.tiles.example.SampleAction" >
  <result name="success" type="tiles">tilesWorks</result>
</action>

~~~~~~~

5. Instead of xml configuration you can use annotations


~~~~~~~
@Result(name = "success", type="tiles")
@TilesDefinition(extend = "fooLayout", putAttributes = {
    @TilesPutAttribute(name = "header", value = "/WEB-INF/tiles/header.jsp"),
    @TilesPutAttribute(name = "body", value = "/WEB-INF/tiles/body.ftl")
})
public class FooAction extends ActionSupport {
~~~~~~~

6. You have to define Tiles Definitons in a tiles.xml file. That can be placed in 

~~~~~~~
resources
~~~~~~~
 or in 

~~~~~~~
WEB-INF
~~~~~~~
.


~~~~~~~
<!DOCTYPE tiles-definitions PUBLIC
        "-//Apache Software Foundation//DTD Tiles Configuration 3.0//EN"
        "http://tiles.apache.org/dtds/tiles-config_3_0.dtd">

<tiles-definitions>

    <definition name="fooLayout" template="/WEB-INF/tiles/layout.jsp">
        <put-attribute name="title" value="Tiles Sample"/>
        <put-attribute name="header" value=".header"/>
        <put-attribute name="body" value=".bodyp"/>
    </definition>

    <definition name="tilesWorks" extends="fooLayout">
        <put-attribute name="header" value="/WEB-INF/tiles/header.jsp"/>
        <put-attribute name="body" value="/WEB-INF/tiles/body.jsp"/>
    </definition>

</tiles-definitions>
~~~~~~~

 



| As from Struts 2\.3\.28, the plugin automatically loads all Tiles definitions matching the following pattern tiles\*\.xml \- you don't have to specify them via org\.apache\.tiles\.definition\.DefinitionsFactory\.DEFINITIONS\_CONFIG in web\.xml, but you can use this option if your application is going to work in restricted servlet environment e\.g\. Google AppEngine\. In such case, definitions will be read from provided init\-param\.

| 

#####Accessing Struts attributes#####

As from Struts version 2\.5\.3 it's possible accessing defined values on a 

~~~~~~~
ValueStack
~~~~~~~
 using 

~~~~~~~
S2
~~~~~~~
 prefix when defining an expression in tiles definition, e\.g\.:


~~~~~~~
<definition name="home" extends="logged-in">
  <put-attribute name="title" expression="S2:actionProperty"/>
  <put-attribute name="body" value="/WEB-INF/tiles/home.jsp"/>
</definition>
~~~~~~~

In such case Tiles will delegate evaluation of the expression to Struts and 

~~~~~~~
ValueStack
~~~~~~~
 will be examined to evaluate the expression\.

#####I18N#####

Instead of defining new tiles definitions per supported language (i\.e\.: 

~~~~~~~
tiles.xml
~~~~~~~
, 

~~~~~~~
tiles_de.xml
~~~~~~~
, 

~~~~~~~
tiles_pl.xml
~~~~~~~
) you can use 

~~~~~~~
I18N
~~~~~~~
 prefix to evaluate provided expression as a key in Struts resource bundles\. 


~~~~~~~
<definition name="home" extends="logged-in">
  <put-attribute name="title" expression="I18N:home.title"/>
  <put-attribute name="body" value="/WEB-INF/tiles/home.jsp"/>
</definition>
~~~~~~~

####Example####

This example shows a Tiles layout page using Struts tags:

~~~~~~~
{snippet:url=struts2/apps/showcase/src/main/webapp/WEB-INF/tiles/layout.jsp|lang=xml}
~~~~~~~
Please check [tiles](https://github\.com/apache/struts\-examples/tree/master/tiles)^[https://github\.com/apache/struts\-examples/tree/master/tiles] example in [struts\-examples](https://github\.com/apache/struts\-examples/tree/master/tiles)^[https://github\.com/apache/struts\-examples/tree/master/tiles] project\.

####Settings####

This plugin does inherits settings from [Tiles configuration](http://tiles\.apache\.org/config\-reference\.html)^[http://tiles\.apache\.org/config\-reference\.html]\.

####Installation####

This plugin can be installed by copying the plugin jar into your application's 

~~~~~~~
/WEB-INF/lib
~~~~~~~
 directory\. No other files need to be copied or created\.

###Tiles Use### {#PAGE_14187}

Tiles uses a definition file (XML document) that must be instantiated before use\. One way to render the definition file would be to use Spring\. Another way would be to use a separate Listener, as shown by Tilesconfigurer\.

**TilesConfigurer\.java**


~~~~~~~

package com.opensymphony.webwork.views.tiles;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.struts.tiles.DefinitionsFactoryConfig;
import org.apache.struts.tiles.DefinitionsFactoryException;
import org.apache.struts.tiles.TilesUtil;
import org.apache.struts.tiles.xmlDefinition.I18nFactorySet;

/*
* Modified from Spring's source
*
* here's how a smaple web xml should look like:
* <web-app>
*   <context-param>
*     <param-name>tilesDefinitions</param-name>
*     <param-value>/WEB-INF/tiles.xml</param-value>
*   </context-param>
*
*   <listener>
*      <listener-class>com.opensymphony.webwork.views.tiles.TilesConfigurer</listener-class>
*   </listener>
* </web-app>
*
* To use the definitions specified you would use a dispatcher result (since
* tiles jsp is just another jsp) to render tiles view.
*/
public class TilesConfigurer implements ServletContextListener {

    private boolean initialized = false;

    public void contextInitialized (ServletContextEvent evt) {

        if (!initialized) {
            DefinitionsFactoryConfig factoryConfig = new DefinitionsFactoryConfig();
            factoryConfig.setFactoryClassname(I18nFactorySet.class.getName());
            factoryConfig.setParserValidate(true);
            factoryConfig.setDefinitionConfigFiles(evt.getServletContext().getInitParameter("tilesDefinitions"));
            try {
                TilesUtil.createDefinitionsFactory(evt.getServletContext(), factoryConfig);
            } catch (DefinitionsFactoryException e) {
                e.printStackTrace();
            }
            initialized = true;
        }

    }

    public void contextDestroyed (ServletContextEvent evt) {
    }

}

~~~~~~~


> 

> 

> The TilesConfigurer was adapted from the Spring source code\.

> 