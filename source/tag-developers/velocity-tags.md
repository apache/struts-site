---
layout: default
title: Velocity Tags
parent:
  title: Tag Developers Guide
  url: index
---

# Velocity Tags

Velocity tags are extensions of the generic [Struts Tags](struts-tags) provided by the framework. You can get jump
right in just by knowing the structure in which the tags can be accessed: `#s<tag> (...)`, 
where **tag** is any of the [Struts Tags](struts-tags) supported by the framework.

For example, in JSP you might create a form using Struts tags.

**JSP Form**

```jsp
<s:form action="updatePerson">
    <s:textfield label="First name" name="firstName"/>
    <s:submit value="Update"/>
</s:form>
```

In Velocity, the same form can also be built using macros.

**VM Form**

```
#sform ("action=updatePerson")
    #stextfield ("label=First name" "name=firstName")
    #ssubmit ("value=Update")
#end
```

## Block and Inline Tags

Some VM tags require an #end statement while others do not. The inconsistency arises from a limitation in Velocity 
where tags must declare if they are a _block_ or _inline_ tag up front. As such, by default all tags are _inline_ 
except for a few key ones, such as the [form](form-tag) tag.
