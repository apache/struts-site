---
layout: core-developers
title: WebLogic 6.1
---

# WebLogic 6.1

## Running on Weblogic Server 6\.1

This document describes why the framework doesn't work "as\-is" on Weblogic Server 6\.1 and shows how to build an additional JAR that will fix the problems\.

(information) The service pack SP4 of Weblogic Server 6\.1 was used to test these notes\.

The first part of this document describes the technical problems and the theoretical solution\.

### Why It Doesn't Just Work

Weblogic 6\.1 was published just prior to the finalization of the Servlet 2\.3 specification\. The incompatibility is that servlet filters and listeners in Weblogic 6\.1 do not work with the 2\.3 spec primarily because the servlet context is not retrieved in the same way\.  This causes virtually all filter initialization operations to fail with an AbstractMethodError exception\.

### How the Framework is Modified

In Servlet 2\.3, the servlet context is available from the session object; this is not true for Weblogic Server 6\.1\. Hence, filters and listeners must be modified to retrieve the servlet context from a different source; this is accomplished by retrieving the servlet context from the FilterConfig passed to the servlet filters during initialzation\.

However, the framework code cannot be modifed to do this, because this will break the Servlet 2\.3 specification\.  The goal is to leave the "original" framework unmodified so that it is still Servlet 2\.3 compatible, and then to add an additional JAR that "breaks" the frame to work on Weblogic Server 6\.1\.

The framework has already been modified slightly to make the above effort possible:

1. **RequestLifecycleFilter** is modified to retrieve its servlet context from the method 

~~~~~~~
getServletContext
~~~~~~~
. This method, 

~~~~~~~
getServletContext
~~~~~~~
, is then implemented to return the servlet context from where it is available in Servlet 2.3: the session object. The logical operation is unchanged, but now subclasses can override 

~~~~~~~
getServletContext
~~~~~~~
 to retrieve the servlet context from a different location as we'll see below.

1. **SessionLifecycleListener** is modified in the same way as RequestLifecycleFilter. The method, 

~~~~~~~
getServletContext
~~~~~~~
, is implemented to return the servlet context, in this case also from the session object. Again, subclasses can override the 

~~~~~~~
getServletContext
~~~~~~~
 method to restore the servlet context from a different source. Again, this class's functionality is unchanged.

Now, in a separate project, the following classes are added and compiled into a separate JAR:

__RequestLifecycleFilterCompatWeblogic61__

This subclass of RequestLifecycleFilter simply overrides getServletContext() to retrieve the servlet context from the filter config, creates a singleton class, SessionContextSingleton, and assigns the servlet context to the singleton so that the listeners will have the ability to retrieve it\.

__SessionLifecycleListenerCompatWeblogic61__

This subclass of SessionLifecycleListener simply overrides getServletContext() to retrieve the servlet context from the singleton created above\.

__FilterDispatcherCompatWeblogic61__

Although the superclass of this class, FilterDispatcher, is commented out, this subclass retrieves the servlet context in the same way as RequestLifecycleFilterCompatWeblogic61 in case it is ever resurrected\. At this time, this class is unnecessary\.

__ServletContextSingleton__

A singleton class whose sole purpose is to hold the servlet context so that listener classes have access to it\.

### Setting Up to Run on Weblogic 6\.1

__Building your own project__

In the \{\{web\.xml\} file, make the following class name substitutions:

| Old Class Name | New Class Name |
|----------------|----------------|
| RequestLifecycleFilter | RequestLifecycleFilterCompatWeblogic61 |
| SessionLifecycleListener | SessionLifecycleListenerCompatWeblogic61 |
| FilterDispatcher | FilterDispatcherCompatWeblogic61 |

### FAQ

__I still get the AbstractMethodError Exception when Weblogic Server starts up\.  What am I doing wrong?__

1. Check to see if a 

~~~~~~~
action2-example.war
~~~~~~~
 is still lingering in your 

~~~~~~~
mydomain/applications
~~~~~~~
 folder and delete it if it is there.

2. See next FAQ question.

__The server behavior seems like it is from a previous source code base; I can't debug it\.  What's the clue?__

Sometimes BEA Weblogic Server doesn't "rebuild" its temporary files\.  Do the following to force the temporary files to rebuild:

1. Stop the server.

2. Delete the .wlnotdelete folder in 

~~~~~~~
mydomain/applications
~~~~~~~
.

3. Restart the server.
