---
layout: core-developers
title: Configuration Files
---

# Configuration Files

From a Struts developer point of view, the one required configuration file used by the framework is 

~~~~~~~
web.xml
~~~~~~~
\.  From here, you have full control over how Struts configures both itself and your application\.  By default, Struts will load a set of internal configuration files to configure itself, then another set to configure your application, however it is possible to build an entire Struts application without writing a single configuration file other than 

~~~~~~~
web.xml
~~~~~~~
\.

The table lists the files that you can use to configure the framework for your application\. Some configuration files can be reloaded dynamically\. Dynamic reloading makes interactive development possible\. See [Reloading configuration](reloading-configuration.html) for more\.

| File | Optional | Location (relative to webapp) | Purpose |
|------|----------|-------------------------------|---------|
|[web.xml](web-xml.html)| no | /WEB\-INF/ | Web deployment descriptor to include all necessary framework components |
|[struts.xml](struts-xml.html)| yes | /WEB\-INF/classes/ | Main configuration, contains result/view types, action mappings, interceptors, and so forth \
|
|[struts.properties](struts-properties.html)| yes | /WEB\-INF/classes/ | Framework properties |
|[struts\-default\.xml](struts-default-xml.html)| yes | /WEB\-INF/lib/struts2\-core\.jar | Default configuration provided by Struts |
|[struts\-default\.vm](struts-default-vm.html)| yes | /WEB\-INF/classes/ | Default macros referenced by velocity\.properties|
| struts\-plugin\.xml | yes | At the root of a plugin JAR| Optional configuration files for _Plugins_  in the same format as struts\.xml\. |
|[velocity\.properties](velocity-properties.html)| yes | /WEB\-INF/classes/ | Override the default _Velocity_  configuration |

####Static Content####

Common static content that is needed by the framework (JavaScript and CSS files, etc\.) is served automatically by the FilterDispatcher filter\.  Any request starting with "

~~~~~~~
/struts/
~~~~~~~
" denotes that static content is required, and then mapping the value after "

~~~~~~~
/struts/
~~~~~~~
" to common packages in the framework and, optionally in the application's class path\.

By default, the following packages are searched:

+ org\.apache\.struts2\.static

+ template

Additional packages can be specified by providing a comma separated list to the configuration parameter named "packages" (configured in web\.xml for the FilterDispatcher filter)\. When specifying additional static content, you should be careful not to expose sensitive configuration information (such as the password to a database)\.
