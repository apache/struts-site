#Struts 2 Maven Archetypes# {#PAGE_108820}

Struts 2 provides several [Maven](http://maven\.apache\.org/)^[http://maven\.apache\.org/] archetypes that create a starting point for our own applications\.

**Contents**

###Quickstart###

A recommended way to start with Struts2 archetypes is to work with the archetype catalog\.


~~~~~~~

mvn archetype:generate -DarchetypeCatalog=http://struts.apache.org/

~~~~~~~

###Available Archetypes###

####The Blank Convention Archetype (struts2\-archetype\-convention)####

#####Features#####

+ Convention\-based validation

+ Example actions

+ Package\-level resource bundle

+ Unit\-testing

+ Google AppEgine aware



~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myWebApp \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-convention \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org

~~~~~~~

####The Blank Archetype (struts2\-archetype\-blank)####

See the [Struts 2 Blank Archetype](#PAGE_108834) page for more information, including some basic Maven information, how to build and run the app, and basic application information\.


~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myWebApp \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-blank \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org


~~~~~~~

####The Starter Archetype (struts2\-archetype\-starter)####

The Starter archetype creates a more featured application using several common technologies used in production applications\.

#####Features#####

+ Sitemesh integration

+ Action example (instantiated both through Spring and Struts)

+ Spring integration

+ Validation example (action and action\-alias level)

+ Conversion example (global and action level)

+ Resource bundle (both global, action and package level)



~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myWebApp \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-starter \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org

~~~~~~~

####The AngularJS Archetype (struts2\-archetype\-angularjs)####

#####Features#####

+ Convention\-based Action Configuration

+ Example actions with JSON Result

+ Example for AngularJS and Struts2 Integration



~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myWebApp \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-angularjs \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org

~~~~~~~

####The Portlet Blank Archetype (struts2\-archetype\-portlet)####

The Portlet blank archetype creates a minimally populated JSR 168 portlet\.

#####Features#####

+ View, Edit, and Help mode examples

+ Simple form for preferences in Edit mode

+ Can be deployed as a servlet or portlet application

+ Can use Maven Jetty plugin to deploy with the pluto\-embedded profile (usage 'mvn jetty:run \-Ppluto\-embedded', then access [http://localhost:8080/](http://localhost:8080/)\<artifactId\>/pluto/index\.jsp)



~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myWebApp \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-portlet \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org

~~~~~~~

####The Portlet Database Archetype (struts2\-archetype\-dbportlet)####

The Portlet database archetype creates a simple JSR 168 portlet that displays the contents of a database table\.

#####Features#####

+ Uses Spring and Hsql to show a real database query

+ Builtin caching of query results

+ View, Edit, and Help mode examples

+ Simple form for preferences in Edit mode

+ Can be deployed as a servlet or portlet application

+ Can use Maven Jetty plugin to deploy as a servlet webapp



~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myWebApp \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-dbportlet \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org

~~~~~~~

####The Plugin Archetype (struts2\-archetype\-plugin)####

#####Features#####

+ Example new result type

+ Example XML\-based configuration



~~~~~~~

mvn archetype:generate -B -DgroupId=com.mycompany.mysystem \
							-DartifactId=myPlugin \
							-DarchetypeGroupId=org.apache.struts \
							-DarchetypeArtifactId=struts2-archetype-plugin \
							-DarchetypeVersion=<CURRENT_STRUTS_VERSION> \
							-DremoteRepositories=http://struts.apache.org

~~~~~~~

###Creating an Application Using a Maven Archetype###

Run the following command from your new project's parent directory\. The project will be created in a sub\-directory named after the 

~~~~~~~
artifactId
~~~~~~~
 parameter\.

The first two parameters, 

~~~~~~~
groupId
~~~~~~~
 and 

~~~~~~~
artifactId
~~~~~~~
, should be set according to your needs:

+ 

~~~~~~~
groupId
~~~~~~~


  This should be the root package of your application, e\.g\., com\.mycompany\.myapp\. 

+ 

~~~~~~~
artifactId
~~~~~~~


  Names the project directory that will be created in the current directory\.



~~~~~~~

mvn archetype:generate -B \
                       -DgroupId=tutorial \
                       -DartifactId=tutorial \
                       -DarchetypeGroupId=org.apache.struts \
                       -DarchetypeArtifactId=struts2-archetype-blank \
                       -DarchetypeVersion=<CURRENT_STRUTS_VERSION>
		       -DremoteRepositories=http://struts.apache.org

~~~~~~~

where \<CURRENT\_STRUTS\_VERSION\> is archetype's version you want to use, eg\. 2\.3\.15\.1

####Staging repository####

If the above command will fail because of missing archetypes in central repository, you can try to use staging repository like below


~~~~~~~

mvn archetype:generate -DarchetypeCatalog=https://repository.apache.org/content/repositories/snapshots/

~~~~~~~

or this


~~~~~~~

mvn archetype:generate -DarchetypeCatalog=http://struts.apache.org/

~~~~~~~

####Archetype Parameters####

The 

~~~~~~~
-B
~~~~~~~
 option runs 

~~~~~~~
archetype:generate
~~~~~~~
 in batch mode; it avoids a prompt to confirm our settings\.

| Parameter | Description |
|-----------|-------------|
|groupId| The id for the group the application belongs to\.  Usually is the root package for applications in your company, e\.g\. com\.mycompany |
|artifactId| The id for the project\. The project will be created a sub\-directory named after this parameter\. |
|archetypeGroupId| The group id of the archetype\.  Will always be org\.apache\.struts for Struts archetypes |
|archetypeArtifactId| The id of the archetype |
|archetypeVersion| The version of the archetype |
|package| (Optional) The base Java package to use for generated source code\.  Defaults to archetypeGroupId if not specified\. |
|remoteRepositories| (Optional) A list of remote repositories that contain the archetype\. |

###Command Quick Reference###

These commands are used from the directory created by the archetype plugin (the project's sub\-directory that was created in the previous step)\.

+ To build



~~~~~~~

   mvn install

~~~~~~~

+ To create IntelliJ IDEA project files



~~~~~~~

   mvn idea:idea

~~~~~~~

+ To create Eclipse project files



~~~~~~~

   mvn eclipse:eclipse -Dwtpversion=1.5

~~~~~~~

+ To run test cases



~~~~~~~

   mvn test

~~~~~~~

+ To clean up (removes generated artifacts)



~~~~~~~

   mvn clean

~~~~~~~

+ To package (creates a WAR file)



~~~~~~~

   mvn package

~~~~~~~

+ To grab necessary JAR files etc\.



~~~~~~~

   mvn initialize

~~~~~~~

+ To run it with Jetty



~~~~~~~

   mvn jetty:run

~~~~~~~

##Struts 2 Blank Archetype## {#PAGE_108834}


The Struts 2 Blank Archetype ("blank\-archetype") provides a minimal, but complete, Struts 2 application\. It demonstrates some of the most basic Struts 2 concepts\.

__Features__

+ XML\-based configuration, demonstrates including additional config file

+ Example actions

+ Package\-level resource bundle

+ XML\-based validation

+ Unit\-testing


**Contents**

####Creating Our blank\-archetype Project####

We'll run the following command from our project's parent directory (this is shown using Unix\-style commands)\.


~~~~~~~

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

~~~~~~~

Depending on the state of your local system you may see Maven downloading various libraries (known as "downloading the internet", which is what it seems Maven does sometimes)\. Be patient\-\-Maven is basically setting up your required libraries automatically\.
**\<version\>** \- is the version of Struts 2 you want to use and archetype was released for, eg\. 2\.1\.8\.1 \.

#####Staging repository#####

If the above command will fail because of missing archetypes in central repository, you can try to use staging repository like below


~~~~~~~

mvn archetype:generate -B \
                       -DgroupId=tutorial \
                       -DartifactId=tutorial \
                       -DarchetypeGroupId=org.apache.struts \
                       -DarchetypeArtifactId=struts2-archetype-blank \
                       -DarchetypeVersion=<version>
                       -DarchetypeCatalog=http://people.apache.org/builds/struts/<version>/m2-staging-repository/ 

~~~~~~~

####Project Structure####

The source code structure follows the normal [Maven directory structure](http://maven\.apache\.org/guides/introduction/introduction\-to\-the\-standard\-directory\-layout\.html)^[http://maven\.apache\.org/guides/introduction/introduction\-to\-the\-standard\-directory\-layout\.html]\. The blank\-archetype does not include all of the directories listed in the Maven structure reference page\.

Our project's structure looks like this:

| Directory | Description|
|-----------|------------|
|src| All project source|
|¦\- main| Primary source directory|
|¦  ¦\- java| Java source code|
|¦  ¦  \`\- tutorial| Package defined by groupId parameter|
|¦  ¦     \`\- example| The example actions from the archetype|
|¦  ¦\- resources| Resources (config, property, and validation files, and so on|
|¦  ¦  \`\-tutorial| Package defined by groupId parameter|
|¦  ¦     \`\- example| Example property and validation files from archetype|
|¦  \`\- webapp| Web application files (HTML, JSP, etc\.)|
|¦      \`\- WEB\-INF| Typical WEB\-INF folder|
|¦         \`\- example| Files from archetype|
|\`\- test| Test code (unit tests etc\.)|
|   \`\- java| Java\-based test code|
|      \`\- tutorial| Package defined by groupId parameter|
|         \`\- example| Test code from archetype|

#####Structure Difference From Non\-Maven Projects#####

One big change for folks not used to the Maven structure is the separation of Java source code and resource files\. For example, in a non\-Maven project our directory structure might look like this:

|src| All project source|
|---|-------------------|
|¦\- tutorial| Tutorial package|
|¦  \`\- example| Example package|
|¦     ¦\- Login\.java| Login action source|
|¦     ¦\- package\.properties| Resource file|
|¦     \`\- Login\-validation\.xml| Validation file|
|\`\- struts\.xml| Struts 2 config file|
|web| Web app files|
|¦\- WEB\-INF| Typical WEB\-INF folder|
|\`\- index\.html| An HTML file|

It can take a little while to get used to, but ultimately it provides good separation of "types" of things, and becomes second\-nature pretty quickly\. Note that it's possible to use a non\-Maven directory layout with Maven projects, but this can be challenging at some points\.

####Building The Project####

There are several different ways we can go about building our project, from simple compilation up to actually running the web application\-\-all from within Maven\.

#####Compilation#####



~~~~~~~
$ mvn compile
~~~~~~~

will create a 

~~~~~~~
target
~~~~~~~
 directory containing the compiled classes\. By itself this isn't terribly useful\.

#####Testing#####

Running


~~~~~~~
$ mvn test
~~~~~~~

will compile the application and run the included unit tests\. Blank\-archetype's unit tests are _not_  extensive, but provide a simple starting point for writing more complex, application\-specific tests\.

One we've run the Maven test command we'll notice there's a 

~~~~~~~
target/surefire-reports
~~~~~~~
 directory\. The [Maven Surefire Plugin](http://maven\.apache\.org/plugins/maven\-surefire\-plugin/)^[http://maven\.apache\.org/plugins/maven\-surefire\-plugin/] is how Maven runs our unit tests\. By default it will create test results in XML and text formats in the 

~~~~~~~
target/surefire-reports
~~~~~~~
 directory\. These files can be examined to get further information regarding the failed tests\.

#####Assembling (Creating a WAR)#####

#####Running#####

We can run blank\-archetype using the [Jetty](http://www\.mortbay\.org/jetty/)^[http://www\.mortbay\.org/jetty/] server via the [Maven Jetty Plugin](http://docs\.codehaus\.org/display/JETTY/Maven\+Jetty\+Plugin)^[http://docs\.codehaus\.org/display/JETTY/Maven\+Jetty\+Plugin] by executing the Jetty plugin's 

~~~~~~~
run
~~~~~~~
 command:


~~~~~~~
$ mvn jetty:run
~~~~~~~

Once we've run the application we can see that it works by visiting 

~~~~~~~
localhost:8080/tutorial/example/Welcome.action
~~~~~~~
 as a sanity check\.

####Application Documentation####

The application consists of a few test actions demonstrating simple validation and package\-level property (resource) files\. The most interesting URLs are as follows (assuming we used 

~~~~~~~
groupId=tutorial
~~~~~~~
):

| URL | Description|
|-----|------------|
|/tutorial/example/Welcome\.action| Handled by wildcard mapping|
|/tutorial/example/HelloWorld\.action| Handled by explicit mapping, demonstrates package\-level properties|
|/tutorial/example/Login\.action| Handled by explicit mapping with method wilcard (see the Login\.action documentation for information regarding how to access this URL)|

#####Application Configuration#####

The default Struts 2 configuration file is contained in 

~~~~~~~
src/main/resources/struts.xml
~~~~~~~
\. It includes an additional configuration file, 

~~~~~~~
src/main/resources/example.xml
~~~~~~~
\. The application's mappings are contained in the 

~~~~~~~
example.xml
~~~~~~~
 file\. The 

~~~~~~~
struts.xml
~~~~~~~
 file sets some constants\.

See the _struts\.xml_  page for more information about the 

~~~~~~~
struts.xml
~~~~~~~
 file\. For more information regarding what's contained in typical 

~~~~~~~
struts.xml
~~~~~~~
 files start at the _Configuration Elements_  page, which contains links to a bunch of information\. See the _Configuration Files_  page for more information regarding additional Struts 2 configuration files, including links to the files that set all the Struts 2 default configurations\.

#####Welcome\.action#####

The mapping for this action is handled by a "catch\-all" mapping in 

~~~~~~~
example.xml
~~~~~~~
:


~~~~~~~

<action name="*" class="tutorial2.example.ExampleSupport">
  <result>/example/{1}.jsp</result>
</action>

~~~~~~~

This mapping is the last mapping contained in 

~~~~~~~
example.xml
~~~~~~~
\-\-anything not handled by mappings appearing before it in 

~~~~~~~
example.xml
~~~~~~~
 will be caught by this mapping\. This mapping will look for JSP files in 

~~~~~~~
src/main/webapp/example/*.jsp
~~~~~~~
\. Since there's a 

~~~~~~~
Welcome.jsp
~~~~~~~
 in that directory, we're all set\. See the _Wildcard Mappings_  page for more information on how Struts 2 can use wildcard mappings\.

#####HelloWorld\.action#####

The mapping executes the HelloWorld action, contained in 

~~~~~~~
src/main/java/tutorial/example/HelloWorld.action
~~~~~~~
\. This action retrieves a message from a package\-level properties file, contained in 

~~~~~~~
src/main/resources/tutorial/package.properties
~~~~~~~
\. See the _Localization_  page for more information about how Struts 2 handles message resources (it's pretty cool)\.

#####Login\.action#####

This is another wildcard mapping:


~~~~~~~

<action name="Login_*" method="{1}" class="tutorial2.example.Login">
  <result name="input">/example/Login.jsp</result>
  <result type="redirectAction">Menu</result>
</action>

~~~~~~~

In the application the Login action is reached via a link, but not directly to 

~~~~~~~
/tutorial/example/Login.action
~~~~~~~
\. The link is actually 

~~~~~~~
/tutorial/example/Login_input.action
~~~~~~~
\. Reaching the Login action this way bypasses validation: if we hit the Login action directly we'll get a validation error\.

The validation configuration is contained in 

~~~~~~~
/src/main/resources/tutorial/example/Login-validation.xml
~~~~~~~
\. It checks for the presence of the 

~~~~~~~
username
~~~~~~~
 and 

~~~~~~~
password
~~~~~~~
 properties (form values)\. It uses messages stored in the 

~~~~~~~
package.properties
~~~~~~~
 file (in the same directory)\. See the _Validation_  page for more information regarding Struts 2 validation\.
