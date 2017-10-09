---
layout: getting-started
title: Spring
---
# Spring and Struts 2

The example code for this tutorial, spring_struts, is available for checkout at [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples)

__Introduction__

In the execute method of many Struts 2 ActionSupport classes are statements that create objects and then have those objects execute methods that perform needed tasks. Whenever one class creates an object of another class that introduces a dependency between the two classes. The Spring framework makes it easier for the application developer to manage these dependencies and helps make the application more flexible and maintainable. This tutorial will show you how to use Struts 2 and Spring together to manage the dependencies between your ActionSupport classes and other classes in your application.

> This tutorial assumes you understand how to use the Spring framework to manage dependencies between classes. You can learn more about Spring by reading the documentation at [http://www.springsource.org/documentation](http://www.springsource.org/documentation)

The [Struts 2 user mailing list](http://struts.apache.org/mail.html) is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

| 

If you examine the example application for the [Struts 2 Themes](#PAGE_23337450) tutorial you'll see this code in the EditAction ActionSupport class

**EditAction Class Hard-Coded Dependency**

```java
private EditService editService = new EditServiceInMemory();
```

The above statement hard-codes a dependency between the `EditAction` class and the `EditServiceInMemory` class. This is poor design for two reasons.

1. If I need to replace the `EditServiceInMemory` with another class that implements the `EditService` interface I'll have to hunt down and replace all statements where I hard-coded the dependency.

2. I cannot test `EditAction` without using the `EditServiceInMemory` class. I cannot isolate `EditAction` by using a stub implementation of `EditService` when writing my test case because the use of `EditServiceInMemory` is hard-coded.

Spring provides a mechanism to manage dependencies by injecting them at run time. Struts 2 ActionSupport classes—like any other Java class—can be injected with a dependent object by the Spring framework. So instead of having the above code, I would have this statement in `EditAction`.

**EditAction Class No Hard-Coded Dependency**

```java
private EditService editService;
```

At run time the Spring framework will provide an object of a class that implements the EditService interface.

__Struts 2 Spring Plugin__

Struts 2 provides a plugin that enables Spring to inject into the ActionSupport classes any dependent objects you've specified in the Spring configuration file. Consult [Spring Plugin documentation](//struts.apache.org/docs/spring-plugin.html) for more information about how the plugin works.

For a Maven application you'll need to add a dependency to the struts2-spring-plugin jar (see the Maven example application for this tutorial). The plugin's pom.xml includes transitive dependencies to the Spring jar files.


| The current version (`2.5.10.1`) of the Struts 2 Spring plugin has transitive dependencies to the Spring `4.1.6.RELEASE` version. If you want to use the latest version of Spring, then you should exclude the transitive dependencies in your pom.xml for the Struts 2 Spring plugin and then declare dependency nodes to the current version of the Spring jar files. If you are using Ant and explicitly including the jar files in your application, then just include the latest version of the Spring jar files.

In your `ActionSupport` class you must have a set method for the dependent object that follows standard Java bean naming conventions. If you examine the `EditAction` class for this tutorial's application you'll see this set method.

```java
public void setEditService(EditService editService) {
    this.editService = editService;
}
```

Spring will use that set method to provide an object of type `EditService` to the `EditAction` class at run time.

To make our application "Spring aware" we need to add this line to web.xml.

**Spring Listener In web.xml**

```xml
<listener>
    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
</listener>
```

The above code will activate the Spring framework when the application is started up by the Servlet container. By default Spring will look for a configuration file name applicationContext.xml in WEB-INF (consult the Spring documentation for how you can change where Spring looks and what the configuration file name is).

__Spring Configuration File__

In the Spring configuration file we create a bean node for those objects we want Spring to create an instance of and inject into our ActionSupport class. In the example application is this applicationContext.xml.

**Spring Configuration File**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
            http://www.springframework.org/schema/beans
            http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="editService" class="org.apache.struts.edit.service.EditServiceInMemory" />

</beans>
```

Note the id value above. By default the Spring plugin works with Spring to autowire the dependencies of the ActionClass by "name." Spring will create an object of class EditServiceMemory and provide that object to any ActionSupport class that has a setEditService method with an argument of type EditService. Consult the [Spring Plugin](//struts.apache.org/docs/spring-plugin.html) documentation for how to change the default autowire method.

The editService bean created by Spring will have a scope of singleton since that is the default scope. Consult section 3.5 of the [Spring documentation](http://www.springsource.org/documentation) for how to configure the bean definition to use a different scope (e.g. request or session).

__Alternative - Have Spring Manage Creation Of ActionSupport Class__

Using the above methodology, the Struts 2 framework will still manage the creation of the `ActionSupport` class. If you prefer you can configure the application so that Spring will create the ActionSupport class also. To support this technique you need to add a bean node to the Spring configuration file for the ActionSupport class.

**Spring Configuration For ActionSupport Class Managed By Spring**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
            http://www.springframework.org/schema/beans
            http://www.springframework.org/schema/beans/spring-beans.xsd">
            
    <bean id="editService" class="org.apache.struts.edit.service.EditServiceInMemory" />

    <bean id="editAction" class="org.apache.struts.edit.action.EditAction" scope="prototype">
        <property name="editService" ref="editService" />
    </bean>

</beans>
```

Note in the above that there is an `editAction` bean and its `editService` property is set to the `editService` bean. Since we are having Spring manage the `EditAction` class we must specify any properties of `EditAction` that we want Spring to inject. Please remember that actions must be created on each request, they cannot be `singletons`- this is the default `scope` that's why it must be changed to `prototype`.

In the `struts.xml` configuration file you must specify the Spring id value for the class attribute of the action node. This tells Struts to get a bean with that id value from Spring for the Action class.

**Struts Configuration For Spring Managed ActionSupport Class**

```xml
<action name="edit" class="editAction" method="input">
    <result name="input">/edit.jsp</result>
</action>
```

__Summary__

In this tutorial we reviewed how to use the Struts 2 Spring plugin to integrate Spring and Struts. By using the Struts 2 Spring plugin you can have Spring manage the dependencies of your ActionSupport classes. Of course you can also take advantage of the many other benefits (AOP, Spring JDBC) that the Spring framework provides.

|Return to [Themes](themes.html)|or|onward to [Annotations](annotations.html)|
