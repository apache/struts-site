---
layout: plugin
title: JSON plugin
---

# JSON Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

The JSON plugin provides a `json` result type that serializes actions into JSON

1. The `content-type` must be `application/json`
2. The JSON content must be well formed, see [json.org](http://www.json.org) for grammar.
3. Action must have a public "setter" method for fields that must be populated.
4. Supported types for population are: Primitives (int,long...String), Date, List, Map, Primitive Arrays, 
  other class (more on this later), and Array of Other class.
5. Any object in JSON, that is to be populated inside a list, or a map, will be of type Map (mapping from properties 
  to values), any whole number will be of type Long, any decimal number will be of type Double, and any array of type List.

Given this JSON string:

```json
{
   "doubleValue": 10.10,
   "nestedBean": {
      "name": "Mr Bean"
   },
   "list": ["A", 10, 20.20, {
      "firstName": "El Zorro"
   }],
   "array": [10, 20] 
}
```

The action must have a `setDoubleValue` method, taking either a `float` or a `double` argument (the interceptor will 
convert the value to the right one). There must be a `setNestedBean` whose argument type can be any class, that has 
a `setName` method taking as argument an `String`. There must be a `setList` method that takes a `List` as argument, 
that list will contain: "A" (`String`), 10 (`Long`), 20.20 (`Double`), Map (`firstName` -> `El Zorro`). 
The `setArray` method can take as parameter either a `List`, or any numeric array.

> So serialize your objects to JSON in javascript see [json2](http://json.org/json2.js).

`root` attribute must be set on the `JSONInterceptor` when dealing with JSON array.

This plugin also provides _AJAX Validation_.

## Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory. No other 
files need to be copied or created.

To use maven, add this to your pom:

```xml
<dependencies>
   ...
   <dependency>
       <groupId>org.apache.struts</groupId>
       <artifactId>struts2-json-plugin</artifactId>
       <version>STRUTS_VERSION</version>
   </dependency>
   ...
</dependencies>
```

## Customizing Serialization and Deserialization

Use the JSON annotation to customize the serialization/deserialization process. Available JSON annotation fields:

|Name|Description|Default Value|Serialization|Deserialization|
|----|-----------|-------------|-------------|---------------|
|name|Customize field name|empty|yes|no|
|serialize|Include in serialization|true|yes|no|
|deserialize|Include in deserialization|true|no|yes|
|format|Format used to format/parse a Date field|"yyyy-MM-dd'T'HH:mm:ss"|yes|yes|

### Excluding properties

A comma-delimited list of regular expressions can be passed to the JSON Result and Interceptor, properties matching 
any of these regular expressions will be ignored on the serialization process:

```xml
<!-- Result fragment -->
<result type="json">
  <param name="excludeProperties">
    login.password,
    studentList.*.sin
  </param>
</result>

<!-- Interceptor fragment -->
<interceptor-ref name="json">
  <param name="enableSMD">true</param>
  <param name="excludeProperties">
    login.password,
    studentList.*.sin
  </param>
</interceptor-ref>
```

### Including properties

A comma-delimited list of regular expressions can be passed to the JSON Result to restrict which properties will 
be serialized. ONLY properties matching any of these regular expressions will be included in the serialized output.

> Exclude property expressions take precedence over include property expressions. That is, if you use include 
> and exclude property expressions on the same result, include property expressions will not be applied if an 
> exclude property expression matches a property first.

```xml
<!-- Result fragment -->
<result type="json">
  <param name="includeProperties">
    ^entries\[\d+\].clientNumber,
    ^entries\[\d+\].scheduleNumber,
    ^entries\[\d+\].createUserId
  </param>
</result>
```

### Root Object

Use the `root` attribute (OGNL expression) to specify the root object to be serialized.

```xml
<result type="json">
  <param name="root">
    person.job
  </param>
</result>
```

The `root` attribute (OGNL expression) can also be used on the interceptor to specify the object that must be 
populated, **make sure this object is not null**.

```xml
<interceptor-ref name="json">
  <param name="root">bean1.bean2</param>
</interceptor-ref>
```

### Wrapping

For several reasons you might want to wrap the JSON output with some text, like wrapping with comments, adding a prefix, 
or to use file uploads which require the result to be wrapped in a textarea. Use `wrapPrefix` to add content in 
the beginning and `wrapPostfix` to add content at the end. This settings take precedence over `wrapWithComments` 
and `prefix` which are deprecated from 0.34 on. Examples:

- Wrap with comments:

```xml
<result type="json">
  <param name="wrapPrefix">/*</param>
  <param name="wrapSuffix">*/</param>
</result>
```

- Add a prefix:

```xml
<result type="json">
  <param name="wrapPrefix">{}&&</param>
</result>
```

- Wrap for file upload:

```xml
<result type="json">
  <param name="wrapPrefix"><![CDATA[<html><body><textarea>]]></param>
  <param name="wrapSuffix"><![CDATA[</textarea></body></html>]]></param>
</result>
```

### Wrap with Comments

`wrapWithComments` is deprecated from 0.34, use `wrapPrefix` and `wrapSuffix` instead.

> `wrapWithComments` can turn safe JSON text into dangerous text. For example,
> `"\*/ alert('XSS'); /\*"` 
> Thanks to Douglas Crockford for the tip! Consider using **prefix** instead.

If the serialized JSON is `{name: 'El Zorro'}`. Then the output will be: `{}&& ({name: 'El Zorro'})`. 

If the `wrapWithComments` (false by default) attribute is set to true, the generated JSON is wrapped with comments like:

```json
/* {
   "doubleVal": 10.10,
   "nestedBean": {
      "name": "Mr Bean"
   },
   "list": ["A", 10, 20.20, {
      "firstName": "El Zorro"
   }],
   "array": [10, 20] 
} */
```
To strip those comments use:

```javascript
var responseObject = eval("("+data.substring(data.indexOf("\/\*")+2, data.lastIndexOf("\*\/"))+")");
```

### Prefix

`prefix` is deprecated from 0.34, use `wrapPrefix` and `wrapSuffix` instead.

If the parameter `prefix` is set to true, the generated JSON will be prefixed with `{}&& `. This will help prevent 
hijacking. See [this Dojo Ticket](http://trac.dojotoolkit.org/ticket/6380) for details:

```xml
<result type="json">
  <param name="prefix">true</param>
</result>
```

### Base Classes

By default properties defined on base classes of the `root` object won't be serialized, to serialize properties 
in all base classes (up to Object) set `ignoreHierarchy` to false in the JSON result:

```xml
<result type="json">
  <param name="ignoreHierarchy">false</param>
</result>
```

### Enumerations

By default, an Enum is serialized as a `name=value` pair where `value = name()`.

```java
  public enum AnEnum {
     ValueA,
     ValueB
  }
```

```json  
  "myEnum":"ValueA"
```

Use the `enumAsBean` result parameter to serialize Enum's as a bean with a special property `_name` with value `name()`. 
All properties of the enum are also serialized.

```java
  public enum AnEnum {
     ValueA("A"),
     ValueB("B");

     private String val;
     
     public AnEnum(val) {
        this.val = val;
     }
     public getVal() {
        return val;
     }
   }
```

```json
  myEnum: { "_name": "ValueA", "val": "A" }
```

Enable this parameter through `struts.xml`:

```xml
<result type="json">
  <param name="enumAsBean">true</param>
</result>
```

### Compressing the output

Set the `enableGZIP` attribute to true to gzip the generated json response. The request **must** include `gzip` 
in the `Accept-Encoding` header for this to work.

```xml
<result type="json">
  <param name="enableGZIP">true</param>
</result>
```

### Preventing the browser from caching the response

Set `noCache` to true (false by default) to set the following headers in the response:

- `Cache-Control: no-cache`
- `Expires: 0`
- `Pragma: No-cache`

```xml
<result type="json">
  <param name="noCache">true</param>
</result>
```

### Excluding properties with null values

By default fields with null values are serialized like `{property_name: null}`. This can be prevented 
by setting `excludeNullProperties` to true.

```xml
<result type="json">
  <param name="excludeNullProperties">true</param>
</result>
```

### Status and Error code

Use `statusCode` to set the status of the response:

```xml
<result type="json">
  <param name="statusCode">304</param>
</result>
```

And `errorCode` to send an error (the server might end up sending something to the client which is not the serialized JSON):

```json
<result type="json">
  <param name="errorCode">404</param>
</result>
```

### JSONP

To enable JSONP, set the parameter `callbackParameter` in either the JSON Result or the Interceptor. A parameter with 
that name will be read from the request, and it value will be used as the JSONP function. Assuming that a request is 
made with the parameter "callback"="exec":

```xml
<result type="json">
  <param name="callbackParameter">callback</param>
</result>
```

And that the serialized JSON is `{name: 'El Zorro'}`. Then the output will be: `exec({name: 'El Zorro'})`. 

### Content Type

Content type will be set to `application/json-rpc` by default if SMD is being used, or `application/json` otherwise. 
Sometimes it is necessary to set the content type to something else, like when uploading files with Dojo and YUI. 
Use the `contentType`  parameter in those cases.

```xml
<result type="json">
  <param name="contentType">text/html</param>
</result>
```

### Encoding

User can define encoding per result or base on default assigned to `struts.i18n.encoding`. To define encoding for 
given result add encoding param as below:

```xml
<result type="json">
  <param name="encoding">UTF-8</param>
</result>
```

### Customizing the output

Since Struts 2.5.14, you can implement the `org.apache.struts2.json.JSONWriter` interface to customize the generated json response.
The implementation should then be defined in `struts.xml` like:

```xml
<struts>
    <bean type="org.apache.struts2.json.JSONWriter" name="myJSONWriter" class="com.mycompany.MyJSONWriter"
          scope="prototype"/>
    <constant name="struts.json.writer" value="myJSONWriter"/>
</struts>
```

## Example

### Setup Action

This simple action has some fields:

Example:

```java
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.Action;

public class JSONExample {
    private String field1 = "str";
    private int[] ints = {10, 20};
    private Map map = new HashMap();
    private String customName = "custom";

    //'transient' fields are not serialized
    private transient String field2;

    //fields without getter method are not serialized
    private String field3;

    public String execute() {
        map.put("John", "Galt");
        return Action.SUCCESS;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1;
    }

    public int[] getInts() {
        return ints;
    }

    public void setInts(int[] ints) {
        this.ints = ints;
    }

    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }

    @JSON(name="newName")
    public String getCustomName() {
        return this.customName;
    }
}
```

### Write the mapping for the action

1. Add the map inside a package that extends `json-default`
2. Add a result of type `json`

Example with Convention Plugin Configuration:

```java
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Result;

@Result(type = "json")
public class JSONExample extends ActionSupport {
// action code
}
```

Example with XML Configuration:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">

<struts>

  <package name="example"  extends="json-default">
     <action name="JSONExample" class="example.JSONExample">
        <result type="json"/>
     </action>
  </package>

</struts>
```

### JSON example output

```json
{  
   "field1" : "str", 
   "ints": [10, 20],
   "map": {
       "John":"Galt"
   },
   "newName": "custom"
}
```

### Accepting JSON

Your actions can accept incoming JSON if they are in package which uses `json` interceptor or by adding reference 
to it as follow:

```jaba
@InterceptorRef(value="json")
```

By default `Content-Type` of value `application/json` is recognised to be used for de-serialisation 
and `application/json-rpc` to execute SMD processing. You can override those settings be defining `jsonContentType`
and `jsonRpcContentType` params, see example:

```xml
<interceptor-ref name="json">
  <param name="jsonContentType">text/json</param>
  <param name="jsonRpcContentType">text/json-rpc</param>
</interceptor-ref>
```

Please be aware that those are scoped params per stack, which means, once set it will be used by actions in scope of this stack.

## JSON RPC

The json plugin can be used to execute action methods from javascript and return the output. This feature was developed 
with Dojo in mind, so it uses [Simple Method Definition](http://manual.dojotoolkit.org/WikiHome/DojoDotBook/Book9)
to advertise the remote service. Let's work it out with an example(useless as most examples).

First write the action:

```java
package smd;

import com.googlecode.jsonplugin.annotations.SMDMethod;
import com.opensymphony.xwork2.Action;

public class SMDAction {
    public String smd() {
        return Action.SUCCESS;
    }
    
    @SMDMethod
    public Bean doSomething(Bean bean, int quantity) {
        bean.setPrice(quantity * 10);
        return bean;
    }
}
```

Methods that will be called remotely **must** be annotated with the `SMDMethod` annotation, for security reasons. 
The method will take a bean object, modify its price and return it. The action can be annotated with the `SMD` annotation 
to customize the generated SMD (more on that soon), and parameters can be annotated with `SMDMethodParameter`. As you 
can see, we have a "dummy", `smd` method. This method will be used to generate the Simple Method Definition 
(a definition of all the services provided by this class), using the `json` result.

The bean class:

```java
package smd;

public class Bean {
    private String type;
    private int price;
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

}
```

The mapping:

```xml
<package name="RPC" namespace="/nodecorate" extends="json-default">
    <action name="SMDAction" class="smd.SMDAction" method="smd">
        <interceptor-ref name="json">
            <param name="enableSMD">true</param>
        </interceptor-ref>
        <result type="json">
             <param name="enableSMD">true</param>
        </result>
    </action>
</package>
```

Nothing special here, except that **both** the interceptor and the result must be applied to the action, and `enableSMD` 
must be enabled for both.

Now the javascript code:

```jsp
<s:url id="smdUrl" namespace="/nodecorate" action="SMDAction" />
<script type="text/javascript">
    //load dojo RPC
    dojo.require("dojo.rpc.*");
    
    //create service object(proxy) using SMD (generated by the json result)
    var service = new dojo.rpc.JsonService("${smdUrl}");
    
    //function called when remote method returns
    var callback = function(bean) {
        alert("Price for " + bean.type + " is " + bean.price);
    };
    
    //parameter
    var bean = {type: "Mocca"};
    
    //execute remote method
    var defered = service.doSomething(bean, 5);

    //attach callback to defered object
    defered.addCallback(callback);
</script>
```

Dojo's JsonService will make a request to the action to load the SMD, which will return a JSON object with the definition 
of the available remote methods, using that information Dojo creates a "proxy" for those methods. Because of the asynchronous 
nature of the request, when the method is executed, a deferred object is returned, to which a callback function can be attached. 
The callback function will receive as a parameter the object returned from your action. That's it.

## Proxied objects

As annotations are not inherited in Java, some user might experience problems while trying to serialize objects that 
are proxied. eg. when you have attached AOP interceptors to your action.

In this situation, the plugin will not detect the annotations on methods in your action.

To overcome this, set the `ignoreInterfaces` result parameter to false (true by default) to request that the plugin 
inspects all interfaces and superclasses of the action for annotations on the action's methods.

> This parameter should only be set to false if your action could be a proxy as there is a performance cost caused 
> by recursion through the interfaces.

```xml
<action name="contact" class="package.ContactAction" method="smd">
   <interceptor-ref name="json">
      <param name="enableSMD">true</param>
      <param name="ignoreSMDMethodInterfaces">false</param>
   </interceptor-ref>
   <result type="json">
      <param name="enableSMD">true</param>
      <param name="ignoreInterfaces">false</param>
   </result>
   <interceptor-ref name="default"/>
</action>
```
