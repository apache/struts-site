---
layout: default
title: Tag Developers Guide (WIP)
---

# CeWolf charts using Velocity templates

##### Setup CeWolf

**This currently only works with the most recent CVS version of WebWork but should be available in the upcoming 2.0 beta2**

1. Go to [http://cewolf.sourceforge.net](http://cewolf.sourceforge.net) and grab a stable release of CeWolf (at the time of writing, the unstable builds do not work with WebWork).

2. Edit your webwork.properties file and add "de.laures.cewolf.taglib.tags" to the  property "webwork.velocity.tag.path"

Lastly add the CeWolf servlet to web.xml:


~~~~~~~

<servlet>
    <servlet-name>CewolfServlet</servlet-name>
    <servlet-class>de.laures.cewolf.CewolfRenderer</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>CewolfServlet</servlet-name>
    <url-pattern>/cewolf/*</url-pattern>
</servlet-mapping>

~~~~~~~

##### Create a DatasetProducer

This is the default DatasetProducer from the CeWolf tutorial.


~~~~~~~

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import org.jfree.data.DefaultCategoryDataset;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;

public class PageViewCountData implements DatasetProducer, Serializable {

	// These values would normally not be hard coded but produced by
	// some kind of data source like a database or a file
	private final String[] categories =    {"mon", "tue", "wen", "thu", "fri", "sat", "sun"};
	private final String[] seriesNames =    {"cewolfset.jsp", "tutorial.jsp", "testpage.jsp", "performancetest.jsp"};
	private final Integer[] [] values = new Integer[OS:seriesNames.length] [OS:categories.length];

	public Object produceDataset(Map params) throws DatasetProduceException {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (int series = 0; series < seriesNames.length; series ++) {
			int lastY = (int)(Math.random() * 1000 + 1000);
			for (int i = 0; i < categories.length; i++) {
				final int y = lastY + (int)(Math.random() * 200 - 100);
				lastY = y;
				dataset.addValue((double)y, seriesNames[OS:series], categories[i]);
			}
		}
		return dataset;
	}

	public boolean hasExpired(Map params, Date since) {		
		return (System.currentTimeMillis() - since.getTime())  > 5000;
	}

	public String getProducerId() {
		return "PageViewCountData DatasetProducer";
	}
}

~~~~~~~

##### Create the Velocity template

With the new WebWork refactorings, nested JSP tags with arbitrary parameters can be used, so we convert the CeWolf tutorial JSP script to Velocity.


~~~~~~~

<jsp:useBean id="pageViews" class="de.laures.cewolf.example.PageViewCountData"/>
<cewolf:chart 
    id="line" 
    title="Page View Statistics" 
    type="line" 
    xaxislabel="Page" 
    yaxislabel="Views">
    <cewolf:data>
        <cewolf:producer id="pageViews"/>
    </cewolf:data>
</cewolf:chart>

<cewolf:img chartid="line" renderer="cewolf" width="400" height="300"/>

~~~~~~~

In Velocity it looks like this:


~~~~~~~

#set( $pageViews = $stack.findValue("new com.PageViewCountData()") )
$req.session.setAttribute("pageViews", $pageViews ) 

#bodytag( SimpleChart "id=line" "title=Page View Statistics" "type=line" "xaxislabel=Page" "yaxslabel=Views" )
  #bodytag( Data )
    #tag( Producer "id=pageViews" )
  #end
#end

#tag( ChartImg "chartid=line" "renderer=cewolf" "width=400" "height=300" ) 

~~~~~~~

As you may notice, CeWolf looks up it's DatasetProducer in the request attributes - it has no knowledge of the Velocity context. That's why we call \$req.session.setAttribute(). The other attributes (such as the chartid) will be set by CeWolf, so we don't need to care about them.

##### Setup an action to disply the template

Now you should be able to fire up an action in the usual way with this template as the result and a nice chart should appear.

