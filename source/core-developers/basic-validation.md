---
layout: core-developers
title: Basic Validation
---

# Basic Validation

Let's configure a basic validation workflow, step by step\.

#####Step 1#####

Create the input form\.

~~~~~~~
{snippet:id=basicValidation|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/webapp/WEB-INF/validation/quiz-basic.jsp}
~~~~~~~

#####Step 2#####

Create the Action class\.

~~~~~~~
{snippet:id=quizAction|javadoc=false|lang=java|url=struts2/apps/showcase/src/main/java/org/apache/struts2/showcase/validation/QuizAction.java}
~~~~~~~

#####Step 3#####

Create the validators\. The 

~~~~~~~
validation.xml
~~~~~~~
 format is either 

~~~~~~~
<ActionClassName>-validation.xml
~~~~~~~
 or 

~~~~~~~
<ActionClassName>-<ActionAliasName>-validation.xml
~~~~~~~
\.

~~~~~~~
{snippet:id=quizValidators|javadoc=false|lang=xml|url=struts2/apps/showcase/src/main/resources/org/apache/struts2/showcase/validation/QuizAction-validation.xml}
~~~~~~~

#####Step 4#####

Make sure there is a result for "input" listed in the struts\.xml for when the validation fails:


~~~~~~~
<action name="HelloWorld" class="tutorial.HelloWorld">
<result name="success">/tutorial/createconfirm.jsp</result>
<result name="error">/tutorial/error.jsp</result>
<result name="input">/tutorial/create.jsp</result>
</action>

~~~~~~~

If you don't have this, you'll get a: "No result defined for action xxx\.xxx\.tutorial\.HellowWorld and result input" error
