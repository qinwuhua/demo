<anychart>
	<settings>
		<animation enabled="True" />
	</settings>
	<charts>
		<chart plot_type="CategorizedVertical">
			<data_plot_settings default_series_type="Bar">
				<bar_series point_padding="0.5" group_padding="1" style="AquaLight">
			<tooltip_settings enabled="True">
            <background>
              <border color="DarkColor(%Color)"/>
            </background>
            <format>
              <![CDATA[{@Name}  {%SeriesName}
                                          数量：{@YValue}{numDecimals: ${precision}}
              ]]>
            </format>
          </tooltip_settings>
					<bar_style>
						<fill opacity="1" />
						<states>
							<hover color="White" />
						</states>
					</bar_style>
					<label_settings enabled="false">
						<background enabled="false" />
						<position anchor="Center" valign="Center" halign="Center" />
						<font color="White" bold="true">
							<effects>
								<drop_shadow enabled="true" distance="1" angle="45"
									blur_x="1.5" blur_y="1.5" strength="2" opacity="0.5" />
							</effects>
						</font>
						<format>{@Value}{numDecimals:${precision}}</format>
					</label_settings>
				</bar_series>
			</data_plot_settings>
			<chart_settings>
				<title enabled="true">
					<text>${chart_title}</text>
				</title>


			
				<axes>
					<y_axis>
						<title>
							<text>${yName}</text>
						</title>
						<labels align="Inside">
							<format>{@Value}{numDecimals:${precision}}</format>
						</labels>
					</y_axis>
					<x_axis>
						<title enabled="false">
							<text>${xName}</text>
						</title>
					</x_axis>
				</axes>
			</chart_settings>
			<data>
				<series name="公交运营" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num}"/>        
                      </#list>
				</series>
				<series name="轨道交通" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num1}"/>        
                      </#list>
				</series>
				<series name="长途客运" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num2}"/>        
                      </#list>
				</series>	
				<series name="出租车" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num3}"/>        
                      </#list>
				</series>
				<series name="自行车" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num4}"/>        
                      </#list>
				</series>
				<series name="其他" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num5}"/>        
                      </#list>
				</series>																
			</data>
		</chart>
	</charts>
</anychart>
			
			
			