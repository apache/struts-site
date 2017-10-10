---
layout: core-developers
title: Scope Interceptor
---

# Scope Interceptor



{% comment %}start snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}
<p> <p>
 This is designed to solve a few simple issues related to wizard-like functionality in Struts. One of those issues is
 that some applications have a application-wide parameters commonly used, such <i>pageLen</i> (used for records per
 page). Rather than requiring that each action check if such parameters are supplied, this interceptor can look for
 specified parameters and pull them out of the session.
 </p>

 <p>This works by setting listed properties at action start with values from session/application attributes keyed
 after the action's class, the action's name, or any supplied key. After action is executed all the listed properties
 are taken back and put in session or application context.
 </p>

 <p>To make sure that each execution of the action is consistent it makes use of session-level locking. This way it
 guarantees that each action execution is atomic at the session level. It doesn't guarantee application level
 consistency however there has yet to be enough reasons to do so. Application level consistency would also be a big
 performance overkill.
 </p>

 <p>Note that this interceptor takes a snapshot of action properties just before result is presented (using a {@link
 PreResultListener}), rather than after action is invoked. There is a reason for that: At this moment we know that
 action's state is "complete" as it's values may depend on the rest of the stack and specifically - on the values of
 nested interceptors.
 </p>

</p>
{% comment %}end snippet id=description|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}

## Parameters



{% comment %}start snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}
<p>
 <ul>

 <li>session - a list of action properties to be bound to session scope</li>

 <li>application - a list of action properties to be bound to application scope</li>

 <li>key - a session/application attribute key prefix, can contain following values:

 <ul>

 <li>CLASS - that creates a unique key prefix based on action namespace and action class, it's a default value</li>

 <li>ACTION - creates a unique key prefix based on action namespace and action name</li>

 <li>any other value is taken literally as key prefix</li>

 </ul>
 </li>
 <li>type - with one of the following

 <ul>

 <li>start - means it's a start action of the wizard-like action sequence and all session scoped properties are reset
 to their defaults</li>

 <li>end - means that session scoped properties are removed from session after action is run</li>

 <li>any other value throws IllegalArgumentException</li>

 </ul>
 </li>

 <li>sessionReset - name of a parameter (defaults to 'session.reset') which if set, causes all session values to be reset to action's default values or application
 scope values, note that it is similar to type="start" and in fact it does the same, but in our team it is sometimes
 semantically preferred. We use session scope in two patterns - sometimes there are wizard-like action sequences that
 have start and end, and sometimes we just want simply reset current session values.</li>

 <li>reset - boolean, defaults to false, if set, it has the same effect as setting all session values to be reset to action's default values or application.</li>

 <li>autoCreateSession - boolean value, sets if the session should be automatically created.</li>
 </ul>

</p>
{% comment %}end snippet id=parameters|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}

## Extending the Interceptor



{% comment %}start snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}
<p>
 <p>There are no know extension points for this interceptor.</p>

</p>
{% comment %}end snippet id=extending|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}

## Examples



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}

```xml
 <!-- As the filter and orderBy parameters are common for all my browse-type actions,
      you can move control to the scope interceptor. In the session parameter you can list
      action properties that are going to be automatically managed over session. You can
      do the same for application-scoped variables-->
 <action name="someAction" class="com.examples.SomeAction">
     <interceptor-ref name="basicStack"/>
     <interceptor-ref name="hibernate"/>
     <interceptor-ref name="scope">
         <param name="session">filter,orderBy</param>
         <param name="autoCreateSession">true</param>
     </interceptor-ref>
     <result name="success">good_result.ftl</result>
 </action>

```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.interceptor.ScopeInterceptor {% endcomment %}

__Some more examples__

The scope interceptor can be used to pass arbitrary objects from one action ActionA to another other ActionB, provided you have a getter in ActionA and and a similar setter in actionB\. Also, you should use a key parameter to make sure you tell ASF/WW which action gets which objects\. This allows you to mix several actions with several scopes, without running the risk of getting wrong objects\.


~~~~~~~
    		<action name="scopea" class="com.mevipro.test.action.ScopeActionA">
			<result name="success" type="dispatcher">/jsp/test.jsp</result>
			<interceptor-ref name="basicStack"/>
			<interceptor-ref name="scope">
				<param name="key">funky</param>
        		<param name="session">person</param>
        		<param name="autoCreateSession">true</param>
    		</interceptor-ref>
		</action>
		<action name="scopeb" class="com.mevipro.test.action.ScopeActionB">
			<result name="success" type="dispatcher">/jsp/test.jsp</result>
			<interceptor-ref name="scope">
				<param name="key">funky</param>
        		<param name="session">person</param>
        		<param name="autoCreateSession">true</param>
    		</interceptor-ref>
			<interceptor-ref name="basicStack"/>
		</action>

~~~~~~~

Don't forget: you'll need at least a getPerson() getter in ScopeActionA and a setPerson(Person person) setter in ScopeActionB, Ã¡nd you need to make sure you specify the key (you don't need this if you only use one action, as in the example above)\. Without the key, the scope interceptor will store your variables, but won't set them on the other action\.
