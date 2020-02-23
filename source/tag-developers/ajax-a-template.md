---
layout: tag-developers
title: Ajax a template
---

# ajax a template

> NOTE: Ajax template (Dojo plugin) is deprecated and won't be supported any longer.

The ajax theme is experimental. Feedback is appreciated.

The ajax a template is used to make asynchronous calls to the server when the user clicks on the a href link. It is 
useful when you need to communicate information back to the application from the UI, without requiring the entire page 
to be re-rendered. An example would be removing an item from a list.

The `preInvokeJS` attribute is used to determine whether the URL specified should be called or not, and must contain 
Javascript that returns `true` or `false`. If you want to call a JavaScript function, use the format 
`preInvokeJS='yourMethodName(data,type)'`. An example would be to show a confirm dialog to the user to double check 
whether they want to remove a user from a list.

**Remember**: the content returned by the `href` attribute must be JavaScript. That JavaScript will then be evaluated 
within the webpage. If you only wish to publish an event to the topic specified, then simply return no result (or `NONE`) 
from your action and utilize the `notifyTopics` attribute to specific the topic names.

For an example of the interaction between the [div](dojo-div-tag.html) tag and the [a](dojo-a-tag.html) tag using 
the topic pub/sub model, see the examples in the [ajax div template](ajax-div-template.html).
