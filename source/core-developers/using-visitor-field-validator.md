---
layout: core-developers
title: Using Visitor Field Validator
---

# Using Visitor Field Validator

#####Description#####

The followings show a simple example using Webwork's Field Validators

__Step 1__

Create the jsp page\.

{% snippet id=visitorValidatorsExample|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/visitorValidatorsExample.jsp %}

__Step 2__

Create the action class\.

{% snippet id=visitorValidatorsExample|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/VisitorValidatorsExampleAction.java %}

__Step 3__

Create the validator\.xml\.

{% snippet id=visitorValidatorsExample|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/VisitorValidatorsExampleAction-submitVisitorValidatorsExamples-validation.xml %}