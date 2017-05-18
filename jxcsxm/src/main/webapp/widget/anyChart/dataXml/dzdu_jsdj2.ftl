<anychart>
  <settings>
    <animation enabled="True"/>
  </settings>
  <charts>
    <chart plot_type="Doughnut">
      
      <data>
      <series name="Series 1" palette="Default">
	<#list list as l >
		<point name="${l.roadcode}"/>        
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