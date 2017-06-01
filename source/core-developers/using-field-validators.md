---
layout: core-developers
title: Using Field Validators
---

# Using Field Validators

#####Description#####

The followings show a simple example using Struts' Field Validators

__Step 1__

Create the jsp page

~~~~~~~
{snippet:id=fieldValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/fieldValidatorsExample.jsp}
~~~~~~~

__Step 2__

Create the action class

~~~~~~~
{snippet:id=fieldValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/FieldValidatorsExampleAction.java}
~~~~~~~

__Step 3__

Create the validator\.xml\.

~~~~~~~
{snippet:id=fieldValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/FieldValidatorsExampleAction-submitFieldValidatorsExamples-validation.xml}
~~~~~~~
