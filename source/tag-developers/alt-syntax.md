---
layout: default
title: Alt Syntax
parent:
  title: Tag Developers Guide
  url: index
---

# Alt Syntax

> Note: As from Struts 2.6 option to disable the AltSyntax has been removed and now using %{...} is the only way 
> to create an expression as stated below.

The _altSyntax_ is an option that can be defined in `struts.xml`. By default it is set to true and it is **strongly** 
recommend you do not change that unless you are upgrading from WebWork 2.1.7 or previous versions.

> You can also turn on the altSyntax on a per-page basis by using the _set_ tag. Simply set the name _useAltSyntax_  
> to the value _true_ . From this point on, all tags will use the altSyntax for the rest of the request.

The altSyntax changes the behavior of how tags are interpreted. Instead of evaluating each tag parameter against 
the value stack and needing single quotes to mark string literals, only marked expressions are evaluated.

Example:

the following code uses the [Tag Syntax](tag-syntax):

```jsp
<s:iterator value="cart.items">
   ...
   <s:textfield label="'Cart item No.' + #rowstatus.index + ' note'" 
                 name="'cart.items[' + #rowstatus.index + '].note'" 
                 value="note" />
</s:iterator>
```

this is somewhat counter intuitive to normal HTML tag behaviour, and you get loads of single quotes. Now the same example 
in altSyntax:

```jsp
<s:iterator value="cart.items">
   ...
   <s:textfield label="Cart item No. %{#rowstatus.index} note" 
                 name="cart.items[%{#rowstatus.index}].note" 
                 value="%{note}" />
</s:iterator>
```

Only expressions enclosed with `%{}` are evaluated. The code is shorter and clearer, very similar to JSTL EL usage. 
Quoting problems, eg. with javascript function calls, are avoided.

In order to fully understand why this option exists and what the differences are, it is best to get a bit of history 
about WebWork.

> If you are _not_ upgrading from WebWork 2.1.7 or previous versions and you don't care about the history of WebWork's 
> evolution, you can skip this section. See the [Tag Syntax](tag-syntax) section for more information 
> on the standard tag syntax support


## History

In WebWork 2.1.4, the altSyntax option was introduced. The book, WebWork in Action, while based around WebWork 2.1.7, 
was entirely written with the assumption that the altSyntax was enabled. As of WebWork 2.2, the altSyntax is turned 
on by default and eventually the old syntax will no longer be supported and will be removed from the code.
