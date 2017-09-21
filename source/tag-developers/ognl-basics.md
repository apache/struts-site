---
layout: default
title: Tag Developers Guide (WIP)
---

# OGNL Basics
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Struts-specific language features

The biggest addition that Struts provides on top of OGNL is the support for the ValueStack. While OGNL operates under 
the assumption there is only one "root", Struts's ValueStack concept requires there be many "roots".

For example, suppose we are using standard OGNL (not using Struts) and there are two objects in the OgnlContext map: 
"foo" -> foo and "bar" -> bar and that the foo object is also configured to be the single **root** object. 
The following code illustrates how OGNL deals with these three situations:

```
#foo.blah // returns foo.getBlah()
#bar.blah // returns bar.getBlah()
blah      // returns foo.getBlah() because foo is the root
```

What this means is that OGNL allows many objects in the context, but unless the object you are trying to access is the root, 
it must be prepended with a namespaces such as @bar. Now let's talk about how Struts is a little different...

> In Struts, the entire ValueStack is the root object in the context. Rather than having your expressions get the object 
> you want from the stack and then get properties from that (ie: peek().blah), Struts has a special OGNL PropertyAccessor 
> that will automatically look at the all entries in the stack (from the top down) until it finds an object with the property 
> you are looking for.

For example, suppose the stack contains two objects: Animal and Person. Both objects have a "name" property, Animal has 
a "species" property, and Person has a "salary" property. Animal is on the top of the stack, and Person is below it. 
The follow code fragments help you get an idea of what is going on here:

```
species    // call to animal.getSpecies()
salary     // call to person.getSalary()
name       // call to animal.getName() because animal is on the top
```

In the last example, there was a tie and so the animal's name was returned. Usually this is the desired effect, but 
sometimes you want the property of a lower-level object. To do this, XWork has added support for indexes on the ValueStack. 
All you have to do is:

```
[0].name   // call to animal.getName()
[1].name   // call to person.getName()
```

With expression like `[0] ... [3]` etc. Struts will cut the stack and still return back a CompoundRoot object. To get 
the top of that particular stack cut, use `[0].top`

|ognl expression|description|
|---------------|-----------|
|`[0].top`|would get the top of the stack cut starting from element 0 in the stack (similar to top in this case)|
|`[1].top`|would get the top of the stack cut starting from element 1 in the stack|

### Accessing static properties

OGNL supports accessing static properties as well as static methods.

By default, Struts 2 is configured to disallow this - to enable OGNL's static member support you must set the
`struts.ognl.allowStaticMethodAccess` constant to `true` via any of the [Constant Configuration](../core-developers/constant-configuration.html) methods.

OGNL's static access looks like this:

```
@some.package.ClassName@FOO_PROPERTY
@some.package.ClassName@someMethod()
```

However, Struts allows you to avoid having to specify the full package name and call static properties and methods of your 
action classes using the "vs" prefix:

```
<at:var at:name="vs" />FOO_PROPERTY
<at:var at:name="vs" />someMethod()

<at:var at:name="vs1" />FOO_PROPERTY
<at:var at:name="vs1" />someMethod()

<at:var at:name="vs2" />BAR_PROPERTY
<at:var at:name="vs2" />someOtherMethod()
```

"vs" stands for "value stack". The important thing to note here is that if the class name you specify is just "vs", 
the class for the object on the top of the stack is used. If you specify a number after the "vs" string, an object's 
class deeper in the stack is used instead.

### Differences from the WebWork 1.x EL

Besides the examples and descriptions given above, there are a few major changes in the EL since WebWork 1.x. The biggest 
one is that properties are no longer accessed with a forward slash (/) but with a dot (.). Also, rather than using ".." 
to traverse down the stack, we now use "[n]" where n is some positive number. Lastly, in WebWork 1.x one could access 
special named objects (the request scope attributes to be exact) by using "@foo", but now special variables are accessed 
using "#foo". However, it is important to note that "#foo" does NOT access the request attributes. Because XWork is not 
built only for the web, there is no concept of "request attributes", and thus "#foo" is merely a request to another 
object in the OgnlContext other than the root.

|Old Expression|New Expression|
|--------------|--------------|
|foo/blah|foo.blah|
|foo/someMethod()|foo.someMethod()|
|../bar/blah|[1].bar.blah|
|@baz|not directly supported, but #baz is similar|
|.|'top' or [0]|

### Struts 2 Named Objects

Struts 2 places request parameters and request, session, and application attributes on the OGNL stack. They may be accessed 
as shown below.

|name|value|
|----|-----|
|#action['foo'] or #action.foo|current action getter (getFoo())|
|#parameters['foo'] or #parameters.foo|request parameter ['foo'] (request.getParameter())|
|#request['foo'] or #request.foo|request attribute ['foo'] (request.getAttribute())|
|#session['foo'] or #session.foo|session attribute 'foo'|
|#application['foo'] or #application.foo|ServletContext attributes 'foo'|
|#attr['foo'] or #attr.foo|Access to PageContext if available, otherwise searches request/session/application respectively|
