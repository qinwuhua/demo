<anychart>
  <settings>
    <animation enabled="True"/>
  </settings>
  <charts>
    <chart plot_type="Doughnut">
      <data_plot_settings enable_3d_mode="false">
        <pie_series>
          <tooltip_settings enabled="true">
            <format>
              <![CDATA[{@YPercentOfSeries}{numDecimals: 0}@]]>
            </format>
            <background>
              <corners type="Rounded" all="3"/>
            </background>
          </tooltip_settings>
     	 
        </pie_series>
      </data_plot_settings>
      <data>
      <series name="Series 1" palette="Default">
				     <#list list as l >
				          <point name="${l.bz}" x="${l.xmbm}" y="${l.xmbm}" color="${l.color}"/>        
                      </#list>
	  </series>
      </data>
      <chart_settings>
        <title enabled="true" padding="2">
          <text>${chart_title}</text>
        </title>
        <legend enabled="true">
			<title enabled="false"></title>
		</legend>
      </chart_settings>
    </chart>
  </charts>
</anychart>