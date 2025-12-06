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

Generic tags are used for controlling the execution flow when the pages render. These tags also allow for data
extraction from places other than your action or the value stack, such as _Localization_ , JavaBeans, and including
additional URLs or action executions.

- Control Tags provide control flow, such as `if`, `else`, and `iterator`
- Data Tags allow for data manipulation or creation, such as `bean`, `push`, and `i18n`

> Please make sure you have read the [Tag Syntax](tag-syntax) document and understand how tag attribute syntax works.

## Generic Tags

Struts Generic Tags control the execution flow as pages render.

| **Control Tags**           | **Data Tags**            | **Other Tags**           |
|----------------------------|--------------------------|--------------------------|
| [if](if-tag)               | [a](a-tag)               | [compress](compress-tag) |
| [elseif](elseif-tag)       | [action](action-tag)     | [script](script-tag)     |   
| [else](else-tag)           | [bean](bean-tag)         | [link](link-tag)         |
| [append](append-tag)       | [date](date-tag)         |                          |
| [generator](generator-tag) | [debug](debug-tag)       |                          |
| [iterator](iterator-tag)   | [i18n](i18n-tag)         |                          |
| [merge](merge-tag)         | [include](include-tag)   |                          |
| [sort](sort-tag)           | [param](param-tag)       |                          |   
| [subset](subset-tag)       | [property](property-tag) |                          |
|                            | [push](push-tag)         |                          |
|                            | [set](set-tag)           |                          |
|                            | [text](text-tag)         |                          |
|                            | [url](url-tag)           |                          |

## UI Tag Reference

Struts UI Tags display data in rich and reusable HTML.

| **Form Tags**                                    | **Non-Form UI Tags**               |
|--------------------------------------------------|------------------------------------|
| [checkbox](checkbox-tag)                         | [actionerror](actionerror-tag)     |
| [checkboxlist](checkboxlist-tag)                 | [actionmessage](actionmessage-tag) |
| [combobox](combobox-tag)                         | [component](component-tag)         |
| [datetextfield](datetextfield-tag)               | [fielderror](fielderror-tag)       |
| [doubleselect](doubleselect-tag)                 |                                    |
| [head](head-tag)                                 |                                    |
| [file](file-tag)                                 |                                    |
| [form](form-tag)                                 |                                    |
| [hidden](hidden-tag)                             |                                    |
| [inputtransferselect](inputtransferselect-tag)   |                                    |
| [label](label-tag)                               |                                    |
| [optiontransferselect](optiontransferselect-tag) |                                    |
| [optgroup](optgroup-tag)                         |                                    |
| [password](password-tag)                         |                                    |
| [radio](radio-tag)                               |                                    |
| [reset](reset-tag)                               |                                    |
| [select](select-tag)                             |                                    |
| [submit](submit-tag)                             |                                    |
| [textarea](textarea-tag)                         |                                    |
| [textfield](textfield-tag)                       |                                    |
| [token](token-tag)                               |                                    |
| [updownselect](updownselect-tag)                 |                                    |
