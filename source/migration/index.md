---
layout: default
title: Migration Guide
---

# Migration Guide

Getting here from there.

## Version Notes

All Version Notes are available on our [Wiki](https://cwiki.apache.org/confluence/display/WW/Migration+Guide)

## Struts 2.3 to Struts 2.5

- [Struts 2.3 to 2.5 migration](struts-2-3-to-2-5-migration)

## Struts 1 to Struts 2

- [Comparing Struts 1 and 2](#PAGE_14048)|How are Struts 1 and Struts 2 alike? How are they different?|
- [Struts 1 Solutions](#PAGE_14240)|Various issues (and hopefully their solutions\!) encountered during migrations to Struts 2.|
- [Migration Strategies](#PAGE_14221)|Steps and overall strategies for migrating Struts 1 applications to Struts 2.|
- [Migration Tools](#PAGE_13954)|Development tools to help aid the migration process.|


## Tutorials

- [Migrating Applications to Struts 2 ](http://www.infoq.com/news/migrating-struts2) - A three-part series by Ian Roughley (Sep 2006)


##Comparing Struts 1 and 2## {#PAGE_14048}

| Feature | Struts 1 | Struts 2 |
|---------|----------|----------|
| Action classes | Struts 1 requires Action classes to extend an abstract base class. A common problem in Struts 1 is programming to abstract classes instead of interfaces. | An Struts 2 Action _may_  implement an Action interface, along with other interfaces to enable optional and custom services. Struts 2 provides a base ActionSupport class to implement commonly used interfaces. Albeit, the Action interface is **not** required. Any POJO object with a execute signature can be used as an Struts 2 Action object. |
| Threading Model | Struts 1 Actions are singletons and must be thread-safe since there will only be one instance of a class to handle all requests for that Action. The singleton strategy places restrictions on what can be done with Struts 1 Actions and requires extra care to develop. Action resources must be thread-safe or synchronized. | Struts 2 Action objects are instantiated for each request, so there are no thread-safety issues. (In practice, servlet containers generate many throw-away objects per request, and one more object does not impose a performance penalty or impact garbage collection.) |
| Servlet Dependency | Struts 1 Actions have dependencies on the servlet API since the HttpServletRequest and HttpServletResponse is passed to the execute method when an Action is invoked. | Struts 2 Actions are not coupled to a container. Most often the servlet contexts are represented as simple Maps, allowing Actions to be tested in isolation. Struts 2 Actions can still access the original request and response, if required. However, other architectural elements reduce or eliminate the need to access the HttpServetRequest or HttpServletResponse directly. |
| Testability | A major hurdle to testing Struts 1 Actions is that the execute method exposes the Servlet API. A third-party extension, Struts TestCase, offers a set of mock object for Struts 1. | Struts 2 Actions can be tested by instantiating the Action, setting properties, and invoking methods. Dependency Injection support also makes testing simpler. |
| Harvesting Input | Struts 1 uses an ActionForm object to capture input. Like Actions, all ActionForms must extend a base class. Since  other JavaBeans cannot be used as ActionForms, developers often create redundant classes to capture input. DynaBeans can used as an alternative to creating conventional ActionForm classes, but, here too, developers may be redescribing existing JavaBeans. \
| Struts 2 uses Action properties as input properties, eliminating the need for a second input object. Input properties may be rich object types which may have their own properties. The Action properties can be accessed from the web page via the taglibs. Struts 2 also supports the ActionForm pattern, as well as POJO form objects and POJO Actions. Rich object types, including business or domain objects, can be used as input/output objects. The ModelDriven feature simplifies taglb references to POJO input objects. \
|
| Expression Language | Struts 1 integrates with JSTL, so it uses the JSTL EL. The EL has basic object graph traversal, but relatively weak collection and indexed property support. | Struts 2 can use JSTL, but the framework also supports a more powerful and flexible expression language called "Object Graph Notation Language" (OGNL). |
| Binding values into views | Struts 1 uses the standard JSP mechanism for binding objects into the page context for access. | Struts 2 uses a "ValueStack" technology so that the taglibs can access values without coupling your view to the object type it is rendering. The ValueStack strategy allows reuse of views across a range of types which may have the same property name but different property types. \
|
| Type Conversion | Struts 1 ActionForm properties are usually all Strings. Struts 1 uses Commons-Beanutils for type conversion. Converters are per-class, and not configurable per instance. | Struts 2 uses OGNL for type conversion. The framework includes converters for basic and common object types and primitives. |
| Validation | Struts 1 supports manual validation via a validate method on the ActionForm, or through an extension to the Commons Validator. Classes can have different validation contexts for the same class, but cannot chain to validations on sub-objects. | Struts 2 supports manual validation via the validate method and the XWork Validation framework. The Xwork Validation Framework supports chaining validation into sub-properties using the validations defined for the properties class type and the validation context. |
| Control Of Action Execution | Struts 1 supports separate Request Processors (lifecycles) for each module, but all the Actions in the module must share the same lifecycle. | Struts 2 supports creating different lifecycles on a per Action basis via Interceptor Stacks. Custom stacks can be created and used with different Actions, as needed. |

**(i) See Also**


> 

> 

> + Matt Raible wrote (mid 2005) an interesting whitepaper where he compared various web frameworks. You can view the PDF here:
 > 	

> 

>   + [https://equinox.dev.java.net/framework-comparison/WebFrameworks.pdf](https://equinox.dev.java.net/framework-comparison/WebFrameworks.pdf)

> 

>   + [http://www.virtuas.com/files/osl-jwf-01.pdf](http://www.virtuas.com/files/osl-jwf-01.pdf)

> 

> 

> 

> 

####Next:####

##Key Changes From WebWork 2## {#PAGE_26950}

The upgrade path from WebWork 2 to Struts 2 is smooth glide. Here's the roadmap.

#####System Platform#####

+ Struts 2 is dependant on XWork 2 (beta-1).

+ Java 1.5 is required to build Struts 2.
	

  + For Java 1.4 deployments, RetroTranslater JARS are available with the distribution.

For other changes from WebWork 2, see the "Members to rename", "New property settings", "New features or feature changes", and "Removed or deprecated" sections.

__Members to rename__

|WebWork 2                  | Struts 2             |
|---------------------------|----------------------|
|com.opensymphony.xwork.\*|com.opensymphony.xwork2.\*|
|com.opensymphony.webwork.\*|org.apache.struts2.\*|
|xwork.xml|struts.xml|
|webwork.properties|struts.properties|
|DispatcherUtil              | Dispatcher            |
|com.opensymphony.webwork.config.Configuration|org.apache.struts2.config.Settings|

The tag prefix conventions in the example applications have changed. 

|JSP        | s: |_\<s:form ...\>_ |
|-----------|----|--------------------|
|Freemarker | s. |_\<@s.form ...\>_ |
|Velocity   | s  |_\#sform ( ... )_ |

__New property settings__

|struts.enable.DynamicMethodInvocation | Enable support for the hardwired action\!alias syntax (Default is TRUE)|
|----------------------------------------|------------------------------------------------------------------------|


It is recommended that all applications specify the DynamicMethodInvocation setting for now, since the default may change. The recommended approach to action aliasing is to use _wildcard aliases_  instead of the hardwired bang.

| 

__New features and feature changes__

+ Various changes to ConfigurationManager
	

  + ConfigurationManager is no longer a static factory. It is now an instance created through Dispatcher. Custom configuration could be done through DispatcherListener.

  + Custom configuration to ConfigurationManager and Configuration cannot be done statically anymore, instead use Dispatcher's DispatcherListener to achieve the same effect.

+ The 

~~~~~~~
prepare
~~~~~~~
 interceptor now uses reflection to call prepare\_Method\_ where _method_  is the action method configured for the particular action in 

~~~~~~~
struts.xml
~~~~~~~
.


~~~~~~~

   <action name="myAction" method="insert" ....>
     .....
   </action>

   // with the above configuration, and PrepareInterceptor in play, 
   // callsequence will be 
   1] prepareInsert() (If it exists)
   2] prepare() (Unless Interceptor's alwaysInvokePrepare parameter is set to false)
   3] insert()

~~~~~~~

+ DefaultWorkflowInterceptor (named 

~~~~~~~
workflow
~~~~~~~
 in 

~~~~~~~
struts-default.xml
~~~~~~~
) now uses reflection to call 

~~~~~~~
validateMethod
~~~~~~~
 on the action class that implements Validateable interface where 

~~~~~~~
method
~~~~~~~
 is the action method configured for the particular action in 

~~~~~~~
struts.xml
~~~~~~~
.


~~~~~~~

<action name="myAction" method="insert" ...>
       ...
    </action>

    // with the above configuration, and DefaultWorkflowInterceptor in play, 
    // call sequence for action that implements Validateable interface will be 
    1] validateInsert()
    2] validate() (unless Interceptor's alwaysInvokeValidate parameter is set to false)
    3] insert()

~~~~~~~

+ The tooltip library used by the xhtml theme was replaced by [Dojo's](http://dojotoolkit.org)^[http://dojotoolkit.org] tooltip component.

+ Datepicker tag has been renamed to datetimepicker and is now using dojo (limited in terms functionality and internationalization)

+ _Tiles integration_  plugin is available.

+ _Wildcards_  can be specified in action mappings.

+ _MessageStoreInterceptor_  is introduced to allow field errors / action errors and messages to be store and retrieve through session, resulting them to be preservable across request.

__Removed or deprecated__

|AroundInterceptor| The AroundInterceptor has been removed. If your application extends the AroundInterceptor, either import the class into your source code form WebWork 2 (pursuant to the Open Symphony License) and modify it to server as your own base class, or rewrite your interceptor. |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|oldSyntax| Support for the "oldSyntax" is removed. |
| Rich text editor tag | Rich text editor tag is removed and replaced by Dojo's [rich text editor](http://dojotoolkit.org/docs/rich\_text.html)^[http://dojotoolkit.org/docs/rich\_text.html]|
|doActionMethod| The convention of trying a "do" form of an action method is not supported. \
\
  \<action name="..." method="submit"\>\
    ...\
  \</action\>\
In WebWork,\
\
+ try to execute submit method in the action, _fail_ \
\
+ try to execute doSubmit method in the action if Step 1, _fail_ \
\
+ _fail_ \
\
In Struts,\
\
+ try to execute submit method in the action, _fail_ \
\
+ _fail_ \
|
|
|default method| Calling the "default" method via "doDefault" is not supported.  |
| IOC framework | Deprecated in WebWork 2.2, the internal IOC framework is removed in Struts 2. Spring is the _ObjectFactory_  default. |

##Migration Strategies## {#PAGE_14221}

The migration strategy of Struts 1 developers moving to Struts 2 involves four non-exclusive paths:

1. **Dual processor, shared resources** - Add the Struts 2.0 JARs to your exisitng Struts 1.3 application. Configure S2 to handle 

~~~~~~~
*.action
~~~~~~~
 requests s and let S1 handle 

~~~~~~~
*.do
~~~~~~~
 requests. S1 and S2 can run side by side, within the same web application. Teams can implement new features in the latest version, and migrate older pieces as needed. Optionally, some common resources may be shared between S1 and S2, like messages, validation rules, and Tiles configurations, making for an even smoother migration.

2. **Study known Struts 1 applications, rewritten for Struts 2** - Familiar applications such as the Struts Mailreader are being rewritten to demonstrate best practices for Struts 2.

3. **Use a conversion wizard** - It may be possible to create a tool that reads the 

~~~~~~~
web.xml
~~~~~~~
 and S1 configuration files, and generates the corresponding S2 classes, pages, and configuration files.  While 100% compatibility is unlikely,  we could make a strong effort to convert the application, marking areas that need attention. Comparing the converted files with the originals could also serve as a training tool.

####Next:####


---

This page originally adopted from [http://wiki.apache.org/struts/MigrationStrategy](http://wiki.apache.org/struts/MigrationStrategy).

##Migration Tools## {#PAGE_13954}

Struts 2 migration tools include the notions of 

+ bridge objects to utilize existing s1 resources, and

+ utilities to convert resources to s2 equivalents.

| (\!) | This is a whiteboard describing tools that volunteers _might_  write, given sufficient interest. |
|------|---------------------------------------------------------------------------------------------------|

####Dual Processor, Shared Resources####

+ A s2 TextProvider that retrieves messages from the s1 MessageResources instance in the servlet context

+ An Interceptor that can apply SAF1 validations to s2 actions, converting error messages to s2 format.

+ An Action and/or Interceptor that executes a Commons Chain instance.

#####Struts 1 Emulation#####

+ Implement s2 Action interface on s1 Action; Extend Session-Aware Interceptor to set properties corresponding to s1 execute parameters and populate ActionForm; Action 

~~~~~~~
execute()
~~~~~~~
 invokes 

~~~~~~~
execute(...)
~~~~~~~
 using properties; return ActionForward name.

+ Extend aforementioned s1 Action Interceptor to load and process PlugIns

####Conversion Wizards####

+ Utilize XSLT and other text processing tools to convert 

~~~~~~~
struts-config.xml
~~~~~~~
 to 

~~~~~~~
struts.xml
~~~~~~~
, 

~~~~~~~
validations.xml
~~~~~~~
 to a global s2 

~~~~~~~
validations.xml
~~~~~~~
, and Struts message resources to global s2 

~~~~~~~
resource.properties
~~~~~~~
.

+ ... convert s1 Action classes to session-aware s2 Action classes

+ ... convert s1 JSPs to s2 JSPs (non-trivial\!)

####Next:####


---

This page adopted from [http://wiki.apache.org/struts/MigrationTools](http://wiki.apache.org/struts/MigrationTools).
