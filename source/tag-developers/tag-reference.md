---
layout: default
title: Tag Reference
parent:
  title: Tag Developers Guide
  url: index
---

# Tag Reference 
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

Generic tags are used for controlling the execution flow when the pages render. These tags also allow for data extraction 
from places other than your action or the value stack, such as _Localization_ , JavaBeans, and including additional URLs 
or action executions.

- Control Tags provide control flow, such as `if`, `else`, and `iterator`
- Data Tags allow for data manipulation or creation, such as `bean`, `push`, and `i18n`

> Please make sure you have read the [Tag Syntax](tag-syntax.html) document and understand how tag attribute syntax works.

## Generic Tags

Struts Generic Tags control the execution flow as pages render.

|**Control Tags**|                               |**Data Tags**|                 
|                |[if](if-tag.html)              |             |[a](a-tag.html)              |   
|                |[elseif](elseif-tag.html)      |             |[action](action-tag.html)    |
|                |[else](else-tag.html)          |             |[bean](bean-tag.html)        |
|                |[append](append-tag.html)      |             |[date](date-tag.html)        |
|                |[generator](generator-tag.html)|             |[debug](debug-tag.html)      |
|                |[iterator](iterator-tag.html)  |             |[i18n](i18n-tag.html)        |
|                |[merge](merge-tag.html)        |             |[include](include-tag.html)  |
|                |[sort](sort-tag.html)          |             |[param](param-tag.html)      |   
|                |[subset](subset-tag.html)      |             |[property](property-tag.html)|
|                |                               |             |[push](push-tag.html)        |
|                |                               |             |[set](set-tag.html)          |
|                |                               |             |[text](text-tag.html)        |
|                |                               |             |[url](url-tag.html)          |


## UI Tag Reference

Struts UI Tags display data in rich and reusable HTML.

|**Form Tags**|                                                     |**Non-Form UI Tags**    |
|             |[checkbox](checkbox-tag.html)                        |                        |[actionerror](actionerror-tag.html)    |
|             |[checkboxlist](checkboxlist-tag.html)                |                        |[actionmessage](actionmessage-tag.html)|
|             |[combobox](combobox-tag.html)                        |                        |[component](component-tag.html)        |
|             |[datetextfield](datetextfield-tag.html)              |                        |[fielderror](fielderror-tag.html)      |
|             |[doubleselect](doubleselect-tag.html)                |                        |                                       |
|             |[head](head-tag.html)                                |                        |                                       |
|             |[file](file-tag.html)                                |                        |                                       |
|             |[form](form-tag.html)                                |                        |                                       |
|             |[hidden](hidden-tag.html)                            |                        |                                       |
|             |[inputtransferselect](inputtransferselect-tag.html)  |                        |                                       |
|             |[label](label-tag.html)                              |                        |                                       |
|             |[optiontransferselect](optiontransferselect-tag.html)|                        |                                       |
|             |[optgroup](optgroup-tag.html)                        |                        |                                       |
|             |[password](password-tag.html)                        |                        |                                       |
|             |[radio](radio-tag.html)                              |                        |                                       |
|             |[reset](reset-tag.html)                              |                        |                                       |
|             |[select](select-tag.html)                            |                        |                                       |
|             |[submit](submit-tag.html)                            |                        |                                       |
|             |[textarea](textarea-tag.html)                        |                        |                                       |
|             |[textfield](textfield-tag.html)                      |                        |                                       |
|             |[token](token-tag.html)                              |                        |                                       |
|             |[updownselect](updownselect-tag.html)                |                        |                                       |
