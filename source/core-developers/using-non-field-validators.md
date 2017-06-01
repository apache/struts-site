---
layout: core-developers
title: Using Non Field Validators
---

# Using Non Field Validators

#####Description#####

The followings show a simple example using Webwork's Non Field Validators

__Step 1__

Create the jsp page

~~~~~~~
{snippet:id=nonFieldValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/nonFieldValidatorsExample.jsp}
~~~~~~~

__Step 2__

Create the action class

~~~~~~~
{snippet:id=nonFieldValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/NonFieldValidatorsExampleAction.java}
~~~~~~~

__Step 3__

Create the validator\.xml\.

~~~~~~~
{snippet:id=nonFieldValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/NonFieldValidatorsExampleAction-submitNonFieldValidatorsExamples-validation.xml}
~~~~~~~
