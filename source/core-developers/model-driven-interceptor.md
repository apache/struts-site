---
layout: core-developers
title: Model Driven Interceptor
---

# Model Driven Interceptor



~~~~~~~
{snippet:id=description|javadoc=true|url=com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor}
~~~~~~~



| To create a Model Driven action, implement the ModelDriven interface by adding a model property, or at least the accessor\.

| 

| 

| public Object getModel() \.\.\.

| 

| 

| In the implementation of getModel, acquire an instance of a business object and return it\.

| 

| 

| On the page, you can address any JavaBean properties on the business object as if they were coded directly on the Action class\. (The framework pushes the Model object onto the ValueStack\.)

| 

| 

| Many developers use Spring to acquire the business object\. With the addition of a setModel method, the business logic can be injected automatically\.

| 

#####Parameters#####



~~~~~~~
{snippet:id=parameters|javadoc=true|url=com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor}
~~~~~~~

#####Extending the Interceptor#####



~~~~~~~
{snippet:id=extending|javadoc=true|url=com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor}
~~~~~~~

#####Examples#####



~~~~~~~
{snippet:id=example|lang=xml|javadoc=true|url=com.opensymphony.xwork2.interceptor.ModelDrivenInterceptor}
~~~~~~~
