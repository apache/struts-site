---
layout: core-developers
title: DispatcherListener
---

# DispatcherListener

Use a `DispatcherListener` object to execute code when a Dispatcher is initialized or destroyed. A `DispatcherListener` 
is an easy way to associate customizable components like a [ConfigurationManager](configuration-provider-and-configuration) 
with a Dispatcher.

## Example

```java
  static {
     Dispatcher.addDispatcherListener(new DispatcherListener() {
         public void dispatcherInitialized(Dispatcher du) {
            // do something to Dispatcher after it is initialized eg.
            du.setConfigurationManager(....);
         }

         public void dispatcherDestroyed(Dispatcher du) {
            // do some cleanup after Dispatcher is destroyed.
         }
     });
  }
```
