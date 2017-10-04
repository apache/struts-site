---
layout: core-developers
title: Parameter Filter Interceptor
---

# Parameter Filter Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor {% endcomment %}
<p>
 The Parameter Filter Interceptor blocks parameters from getting
 to the rest of the stack or your action. You can use multiple 
 parameter filter interceptors for a given action, so, for example,
 you could use one in your default stack that filtered parameters
 you wanted blocked from every action and those you wanted blocked 
 from an individual action you could add an additional interceptor
 for each action.
 </p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor {% endcomment %}
<p>
 <ul>
 <li>allowed - a comma delimited list of parameter prefixes
  that are allowed to pass to the action</li>
 <li>blocked - a comma delimited list of parameter prefixes 
 that are not allowed to pass to the action</li>
 <li>defaultBlock - boolean (default to false) whether by
 default a given parameter is blocked. If true, then a parameter
 must have a prefix in the allowed list in order to be able 
 to pass to the action
 </ul>
 
 <p>The way parameters are filtered for the least configuration is that
 if a string is in the allowed or blocked lists, then any parameter
 that is a member of the object represented by the parameter is allowed
 or blocked respectively.</p>
 
 <p>For example, if the parameters are:
 <ul>
 <li>blocked: person,person.address.createDate,personDao</li>
 <li>allowed: person.address</li>
 <li>defaultBlock: false</li>
 </ul>

 <p>
 The parameters person.name, person.phoneNum etc would be blocked 
 because 'person' is in the blocked list. However, person.address.street
 and person.address.city would be allowed because person.address is
 in the allowed list (the longer string determines permissions).</p> </p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor {% endcomment %}

#####Example#####



~~~~~~~

<interceptors>
    ... 
    <interceptor name="parameterFilter" class="com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor"/>
    ... 
</interceptors>

<action ....> 
     ... 
     <interceptor-ref name="parameterFilter"> 
          <param name="blocked">person,person.address.createDate,personDao</param> 
     </interceptor-ref> 
     ... 
</action>

~~~~~~~

