<?xml version="1.0" encoding="UTF-8"?> 
<anychart>
  <settings>
    <animation enabled="True"/>
  </settings>
  <charts>
    <chart plot_type="Doughnut">
      <data_plot_settings enable_3d_mode="false">
        <pie_series>
          <tooltip_settings enabled="true">
            
            <background>
              <corners type="Rounded" all="3"/>
            </background>
          </tooltip_settings>
     	  <label_settings enabled="true">
				<background enabled="false"/>
				<position anchor="Center" valign="Center" halign="Center" padding="0"/>
				<font color="White">
					<effects>
						<drop_shadow enabled="true" distance="2" opacity="0.5" blur_x="2" blur_y="2"/>
					</effects>
				</font>
				
			</label_settings>
        </pie_series>
      </data_plot_settings>
      <data>
      <series name="Series 1" palette="Default">
				     <#list list as l >
				          <point name="${l.bz}" y="${l.descr}"/>        
                      </#list>
	  </series>
      </data>
      <chart_settings>
        <title enabled="true" padding="5">
          <text>${chart_title}</text>
        </title>
        <legend enabled="true">
			<title enabled="false"/>
		</legend>
      </chart_settings>
    </chart>
  </charts>
</anychart>