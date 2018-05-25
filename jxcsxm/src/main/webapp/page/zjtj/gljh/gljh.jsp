<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>关联计划</title>
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
			loadBmbm('xmnf','项目年份',new Date().getFullYear());
			loadBmbm3('jsxz','国省道改造建设性质');
			loadjhxdwh("jhxdwh",'gs_gsdgz');
		
			loadBmbm3('sfqbbf','是否全部调剂');
			
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
			
			
			var jsxz=parent.YMLib.Var.xmlx;
			var xmnf=$("#xmnf").combobox("getValue");
			if(xmnf==''){
				alert("请选择一个项目");
			}
				
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.gcfl':jsxz,'xmjbxx.jsxz':'国省道改造','xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh
			};
	
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjtj/queryXmlist_tj.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-90,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	
							{field:'cz',title:'操作',width:110,align:'center',
								formatter: function(value,row,index){
									var result='<a style="color:#3399CC;" href="javascript:glxm('+"'"+row.xmbm+"'"+')" >关联</a>';	
									return result;
								}
							},
							{field:'xmnf',title:'项目年份',width:70,align:'center'},
							{field:'xmmc',title:'项目名称',width:200,align:'center'},
							{field:'gydw',title:'管养单位',width:190,align:'center'},
							{field:'xzqh',title:'行政区划',width:130,align:'center'},
							{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
							{field:'jhxdwh',title:'计划下达文号',width:120,align:'center'}
			    ]]
			}); 
		}
		var _xmbm="";
		function glxm(xmbm){
			_xmbm=xmbm;
			$('#xzxdwh').dialog("open");
			$("#whtd").empty();
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/getxmwh.do',
				data:"xmjbxx.xmbm="+xmbm,
				dataType:'json',
				success:function(msg){
					if(msg){
						var radio="";
						for (var i = 0; i < msg.length; i++) {
							radio+="<input name='jhxdwh' type='radio' value='"+msg[i].jhxdwh+"'>"+msg[i].jhxdwh+"</input><br/>";
						}
						$("#whtd").append(radio);
					}
				}
			});
			//
			
			
		}
	
		function gljh(){
			if($("input[name='jhxdwh']:checked").val()==null){
				alert("请选择一个计划下达文号");
				return;
			}
			
			var  data="xmjbxx.xmbm="+parent.YMLib.Var.xmbm+"&xmjbxx.jhxmbm="+_xmbm+"&xmjbxx.jhxdwh="+$("input[name='jhxdwh']:checked").val();
			if(confirm("确认关联该计划吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/glxm.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("关联成功");
						parent.$("#grid").datagrid('reload');
						parent.loadTj();
						closeWindow();
					}else{
						alert("关联失败");
					}
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
        						<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
								</tr>
        					<tr height="28">
								
        						<!-- 县市上报状态 省审核状态-->
        						<td colspan="8"  >
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
            		
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		
		<div id="xzxdwh" class="easyui-dialog" title="选择计划下达文号" style="width:200px;height:270px;" data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
			<table>
				<tr>
					<td id="whtd" style="padding-left: 10px;"> </td>
				</tr>
				<tr>
					<td style="padding-top: 95%;padding-left: 40%;"><a id='mybuttion12' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:gljh()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion12')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion12')"  class="button button-tiny button-rounded button-raised button-primary">确定</a></td>
				</tr>
			</table>
		</div>
</body>
</html>
