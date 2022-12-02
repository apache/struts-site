---
layout: default
title: Announcements 2022
---

# Announcements 2022
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

<p class="pull-right">
  Skip to: <a href="announce-2021">Announcements - 2021</a>
</p>

#### 28 November 2022 - Apache Struts version 6.1.1 General Availability {#a20221128}

The Apache Struts group is pleased to announce that Apache Struts version 6.1.1 is available as a "General Availability"
release. The GA designation is our highest quality grade.

The Apache Struts is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

**Bug**

- WW-3529 - NamedVariablePatternMatcher does not properly escape characters
- WW-3737 - Parsing of excludePattern breaks regex
- WW-4514 - DefaultUrlHelper.buildParametersString appends just ? if collection is empty
- WW-5145 - Checkbox with multiple values do not default correctly
- WW-5214 - When value for SELECT element is greater than 2147483647, the value does not pre-select
- WW-5238 - Strict Method Invocation (SMI) too strict or wrong ActionMapping?
- WW-5239 - regression btw struts 2.5.30 and 6.0.30 / submit s:checkbox unchecked -> NPE
- WW-5241 - <s:url includeParams="all"> is generating an invalid url when used in conjunction with ExecuteAndWait interceptor
- WW-5247 - Related to: [WW-5117] - %{id} evaluates different for data-* and value attribute
- WW-5248 - action attribute on submit tag not working as espected
- WW-5255 - <s:script> and <s:link> tags are broken

**New Feature**

- WW-4173 - Add option to disable a given interceptor

**Improvement**

- WW-2815 - No way to configure XStream engine
- WW-3691 - BackgroundProcess should use a java.util.concurrent.Executor alternatively to spawning a new thread
- WW-3715 - Allow for dynamic validation xml files, by building validator cache based on action AND context
- WW-3725 - Remove unused tag templates from core/src/main/resources/template/archive
- WW-4440 - Add basic README.md to all subprojects
- WW-4567 - Drop unused dependencies or put a proper scope
- WW-4692 - Extract encoding logic from UrlHelper into a dedicated bean
- WW-5133 - Remove deprecated labelposition
- WW-5137 - Remove class attribute
- WW-5184 - Add optional parameter value check to ParametersInterceptor
- WW-5219 - Move TestNGXWorkTestCase from the Core into the TestNG plugin
- WW-5220 - Move XWorkJUnit4TestCase from the Core into the JUnit plugin
- WW-5232 - Use Github Actions instead of Travis to build PRs
- WW-5234 - Normalise DTD definitions
- WW-5235 - Reduce "OGNL Expression Max Length enabled with 256" log entry to trace
- WW-5240 - doubleOnchange attribute of the doubleselect tag is not supported
- WW-5242 - Make "struts.mapper.action.prefix.crossNamespaces" deprecated
- WW-5252 - Completely disable external entities declarations in XML config
- WW-5254 - Document how to use the Async plugin
- WW-5257 - <s:checkbox> output is followed by a newline in simple theme (diff to Struts 2)
- WW-5259 - Extract UrlHelper#parseQueryString into a dedicated plugin
- WW-5260 - Checkbox tag default value for attribute submitUnchecked

**Dependency**

- WW-5213 - Bump javax.el from 3.0.1-b11 to 3.0.1-b12
- WW-5226 - Upgrade weld-core to version 2.4.8.Final
- WW-5227 - Upgrade Apache Log4j to version 2.19.0
- WW-5228 - Upgrade dependency-check-maven from 7.1.2 to 7.2.0
- WW-5229 - Upgrade Spring to version 5.3.23
- WW-5230 - Upgrade OGNL to version 3.3.4
- WW-5231 - Upgrade apache-rat-plugin to version 0.15
- WW-5244 - Upgrade commons-text to ver. 1.10.0
- WW-5245 - Upgrade jackson-databind to version 2.13.4.1
- WW-5258 - Upgrade Struts Annotation to version 1.0.8

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.1.1) to find more details about performed
> bug fixes and improvements. Also, a dedicated [migration guide]({{ site.wiki_url }}/Struts+2.5+to+6.0.0+migration) has been prepared.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 15 September 2022 - Apache Struts version 6.0.3 General Availability {#a20220915}

The Apache Struts group is pleased to announce that Apache Struts version 6.0.3 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

Below is a full list of all changes:

**Bug**

- WW-5185 - TilesDefinition is not found and the request for a Struts action fails after an upgrade from Struts 2.5.30 to Struts 6.0.
- WW-5189 - Add missing struts-6.0.dtd
- WW-5190 - StackOverflowError when dispatching to JSP
- WW-5191 - template/simple/textarea.ftl not rendering parameters correctly
- WW-5192 - radiomap.ftl not setting enum key values
- WW-5194 - UIBean.evaluateParams() throws an IllegalStateException when getting the nonce out of a session that has been invalidated.
- WW-5195 - Dispatcher: Infinite loop with dispatcher FORWARD
- WW-5197 - java.lang.UnsupportedOperationException in the date component
- WW-5198 - textarea's maxlength attribute displays in tag's body
- WW-5203 - lazyPolicyBuilder in DefaultCspSettings is not lazy
- WW-5205 - REST plugin cannot start due to injection error
- WW-5207 - Convention Plugin - support for ASM 9
- WW-5215 - CspInterceptor assumes Session was already created
- WW-5216 - Freemarker Checkbox error after migrating from Struts 2.5.29 to 2.5.30

**New Feature**

- WW-5187 - java.lang.NoClassDefFoundError: org/apache/struts2/views/velocity/VelocityManager Improvement
- WW-5173 - Implement additional OGNL cache configuration controls
- WW-5188 - Use 6.0 marker instead of 2.6
- WW-5218 - Allow to disable CSP related interceptors 
 
**Dependency**

- WW-5193 - Use proper hibernate-validator groupId and upgrade to version 6.1.3.Final
- WW-5201 - Bump Log4j2 to 2.18.0
- WW-5202 - Update jasperreports to 6.19.1 and exclude optional itext from jasperreports
- WW-5204 - Upgrade to OGNL 3.3.3
- WW-5208 - Update hibernate-validator to 6.2.4
- WW-5212 - Upgrade Spring to version 5.3.22

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.0.3) to find more details about performed
> bug fixes and improvements. Also, a dedicated [migration guide]({{ site.wiki_url }}/Struts+2.5+to+6.0.0+migration) has been prepared.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 06 June 2022 - Struts 2 ver. 6.0.0 General Availability {#a20220606}

The Apache Struts group is pleased to announce that Apache Struts 2 ver. 6.0.0 is available as a "General Availability"
release. The GA designation is our highest quality grade.

**Version change**

You can be surprised by the version change, previously we have been using Struts 2.5.x versioning schema, but this was 
a bit misleading. Struts 2 is a different framework than Struts 1 and its versioning is supposed to start with 1.0.0, 
yet that never happened. With each breaking changes release (like Struts 2.5), we had been only upgrading the MINOR 
part of the versioning schema. To fix that problem as from Struts 2 ver. 6.0.0  (aka Struts 2.6) we adopt a proper SemVer 
to avoid such confusion.

**Internal Changes**

The framework requires Java 8 at runtime. Also Servlet API 3.1 capable container is required.

OGNL expressions are limited to 256 characters by default. See [WW-5179](https://issues.apache.org/jira/browse/WW-5179)
and [docs](https://struts.apache.org/security/#apply-a-maximum-allowed-length-on-ognl-expressions) for more details.

Yasser's PR has been merged which contains a fix to double evaluation security vulnerability - it should solve any future 
attack vectors, yet it can impact your application if you have been depending on double evaluation.

_How to test_

- Run all your app tests, you shouldn't see any WARN log like below:
  > Expression [so-and-so] isn't allowed by pattern [so-and-so]! See Accepted / Excluded patterns at https://struts.apache.org/security/
- See if following components are still functioning correctly regarding java-scripts:
  - forms with client side validations
  - doubleselect
  - combobox
- Check also `StreamResult`s, `AliasInterceptor` and `JasperReportResult`s if they are still working as expected.

Support to access static methods via OGNL expressions has been removed, use action instance methods instead.

**Bug**

- WW-3534 - PrepareOperations.createActionContext does not detect existing context correctly
- WW-3730 - action tag accepts only String arrays as parameters
- WW-4723 - s:url incompatible with JDK 1.5
- WW-4742 - Problem with escape when the key from getText has no value
- WW-4865 - Struts s:checkbox conversion fails to List<Integer>
- WW-4866 - ASM 5.2 and Java 9 leads to IllegalArgumentException
- WW-4897 - KEYS, sigs and hashes should use https (SSL)
- WW-4902 - Struts 2 fails to init Dispatcher - Tomcat Embedded
- WW-4928 - Setting struts.devMode from system property not working as described
- WW-4930 - SMI cannot be diasabled for action-packages found via the convention-plugin
- WW-4941 - [jar_cache] Some jar_cache******.tmp files are generated into a temporary directory(/tmp) during web service start
- WW-4943 - opensymphony.xwork2.util.LocalizedTextUtil can't get i18n resources
- WW-4944 - Struts 2 REST Tiles integration issue
- WW-4945 - TagUtils#buildNamespace should throw an exception when invocation is null
- WW-4946 - Strtus 2 spring integrations is failing - fails to init Dispatcher - Tomcat Embedded
- WW-4948 - Struts 2.5.16 is creating jar_cache files in temp folder
- WW-4951 - MD5 and SHA1 should no longer be provided on download pages
- WW-4954 - xml-validation fails since struts 2.5.17
- WW-4957 - Update struts version from 2.5.10 to 2.5.17. LocalizedTextUtil class is removed and GlobalLocalizedTextProvider&StrutsLocalizedTextProvider cannot be used instead.
- WW-4958 - File upload fails from certain clients
- WW-4964 - Missing javascript in form-validate.ftl
- WW-4968 - combining s:set and s:property where the property retrieved is null has unexpected results
- WW-4971 - s:include tag fails with truncated content in certain circumstances
- WW-4974 - NullPointerException in DefaultStaticContentLoader#findStaticResource
- WW-4977 - Fixing flaky test in Jsr168DispatcherTest and Jsr286DispatcherTest
- WW-4984 - Static files like css and js files in struts-core not properly served
- WW-4986 - Race condition reloading config results in actions not found
- WW-4987 - Setting Struts2 <s:select> options Css Class
- WW-4991 - Not existing property in listValueKey throws exception
- WW-4997 - <s:debug> can't be resolved
- WW-4999 - Can't get OgnlValueStack log even if enable logMissingProperties
- WW-5002 - Package Level Properties in Global Results
- WW-5004 - No more calling of a static variable in Struts 2.8.20 available
- WW-5006 - NullPointerException in ProxyUtil class when accessing static member
- WW-5009 - EmptyStackException in JSON plugin due to concurrency
- WW-5011 - Tiles bug when parsing file:// URLs including # as part of the URL
- WW-5013 - Accessing static variable via OGNL returns nothing
- WW-5022 - Struts 2.6 escaping behaviour change for s:a (anchor) tag
- WW-5024 - HttpParameters.Builder can wrap objects in two layers of Parameters
- WW-5025 - Binding Integer Array upon form submission
- WW-5026 - Double-submit of TokenSessionStoreInterceptor broken since 2.5.16
- WW-5027 - xerces tries to load resources from the internet
- WW-5028 - Dispatcher prints stacktraces directly to the console
- WW-5029 - The content allowed-methods tag of the XML configuration is sometimes truncated
- WW-5030 - ClassNotFoundException - MockPortletResponse
- WW-5031 - OGNL: An illegal reflective access operation has occurred
- WW-5043 - trouble with Enum subclassing
- WW-5054 - Debugging Interceptor debug=browser not working
- WW-5058 - Invalid link in primer.html
- WW-5059 - primer.html link to spring-security is broken
- WW-5065 - AbstractMatcher adds values to the map passed into replaceParameters
- WW-5072 - Minor bug in single file upload example of the Showcase application
- WW-5074 - Multiple ASM jar conflict in 2.6 build
- WW-5076 - struts2 redirecting to https to http
- WW-5077 - Unable to set long pathname variables
- WW-5079 - Could not find StrutsPrepareAndExecuteFilter sometime in WAS server
- WW-5081 - Struts default textarea template fails w3c validation
- WW-5082 - struts2 update from 2.1.6 to 2.3.37
- WW-5086 - s:set with empty body
- WW-5087 - AliasInterceptor doesn't properly handle Parameter.Empty
- WW-5088 - Empty file upload gives wrong error message
- WW-5091 - Switched hash and PGP links
- WW-5093 - inconsistent scope for variables created with s:set and s:url
- WW-5095 - Junit plugin does not push ACTION_MAPPING into the context resulting in NPE
- WW-5096 - Struts2 StaticParametersInterceptor's addParametersToContext method is not working as expected.
- WW-5100 - incorrect content-type behavior after upgrading to struts 2.5.*
- WW-5102 - Download page issues
- WW-5104 - Please delete old releases
- WW-5106 - The call chains of ActionContext.getContext() in ServletActionContext are dangerious
- WW-5107 - JQuery plugin does not handle dynamic component ids correctly
- WW-5108 - No errors are reported locally. On linux environment, tomcat runs alone and reports java.lang.annotation.AnnotationTypeMismatchException
- WW-5109 - Ognl issue after migrating from strut 2.3 to 2.5
- WW-5116 - PostbackResult uses wrong regex range
- WW-5117 - %{id} evaluates different for data-* and value attribute
- WW-5119 - Blocking Threads in retrieving text from resource bundle
- WW-5121 - Contention when injecting Scope.SINGLETON instances
- WW-5123 - CheckboxTag value missing for labelposition
- WW-5124 - Tag attribute values cached
- WW-5125 - forbidden name attribute values (size, clone...?) in <s:textfield> using the default theme
- WW-5129 - Dynamic Attributes are not working for doubleselect, optiontransferselect, inputtransferselect tags
- WW-5130 - ID param not being set
- WW-5140 - Cannot download struts from the main page
- WW-5146 - Empty file upload ends in error
- WW-5147 - OGNL valid expression is not cached and is parsed over again in some situations
- WW-5160 - Template not found for name "Empty{name='templateDir'}/simple/hidden.ftl"
- WW-5163 - Error executing FreeMarker template
- WW-5169 - Key Technologies Primer: Broken link to ResourceBundles

**New Feature**

- WW-4598 - async Actions
- WW-4760 - Switch to Servlet API 2.5
- WW-4874 - Asynchronous action method
- WW-5005 - Struts2 convention plugin lacks Java 11 support
- WW-5049 - Move Velocity support into a dedicated plugin
- WW-5083 - Fetch Metadata support
- WW-5084 - Content Security Policy support
- WW-5085 - Add Cross-Origin Opener Policy and Cross-Origin Embedder Policy Support
- WW-5101 - AbstractLocalizedTextProvider illegal reflective access operation has occurred

**Improvement**

- WW-685 - Generic error message - Type Conversion Error Handling
- WW-2040 - Struts 1 vs. Struts 2 benchmarking application
- WW-2411 - Add a maxlength attribute to the textarea tag
- WW-2537 - Fix generics in all codebase
- WW-3788 - Convert ServletActionContext to be more as ActionContext
- WW-3877 - Remove altSyntax option
- WW-4043 - Duplicated class TestUtils
- WW-4069 - Upgrade DWR plugin to use the latest available version
- WW-4348 - Remove access to static methods
- WW-4713 - Drop "searchValueStack" attribute from tag <s:text/>
- WW-4763 - Drop deprecated logging layer
- WW-4779 - Remove profiling layer
- WW-4789 - ActionContext should be immutable
- WW-4792 - Removes deprecated XWork constants
- WW-4796 - Rename Spring related flags to use the same pattern
- WW-4799 - make DateConverter configurable
- WW-4875 - Java configuration
- WW-4889 - Implement REST content handlers using Apache Juneau
- WW-4910 - Align OptGroup with Select
- WW-4915 - Replace deprecated commons-lang3 classes
- WW-4927 - Use immutable version of OGNL without access to #context
- WW-4929 - Fallback i18n Locale
- WW-4932 - Conversion fails when generic type is an interface
- WW-4937 - Add SortedSet field support to JSON plugin
- WW-4938 - ObjectFactory should use Container to instantiate actions and inject dependencies
- WW-4952 - Upgrade to apache-master version 21
- WW-4963 - Implement new Aware interfaces that are using withXxxx pattern instead of setters
- WW-4972 - Switch to latest freemarker version when defining incompatible_improvements
- WW-4995 - Enhancement for s:set tag to improve tag body whitespace control.
- WW-4996 - Refactor DefaultTypeConverterCreator to use ObjectFactory#buildConverter
- WW-5000 - Replace string literals with proper constants in @Inject
- WW-5001 - Allow to define converters in "struts-conversion.properties" file
- WW-5003 - Use StrutsException instead of XWorkException
- WW-5012 - Make a public state check the first acceptance check in SecurityMemberAccess
- WW-5017 - Drop @Validation annotation as not needed
- WW-5018 - Add maven enforce plugin to control certain environmental constraints
- WW-5023 - Upgrade SLF4J to latest 1.7.x version
- WW-5034 - Minor enhancement/fix to AbstractLocalizedTextProvider
- WW-5035 - Provide mechanism to clear OgnlUtil caches
- WW-5036 - update JFreeChart plugin for compatibility with JFreeChart 1.5
- WW-5052 - Use TypeConversionException instead of StrutsException
- WW-5056 - Standard Accepted Patterns in DefaultAcceptedPatternsChecker
- WW-5057 - Cleanup and/or improvements to Showcase Applications
- WW-5062 - Use downloads.a.o instead of archive
- WW-5063 - Use null check of passed in invocation in all the results
- WW-5064 - Move XWork Spring support into struts2-spring-plugin
- WW-5069 - Improve build behaviour on JDK9+
- WW-5070 - JSONResult default root object should be set explicitly, rather than from result of ValueStack.peek()
- WW-5073 - Use TextParser in AbstractMatcher
- WW-5078 - Remove support for <xwork> DTD
- WW-5080 - Allow write directly to a response - define a new result
- WW-5099 - Upgrade JFreeChart plugin to use version 1.5.1 of JFreeChart
- WW-5112 - Add ability (control flag) for TextProviders to prioritize reads from the default resource bundlest.
- WW-5113 - Drop deprecated constant "struts.xworkTextProvider"
- WW-5114 - Drop deprecated constant "struts.localeProvider"
- WW-5115 - Reduce logging for DMI excluded parameters
- WW-5126 - inconsistancy between Model Driven and Model Driven Interceptor documentations
- WW-5136 - Make class attribute deprecated
- WW-5152 - Make OVal plugin deprecated
- WW-5153 - Make Portlet, Portlet Mocks and Portlet Tiles plugins deprecated
- WW-5154 - Make GXP plugin deprecated
- WW-5155 - Make OSGi plugin deprecated
- WW-5156 - Make Plexus plugin deprecated
- WW-5157 - Make Sitemesh plugin deprecated
- WW-5164 - Remove deprecated ConversionDescription class
- WW-5168 - Fix missing submitUnchecked and broken disabled attributes in Javatemplates checkbox tag
- WW-5175 - Add basic LocalDateTime support
- WW-5179 - Set 'struts.ognl.expressionMaxLength' to 256 by default
- WW-5181 - Stop supporting accessing static methods via OGNL expressions
- WW-5182 - Upgrade to Servlet API 3.1

**Task**
- WW-4845 - run, test, and validate Struts2 with Java9
- WW-4981 - Add support for Java 11
- WW-4982 - Remove the deprecated JsonLibHandler and outdated json-lib dependency
- WW-4983 - Set private access modifier for HttpParameters.toMap
- WW-4998 - I18nInterceptor's default storage should store locale
- WW-5010 - Switch to Java 8
- WW-5016 - Support Java 8 date time in the date tag
- WW-5020 - delete deprecated sitegraph plugin
- WW-5021 - Serve static resources from different path
- WW-5118 - OGNL long conversion

**Dependency**
- WW-4887 - Upgrade to Tiles 3.0.8
- WW-4926 - Upgrade commons-beanutils to version 1.9.3
- WW-4931 - Upgrade to Apache FreeMarker 2.3.28 version
- WW-4947 - server errors generated by secure-jakarta-multipart-parser-plugin
- WW-4955 - Upgrade to OGNL 3.2.6
- WW-4956 - Upgrade to Log4j2 2.11.1
- WW-4965 - Upgrade to OGNL 3.2.7
- WW-4967 - Upgrade to Jackson 2.9.6
- WW-4973 - Upgrade to OGNL 3.2.8
- WW-4975 - Upgraded commons-fileupload to version 1.4
- WW-4976 - Upgrade ASM to version 7.0
- WW-4979 - Update multiple Struts 2.6.x libraries to more recent versions
- WW-4980 - Update maven-wrapper to 3.5.4 and add maven-wrapper.jar to .gitignore
- WW-4985 - Update persistence-api from 1.0 to 1.0.2 for CDI Plugin
- WW-4988 - Upgrade DWR from 1.x to 2.x (for DWR plugin)
- WW-4989 - Use JacksonXML handler instead of XStream as a default handler for XML in the REST plugin
- WW-4992 - Mark the Embedded JSP plugin as depracted
- WW-4993 - Update OGNL versions for 2.6 and 2.5.x builds
- WW-5007 - Upgrade Jackson library to the latest version
- WW-5019 - Upgrade Log4j to version 2.13.3
- WW-5032 - Struts 2 Junit Plugin is not working with Zulu JDK11
- WW-5033 - Update a few Struts 2.5.x libraries to more recent versions
- WW-5037 - Upgrade commons-beanutils to version 1.9.4
- WW-5038 - Upgrade jackson-databind to version 2.9.9.3
- WW-5042 - Upgrade jackson-databind to version 2.10.0
- WW-5045 - Update jasperreports to 6.10.0
- WW-5047 - Upgrade Velocity to 2.1 and Velocity Tools to 3.0
- WW-5048 - Update various dependencies to newest version
- WW-5050 - Upgrade to OGNL 3.2.12
- WW-5061 - CVEs in the library dependencies
- WW-5068 - Update multiple Struts 2.6.x libraries / Maven build plugin versions
- WW-5075 - Upgrade OSGi to the latest version
- WW-5092 - ASM dependency update to 8.*
- WW-5094 - Upgrade Spring Framework to version 4.3.29.RELEASE
- WW-5097 - Upgrade to OGNL 3.2.16
- WW-5098 - Upgrade ASM to version 9.0
- WW-5103 - Upgrade XStream to version 1.4.14
- WW-5120 - Upgrade Velocity Engine & Velocity Tools
- WW-5122 - Upgrade XStream to version 1.4.16
- WW-5131 - Upgrade commons-io to version 2.9
- WW-5134 - Upgrade JasperReports to version 6.17.0
- WW-5135 - Upgrade XStream to version 1.4.17
- WW-5142 - Upgrade XStream to version 1.4.18
- WW-5143 - Upgrade Oval library to ver. 3.2.1
- WW-5144 - Mark OVal plugin as deprecated
- WW-5148 - Upgrade ASM to version 9.2
- WW-5151 - Bump to 2.15.0 to fix log4j vulnerability
- WW-5158 - Upgrade Log4j to version 2.16.0 to address security vulnerability
- WW-5161 - Update spring to 4.3.30
- WW-5162 - Upgrade Log4j to version 2.17.1 to address security vulnerability
- WW-5165 - Update spring to 5.3.x b/c 4.3.x is EOL
- WW-5166 - Update OGNL to 3.3.2
- WW-5167 - Upgrade XStream to version 1.4.19
- WW-5171 - Upgrade Apache Log4j 2.17.2
- WW-5172 - Upgrade freemarker to 2.3.31
- WW-5174 - Upgrade Jackson-Core to version 2.13.2 and Jackson-Databind to 2.13.2.1

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+6.0.0) to find more details about performed
> bug fixes and improvements. Also, a dedicated [migration guide]({{ site.wiki_url }}/Struts+2.5+to+6.0.0+migration) has been prepared.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 6.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 3.1, JSP API 2.1, and Java 8.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 04 April 2022 - Struts 2.5.30 General Availability {#a20220404}

The Apache Struts group is pleased to announce that Struts 2.5.30 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Internal Changes:

Yasser's PR has been merged which contains a fix to double evaluation security vulnerability - it should solve any future 
attack vectors, yet it can impact your application if you have been depending on double evaluation.

**How to test**

Run all your app tests, you shouldn't see any `WARN` log like below:

```
Expression [so-and-so] isn't allowed by pattern [so-and-so]! See Accepted / Excluded patterns at
https://struts.apache.org/security/
```

See if following components are still functioning correctly regarding java-scripts:
 - forms with client side validations
 - `doubleselect` tag
 - `combobox` tag

Check also `StreamResult`, `AliasInterceptor` and `JasperReportResult` if they are still working as expected.

Dependency:
 - [WW-5170] - Upgrade Jackson-Core to version 2.10.5 and Jackson-Databind to 2.10.5.1
 - [WW-5172] - Upgrade freemarker to 2.3.31

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.30) to find more details about performed
> bug fixes and improvements.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 22 January 2022 - Struts 2.5.29 General Availability {#a20220122}

The Apache Struts group is pleased to announce that Struts 2.5.29 is available as a "General Availability"
release. The GA designation is our highest quality grade.

Bugs:
 - [WW-5117] - %{id} evaluates different for data-* and value attribute
 - [WW-5160] - Template not found for name "Empty{name='templateDir'}/simple/hidden.ftl"
 - [WW-5163] - Error executing FreeMarker template

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.29) to find more details about performed
> bug fixes and improvements.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

#### 02 January 2022 - Struts 2.5.28.3 General Availability {#a20220102}

The Apache Struts group is pleased to announce that Struts 2.5.28.3 is available as a "General Availability"
release. The GA designation is our highest quality grade.

This release addresses Log4j vulnerability [CVE-2021-44832](https://logging.apache.org/log4j/2.x/security.html#CVE-2021-44832)
by using the latest Log4j ver. 2.12.4 (Java 1.7 compatible).

**Please note, that the Apache Struts itself depends on the `log4j-api` package only, it's users' responsibility 
to use a proper version of the log4j-core package!**

> Please read the [Version Notes]({{ site.wiki_url }}/Version+Notes+2.5.28.3) to find more details about performed
> bug fixes and improvements.

Apache Struts 2 is an elegant, extensible framework for creating enterprise-ready Java web applications.
The framework has been designed to streamline the full development cycle, from building, to deploying,
to maintaining applications over time.

**All developers are strongly advised to perform this upgrade.**

The 2.5.x series of the Apache Struts framework has a minimum requirement of the following specification versions:
Servlet API 2.4, JSP API 2.0, and Java 7.

Should any issues arise with your use of any version of the Struts framework, please post your comments to the user list,
and, if appropriate, file [a tracking ticket]({{ site.jira_url }}).

You can download this version from our [download](download.cgi#struts-ga) page.

<p class="pull-right">
  Skip to: <a href="announce-2021.html">Announcements - 2021</a>
</p>

<p class="pull-left">
  <strong>Next:</strong>
  <a href="kickstart.html">Kickstart FAQ</a>
</p>
