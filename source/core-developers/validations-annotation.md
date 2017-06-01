---
layout: core-developers
title: Validations Annotation
---

# Validations Annotation


~~~~~~~
{snippet:id=description|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validations}
~~~~~~~

#####Usage#####



~~~~~~~
{snippet:id=usage|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validations}
~~~~~~~

#####Parameters#####



~~~~~~~
{snippet:id=parameters|javadoc=true|url=com.opensymphony.xwork2.validator.annotations.Validations}
~~~~~~~

#####Examples#####



~~~~~~~
{snippet:id=example|javadoc=true|lang=java|url=com.opensymphony.xwork2.validator.annotations.Validations}
~~~~~~~

#####Different validations per method#####


Different validations per method is NOT supported for client\-side validation\!

| 

To use different validations per method, the validateAnnotatedMethodOnly property must be set on the validation interceptor\.


~~~~~~~

<interceptor-ref name="validation">
  <param name="validateAnnotatedMethodOnly">true</param>                
  <param name="excludeMethods">input,back,cancel,browse</param>
</interceptor-ref>

~~~~~~~

Here's a complete example of updating the default stack:


~~~~~~~

  <package name="default" extends="struts-default">
    <interceptors>
      <interceptor-stack name="content">
        <interceptor-ref name="exception"/>
                <interceptor-ref name="alias"/>
                <interceptor-ref name="servletConfig"/>
                <interceptor-ref name="prepare"/>
                <interceptor-ref name="i18n"/>
                <interceptor-ref name="chain"/>
                <interceptor-ref name="debugging"/>
                <interceptor-ref name="profiling"/>
                <interceptor-ref name="scopedModelDriven"/>
                <interceptor-ref name="modelDriven"/>
                <interceptor-ref name="fileUpload"/>
                <interceptor-ref name="checkbox"/>
                <interceptor-ref name="staticParams"/>
                <interceptor-ref name="params">
                  <param name="excludeParams">dojo\..*</param>
                </interceptor-ref>
                <interceptor-ref name="conversionError"/>
                <interceptor-ref name="validation">
  	            <param name="validateAnnotatedMethodOnly">true</param>                
                    <param name="excludeMethods">input,back,cancel,browse</param>
                </interceptor-ref>
                <interceptor-ref name="workflow">
                    <param name="excludeMethods">input,back,cancel,browse</param>
                </interceptor-ref>
      </interceptor-stack>
    </interceptors>
    <default-interceptor-ref name="default"/>
  </package>
</struts>

~~~~~~~
