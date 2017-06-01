---
layout: core-developers
title: RestfulActionMapper
---

# RestfulActionMapper


A custom action mapper using the following format:


~~~~~~~
http://HOST/ACTION_NAME/PARAM_NAME1/PARAM_VALUE1/PARAM_NAME2/PARAM_VALUE2
~~~~~~~

You can have as many parameters you'd like to use\. Alternatively the URL can be shortened to the following:


~~~~~~~
http://HOST/ACTION_NAME/PARAM_VALUE1/PARAM_NAME2/PARAM_VALUE2
~~~~~~~

This is the same as:


~~~~~~~
http://HOST/ACTION_NAME/ACTION_NAME + "Id"/PARAM_VALUE1/PARAM_NAME2/PARAM_VALUE2
~~~~~~~

Suppose for example we would like to display some articles by id at using the following URL sheme:


~~~~~~~
http://HOST/article/Id
~~~~~~~

Your action just needs a setArticleId() method, and requests such as /article/1, /article/2, etc will all map to that URL pattern\.

#####Restful2ActionMapper#####

Improved restful action mapper that adds several ReST\-style improvements to action mapping, but supports fully\-customized URL's via XML\. The two primary REST enhancements are:

+ If the method is not specified (via '\!' or 'method:' prefix), the method is "guessed" at using ReST\-style conventions that examine the URL and the HTTP method\.

+ Parameters are extracted from the action name, if parameter name/value pairs are specified using PARAM\_NAME/PARAM\_VALUE syntax\.

These two improvements allow a GET request for 'category/action/movie/Thrillers' to be mapped to the action name 'movie' with an id of 'Thrillers' with an extra parameter named 'category' with a value of 'action'\.  A single action mapping can then handle all CRUD operations using wildcards, e\.g\.


~~~~~~~

<action name="movie/*" className="app.MovieAction">
    <param name="id">{1}</param>
    ...
</action>

~~~~~~~

This mapper supports the following parameters:

+ _struts\.mapper\.idParameterName_  \- if set, this value will be the name of the parameter under which the id is stored\.  The id will then be removed from the action name\.  This allows restful actions to not require wildcards\.

The following URL's will invoke its methods:

|Request                    |method called|
|---------------------------|-------------|
| GET: /movie/               |method="index" |
| GET: /movie/Thrillers      | method="view", id="Thrillers" |
| GET: /movie/Thrillers\!edit | method="edit", id="Thrillers" |
| GET: /movie/new            | method="editNew" |
| POST: /movie/              | method="create" |
| PUT: /movie/Thrillers      | method="update", id="Thrillers" |
| DELETE: /movie/Thrillers   | method="remove", id="Thrillers" |

To simulate the HTTP methods PUT and DELETE, since they aren't supported by HTML, the HTTP parameter "\_\_http\_method" will be used\.

The syntax and design for this feature was inspired by the REST support in Ruby on Rails\. See [Simple RESTful support](http://ryandaigle\.com/articles/2006/08/01/whats\-new\-in\-edge\-rails\-simply\-restful\-support\-and\-how\-to\-use\-it)^[http://ryandaigle\.com/articles/2006/08/01/whats\-new\-in\-edge\-rails\-simply\-restful\-support\-and\-how\-to\-use\-it]

__Example__

To use the Restful2ActionMapper in an existing struts application we have to change the strus\.mapper\.class constant and let it point to the Restful2ActionMapper


~~~~~~~

<constant name="struts.mapper.class" value="org.apache.struts2.dispatcher.mapper.Restful2ActionMapper" />

~~~~~~~

The problem with the above approach is that we may break existing actions because the Restful2ActionMapper tries to guess the method name using conventions that aren't applicable to normal action classes\.

To overcome the above problem, we have to use a different action mapper depending on the url we want to process\. REST actions will be processed by the Restful2ActionMapper and non\-REST actions by the DefaultActionMapper

To achieve that we have to rely on namespaces and the PrefixBasedActionMapper that can choose which action mapper to use for a particular url based on a prefix (the action namespace)\.

To put everything together, we create a package for our rest actions


~~~~~~~

<package name="rest" namespace="/rest" extends="struts-default">
    ....interceptor config
    <action name="movie/*" class="app.MovieAction">
        <param name="id">{1}</param>
        ....results
    </action>
    ....
</package>

~~~~~~~

All other actions remain in their existing packages and namespaces we use the PrefixBasedActionMapper telling it to use the Restful2ActionMapper for actions in the /rest namespace and the DefaultActionMapper for all other actions


~~~~~~~

<constant name="struts.mapper.class" value="org.apache.struts2.dispatcher.mapper.PrefixBasedActionMapper" />
<constant name="struts.mapper.prefixMapping" value="/rest:restful2,:struts" />

~~~~~~~

For the Restful2ActionMapper to work we also have to set


~~~~~~~

<constant name="struts.enable.SlashesInActionNames" value="true" />
<constant name="struts.mapper.alwaysSelectFullNamespace" value="false" />

~~~~~~~

__Unit testing__

Below you will find a simple unit test to test how to test actions when 

~~~~~~~
Restful2ActionMapper
~~~~~~~
 is used\.


~~~~~~~

public class MovieActionTest extends StrutsJUnit4TestCase<MovieActionTest>{
    
    @Before
    public void setUp() throws Exception {
        //assumes Basic authentication
        super.setUp();
        String credentials = "username:password";
        request.addHeader("authorization", "BASIC " + Base64.encodeBase64String(credentials.getBytes()));
    }
        
    @Test
    public void testIndex() throws Exception {
        request.setMethod("get"); //Http method should be set
        
        ActionProxy proxy = getActionProxy("/rest/movie/");                        
      
        proxy.setExecuteResult(false);
        String result = proxy.execute();
        
       //assertions ...        
    }
    
    @Test
    public void testView() throws Exception {
        request.setMethod("get"); //Http method should be set
              
        ActionProxy proxy = getActionProxy("/rest/movie/1");                        
        MovieAction movieAction = MovieAction.class.cast(proxy.getAction());
           
        proxy.setExecuteResult(false);
        
        String result = proxy.execute();
        //assertions ...
        assertEquals("1", movieAction.getId());         
    }
}

~~~~~~~

Thanks to Antonios Gkogkakis for the examples\!

