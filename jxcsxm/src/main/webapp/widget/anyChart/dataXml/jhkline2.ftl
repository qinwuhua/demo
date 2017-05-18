<anychart>
	<settings>
		<animation enabled="True"/>
	</settings>
  <charts>
    <chart plot_type="CategorizedVertical">
    <styles>
    			<line_style name="style1" parent="style1">
          			<line color="red" thickness="2"/>
        		</line_style>
        		<line_style name="style2" parent="style2">
          			<line color="blue" thickness="2"/>
        		</line_style>
        		<line_style name="style3" parent="style3">
          			<line color="green" thickness="2"/>
        		</line_style>
        		<line_style name="style4" parent="style4">
          			<line color="black" thickness="2"/>
        		</line_style>
        		<line_style name="style5" parent="style5">
          			<line color="yellow" thickness="2"/>
        		</line_style>
        		<line_style name="style6" parent="style6">
          			<line color="#ABABAB" thickness="2"/>
        		</line_style>
        		<line_style name="style7" parent="style7">
          			<line color="#7D26CD" thickness="2"/>
        		</line_style>
        		<line_style name="style8" parent="style8">
          			<line color="#8B3A3A" thickness="2"/>
        		</line_style>
    		</styles>
   <chart_settings>
				<title enabled="true">
					<text>${chart_title}</text>
				</title>
				<legend enabled="true" position="Bottom" align="Spread"
					ignore_auto_item="true">
					<format>{@Icon} {@Name}{numDecimals:0}</format>
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
					<y_axis>
						<title>
							<text>${yName}</text>
						</title>
						<labels align="Inside">
							<format>{@Value}{numDecimals:0}</format>
						</labels>
					</y_axis>
					<x_axis>
						<title>
							<text>${xName}</text>
						</title>
					</x_axis>
				</axes>
			</chart_settings>  	
    	<data_plot_settings default_series_type="Line">
    		<line_series>
    			<marker_settings>
    					<marker size="8"/>
    					<states>
    						<hover>
    							<marker size="12"/>
    						</hover>
    					</states>
    			</marker_settings>
    			<tooltip_settings enabled="True">
	    			<format>
	               		<![CDATA[{@Name}{numDecimals: 0}年{%SeriesName} 总投资：{@YValue}{numDecimals: ${precision}}]]>
					</format>
    			</tooltip_settings>
    		</line_series>
    	</data_plot_settings>
    	   
	    <data>
                <series name="路面改造工程" style="style1">
				     <#list list as l >
				          <point name="${l.year}" y="${l.gcgj}"/>        
                      </#list>
				</series>
				<series name="升级改造工程" style="style2">
				     <#list list as l >
				          <point name="${l.year}" y="${l.gcsj}"/>        
                      </#list>
				</series>
				<series name="新建工程" style="style3">
				     <#list list as l >
				          <point name="${l.year}" y="${l.xj}"/>        
                      </#list>
				</series>
				<series name="灾毁恢复重建项目" style="style4">
				     <#list list as l >
				          <point name="${l.year}" y="${l.shuih}"/>        
                      </#list>
				</series>
				<series name="养护大中修" style="style5">
				     <#list list as l >
				          <point name="${l.year}" y="${l.yhdzx}"/>        
                      </#list>
				</series>
				<series name="危桥改造" style="style6">
				     <#list list as l >
				          <point name="${l.year}" y="${l.wqgz}"/>        
                      </#list>
				</series>
				<series name="安保工程" style="style7">
				     <#list list as l >
				          <point name="${l.year}" y="${l.abgc}"/>        
                      </#list>
				</series>
				<series name="灾害防治" style="style8">
				     <#list list as l >
				          <point name="${l.year}" y="${l.zhfz}"/>        
                      </#list>
				</series>
	    </data>
    </chart>
  </charts>
</anychart>
		