---
layout: default
title: CSP Interceptor
parent:
    title: Interceptors
    url: interceptors.html
---

# Content Security Policy Interceptor
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

Interceptor that implements Content Security Policy on incoming requests.

Content Security Policy (CSP) is an added layer of security that helps to detect and mitigate certain types of attacks, 
including Cross-Site Scripting (XSS) and data injection attacks. These attacks are used for everything from data theft, 
to site defacement, to malware distribution.

CSP can work in two modes, either **enforce** or **report**. In the report mode the `Content-Security-Policy-Report-Only`
header is sent and `Content-Security-Policy` header is used when using the enforce mode.

CSP is now supported by all major browsers. [More information about CSP](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP).

The interceptor adds a nonce value automatically to `<s:script>` and `<s:link>` tags. This provides a painless way to
implement CSP in a highly secure fashion.

## Parameters

- `enforcingMode` (default `false`) - When set to "true", the enforce mode has been enabled, and the provided policy 
  is going to be enforced.
- `reportUri` - an uri under which the violations will be reported.
- `prependServletContext` (default `true`) - a flag to prepend or not the Servlet context to the `reportUri`
- `cspSettingsClassName` (default to `DefaultCspSettings.class`) - a full class name implementing `CspSettings` interface
  to allow to define a custom CPS settings. It's alternative approach of using the [CspSettingsAware](#action-aware) 
  interface below.

## Report action

To receive reports about violations against CSP an abstract `CspReportAction` action has been created, which you can
extend to process the reports. When extending the action you must implement `processReport(String)` to process the report.
Read JavaDoc of the action for more details.

> Note: the action must always return an HTTP status `204`.

## Action aware

Since Struts 6.2.0 it is possible to configure the CSP interceptor by providing the an instance of `CspSettings` interface.
Please use `CspSettingsAware` interface and implement the `getCspSettings()` method to steer the policy per action.

```java
public class MyAction implements CspSettingsAware {
    
    public String execute() {
        return "success";
    }
    
    public CspSetting getCspSettings() {
      ...
    }
}
```

## Examples

```xml
<action  name="someAction" class="com.examples.SomeAction">
    <interceptor-ref name="defaultStack">
        <param name="csp.enforcingMode">true</param>
        <param name="csp.reportUri">/csp-report.action</param>
    </interceptor-ref>
    <result name="success">good_result.ftl</result>
</action>
```
