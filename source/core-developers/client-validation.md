---
layout: core-developers
title: Client Validation
---

# Client Validation

Let's create a Client\-Side validation workflow, step by step\.

(information) The 

~~~~~~~
validate
~~~~~~~
 attribute is set to 

~~~~~~~
true
~~~~~~~
\.

(information) Some themes do not support client\-side validation\.

#####Step 1#####

Create the form\.

~~~~~~~
{snippet:id=clientValidation|lang=xml|javadoc=false|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/quiz-client.jsp}
~~~~~~~
(information) This case uses the default xhtml theme, so the 

~~~~~~~
<s:head >
~~~~~~~
 tag is used to link a style sheet\.

#####Step 2#####

Create the Action class\.

~~~~~~~
{snippet:id=quizAction|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/QuizAction.java}
~~~~~~~

__Step 3__

Create the 

~~~~~~~
validation.xml
~~~~~~~
 to configure the validators to be used\.

~~~~~~~
{snippet:id=quizValidators|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/QuizAction-validation.xml}
~~~~~~~

__Action and Namespace__

A correct action and namespace attributes must be provided to the \<s:form\> tag\. For example, if the action named "quizClient" is defined in the "/validation" namespace, the form must be configured as:


~~~~~~~
<s:form method="post" validate="true" action="quizClient" namespace="/validation">
   <s:textfield label="Name" name="name"/>
   <s:textfield label="Age" name="age"/>
   <s:textfield label="Favorite color" name="answer"/>
   <s:submit/>
</s:form> 

~~~~~~~

While the following will "work" in the sense that the form will function correctly, **client\-side validation will not**\. That is because Struts must know the exact namespace and action (rather than a URL) to properly support validation\.


~~~~~~~
<s:form method="post" validate="true" action="/validation/quizClient.action">
   <s:textfield label="Name" name="name"/>
   <s:textfield label="Age" name="age"/>
   <s:textfield label="Favorite color" name="answer"/>
   <s:submit/>
</s:form> 

~~~~~~~