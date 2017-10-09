---
layout: default
title: Tag Developers Guide (WIP)
---

# OGNL Expression Compilation

This document is meant as a development/integration guide for anyone wanting to use the new OGNL 2.7 features for doing 
byte code runtime enhancements on OGNL statements.  This is _not_  meant for general user reference as it covers what 
are mostly internal API development concerns.

## Basic Usage

By default there isn't much you have to do to use the new compilation abilities in OGNL.  Following is an example of compiling 
a simple property expression and invoking it.

```java
SimpleObject root = new SimpleObject();
OgnlContext context =  (OgnlContext) Ognl.createDefaultContext(null);

Node node =  (Node) Ognl.compileExpression(context, root, "user.name");
String userName = node.getAccessor().get(context, root);
```

You'll notice that this example references the new `ognl.enhance.ExpressionAccessor` class.  This is the interface used 
to create the enhanced expression versions of any given expression via javassist and should be used to set/get expression 
values from the compiled versions of the code.  Although the old `Ognl.getValue(node, context, root)` method of getting/setting 
values will correctly detect a compiled expression and use the accessor directly as well,  it's not going to be as fast 
as you doing it directly.

## ognl.enhance.OgnlExpressionCompiler

The core class involved in doing the management of these expression compilations by default is `ognl.enhance.ExpressionCompiler`, 
which implements `ognl.enhance.OgnlExpressionCompiler`. Although you can in theory use this default implementation it 
is not recommended for more robust integration points - such as being incorporated within a web framework. The majority 
of examples here are going to be based around the strategy that Tapestry has used to integrate these new features.

## Tapestry OGNL Integration

There are only small handful of classes/services involved in the Tapestry implementation of these features, so hopefully 
using them as a reference will help anyone trying to get started with this:

- [org.apache.tapestry.services.impl.HiveMindExpressionCompiler](http://svn.apache.org/viewvc/tapestry/tapestry4/trunk/tapestry-framework/src/java/org/apache/tapestry/services/impl/HiveMindExpressionCompiler.java?view=markup)
  The Tapestry implementation of `ognl.enhance.OgnlExpressionCompiler` - which is a subclass 
  of the `ognl.enhance.ExpressionCompiler` default implementation.
_ [org.apache.tapestry.services.impl.ExpressionEvaluatorImpl](http://svn.apache.org/viewvc/tapestry/tapestry4/trunk/tapestry-framework/src/java/org/apache/tapestry/services/impl/ExpressionEvaluatorImpl.java?view=markup)
  Main service point involved in compiling/evaluating OGNL expressions.  This is the core service that the rest of Tapestry 
  uses when dealing with OGNL expressions.
- [org.apache.tapestry.services.impl.ExpressionCacheImpl](http://svn.apache.org/viewvc/tapestry/tapestry4/trunk/tapestry-framework/src/java/org/apache/tapestry/services/impl/ExpressionCacheImpl.java?view=markup)
  Service responsible for caching OGNL statements where appropriate.
- [org.apache.tapestry.binding.ExpressionBinding](http://svn.apache.org/viewvc/tapestry/tapestry4/trunk/tapestry-framework/src/java/org/apache/tapestry/binding/ExpressionBinding.java?view=markup)
  Wrapper class which represents a single OGNL binding expression within Tapestry templates/annotations/html/etc. 
  Anything formally specified in an html attribute for components in Tapestry is represented by a specific type of `IBinding`,
  `ExpressionBinding` represents the type of bindings for OGNL expressions.
- [org.apache.tapestry.bean.BeanProviderPropertyAccessor](http://svn.apache.org/viewvc/tapestry/tapestry4/trunk/tapestry-framework/src/java/org/apache/tapestry/bean/BeanProviderPropertyAccessor.java?view=markup)
  One of the custom `PropertyAccessor` classes Tapestry registers with OGNL. This will be a good reference for the new 
  source code generation methods you will need to implement for your `PropertyAccessor` classes if you want to compile 
  expressions.

## ExpressionEvaluator

If you look at the `ExpressionEvaluator` source you'll see a block of initialization where the `HiveMindExpressionCompiler`
and `OgnlContext` pools are setup:

```java
OgnlRuntime.setCompiler(new HiveMindExpressionCompiler(_classFactory));

_contextPool = new GenericObjectPool(new PoolableOgnlContextFactory(_ognlResolver, _typeConverter));

_contextPool.setMaxActive(-1);
_contextPool.setMaxIdle(-1);
_contextPool.setMinEvictableIdleTimeMillis(POOL_MIN_IDLE_TIME);
_contextPool.setTimeBetweenEvictionRunsMillis(POOL_SLEEP_TIME);
```

Some things like null handlers/property accessor configuration has been left out but you should have enough there to get 
a good idea of what is going on.  Because creating new OgnlContext objects for every expression evaluation can be needlessly 
expensive Tapestry uses the Apache commons-pool library to manage pooling of these instances.  It is recommended that 
you do the same where you can. You will also notice in other portions of the source some new method calls made on 
`OgnlRuntime`:

```java
OgnlRuntime.clearCache();
Introspector.flushCaches();
```

The OgnlRuntime class stores static `Map`-like instances of reflection meta cache information for all objects evaluated 
in OGNL expressions.  The new `clearCache` method clears these caches out as the memory footprint can get quite large 
after a while. How often/when to call this will largely depend on how your framework works - just keep in mind that 
calling it too often will have a big impact on runtime performance of your app if you are doing normal application 
development sort of things with it.

## HiveMindExpressionCompiler

Perhaps the most important class to examine is Tapestrys implementation of `OgnlExpressionCompiler`. This class still 
extends the default `ExpressionCompiler` provided by OGNL - but does a few more things that can't be made generic enough 
to live in the default implementation.

One of these important differences is how Javassist is used to compile the expressions and the ClassLoader/ClassResolver 
it uses.  Because these expressions are being compiled against what are already Javassist enhanced Tapestry component 
class instances this implementation needed to re-use existing hivemind Javassist services so that these enhanced classes 
could be correctly resolved while OGNL is evaluating them.

If you don't have a need to provide this kind of classloading functionality you will probably still need to modify 
at least how the javassist `ClassPool` is being managed in your own implementations. The internal functionality of that 
library is such that the memory consumption of the pool is very large and will get unwieldy especially in development 
of web apps.  Tapestry has a special state that users are used to which is known as "disable caching" - more or less 
meaning that javassist enhancements happen for every request instead of only once.

Another very important piece of logic that this class handles is the generation of "fail safe" getters/setters when 
expressions just can't be compiled because of either internal errors or a specific syntax type used isn't yet able to support 
javassist compilations.  This logic can sometimes get tricky in that in many instances OGNL expressions won't be compilable 
because the full expression contains a null reference.  The basic idea is that the compiler keeps trying to compile these 
kinds of expressions until it either gets a fatal exception thrown or the full expression is able to be resolved. 
For example, the following expression would throw a `UnsupportedCompilationException` if the "user" object returned 
was null - resulting in no direct compilation being done at all:

```
"user.firstName"
```

That doesn't mean that the user object might not be resolvable the next time this expression is invoked though, 
so the next time the compiler tries it may succeed in which case the whole expression is enhanced and the new `ExpressionAccessor`
instance is attached to the root `Node` object by calling `SimpleNode.setAccessor(newInstance)`.

The fail safe logic is there for expressions that are likely to never be resolvable for one reason or another. In these 
instances a `ExpressionAccessor` class instance is still created - with the major difference being that instead of pure 
java object expressions being compiled the get/set methods on the instance just call back to the standard OGNL 
getValue/setValue methods:

```java
public Object get(OgnlContext context, Object root)
{
  return _node.getValue($1, $2);
}
```

The `$1, $2` references are Javassist constructs which allow you to specify the first and second argument passed in 
to the calling method.

## ExpressionBinding

As stated previously, this class represents a single OGNL expression in Tapestry when used directly in html templates 
- such as:

```html
<div jwcid="@Input" value="ognl:user.firstName" />
```

What you will want to examine in this class is how it deals with incrementally attempting expression evaluations using 
the local members `_writeFailed, _accessor`.  Looking through the source of this implementation will probably be the best 
documentation available - but keep in mind that in many instances this object also has to deal with the possibility 
that a write statement may never happen.

## BeanProviderPropertyAccessor / Custom PropertyAccessor implementations

Besides the `OgnlExpressionCompiler` logic this will probably be the second most impactual area people will have to deal 
with in terms of having to write new code.  In this specific instance there are three new `PropertyAccessor` methods 
you must implement in order to compile your expressions:

```java
public Class getPropertyClass(OgnlContext context, Object target, Object name)
{
  IBeanProvider provider = (IBeanProvider)target;
  String beanName = ((String)name).replaceAll("\"", "");

  if (provider.canProvideBean(beanName))
    return provider.getBean(beanName).getClass();

  return super.getPropertyClass(context, target, name);
}

public String getSourceAccessor(OgnlContext context, Object target, Object name)
{
   IBeanProvider provider = (IBeanProvider)target;
   String beanName = ((String)name).replaceAll("\"", "");

   if (provider.canProvideBean(beanName)) {

       Class type = OgnlRuntime.getCompiler().getInterfaceClass(provider.getBean(beanName).getClass());

       ExpressionCompiler.addCastString(context, "((" + type.getName() + ")");

       context.setCurrentAccessor(IBeanProvider.class);
       context.setCurrentType(type);

       return ".getBean(" + name + "))";
   }

   return super.getSourceAccessor(context, target, name);
}

public String getSourceSetter(OgnlContext context, Object target, Object name)
{
  throw new UnsupportedCompilationException("Can't set beans on IBeanProvider.");
}
```

Although this example may not provide with all of the possible use cases you may need to learn to properly implement 
these methods in your own `PropertyAccessor` implementations - the built in OGNL versions like `ObjectPropertyAccessor`, 
`MapPropertyAccessor`, `ListPropertyAccessor`, etc should provide more than enough data to work from.

The most important part of the above logic you will want to look at is in how the new `OgnlContext` methods for setting 
object/accessor types are being set:

```java
context.setCurrentAccessor(IBeanProvider.class);
context.setCurrentType(type);
```

This meta information is used by the `OgnlExpressionCompiler` to correctly cast your specific expression object types 
during compilation. This process of casting/converting in to and out of native types is the most complicated part of this 
new logic and also the source of the greatest number of bugs reported in the OGNL jira.

In this property accessor example the goal is to turn general statements like `beans.emailValidator` in to their pure 
source form - which would look something like this when all is said and done:

```java
((ValidatingBean)beanProvider.getBean("emailValidator"))
```

There is also the ever important cast handling which you must do:

```java
Class type = OgnlRuntime.getCompiler().getInterfaceClass(provider.getBean(beanName).getClass());

ExpressionCompiler.addCastString(context, "((" + type.getName() + ")");
```

In this example the `PropertyAccessor` is trying to determine the class type and manually adding the cast string for 
the specific type to the overall statement by invoking the utility method `addCastString(OgnlContext, String)` on 
`ExpressionCompiler`. In many instances of expression compilation you might also be dealing with unknown method calls, 
where the more preferred way to do this kind of logic would be something like this: (taken from the OGNL 
`ObjectPropertyAccessor` implementation)

```java
Method m = ...(various reflection gynamistics used to find a java.reflect.Method instance)

context.setCurrentType(m.getReturnType());
context.setCurrentAccessor(OgnlRuntime.getCompiler().getSuperOrInterfaceClass(m, m.getDeclaringClass()));
```

When dealing with method calls it is very important that you do this specific kind of type setting on the `OgnlContext` 
class so that the casting done on your statements (which happens outside of the `ObjectPropertyAccessor` in this instance) 
can be done on the highest level interface defining that method.  This becomes important when you are dealing with expressions 
that you would like to re-use against different object instances.  For example, suppose we had an ognl expression like 
this (for Tapestry):

```
user.firstName
```

and the object it was compiled against was an instance of something looking like this:

```java
public abstract LoginPage extends BasePage implements UserPermissions {

  public abstract User getUser();

}

..
/**
 * Interface for any page/component that holds references to the current system
 * User.
 */
public interface UserPermissions {
   User getUser();
}
```

`BasePage` is a Tapestry specific class which is unimportant in this example.  What is important to know is that if we 
had done something like this in the previous context setting example:

```java
context.setCurrentType(m.getReturnType());
context.setCurrentAccessor(m.getDeclaringClass());
```

It would have resulted in a compiled expression of:

```java
public void get(OgnlContext context, Object root) {
  return ((LoginPage)root).getUser();
}
```

This is undesirable in situations where you would like to re-use OGNL expressions across many different class instances 
(which is what Tapestry does via the `ExpressionCacheImpl` listed above).  The better/more re-usable compiled version 
should really look like:

```java
public void get(OgnlContext context, Object root) {
  return ((UserPermissions)root).getUser();
}
```

These are the more delicate parts of the compiler API that the majority of people will need to worry about during any 
integration efforts.

## Known Issues / Limitations

## Compiler Errors

Despite the substantially large number of unit tests set up and thorough usage of many different 
types of expressions Tapestry users are still currently running in to fatal/non caught runtime errors when some of their 
OGNL expressions are compiled.  In some instances these errors are blockers and they must either wait for someone 
to fix the bug (after being posted to [http://jira.opensymphony.com/browse/OGNL](http://jira.opensymphony.com/browse/OGNL) 
correctly) or re-work their expression to get around the error.  I (jesse) generally try to fix these reported errors
within a day or two (or sooner) when I can and immediately deploy the fixes to the OGNL snapshot maven2 repository.  
This doesn't mean that the vast majority of expressions won't compile fine, but it is something to keep in mind when 
you decide how to integrate the compiler logic in to your own framework.

## Compile vs. normal expression evaluation

The current Tapestry implementation compiles OGNL expressions in both  development AND production modes.  This has 
the undesirable side effect of causing needless multiple method invocations on objects when compiling as well as the general 
overhead of performing compilations at all when people are just developing applications and not serving them in production 
environments.  It is hoped that when OGNL becomes final this special development mode can go back to using normal OGNL 
expression evaluation during development and save compilation for production environments,  but until then we've been 
worried about giving people false positives when testing their applications.  Meaning - something may evaluate just fine 
when using 

```java
Ognl.getValue(OgnlContext, Object root, String expression
```

but fail completely when they deploy their app to production and the compiler kicks in.  If you framework doesn't handle 
separate modes or have this kind of state set up it is something to keep in mind.  The number of JIRA issues reported 
has gone way down since this all started but they do still trickle in which is enough to know that things aren't yet 100% 
reliable.  I'm sure the plethora of Struts/WebWork/etc users available should be enough to iron out any remaining issues 
found but it's something to keep in mind.

## Snapshot Repository

The current maven2 location of the OGNL development/snapshot release are all made to [http://opencomponentry.com/repository/m2-snapshot-repo/](http://opencomponentry.com/repository/m2-snapshot-repo/), 
while releases go out to ibiblio as per normal.  If someone has a better place for these release to be made please feel free to contact jesse ( jkuhnert at gmail.com) with accessor information / instructions.

