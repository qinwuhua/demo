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
			
			var jsxz=$("#jsxz").combobox("getValues").join(",");
			if(jsxz.substr(0,1)==',')
				jsxz=jsxz.substr(1,jsxz.length);
			if(jsxz=="")
			jsxz="改建,路面改造,新建"
				
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
			    url:'/jxcsxm/zjtj/queryXmlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-90,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
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
		
		function glxm(xmbm){
			var  data="xmjbxx.xmbm="+parent.YMLib.Var.xmbm+"&xmjbxx.trxmbm="+parent.YMLib.Var.trxmbm+"&xmjbxx.jhxmbm="+xmbm;
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
        						<td colspan="8"  rowspan=" 2"  style="padding-left: 50px;">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
								</td>
								</tr>
        					<tr height="28">
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
        						<!-- 县市上报状态 省审核状态-->
        						<td align="right">建设性质：</td>
								<td><select name="jsxz" id="jsxz" style="width:144px;" ></select></td>
								
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
		

</body>
</html>
