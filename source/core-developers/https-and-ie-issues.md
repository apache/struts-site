---
layout: core-developers
title: HTTPS and IE Issues
---

# HTTPS and IE Issues

 When trying to stream PDF's, TIFF's, and various other types of content over HTTPS to certain versions of Internet Explorer you may trigger a creative (broken) interpretation of the HTTP spec\. The following interceptor should be applied to your actions to set the HTTP headers cache settings to private\. This should avoid the issue\. (You should \*only\* do this if you are running over HTTPS\!)


```java

package org.tuxbot.ww.interceptor;

import com.opensymphony.xwork.interceptor.AroundInterceptor;
import com.opensymphony.xwork.ActionInvocation;
import com.opensymphony.webwork.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
/**
 * This interceptor sets the the HTTP Header to work around IE SSL weirdness  *
 * @author Eric Molitor <a href="mailto:eric@tuxbot.com">eric@tuxbot.com</a>
 * @version 1.0
 */
public class HTTPRequestCachePrivateInterceptor extends AroundInterceptor {

    protected void after(ActionInvocation actionInvocation, String string) throws Exception {
        // Nothing
    }

    protected void before(ActionInvocation actionInvocation) throws Exception {
        HttpServletResponse res = (HttpServletResponse) actionInvocation.getInvocationContext().get(ServletActionContext.HTTP_RESPONSE);
        res.setHeader("CACHE-CONTROL", "PRIVATE");
    }
}

```
