---
layout: default
title: WebSphere
parent:
  title: Application Servers
  url: application-servers
---

# WebSphere

## WebSphere 5.1

 (ok) [Be sure to install WebSphere's Fix Pack 1](http://forums.opensymphony.com/thread.jspa?threadID=26068).

## WebSphere 6

See forum thread: [http://forums.opensymphony.com/message.jspa?messageID=119574\#119574](http://forums.opensymphony.com/message.jspa?messageID=119574\#119574)

> It looks like there is a bug in WebSphere App Server related to which classloader is used at the time that Struts2 is loading the properties files, (all properties files, not just struts.properties and default.properties). The bug may have been fixed in WAS 6.0.2.9, (check out this link for details [http://www-1.ibm.com/support/docview.wss?uid=swg27006876](http://www-1.ibm.com/support/docview.wss?uid=swg27006876)).
> If you just want to confirm the issue, or you need just a temporary fix, try this:
> 1) jar up all properties files for your project, (including default.properties in its full path), and put these into the WS common applications lib directory at the same level as the "profiles" directory.
> 2) Run the application - everything should work

> This solution is strictly temporary, as all struts2 apps in this instance of WAS would have to use the same properties files. A better solution:
> 1) add a servlet that initializes the Struts Dispatcher with the servlet context:
> import org.apache.struts2.dispatcher.Dispatcher;
>  
> public class LaunchServlet extends HttpServlet implements Servlet \{
>  
> 	public LaunchServlet() \{
> 		super();
> 	}
>  
> 	public void init(ServletConfig arg0) throws ServletException \{
> 		
> 		// this works around a bug in the websphere classloader.
> 		super.init(arg0);
> 		Dispatcher d = new Dispatcher(getServletContext(), new HashMap<String, String>());	
> 		
> 	}
>  
> }
> 
> 2) launch it at start-up (web.xml):
> 
>     <servlet>
>       <servlet-name>dummyaction</servlet-name>
>       <servlet-class>com.xxx.yyyyyy.service.LaunchServlet</servlet-class>
>       <load-on-startup>1</load-on-startup>
>     </servlet>
>
> 3) Run application and everything should work.

## WebSphere 6.5

To make struts2 work in Websphere, one has to set Websphere specific properties, you may want to add that to the wiki:

The properties are:

```
com.ibm.ws.webcontainer.assumefiltersuccessonsecurityerror = true
com.ibm.ws.webcontainer.invokefilterscompatibility = true
```

At least that is necessary when using StrutsPrepareAndExecuteFilter.

In Websphre admin console one has to add those properties here:

```
Servers > Application servers > {server name} > Web container > Custom Properties
```

A wsadmin jython script to set those properties could look like this:

```
def findObjectName(objectId):
        index = objectId.find('(')
        return objectId[0 : index]

node = AdminNodeManagement.listNodes()[0]
server = AdminConfig.list('Server')

nodeName = findObjectName(node)
serverName = findObjectName(server)

webContainer = AdminConfig.list('WebContainer', node)
webContainerDetails = AdminConfig.show(webContainer)

if webContainerDetails.find("com.ibm.ws.webcontainer.assumefiltersuccessonsecurityerror") == -1:
        print "creating prop: com.ibm.ws.webcontainer.assumefiltersuccessonsecurityerror"
        AdminServerManagement.configureCustomProperty(nodeName, serverName, "WebContainer","com.ibm.ws.webcontainer.assumefiltersuccessonsecurityerror", "true")
if webContainerDetails.find("com.ibm.ws.webcontainer.invokefilterscompatibility") == -1:
        print "creating prop: com.ibm.ws.webcontainer.invokefilterscompatibility"
        AdminServerManagement.configureCustomProperty(nodeName, serverName, "WebContainer", "com.ibm.ws.webcontainer.invokefilterscompatibility", "true")
```

Thanks to Christoph Nenning (christoph dot nenning at lex-com at net)

## JSESSIONID handling

IBM WebSphere Application Server uses the JSESSIONID information to keep track of the client session. If you have an application where the application client must navigate across multiple WebSphere Application Server nodes residing in same domain, then the JSESSIONID information may be over-written on the client because multiple JSESSIONID cookies received with the same name and path.

When persistence is disabled and if the JSESSIONID in the incoming request is not found in the current session manager, then the session manager will generate a new sessionId and create a session object, instead of using the sessionId in the incoming request.

To resolve this issue, configure WebSphere Application Server to reuse the sessionId present in the incoming request.

For All versions:

1. Open the administrative console.
2. Select Servers > Application Servers > Server_Name > Server Infrastructure > Java and Process Management > Process Definition > Java Virtual Machine > Custom Properties > New
3. Add a new Custom Property for the JVM to reuse the sessionId:

```
System Property Name: HttpSessionIdReuse
System Property Value: true
```

4. Save your changes and restart the Application Server.

If the application client does not navigate across multiple WebSphere Application Server nodes residing in the same domain but there are multiple WARs with different context roots, following is the step that needs to be followed for session to be maintained in one web application:

1. Open the administrative console.
2. Select Application servers > Server_Name > Session management > Cookies
3. In "Cookie Path", specify the context root of web application in which session needs to be maintained. This will ensure that cookies are sent only to /<<context_root>> URL and prevent overriding of JSSESSIONID cookie which results in new session creation by WAS.
4. Save your changes and restart the Application Server.

Thanks to Vineet Kanwal from IBM\!
