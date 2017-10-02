---
layout: default
title: Tag Developers Guide (WIP)
---

# ajax common header

To use this tag:

- Add: `<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>`  to your page.
- The [head](head-tag.html) tag must be included on the page, which can be configured for performance or debugging purposes.
- If the `parseContent` parameter for the [head](head-tag.html) tag is false (it is false by default), then the **id** tag is required.

For more examples see [Ajax and JavaScript Recipes](ajax-and-javascript-recipes.html)


#####autocompleter##### {#PAGE_46753}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/autocompleter.html %}

__Examples__

Get list from an action:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Uses a list:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Autocompleter that reloads its content everytime the text changes (and the length of the text is greater than 3):


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Linking two autocompleters:


{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Set/Get selected values using JavaScript:


{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using beforeNotifyTopics:


{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using errorNotifyTopics:


{% snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using errorNotifyTopics:


{% snippet id=example8|lang=html|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

Using valueNotifyTopics:


{% snippet id=example9|lang=html|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Autocompleter.java %}

__Caveats__

+ The service that is producing the HTTP Response with JSON response to the Autocompleter tag must set the HTTP Header Response Content-Type to 

~~~~~~~
text/json
~~~~~~~
. JSON has its own MIME type, which this tag expects.

+ Since 2.0.9, there is a change in the value:key order. Now, the value **must** come before the key.

#####bind##### {#PAGE_66798}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ . Resulting in an "undefined" message in the content's, instead of the result of the request.

One possible alternative is to set _showLoadingText="false"_  and set the indicator attribute to an element showing the desired loading text or image (outside the div).


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <s:submit id="btn" />
        <sx:bind sources="btn" events="onclick" targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/bind.html %}

__Examples__

Without attaching to an event, listening to a topic (used to make an Ajax call):


{% snippet id=example0|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

Attached to event 'onclick' on submit button:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

Submit form:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

Using beforeNotifyTopics:


{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

Using afterNotifyTopics and highlight:


{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

Using errorNotifyTopics and indicator:


{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Bind.java %}

#####checkbox##### {#PAGE_14029}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Checkbox %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/checkbox.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Checkbox %}

#####checkboxlist##### {#PAGE_13969}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean %}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.CheckboxList %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/checkboxlist.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.CheckboxList %}

#####combobox##### {#PAGE_14259}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ComboBox %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/combobox.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.ComboBox %}

#####component##### {#PAGE_14033}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.GenericUIBean %}

{% snippet id=note|javadoc=true|url=org.apache.struts2.components.GenericUIBean %}

**(!) templateDir and theme attribute**


> 

> 

> The final path to the template will be built using the _templateDir_  and _template_  attributes, like \${templateDir}/\${theme}/\${template}. If for example your component is under /components/html/option.jsp, you would have to set templateDir="components", theme="html" and template="options.jsp". 

> 

> 

> For any Struts tag that you use in your component, make sure that you set its templateDir="template"

> 

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/component.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.GenericUIBean %}

#####datetextfield##### {#PAGE_40506485}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DateTextField %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/datetextfield.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DateTextField %}

#####datetimepicker##### {#PAGE_14274}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/datetimepicker.html %}

__Examples__



{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java %}

Getting and getting the datetimepicker value, from JavaScript:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java %}

Publish topic when value changes


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/DateTimePicker.java %}

#####div##### {#PAGE_13908}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Div %}



| While this tag can be used with the [simple theme](#PAGE_14291), [xhtml theme](#PAGE_13834), and others, it is really designed to work best with the [ajax theme](#PAGE_14205). We recommend reading the _ajax div template_  documentation for more details.

| 

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/div.html %}

#####dojo div##### {#PAGE_66929}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/div.html %}

__Examples__

Simple div that loads its content once:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java %}

div that reloads its content every 2 seconds, and shows an indicator while reloading:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java %}

div that uses topics to control the timer, highlights its content in red after reload, and submits a form:


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Div.java %}

#####dojo head##### {#PAGE_66757}

__Description__


{% snippet id=notice|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}


> 

> 

> If you are planning to nest tags from the Dojo plugin, make sure you set parseContent="false", otherwise each request made by the inner tags will be performed twice.

> 

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/head.html %}

__Examples__



{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Head.java %}

#####dojo textarea##### {#PAGE_66931}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TextArea.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/textarea.html %}

#####doubleselect##### {#PAGE_14005}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleListUIBean %}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleSelect %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/doubleselect.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.DoubleSelect %}

#####fielderror##### {#PAGE_14151}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.FieldError %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/fielderror.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.FieldError %}


{% snippet id=description|javadoc=true|url=org.apache.struts2.components.FieldError %}

#####file##### {#PAGE_14283}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.File %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/file.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.File %}

#####form##### {#PAGE_14201}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Form %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/form.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Form %}

__Validation__

There are two flavours _Client Side Validation_ , depending on the theme you are using (xhtml, ajax, etc). If you are using the [xhtml theme](#PAGE_13834) or [css_xhtml theme](#PAGE_14215), pure client side validation will be used. If you are using the [ajax theme](#PAGE_14205), a special AJAX-based validation will take place. Read the _Client Side Validation_  docs for more information.

#####head##### {#PAGE_13997}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Head %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/head.html %}

__Examples__



{% snippet id=example1|lang=xml|javadoc=true|url=org.apache.struts2.components.Head %}

#####hidden##### {#PAGE_14313}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Hidden %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/hidden.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Hidden %}

#####inputtransferselect##### {#PAGE_17268774}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.InputTransferSelect %}

{% snippet id=notice|javadoc=true|url=org.apache.struts2.components.InputTransferSelect %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/inputtransferselect.html %}

__Example__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.InputTransferSelect %}

#####label##### {#PAGE_14167}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Label %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/label.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Label %}


{% snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.Label %}

#####optgroup##### {#PAGE_14170}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptGroup %}

{% snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptGroup %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/optgroup.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptGroup %}

#####optiontransferselect##### {#PAGE_13943}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.DoubleListUIBean %}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect %}


{% snippet id=notice|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/optiontransferselect.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.OptionTransferSelect %}

#####password##### {#PAGE_13826}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Password %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/password.html %}

__Examples__



{% snippet id=exdescription|javadoc=true|lang=none|url=org.apache.struts2.components.Password %}


{% snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Password %}

#####radio##### {#PAGE_14226}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean %}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Radio %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/radio.html %}

__Examples__



{% snippet id=exdescription|javadoc=true|url=org.apache.struts2.components.Radio %}


{% snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio %}


{% snippet id=example_fmt|javadoc=true|lang=xml|url=org.apache.struts2.components.Radio %}

#####reset##### {#PAGE_13833}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Reset %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/reset.html %}

__Examples__

__Example 1__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset %}

__Example 2__



{% snippet id=example2|lang=xml|javadoc=true|url=org.apache.struts2.components.Reset %}

#####select##### {#PAGE_14127}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Select %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/select.html %}

__Examples__



{% snippet id=exnote|javadoc=true|lang=none|url=org.apache.struts2.components.Select %}


{% snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Select %}

#####submit##### {#PAGE_14054}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Submit %}



| To use method attribute (to use multiple submit buttons which direct to different action methods) you must set **struts.enable.DynamicMethodInvocation** to **true** but this can lead to [security vulnerability](http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation)^[http://www.brucephillips.name/blog/index.cfm/2011/2/19/Struts-2-Security-Vulnerability--Dynamic-Method-Invocation] - use with care! Instead you can try to use _Multiple Submit Buttons_  solution.

| 


This tag works with all themes, but has special importance when combined with the [form](#PAGE_14201) tag in the [ajax theme](#PAGE_14205). Please read up on the [ajax theme](#PAGE_14205) for more information.

| 

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/submit.html %}

#####tabbedPanel##### {#PAGE_14222}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html %}

__Examples__

The following is an example of a tabbedpanel and panel tag utilizing local and remote content:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java %}

Use notify topics to prevent a tab from being selected:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TabbedPanel.java %}

#####textarea##### {#PAGE_13926}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.TextArea %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/textarea.html %}

__Example__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextArea %}

#####textfield##### {#PAGE_13912}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.TextField %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/textfield.html %}

__Examples__



{% snippet id=exdescription|lang=none|javadoc=true|url=org.apache.struts2.components.TextField %}


{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.TextField %}

#####token##### {#PAGE_13998}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.Token %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/token.html %}

__Examples__



{% snippet id=example|javadoc=true|lang=xml|url=org.apache.struts2.components.Token %}

#####tree##### {#PAGE_14168}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/tree.html %}

__Examples__

Static tree:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java %}

Dynamic tree (rendered on the server):


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java %}

Dynamic tree loaded with AJAX (one request is made for each node):


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Tree.java %}

#####treenode##### {#PAGE_14288}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/treenode.html %}

__Examples__

Update target content with html returned from an action:


{% snippet id=example|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/TreeNode.java %}

#####updownselect##### {#PAGE_13884}


Please make sure you have read the [Tag Syntax](#PAGE_13927) document and understand how tag attribute syntax works.

| 


{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.ListUIBean %}

__Description__



{% snippet id=javadoc|javadoc=true|url=org.apache.struts2.components.UpDownSelect %}

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/updownselect.html %}

__Examples__



{% snippet id=example|lang=xml|javadoc=true|url=org.apache.struts2.components.UpDownSelect %}

####dojo anchor#### {#PAGE_66791}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ . Resulting in an "undefined" message in the content's, instead of the result of the request.

One possible alternative is to set _showLoadingText="false"_  and set the indicator attribute to an element showing the desired loading text or image (outside the div).


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <sx:a targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/a.html %}

__Examples__

Update target content with html returned from an action:


{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

Submit form(anchor inside the form):


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

Submit form(anchor outside the form):


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

Using beforeNotifyTopics:


{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

Using afterNotifyTopics and highlights target:


{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

Using errorNotifyTopics and indicator:


{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Anchor.java %}

####dojo submit#### {#PAGE_66801}

__Description__



{% snippet id=javadoc|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

There's a bug in  IE6/IE7 which makes impossible to use the target's attribute with a parent Div, because such Div's content's are overwritten with the tag's _loadingText_ . Resulting in an "undefined" message in the content's, instead of the result of the request.

One possible alternative is to set _showLoadingText="false"_ (the default) and set the indicator attribute to an element showing the desired loading text or image (outside the div).


~~~~~~~

<img id="loadingImage" src="images/loadingAnimation.gif" style="display:none"/>
<s:div id="parentDiv">
    <s:form action="actionName">
        <sx:submit  targets="parentDiv" showLoadingText="false" indicator="loadingImage"/>
    </s:form>
</s:div>

~~~~~~~

__Parameters__



{% snippet id=tagattributes|javadoc=false|url=struts2-tags/ajax/submit.html %}

__Examples__



{% snippet id=example1|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Render an image submit:


{% snippet id=example2|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Render a button submit:


{% snippet id=example3|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Update target content with html returned from an action:


{% snippet id=example4|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Submit form(inside the form):


{% snippet id=example5|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Submit form(outside the form):


{% snippet id=example6|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Using beforeNotifyTopics:


{% snippet id=example7|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Using afterNotifyTopics and highlight target:


{% snippet id=example8|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

Using errorNotifyTopics and indicator:


{% snippet id=example9|lang=xml|javadoc=true|url=struts2/plugins/dojo/src/main/java/org/apache/struts2/dojo/components/Submit.java %}

