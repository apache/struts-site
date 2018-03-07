---
layout: maven-archetypes
title: Struts 2 Blank Archetype
---

# Struts 2 Blank Archetype


The Struts 2 Blank Archetype ("blank-archetype") provides a minimal, but complete, Struts 2 application. It demonstrates some of the most basic Struts 2 concepts.

__Features__

+ XML-based configuration, demonstrates including additional config file

+ Example actions

+ Package-level resource bundle

+ XML-based validation

+ Unit-testing


**Contents**
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Creating Our blank-archetype Project

We'll run the following command from our project's parent directory (this is shown using Unix-style commands).


```
$ mvn archetype:generate -B \
                         -DgroupId=tutorial \
                         -DartifactId=tutorial \
                         -DarchetypeGroupId=org.apache.struts \
                         -DarchetypeArtifactId=struts2-archetype-blank \
                         -DarchetypeVersion=<version>
$ ls
tutorial/
$ cd tutorial
$ ls
pom.xml         src/
```

Depending on the state of your local system you may see Maven downloading various libraries (known as "downloading the internet", which is what it seems Maven does sometimes). Be patient -- Maven is basically setting up your required libraries automatically.

### Staging repository

If the above command will fail because of missing archetypes in central repository, you can try to use staging repository.

Add staging repository to your settings.xml

```
<settings>
  <profiles>
    <profile>
      <id>staging</id>
      <repositories>
        <repository>
          <id>archetype</id>
          <url>https://repository.apache.org/content/repositories/snapshots/</url>
          <releases>
            <enabled>true</enabled>
            <checksumPolicy>fail</checksumPolicy>
          </releases>
          <snapshots>
            <enabled>true</enabled>
            <checksumPolicy>warn</checksumPolicy>
          </snapshots>
        </repository>
      </repositories>
    </profile>
  </profiles>
</settings>
```

Use `staging` profile in the command.

```
mvn archetype:generate -B \
                       -DgroupId=tutorial \
                       -DartifactId=tutorial \
                       -DarchetypeGroupId=org.apache.struts \
                       -DarchetypeArtifactId=struts2-archetype-blank \
                       -DarchetypeVersion=<version> \
                       -Pstaging
```


## Project Structure

The source code structure follows the normal [Maven directory structure](http://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html). The blank-archetype does not include all of the directories listed in the Maven structure reference page.

Our project's structure looks like this:

| Directory | Description|
|-----------|------------|
|src| All project source|
|src/main| Primary source directory|
|src/main/java| Java source code|
|src/main/java/tutorial| Package defined by groupId parameter|
|src/main/java/tutorial/example| The example actions from the archetype|
|src/main/resources| Resources (config, property, and validation files, and so on|
|src/main/resources/tutorial| Package defined by groupId parameter|
|src/main/resources/tutorial/example| Example property and validation files from archetype|
|src/main/webapp| Web application files (HTML, JSP, etc.)|
|src/main/webapp/WEB-INF| Typical WEB-INF folder|
|src/main/webapp/WEB-INF/example| Files from archetype|
|src/test| Test code (unit tests etc.)|
|src/test/java| Java-based test code|
|src/test/java/tutorial| Package defined by groupId parameter|
|src/test/java/tutorial/example| Test code from archetype|

### Structure Difference From Non-Maven Projects

One big change for folks not used to the Maven structure is the separation of Java source code and resource files. For example, in a non-Maven project our directory structure might look like this:

| Directory | Description|
|-----------|------------|
|src| All project source|
|src/tutorial| Tutorial package|
|src/tutorial/example| Example package|
|src/tutorial/example/Login.java| Login action source|
|src/tutorial/example/package.properties| Resource file|
|src/tutorial/example/Login-validation.xml| Validation file|
|src/struts.xml| Struts 2 config file|
|web| Web app files|
|web/WEB-INF| Typical WEB-INF folder|
|web/index.html| An HTML file|

It can take a little while to get used to, but ultimately it provides good separation of "types" of things, and becomes second-nature pretty quickly. Note that it's possible to use a non-Maven directory layout with Maven projects, but this can be challenging at some points.

## Building The Project

There are several different ways we can go about building our project, from simple compilation up to actually running the web application -- all from within Maven.

### Compilation

Running

```
$ mvn compile
```

will create a `target` directory containing the compiled classes. By itself this isn't terribly useful.

### Testing

Running


```
$ mvn test
```

will compile the application and run the included unit tests. Blank-archetype's unit tests are _not_  extensive, but provide a simple starting point for writing more complex, application-specific tests.

Once we've run the Maven test command we'll notice there's a  `target/surefire-reports` directory. The [Maven Surefire Plugin](http://maven.apache.org/plugins/maven-surefire-plugin/) is how Maven runs our unit tests. By default it will create test results in XML and text formats in the  `target/surefire-reports` directory. These files can be examined to get further information regarding the failed tests.

### Assembling (Creating a WAR)

Running

```
$ mvn package
```

will create a WAR file in the `target` directory.

### Running

We can run blank-archetype using the [Jetty](https://www.eclipse.org/jetty/) server via the [Maven Jetty Plugin](https://www.eclipse.org/jetty/documentation/current/jetty-maven-plugin.html) by executing the Jetty plugin's  `run` command:


```
$ mvn jetty:run
```

Once we've run the application we can see that it works by visiting  `localhost:8080/tutorial/example/Welcome.action` as a sanity check.

## Application Documentation

The application consists of a few test actions demonstrating simple validation and package-level property (resource) files. The most interesting URLs are as follows (assuming we used  `groupId=tutorial`):

| URL | Description|
|-----|------------|
|/tutorial/example/Welcome.action| Handled by wildcard mapping|
|/tutorial/example/HelloWorld.action| Handled by explicit mapping, demonstrates package-level properties|
|/tutorial/example/Login.action| Handled by explicit mapping with method wilcard (see the Login.action documentation for information regarding how to access this URL)|

### Application Configuration

The default Struts 2 configuration file is contained in  `src/main/resources/struts.xml`. It includes an additional configuration file,  `src/main/resources/example.xml`. The application's mappings are contained in the  `example.xml` file. The  `struts.xml` file sets some constants.

See the [struts.xml page](/core-developers/struts-xml.html) for more information about the  `struts.xml` file. For more information regarding what's contained in typical  `struts.xml` files start at the [Configuration Elements page](/core-developers/configuration-elements.html), which contains links to a bunch of information. See the [Configuration Files](/core-developers/configuration-files.html) page for more information regarding additional Struts 2 configuration files, including links to the files that set all the Struts 2 default configurations.

### Welcome.action

The mapping for this action is handled by a "catch-all" mapping in  `example.xml`:


```xml
<action name="*" class="tutorial2.example.ExampleSupport">
  <result>/example/{1}.jsp</result>
</action>
```

This mapping is the last mapping contained in  `example.xml` -- anything not handled by mappings appearing before it in  `example.xml` will be caught by this mapping. This mapping will look for JSP files in  `src/main/webapp/example/*.jsp`. Since there's a  `Welcome.jsp` in that directory, we're all set. See the [Wildcard Mappings page](/core-developers/wildcard-mappings.html) for more information on how Struts 2 can use wildcard mappings.

### HelloWorld.action

The mapping executes the HelloWorld action, contained in  `src/main/java/tutorial/example/HelloWorld.action`. This action retrieves a message from a package-level properties file, contained in  `src/main/resources/tutorial/package.properties`. See the [Localization page](/core-developers/localization.html) for more information about how Struts 2 handles message resources (it's pretty cool).

### Login.action

This is another wildcard mapping:


```xml
<action name="Login_*" method="{1}" class="tutorial2.example.Login">
  <result name="input">/example/Login.jsp</result>
  <result type="redirectAction">Menu</result>
</action>
```

In the application the Login action is reached via a link, but not directly to  `/tutorial/example/Login.action`. The link is actually  `/tutorial/example/Login_input.action`. Reaching the Login action this way bypasses validation: if we hit the Login action directly we'll get a validation error.

The validation configuration is contained in `/src/main/resources/tutorial/example/Login-validation.xml`. It checks for the presence of the  `username` and  `password` properties (form values). It uses messages stored in the  `package.properties` file (in the same directory). See the [Validation page](/core-developers/validation.html) for more information regarding Struts 2 validation.
