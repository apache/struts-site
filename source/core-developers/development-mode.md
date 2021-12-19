---
layout: core-developers
title: Development Mode
---

# Development Mode (aka "devMode")

Please turn this option off before deploying application to a production environment - it can expose sensitive data of your application!

Struts 2 has a setting (which can be set to `true` or `false` in [default.properties](default-properties)) 
called devMode (= development mode). When this setting is enabled, Struts 2 will provide additional logging and debug 
information, which can significantly speed up development.

You can also set this constant in your struts.xml file: `<constant name="struts.devMode" value="true" />`.

This is the preferred method. See [Constant Configuration](constant-configuration) for more information.

## What does it do?

- When enabled, Struts 2 will reload your **resource bundles on every request** (meaning you can change your .properties 
  files, save them, and see the changes reflected on the next request). 
  **Note**: this option can also be set standalone via `struts.i18n.reload = true`
- It will also **reload your xml configuration files** ([struts.xml](struts-xml)), your **validation files**, 
  and so on, on every request. This is useful for testing or fine-tuning your configuration without having to redeploy 
  your application every time.
  **Note**: this option can also be set standalone via `struts.configuration.xml.reload = true`
- And thirdly, perhaps the setting which is less widely known, and therefore a source of much confusion: it will 
  **raise the level of debug or normally ignorable problems to errors**. For example: when you 
  **submit a field which cannot be set on an action** 'someUnknownField', it will normally be ignored. However, when 
  you're in development mode, **an exception will be thrown**, telling you an invalid field was submitted. This is very 
  useful for debugging or testing large forms, but can also be confusing if you're relying on parameters in your request 
  that are not set on the action, but which you are using directly in your view layer (**warning**: bad practice, 
  you should always validate input from the web).

## Don't forget...

By default, the development mode is disabled, because it has a significant impact on [performance](performance-tuning), 
since the entire configuration will be reloaded on every request.

## Page rendering is slow

If you experience slow page rendering when `devMode` is on it's mostly because Freemarker cache is disabled during 
`devMode`. You can explicit enable cache and any other options disabled by `devMode`, see example below:

```xml
<constant name="struts.devMode" value="true" />
<constant name="struts.i18n.reload" value="false"/>
<constant name="struts.configuration.xml.reload" value="false"/>
<constant name="struts.freemarker.templatesCache" value="true"/>
<constant name="struts.freemarker.templatesCache.updateDelay" value="120"/>
<constant name="struts.freemarker.mru.max.strong.size" value="120"/>
```
As you can see, you can switch `devMode` on and still have production options on as well.

Please remember to use production optimized options which can be different than these used during development 
(especially cache related)!
