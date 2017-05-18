<anychart>
  <settings>
    <animation enabled="True"/>
  </settings>
  <charts>
    <chart plot_type="CategorizedVertical">
      <data_plot_settings default_series_type="Bar">
        <bar_series group_padding="0.3" style="AquaLight">
          <label_settings enabled="false">
            <background enabled="false"/>
            <position anchor="Center" valign="Center" halign="Center"/>
            <font color="White" bold="true">
              <effects>
                <drop_shadow enabled="true" distance="1" angle="45" blur_x="1.5" blur_y="1.5" strength="2" opacity="0.5"/>
              </effects>
            </font>
            <format>{@Value}{numDecimals:${precision}}</format>
          </label_settings>
          <tooltip_settings enabled="True">
            <background>
              <border color="DarkColor(%Color)"/>
            </background>
            <format>
              <![CDATA[{@Name}
                                          数量：{@YValue}{numDecimals: ${precision}}
                                         占比: {@YPercentOfCategory}{numDecimals: 2}@]]>
            </format>
          </tooltip_settings>
          <bar_style>
            <fill opacity="1"/>
            <states>
              <hover color="White"/>
            </states>
          </bar_style>
        </bar_series>
      </data_plot_settings>
      <chart_settings>
        <title enabled="true">
          <text>${chart_title}</text>
        </title>
        <legend enabled="true" position="Bottom" align="Spread"
					ignore_auto_item="true">
					<format>{@Icon} {@Name}</format>
					<template></template>
					<title enabled="true">
						<text>${legend_title}</text>
					</title>
					<columns_separator enabled="false" />
					<background>
						<inside_margin left="10" right="10" />
					</background>
					<items>
						<item source="Series" />
					</items>
		</legend>
        <axes>
         <y_axis position="Left">
            <scale mode="Stacked"/>
			<title>
			<text>${yName}</text>
			</title>
			<labels align="Inside">
				<format>{@Value}{numDecimals:${precision}}</format>
			</labels>
		</y_axis>
		<x_axis>
		    <labels padding="${x_padding}"/>
			<title>
				<text>${xName}</text>
			</title>
		</x_axis>
        </axes>
      </chart_settings>
      <data>
       <#list list as p>
                	  <series name="${p.name}">
                	      <#list p.data as s>
                	        <point name="${s.name}" y="${s.data}"/>   
                	      </#list>
				      </series>   
        </#list>
      </data>
    </chart>
  </charts>
</anychart>