---
layout: core-developers
title: Scoped Model Driven Interceptor
---

# Scoped Model Driven Interceptor



{% comment %}start snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}
<p>
 An interceptor that enables scoped model-driven actions.

 <p>This interceptor only activates on actions that implement the {@link ScopedModelDriven} interface.  If
 detected, it will retrieve the model class from the configured scope, then provide it to the Action.</p>
  </p>
{% comment %}end snippet id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}

#####Parameters#####



{% comment %}start snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}
<p>
 <ul>

 <li>className - The model class name.  Defaults to the class name of the object returned by the getModel() method.</li>
            
 <li>name - The key to use when storing or retrieving the instance in a scope.  Defaults to the model
            class name.</li>

 <li>scope - The scope to store and retrieve the model.  Defaults to 'request' but can also be 'session'.</li>
 </ul>
</p>
{% comment %}end snippet id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}

#####Extending the Interceptor#####



{% comment %}start snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}
<p>
 There are no known extension points for this interceptor.
</p>
{% comment %}end snippet id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}

#####Examples#####



{% comment %}start snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}

```xml
 
 <-- Basic usage -->
 <interceptor name="scopedModelDriven" class="com.opensymphony.interceptor.ScopedModelDrivenInterceptor" />
 
 <-- Using all available parameters -->
 <interceptor name="gangsterForm" class="com.opensymphony.interceptor.ScopedModelDrivenInterceptor">
      <param name="scope">session</param>
      <param name="name">gangsterForm</param>
      <param name="className">com.opensymphony.example.GangsterForm</param>
  </interceptor>
 
```

{% comment %}end snippet id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.ScopedModelDrivenInterceptor {% endcomment %}
