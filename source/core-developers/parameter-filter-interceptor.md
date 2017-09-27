---
layout: core-developers
title: Parameter Filter Interceptor
---

# Parameter Filter Interceptor



~~~~~~~
{% snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor %}
~~~~~~~

#####Parameters#####



~~~~~~~
{% snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ParameterFilterInterceptor %}
~~~~~~~

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

