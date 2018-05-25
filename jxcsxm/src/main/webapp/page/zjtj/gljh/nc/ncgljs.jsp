<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>农村公路建设</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>

	<script type="text/javascript">
		var anqxstr="";
		$(function(){
			anqxstr=getxqxbyid(getUrlParame("id"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('xmnf','项目年份',new Date().getFullYear());
			loadjhxdwh("jhxdwh",'gs_gsdgz');
		
			loadBmbm3('sfqbbf','是否全部调剂');
			loadBmbm3('sfppjh','是否全部调剂');
			queryXmlist();
			
			
		});
		function queryXmlist(){
			
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			
			jsxz="农村公路建设";
				
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var sfppjh=$("#sfppjh").combobox("getValues").join(",");
			if(sfppjh.substr(0,1)==',')
				sfppjh=sfppjh.substr(1,sfppjh.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.gcfl':jsxz,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,'xmjbxx.sfppjh':sfppjh,'xmjbxx.gydw':1
			};
	
			loadTj();
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjtj/queryTjXmlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-190,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
							    	{field:'cz',title:'操作',width:180,align:'center',
									formatter: function(value,row,index){
										var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','gs_gsdgz','zjtj'"+')" >项目详情</a>&nbsp;';
										if(row.sfppjh=='否'){
											result+='<a style="color:#3399CC;" href="javascript:openGljh('+"'"+row.xmbm+"','"+row.trxmbm+"','"+row.gcfl+"'"+')" >关联计划</a>&nbsp;取消关联';	
										}else{
											result+='关联计划&nbsp;<a style="color:#3399CC;" href="javascript:qxgljh('+"'"+row.xmbm+"'"+')" >取消关联</a>';
										}
										
										return result;
									}
								},
								{field:'sfppjh',title:'是否已关联计划',width:90,align:'center'},
								{field:'xmlx',title:'项目类型',width:70,align:'center'},
								{field:'xmnf',title:'项目年份',width:70,align:'center'},
								{field:'xmmc',title:'项目名称',width:280,align:'center'},
								{field:'gydw',title:'管养单位',width:250,align:'center'},
								{field:'xzqh',title:'行政区划',width:150,align:'center'},
								{field:'tjzbz',title:'总补助(万元)',width:80,align:'center'}
				    ]]
			}); 
		}
		
		
	
		
		function loadTj(){
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
		
			jsxz="农村公路建设";
				
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			
			var sfppjh=$("#sfppjh").combobox("getValues").join(",");
			if(sfppjh.substr(0,1)==',')
				sfppjh=sfppjh.substr(1,sfppjh.length);
			
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.gcfl':jsxz,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,'xmjbxx.sfppjh':sfppjh,'xmjbxx.gydw':1
			};
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/getTjTjAll.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$("#xmsl").html(msg.xmsl);
					$("#tjzbz").html(msg.tjzbz);
					$("#tjbb").html(msg.tjbb);
					$("#tjsb").html(msg.tjsb);
					$("#tjdf").html(msg.tjdf);
				}
			});
		}
	</script>
	<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">资金调剂>&nbsp;关联计划>&nbsp;普通国省道>&nbsp;农村公路建设</div>
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
							<tr height="28">
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:165px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 144px;"></select></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:140px;" /></td>
        						
								</tr>
        					<tr height="28">
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
        						<!-- 县市上报状态 省审核状态-->
        						
							<td align="right">是否关联计划：</td>
								<td><select name="sfppjh" id="sfppjh" style="width:144px;" ></select></td>
							
        					</tr>
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
								</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<div>共有项目【<span id="xmsl" style="color: red;font-weight: bold;">0</span>】个,
           		        补助共【<span id="tjzbz" style="color: Red; font-weight: bold;">0</span>】万元,
           		        部补共【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元,
           		        省补共【<span id="tjsb" style="color: Red; font-weight: bold;">0</span>】万元,
           		        地方自筹共【<span id="tjdf" style="color: Red; font-weight: bold;">0</span>】万元。
            		</div>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
