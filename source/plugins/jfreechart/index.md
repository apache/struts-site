---
layout: default
title: JFreeChart Plugin
parent:
    url: ../
    title: Plugins
---

# JFreeChart Plugin
{:.no_toc}

* Will be replaced with the ToC, excluding a header
{:toc}

## Description

[JFreeChart](http://www.jfree.org/jfreechart/) is a free 100% Java (LGPL) chart library that makes it easy for 
developers to display professional quality charts in their applications.

The JFreeChart plugin allows Actions to easily return generated charts and graphs.

Instead of streaming a generated chart directly to the HTTP response, this plugin provides a ChartResult, which 
handles the generation for you.  This allows you to generate the chart in one class, and render it out in another 
class, effectively decoupling the view from the Actions. You can easily render it out to a file or some view other 
than a web HTTP response if you wish.

## Features

+ Handles rendering charts to the HTTP response

+ Can be used in other non-web contexts

### Future Work

Currently the "chart" property is hardcoded. There should be a better way of transferring data from the Action to 
the Result, via some externally defined variable or something.

As mentioned by John Patterson (mailing list), the Action is still dependant on a JFreeChart Chart class. This can 
be improved. The seperation between Action and View can be made cleaner. A chart-agonistic List or Array can be used
as the data, and the configuration of the chart details (font, axis, etc...) be done via the result properties 
in the xwork.xml.

But hey, the above works for now. Any suggestions are welcome.

You can also create charts via the CeWolf library directly.  See [CeWolf charts using Velocity templates](cewolf-charts-using-velocity-templates).

## Usage

To use the plugin, have your Struts configuration package extend the `jfreechart-default` package, which provides
the `chart` result type.  Next, use it as a result in an action:

**Chart example in struts.xml**

```xml
<action name="viewModerationChart" class="myapp.actions.ViewModerationChartAction">
  <result name="success" type="chart">
    <param name="width">400</param>
    <param name="height">300</param> 
  </result>
</action>
```

In your Action class, provide a `getChart()` method that returns the chart to be rendered.  This method will be 
called by the chart result.

### Example

**Struts Action that provides a chart**

```java
public class ViewModerationChartAction extends ActionSupport {

	private JFreeChart chart;

	public String execute() throws Exception {
		// chart creation logic...
		XYSeries dataSeries = new XYSeries(new Integer(1)); //pass a key for this serie
		for (int i = 0; i <= 100; i++) {
			dataSeries.add(i, RandomUtils.nextInt());
		}
		XYSeriesCollection xyDataset = new XYSeriesCollection(dataSeries);

		ValueAxis xAxis = new NumberAxis("Raw Marks");
		ValueAxis yAxis = new NumberAxis("Moderated Marks");

		// set my chart variable
		chart =
			new JFreeChart(
				"Moderation Function",
				JFreeChart.DEFAULT_TITLE_FONT,
				new XYPlot(
					xyDataset,
					xAxis,
					yAxis,
					new StandardXYItemRenderer(StandardXYItemRenderer.LINES)),
				false);
		chart.setBackgroundPaint(java.awt.Color.white);

		return super.SUCCESS;
	}

	public JFreeChart getChart() {
		return chart;
	}

}
```

### Settings

This plugin doesn't provides any global settings.

### Installation

This plugin can be installed by copying the plugin jar into your application's `/WEB-INF/lib` directory.  
he JFreeChart library will need to be downloaded separately, as its LGPL license doesn't allow it to be distributed 
with Struts.
