<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护工程</title>
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
			//loadBmbm3('gcfl','养护大中修工程分类');
			loadjhxdwh("jhxdwh",'nc_yhgc');
			loadBmbm3('shzt','审核状态');
			loadBmbm3('ssbzt','上报状态');
			loadBmbm3('xsbzt','上报状态');
			loadBmbm3('sfqbdw','是否全部到位');
			if($.cookie('unit2').length==11){
				$("td[name='xian']").show();
				$("td[name='shi']").hide();
				$("td[name='sheng']").hide();
				$("a[name='sheng']").hide();
				$("a[name='xian']").show();
				$("a[name='shi']").hide();
				if(anqxstr.indexOf("上报")!=-1){
					$("a[name='xian']").show();
				}else{
					$("a[name='xian']").hide();
				}
				
			}
			if($.cookie('unit2').length==9){
				$("td[name='shi']").show();
				$("td[name='xian']").hide();
				$("td[name='sheng']").hide();
				$("a[name='sheng']").hide();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
				if(anqxstr.indexOf("上报")!=-1){
					$("a[name='shi']").show();
				}else{
					$("a[name='shi']").hide();
				}
				
			}
			if($.cookie('unit2').length==7){
				$("a[name='sheng']").hide();
				$("td[name='sheng']").show();
				$("td[name='xian']").hide();
				$("td[name='shi']").hide();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
				if(anqxstr.indexOf("审核")!=-1){
					$("a[name='sheng']").show();
				}else{
					$("a[name='sheng']").hide();
				}
			}
			//YMLib.Var.jdbs=2;
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
			
			var jsxz="养护工程";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var sfqbdw=$("#sfqbdw").combobox("getValues").join(",");
			if(sfqbdw.substr(0,1)==',')
				sfqbdw=sfqbdw.substr(1,sfqbdw.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':$.cookie('unit2'),'xmjbxx.sfqbdw':sfqbdw
			};
	
			loadTj();
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjdw/queryXmlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-160,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
							{field:'cz',title:'操作',width:130,align:'center',
								formatter: function(value,row,index){
									var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','nc_yhgc','zjdw'"+')" >项目详情</a>&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:openZjdw('+"'"+row.xmbm+"','"+row.gydwdm+"','nc_yhgc'"+')" >到位详情</a>';	
									return result;
								}
							},
							{field:'xmnf',title:'项目年份',width:60,align:'center'},
							{field:'xmmc',title:'项目名称',width:270,align:'center'},
							{field:'gydw',title:'管养单位',width:180,align:'center'},
							{field:'xzqh',title:'行政区划',width:100,align:'center'},
							{field:'ztz',title:'总投资',width:110,align:'center'},
							{field:'jhxdwh',title:'计划下达文号',width:250,align:'center'}
			    ]],
			    rowStyler:function(index,row){
			    	if($.cookie('unit2').length==11){
					if (row.xsbzt>0 ){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==9){
						if (row.ssbzt>0 && row.xsbzt==0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==7){
						if (row.shzt>0 && row.ssbzt==0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	
			    	
				}
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
			
			var jsxz="养护工程";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var sfqbdw=$("#sfqbdw").combobox("getValues").join(",");
			if(sfqbdw.substr(0,1)==',')
				sfqbdw=sfqbdw.substr(1,sfqbdw.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':$.cookie('unit2'),'xmjbxx.sfqbdw':sfqbdw
			};
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjdw/getdwTjAll.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$("#xmsl").html(msg.xmsl);
					$("#jhxdzj").html(msg.jhxdzj);
					$("#dwzj").html(msg.dwzj);
					$("#yshdwzj").html(msg.yshdwzj);
				}
			});
		}
		
		
		function dcmbjyzj(){
			loadjzt();
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
			var jsxz="养护工程";
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var sfqbdw=$("#sfqbdw").combobox("getValues").join(",");
			if(sfqbdw.substr(0,1)==',')
				sfqbdw=sfqbdw.substr(1,sfqbdw.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':$.cookie('unit2'),'xmjbxx.sfqbdw':sfqbdw
			};
			postDownLoadFile({
	            url:'/jxcsxm/zjdw/dcmbjyzj.do',
	            data:params,
	            method:'post'
	          });
			setTimeout('disLoadjzt()',4000);
		}
		function drsjjyzj(){
			var url="/jxcsxm/zjdw/importZjdwjyzj.do?gydwdm="+$.cookie("unit");
			var flag='yhgczjdw';
			importSj(url,flag);
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
		<div id="p_top">资金到位>&nbsp;农村公路>&nbsp;养护工程</div>
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
        						<td><select id="xmnf" style="width: 80px;"></select></td>
								<td align="right">项目编码：</td>
        						<td><input name="xmbm" type="text" id="xmbm" style="width:140px;" /></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:140px;" /></td>
        						
								</tr>
        					<tr height="28">
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
								<!-- 县市上报状态 省审核状态-->
								<td align="right" name='sheng'>审核状态：</td>
								<td name='sheng'><select name="shzt" id="shzt" style="width:80px;" ></select></td>
        						<td align="right" name='shi'>上报状态：</td>
								<td name='shi'><select name="ssbzt" id="ssbzt" style="width:80px;" ></select></td>
        						<td align="right" name='xian'>上报状态：</td>
								<td name='xian'><select name="xsbzt" id="xsbzt" style="width:80px;" ></select></td>
        						<td align="right">是否全部到位：</td>
								<td><select name="sfqbdw" id="sfqbdw" style="width:144px;" ></select></td>
        						
        					</tr>
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
									<a name='sheng' id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plshdw()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">批量审核</a>
									<a name='xian' id='mybuttion5' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbdwxj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion5')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion5')"  class="button button-tiny button-rounded button-raised button-primary">批量上报</a>
									<a name='shi' id='mybuttion6' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbdwsj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion6')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion6')"  class="button button-tiny button-rounded button-raised button-primary">批量上报</a>
									<a name='shi' id='mybuttion8' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:dcmbjyzj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">导出模版(结余资金)</a>
									<a name='shi' id='mybuttion9' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:drsjjyzj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">导入数据(结余资金)</a>
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
           		        计划下达补助资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;">0</span>】万元，
		                        到位补助资金共【<span id="dwzj" style="color: Red; font-weight: bold;">0</span>】万元，
		                        其中，已审核到位补助资金共【<span id="yshdwzj" style="color: Red; font-weight: bold;">0</span>】万元。
            		</div>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
