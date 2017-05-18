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
<label_settings enabled="true">
<background enabled="false"/>
<font color="DarkColor(%Color)"/>
<format>{%SeriesName}</format>
<effects>
<drop_shadow enabled="true" opacity="1"/>
</effects>
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
				<series name="春节输入" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num}"/>        
                      </#list>
				</series>
				<series name="春节输出" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num1}"/>        
                      </#list>
				</series>
				<series name="国庆输入" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num2}"/>        
                      </#list>
				</series>
				<series name="国庆输出" palette="Default">
				     <#list list as l >
				          <point name="${l.name}" y="${l.num3}"/>        
                      </#list>
				</series>				
			</data>
		</chart>
	</charts>
</anychart>
			
			
			