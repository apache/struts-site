---
layout: default
title: Alt Syntax
parent:
  title: Tag Developers Guide
  url: index
---

# Alt Syntax

> Note: This page is history. The `%{ ... }` notation described here is the only tag syntax since Struts 2.6, when the
> option to disable it was removed (WW-3877). See [Tag Syntax](tag-syntax) for how tag attributes are evaluated today.

The _altSyntax_ was an option introduced in WebWork 2.1.4 that changed how tag attributes are interpreted. Before it,
every tag attribute was evaluated against the value stack as an expression, so string literals had to be marked with
single quotes. With the altSyntax, only expressions enclosed in `%{}` are evaluated and everything else is taken
literally.

The old syntax:

```jsp
<s:iterator value="cart.items">
   ...
   <s:textfield label="'Cart item No.' + #rowstatus.index + ' note'" 
                 name="'cart.items[' + #rowstatus.index + '].note'" 
                 value="note" />
</s:iterator>
```

This was counter-intuitive next to normal HTML tag behaviour and produced loads of single quotes. The same example in
the altSyntax, which is the syntax Struts uses today:

```jsp
<s:iterator value="cart.items">
   ...
   <s:textfield label="Cart item No. %{#rowstatus.index} note" 
                 name="cart.items[%{#rowstatus.index}].note" 
                 value="%{note}" />
</s:iterator>
```

The code is shorter and clearer, very similar to JSTL EL usage, and quoting problems, e.g. with JavaScript function
calls, are avoided.

## History

The book WebWork in Action, while based around WebWork 2.1.7, was entirely written with the assumption that the
altSyntax was enabled. As of WebWork 2.2 it was turned on by default, with a `struts.xml` constant and a per-request
`useAltSyntax` flag to switch back to the old syntax. Struts 2.6 removed both, and with them the old syntax.

Documentation written for the old syntax survives in places. If you meet an example where a plain property name is
passed to `value` on a form tag and expected to be evaluated, it predates the altSyntax; today that requires
`value="%{property}"`.
