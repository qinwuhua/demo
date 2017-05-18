<?xml version="1.0" encoding="UTF-8"?>
<anychart>
	<charts>
    	<chart plot_type="CategorizedVertical">
      		<data_plot_settings default_series_type="Bar">
        		<bar_series>
          			<tooltip_settings>
            			<font bold="False" />
            			<format>Manager: {%CategoryName}
							Sales: {%YValue}
							Period: {%SeriesName}
							Percent: {%YPercentOfSeries}{numDecimals:2}%
						</format>
          			</tooltip_settings>
          			<label_settings enabled="True" rotation="90">
	            		<position anchor="Center" halign="Center" valign="Center" />
	            		<format>{%Value}{numDecimals:0}</format>
	            		<font bold="False" color="White">
	              			<effects>
	                			<drop_shadow enabled="True" opacity="0.5" distance="2" blur_x="1" blur_y="1" />
	              			</effects>
	            		</font>
	            		<background enabled="False" />
         	 		</label_settings>
        		</bar_series>
      		</data_plot_settings>
			<data>
				<series name="计划里程">
					<#list list as l >
						<point name="${l.XZQH}" y="${l.ZLC}"/>
					</#list>
				</series>
        		<series name="本年完成里程">
        			<#list list as l >
						<point name="${l.XZQH}" y="${l.WCLC}"/>
					</#list>
        		</series>
			</data>
      		<chart_settings>
        		<title enabled="False" />
        		<axes>
          			<y_axis>
            			<scale minimum="0" />
            			<title>
              				<text>${chart_title_y}</text>
            			</title>
            			<labels>
              				<format>{%Value}{numDecimals:0}</format>
            			</labels>
          			</y_axis>
          			<x_axis>
            			<title>
              				<text>${chart_title}</text>
            			</title>
          			</x_axis>
        		</axes>
        		<legend enabled="True" >
        			<title enabled="false"/>
        		</legend>
      		</chart_settings>
		</chart>
	</charts>
</anychart>