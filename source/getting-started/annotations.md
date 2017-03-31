---
layout: default
title: Annotations
---
## Annotations

The example code for this tutorial, annotations, is available for checkout at [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples)

> 

#####Introduction#####

In our previous tutorials we've been using an XML file (struts.xml) to configure our applications. The XML file wires up the action names (register), with ActionSupport classes (RegisterAction.java), and with the result to render back to the browser (register.jsp). Struts 2 provides an alternative to using XML to configure your application by using standard naming conventions and annotations for your action names, ActionSupport classes, and results.


> 

> 

> This tutorial assumes you understand how to apply annotations to Java classes and methods. If you're not familiar with annotations, consult the [Java online tutorial](http://download.oracle.com/javase/tutorial/java/javaOO/annotations.html)^[http://download.oracle.com/javase/tutorial/java/javaOO/annotations.html].

> 


| 

| The [Struts 2 user mailing list](http://struts.apache.org/mail.html)^[http://struts.apache.org/mail.html] is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

| 

#####Struts 2 Convention Plugin#####

Struts 2 enables the use of standard naming conventions and annotations when you include the Convention plugin in your application's class path. If you're using Maven you'll need to add a dependency:

**Convention Plugin Dependency**


~~~~~~~
<dependency>
  <groupId>org.apache.struts</groupId>
  <artifactId>struts2-convention-plugin</artifactId>
  <version>2.2.1</version>
</dependency>


~~~~~~~

If you're using Ant then copy the struts2-convention-plugin jar file from the Struts 2 download to your WEB-INF/lib folder.



| The convention plugin provide several different ways you can configure your Struts 2 application without using XML. Consult the _Convention Plugin_  documentation for complete details. This tutorial only examines one simple way of following the conventions provided by the Convention plugin.

| 

When you run the example application you'll see on the index.jsp page a link to Get your hello. This URL for the link is hello.action. When you click on this link, the execute method of class HelloAction.java (which is a Struts 2 ActionSupport class) is run. The view page rendered back to the browser after the execute method returns success is hello-success.jsp.

None of the above is wired up using XML but rather happens because the application follows the standard naming conventions expected by the Convention plugin. The first convention is that the ActionSupport class, HelloAction.java, is in package org.apache.struts.struts2annotations.action. One of the Convention plugin's defaults is to look for ActionSupport classes that are in package structure that ends in action. The next convention the application follows is that HelloAction.java extends the ActionSupport class and defines an execute method. The link is hello.action. When the Struts 2 filter sees a request for hello.action it will map that request to the HelloAction class's execute method due to the Convention plugin being used.

So a link of hello.action causes the execute method of class HelloAction to be run. That method returns "success." Because the application is using the Convention plugin, Struts 2 will render back to the browser a view page named hello-success.jsp that is located in WEB-INF/content (by default the Convention plugin expects all view pages to be in this location). If the execute method returns "input" or "error" then the view page rendered would have been hello-input.jsp or hello-error.jsp.

#####Struts 2 Configuration Plugin#####

In a [previous tutorial](#PAGE_16941310) we reviewed how to use the Struts 2 Configuration plugin to view the details of how Struts 2 has configured your application. When using the Convention plugin, it's very handy to also use the Configuration plugin during development. On the example application's home page is a link to the application's configuration. Click on that link and then the hello link on the left menu (under Actions in default). You'll see the configuration for the hello action including it's Action class, result, and view page.

![Screen shot 2010-10-24 at 10.51.45 AM.png](attachments/att24346643_Screen shot 2010-10-24 at 10.51.45 AM.png)

#####Annotations#####

If you want to go beyond the simple naming conventions provided by the Convention plugin, you can use the Struts 2 annotations also provided by the plugin. For example, a common work-flow for a Struts 2 application is to first execute the ActionSupport class's input method to setup form field default values and then to run the execute method of the same ActionSupport class when the form is submitted (to validate and save the user's input).

The link to Register for the drawing on the example application's home page follows this work flow. The link value is register-input.action. If you examine the RegisterAction.java class you'll find the input method with an Action annotation.

**Action Annotation**


~~~~~~~
@Action("register-input")
public String input() throws Exception {

	logger.info("In input method of class Register");
		
	return INPUT;
}


~~~~~~~

The Action annotation tells Struts 2 to execute the annotated method when the action link value equals the Action annotation's value ("register-input"). So a link of register-input.action will call the input method of class RegisterAction. On the example application's home page is a link to Register for the drawing with a URL of register-input.action.

The input method above returns "input". By the standards of the Convention plugin, the view page rendered will be register-input.jsp (from WEB-INF/content). On that view page is a Struts 2 form tag with an action attribute value of register. When submitting the form, the execute method of class RegisterAction will be run. Since the execute method returns success, the view page rendered is register-success.jsp.

#####Struts 2 Configuration Values#####

In previous examples, we included in struts.xml values for some of the Struts 2 configuration parameters.

**struts.xml parameter configuration**


~~~~~~~
<constant name="struts.devMode" value="true" />


~~~~~~~

When we don't use a struts.xml file, we can set the value of these Struts 2 parameters by using filter parameters in web.xml:

**Struts 2 Parameter Configurate web.xml**


~~~~~~~
<filter>
  <filter-name>struts2</filter-name>
    <filter-class>org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter</filter-class>
      <init-param>
	  <param-name>struts.devMode</param-name>
	  <param-value>true</param-value>
      </init-param>
</filter>


~~~~~~~

#####Summary#####

We've just scratched the surface of what the Struts 2 convention plugin provides to reduce or eliminate the need to use an XML file to configure your Struts 2 application. The Struts 2 Convention plugin provides ways to map multiple actions to the same method, map results to different view pages, map errors to view pages, and much more. Be sure to read through the _Convention Plugin_  documentation for alternative ways to configure your Struts 2 application.

##Struts 2 Form Tags## {#PAGE_19300595}

The example code for this tutorial, form_tags, can be checked out from [https://github.com/apache/struts-examples](https://github.com/apache/struts-examples).

> 

#####Introduction#####

In this tutorial we'll explore some of the other Struts 2 form controls. In our previous tutorials that explained how to use Struts 2 forms (_Processing Forms_ , _Form Validation_ , and _Message Resource Files_ ) we covered how to use the Struts 2 head, form, textfield controls and the key attribute. This tutorial will explore using the Struts 2 select, radio, checkbox, and checkboxlist form controls.



| The [Struts 2 user mailing list](http://struts.apache.org/mail.html)^[http://struts.apache.org/mail.html] is an excellent place to get help. If you are having a problem getting the tutorial example applications to work search the Struts 2 mailing list. If you don't find an answer to your problem, post a question on the mailing list.

| 

#####Example Application#####

The example application that supports this tutorial shows how to use Struts 2 form tags so that a user can edit his information. The information that can be edited is encapsulated in an object of class Person. A Person object knows these things: first name, last name, favorite sport, gender, state of residency, is or is not over 21, and car models owned.

To enable the user to edit his information that is stored in the Person object, we need to create a form like this one:

![Screen shot 2010-04-25 at 8.39.59 AM.png](attachments/att19660802_Screen shot 2010-04-25 at 8.39.59 AM.png)

The form allows the user to make changes. After submitting the form, the Struts 2 framework will update the state of the Person object.

The first and last names are shown on the form (see edit.jsp) using the Struts 2 textfield tag, which we've discussed in previous tutorials.

#####Struts 2 Select Tag#####

A user can select one favorite sport from several choices. The example application uses the Struts 2 select tag to provide the list of options for the select box.

**Struts 2 Select Tag**


~~~~~~~
<s:select key="personBean.sport" list="sports" />


~~~~~~~

In these form tags, we are using the key attribute as discussed in the _Message Resource Files_  tutorial. The key attribute is used by the Struts 2 framework to determine values for the other attributes (e.g. label and value). We are also using a property file associated with the EditAction class to provide the label values based on the key attribute value (see the _Message Resource Files_  tutorial for information on using Struts 2 property files).


> 

> 

> Note that there are many attributes for the Struts 2 form tags, most of which mirror the HTML attributes associated with the tags. You can read about all the attributes for a Struts 2 form tag by consulting the Struts 2 documentation.

> 

The value of the list attribute of the Struts 2 select tag is used by the framework to determine what method of the action class to call in order to create the option values. In our example application, the list attribute value of "sports" results in the framework calling the getSports method of class EditAction. That method returns a String array containing "football", "baseball", and "basketball". Those values are used to create the option tags inside the select tag.

The Struts 2 framework determines which option is preselected by using the key attribute's value to call a method on the personBean object. Since the key attribute's value is "personBean.sport", the framework calls the personBean object's getSport method. If the value returned by that method matches one of the option values, that option will be marked as "selected".

Here is the HTML that results from using the above Struts 2 select tag.

**HTML Created By Struts 2 Select Tag**


~~~~~~~
<tr>
<td class="tdLabel">
<label for="save_personBean_sport" class="label">Favorite sport:</label>
</td>
<td>
<select name="personBean.sport" id="save_personBean_sport">
    <option value="football">football</option>
    <option value="baseball">baseball</option>
    <option value="basketball" selected="selected">basketball</option>
</select>
</td>
</tr>


~~~~~~~

Note the table formatting created by the Struts 2 framework when using the Struts 2 select tag. The CSS classes are defined in style sheets included by the Struts 2 s:head tag. The Struts 2 s:head tag is placed inside the edit.jsp's head section.

Since the personBean's getSport method returns "baskeball", the basketball option value is marked as selected.

#####Struts 2 Radio Tag#####

The Struts 2 radio tag—like its standard HTML counterpart—is used to display 2 or more choices, only one of which can be selected by the user. Here is the code for the Struts 2 radio button from the example application.

**Struts 2 Radio Tag**


~~~~~~~
<s:radio key="personBean.gender" list="genders" />


~~~~~~~

Again the key attribute's value determines the value for the label and value attributes. The label's text is derived from the EditAction.properties file (key personBean.gender). Just like the Struts 2 select tag, the list attribute of the Struts 2 radio tag causes the framework to call the getGenders method of the EditAction class. The Array of String objects returned are used to create the individual radio buttons.

**HTML Created By Struts 2 Radio Tag**


~~~~~~~
<tr>
<td class="tdLabel">
<label for="save_personBean_gender" class="label">Gender:</label></td>
<td>
<input type="radio" name="personBean.gender" id="save_personBean_gendermale" value="male"/><label for="save_personBean_gendermale">male</label>
<input type="radio" name="personBean.gender" id="save_personBean_genderfemale" value="female"/><label for="save_personBean_genderfemale">female</label>
<input type="radio" name="personBean.gender" id="save_personBean_gendernot sure" checked="checked" value="not sure"/><label for="save_personBean_gendernot sure">not sure</label>
</td>
</tr>


~~~~~~~

Also just like the Struts 2 select tag the result returned by calling the personBean object's getGender method is used to determine which of the radio buttons is checked.

#####Struts 2 Select Tag - Object Backed#####

You may need to create a Struts 2 select tag where the options displayed to the user each have their own value that is different then what is displayed. In the example application, the user's residency is stored as a two-letter abbreviation (e.g. KS), but the form select box should display the full state name (e.g. Kansas). To create such a select box in Struts 2, you would use this code

**Struts 2 Select Tag Object Backed**


~~~~~~~
<s:select key="personBean.residency" list="states" listKey="stateAbbr" listValue="stateName" />


~~~~~~~

The list value tells the framework to call the getStates method of the EditAction class. That method returns an ArrayList of State objects. Each State object has getStateAbbr and getStateName methods.

The listKey attribute tells the framework to use the value returned by calling the getStateAbbr method as the value for the value attribute of the HTML option tag and the value returned by calling the getStateName method as the value displayed to the user. So the above Struts 2 select tag code results in this HTML.

**HTML Created By Struts 2 Select Tag**


~~~~~~~
<tr>
<td class="tdLabel">
<label for="save_personBean_residency" class="label">State resident:</label></td>
<td>
<select name="personBean.residency" id="save_personBean_residency">
    <option value="AZ">Arizona</option>
    <option value="CA">California</option>
    <option value="FL">Florida</option>
    <option value="KS" selected="selected">Kansas</option>
    <option value="NY">New York</option>
</select>
</td>
</tr>


~~~~~~~

The value returned by calling the personBean object's getResidency method determines which of the select tag's option tags is marked as selected. In our example, since getResidency returns "KS", the option tag whose value attribute equals "KS" is marked as selected.

#####Struts 2 Checkbox Tag#####

The Struts 2 checkbox tag is used to create the HTML input type equals checkbox tag. The value for the key attribute tells the framework what method to call to determine if the checkbox is checked or not checked. The method called should return a Boolean value (true or false). A return value of true will cause the checkbox to be checked and false the checkbox will not be checked.

**Struts 2 Checkbox Tag**


~~~~~~~
<s:checkbox key="personBean.over21" />


~~~~~~~

Since the method getOver21 returns true, the checkbox is checked.

**HTML Created By Struts 2 Checkbox Tag**


~~~~~~~
<tr>
<td valign="top" align="right">
</td>
<td valign="top" align="left">
<input type="checkbox" name="personBean.over21" value="true" checked="checked" id="save_personBean_over21"/>
<input type="hidden" id="__checkbox_save_personBean_over21" name="__checkbox_personBean.over21" value="true" />  <label for="save_personBean_over21" class="checkboxLabel">21 or older</label>
</td>
</tr>


~~~~~~~

When the form is submitted and the checkbox is not checked, no value will be posted for the checkbox (this is how HTML forms work). Since the Struts 2 framework will need to update the value of the personBean's over21 instance field to false—given that the check box was not checked—the framework needs a way to determine if the checkbox was not checked after form submission.

If you examine the HTML code created by the Struts 2 checkbox tag, you'll see that it created a hidden field associated with the personBean.over21 checkbox. When the Struts 2 framework intercepts the submission of this form it will use this hidden form field to check if the associated checkbox field exists in the posted form data. If that checkbox field doesn't exist then the Struts 2 framework will know to update the value of the personBean object's over21 instance variable to false.

#####Struts 2 checkboxlist Tag#####

The Struts 2 framework provides a unique form field control that creates a series of associated check boxes, one or more of which can be checked. In the example application, the Person class has an Array of Strings, which is used to store car models owned by a person.

Using the Struts 2 checkbox tag, we can create a series of checkboxes, one for each possible car model the user may own. The value of each String in the personBean's carModels Array will determine which checkboxes are checked.

**Struts 2 Checkboxlist Tag**


~~~~~~~
<s:checkboxlist key="personBean.carModels" list="carModelsAvailable" />


~~~~~~~

The list attributes value in the checkboxlist tag tells the Struts 2 framework which method to call to get the possible car models. In the example application, the framework will call the EditAction class's getCarModelsAvailable method. That method returns an Array of Strings. For each element of the Array, the Struts 2 framework creates a checkbox (including the associated hidden field described above).

The key attribute value in the checkboxlist tag tells the Struts 2 framework which method to call on the personBean object to determine which checkboxes should be checked. In the example application, the framework will call the personBean object's getCarModels method. The getCarModels method returns an Array of Strings. For each String value in that Array that matches a String value in the Array returned by the EditAction class's getCarModelsAvailable, the checkbox will be checked.

**HTML Created By Struts 2 Checkboxlist Tag**


~~~~~~~
<tr>
<td class="tdLabel">
<label for="save_personBean_carModels" class="label">Car models owned:</label></td>
<td>
<input type="checkbox" name="personBean.carModels" value="Ford" id="personBean.carModels-1" checked="checked"/>
<label for="personBean.carModels-1" class="checkboxLabel">Ford</label>
<input type="checkbox" name="personBean.carModels" value="Chrysler" id="personBean.carModels-2"/>
<label for="personBean.carModels-2" class="checkboxLabel">Chrysler</label>
<input type="checkbox" name="personBean.carModels" value="Toyota" id="personBean.carModels-3"/>
<label for="personBean.carModels-3" class="checkboxLabel">Toyota</label>
<input type="checkbox" name="personBean.carModels" value="Nissan" id="personBean.carModels-4" checked="checked"/>
<label for="personBean.carModels-4" class="checkboxLabel">Nissan</label>
<input type="hidden" id="__multiselect_save_personBean_carModels" name="__multiselect_personBean.carModels" value="" />
</td>
</tr>


~~~~~~~

Summary
 There are several other Struts 2 form controls you should explore. If you need more information about the Struts 2 form tags consult the Struts 2 documentation at [http://struts.apache.org](http://struts.apache.org).

