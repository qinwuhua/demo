<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>index Examples</title>
    <link href="css/Top.css" rel="stylesheet" type="text/css">
    <link href="easyui/themes/insdep/easyui.css" rel="stylesheet" type="text/css">
    <link href="easyui/themes/insdep/easyui_animation.css" rel="stylesheet" type="text/css">
    <link href="easyui/themes/insdep/easyui_plus.css" rel="stylesheet" type="text/css">
	<link href="easyui/themes/insdep/insdep_theme_default.css" rel="stylesheet" type="text/css">
	<link href="easyui/themes/insdep/icon.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/themes/insdep/jquery.insdep-extend.min.js"></script>
	
	
	
</head>

<body>
<div class="easyui-layout" data-options="fit:true">
    <div id="righttop">
	<div id="p_top">资金到位>&nbsp;普通国省道>&nbsp;服务区</div>
</div>
     

     
     
     <table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 5px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:4px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="38">
								<td align="right">行政区划：</td>
        						<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
								<td align="right">项目年份：</td>
        						<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
								<td align="right">项目名称：</td>
        						<td><input class="easyui-textbox" style="width:150px"> </td>
        						<td align="right">是否全部到位：</td>
								<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
								</tr>
        					<tr height="38">
								<td align="right">计划下达文号：</td>
        						<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
								<!-- 县市上报状态 省审核状态-->
								<td align="right" name='sheng'>审核状态：</td>
								<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
        						<td align="right" name='shi'>上报状态：</td>
								<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
        						<td align="right" name='xian'>上报状态：</td>
								<td><select class="easyui-combobox" name="dept" style="width:150px;">   
									    <option value="aa">aitem1</option>   
									    <option>bitem2</option>   
									    <option>bitem3</option>   
									    <option>ditem4</option>   
									    <option>eitem5</option>   
									</select>  </td>
        						
        						
        					</tr>
        					<tr height="38">
                            	<td colspan="8">
									<a id="btn" href="javascript:querylist()" class="easyui-linkbutton color-grey" data-options="iconCls:'icon-search'">查询</a> 
								
								
								</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<table>
                   			<tr>
	                		<td colspan="2">共有项目【<span id="xmsl" style="color: red;font-weight: bold;">0</span>】个。</td>
	                		</tr>
                   			<tr>
	                		<td>下达补助【<span id="xdzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="xdbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="xdsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="xddf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		<td style="padding-left: 10px;">到位补助【<span id="dwzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="dwbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="dwsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="dwdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		</tr>
	                		<tr>
	                		<td>拨付补助【<span id="bfzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="bfbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="bfsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="bfdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		<td style="padding-left: 10px;">调剂补助【<span id="tjzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="tjdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		</tr>
                   		</table>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
     
     
	<script type="text/javascript">
	
	function querylist(){
		$('#grid').datagrid({    
		    url:'/demoui/xtgl/selectxmlist.do',
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    checkOnSelect:true,
		    height:$(window).height()-280,
		    width:$('#searchField').width()+2,
		   // queryParams: params,
		    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
						{field:'cz',title:'操作',width:130,align:'center',
							formatter: function(value,row,index){
								var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','gs_fwq','zjdw'"+')" >项目详情</a>&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:openZjdw('+"'"+row.xmbm+"','"+row.gydwdm+"','gs_fwq'"+')" >到位详情</a>';	
								return result;
							}
						},
						{field:'xmnf',title:'项目年份',width:60,align:'center'},
						{field:'xmmc',title:'项目名称',width:270,align:'center'},
						{field:'gydw',title:'管养单位',width:180,align:'center'},
						{field:'xzqh',title:'行政区划',width:100,align:'center'},
						{field:'jhxdwh',title:'计划下达文号',width:250,align:'center'}
		    ]]
		}); 
		
	}		
	
			
	querylist();
		
	</script>
     
</div>

</body>
</html>