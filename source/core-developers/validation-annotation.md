---
layout: core-developers
title: Validation Annotation
---

# Validation Annotation



~~~~~~~
{snippet:id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation}
~~~~~~~

#####Usage#####



~~~~~~~
{snippet:id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation}
~~~~~~~

#####Parameters#####



~~~~~~~
{snippet:id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validation}
~~~~~~~

#####Examples#####

**An Annotated Interface**

+ Mark the interface with @Validation()

+ Apply standard or custom annoations at method level



~~~~~~~
{snippet:id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validation}
~~~~~~~

**An Annotated Class**


~~~~~~~
{snippet:id=example2|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validation}
~~~~~~~


> 

> 

> When multiple methods are used to map different actions on the same class, and one of them is annotated with _@Validations_ , those validators will be triggered for all the actions, unless they are annotated with @SkipValidation or _validateAnnotatedMethodOnly_  is set to _true_  in the "validation" interceptor, like:

> 
 > \<interceptor\-ref name="validation"\>
 >     \<param name="validateAnnotatedMethodOnly"\>true\</param\>
 >     \<param name="excludeMethods"\>input,back,cancel,browse\</param\>
 > \</interceptor\-ref\>
 > 
 