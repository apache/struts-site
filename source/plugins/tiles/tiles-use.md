---
layout: plugin
title: Tiles Use
---

# Tiles Use

Tiles uses a definition file (XML document) that must be instantiated before use. One way to render the definition file would be to use Spring. Another way would be to use a separate Listener, as shown by Tilesconfigurer.

**TilesConfigurer.java**

```java

package com.opensymphony.webwork.views.tiles;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.struts.tiles.DefinitionsFactoryConfig;
import org.apache.struts.tiles.DefinitionsFactoryException;
import org.apache.struts.tiles.TilesUtil;
import org.apache.struts.tiles.xmlDefinition.I18nFactorySet;

/*
* Modified from Spring's source
*
* here's how a smaple web xml should look like:
* <web-app>
*   <context-param>
*     <param-name>tilesDefinitions</param-name>
*     <param-value>/WEB-INF/tiles.xml</param-value>
*   </context-param>
*
*   <listener>
*      <listener-class>com.opensymphony.webwork.views.tiles.TilesConfigurer</listener-class>
*   </listener>
* </web-app>
*
* To use the definitions specified you would use a dispatcher result (since
* tiles jsp is just another jsp) to render tiles view.
*/
public class TilesConfigurer implements ServletContextListener {

    private boolean initialized = false;

    public void contextInitialized (ServletContextEvent evt) {

        if (!initialized) {
            DefinitionsFactoryConfig factoryConfig = new DefinitionsFactoryConfig();
            factoryConfig.setFactoryClassname(I18nFactorySet.class.getName());
            factoryConfig.setParserValidate(true);
            factoryConfig.setDefinitionConfigFiles(evt.getServletContext().getInitParameter("tilesDefinitions"));
            try {
                TilesUtil.createDefinitionsFactory(evt.getServletContext(), factoryConfig);
            } catch (DefinitionsFactoryException e) {
                e.printStackTrace();
            }
            initialized = true;
        }

    }

    public void contextDestroyed (ServletContextEvent evt) {
    }

}

```

> The TilesConfigurer was adapted from the Spring source code.
