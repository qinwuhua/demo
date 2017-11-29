<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>项目详细</title>
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
	<style type="text/css">.table{border: 1px solid #FFE7BA;} .table tr{border: 1px solid #FFE7BA;} .table tr td{border: 1px solid #FFE7BA;}</style>

	<script type="text/javascript">
	$(function(){
		getxmInfo();
		queryzjxdlist();
		queryzjdwlist();
		queryzjtjlist();
		
	});
	function getbfTj(){
		$.ajax({
			type:'post',
			url:'/jxcsxm/zjtj/getbfTj.do',
			data:'xmbm='+parent.YMLib.Var.xmbm+"&sbthcd="+$.cookie("unit2").length,
			dataType:'json',
			success:function(msg){
				$("#jhxdzj_bf").html(msg.jhxdzj);
				$("#jhxdzj_cgs").html(msg.jhxdcgs);
				$("#jhxdzj_stz").html(msg.jhxdstz);
				$("#dwzj_bf").html(msg.dwzj);
				$("#bfzj_bf").html(msg.bfzj);
				$("#yshbfzj_bf").html(msg.yshbfzj);
			}
		});
	}
	function getdwTj(){
		$.ajax({
			type:'post',
			url:'/jxcsxm/zjdw/getdwTj.do',
			data:'xmbm='+parent.YMLib.Var.xmbm+"&sbthcd="+$.cookie("unit2").length,
			dataType:'json',
			success:function(msg){
				$("#jhxdzj_xd").html(msg.jhxdzj);
				$("#jhxdzj_dw").html(msg.jhxdzj);
				$("#dwzj_dw").html(msg.dwzj);
				$("#yshdwzj_dw").html(msg.yshdwzj);
				
				$("#jhxdzj_cgs").html(msg.jhxdcgs);
				$("#jhxdzj_stz").html(msg.jhxdstz);
			}
		});
	}
	
	function openBfInfo(id){
		YMLib.Var.id=id;
		if(parent.YMLib.Var.xmlx=="gs_gsdgz")
		openWindow("详情","/jxcsxm/page/zjtj/gs/gsdgzzjtj_info.jsp",600,390);
		if(parent.YMLib.Var.xmlx=="gs_yhdzx")
		openWindow("详情","/jxcsxm/page/zjtj/gs/yhdzxzjtj_info.jsp",600,280);
		if(parent.YMLib.Var.xmlx=="gs_zhhf")
		openWindow("详情","/jxcsxm/page/zjtj/gs/zhhfzjtj_info.jsp",600,350);
		if(parent.YMLib.Var.xmlx=="gs_lwjggz")
		openWindow("详情","/jxcsxm/page/zjtj/gs/lwjggzzjtj_info.jsp",600,280);
		if(parent.YMLib.Var.xmlx=="nc_lwjggz")
		openWindow("详情","/jxcsxm/page/zjtj/nc/lwjggzzjtj_info.jsp",600,280);
		if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=="nc_tzrc"||parent.YMLib.Var.xmlx=="nc_yhgc")
		openWindow("详情","/jxcsxm/page/zjtj/nc/nczjtj_info.jsp",600,280);
		if(parent.YMLib.Var.xmlx=="gs_sfl")
			openWindow("详情","/jxcsxm/page/zjtj/gs/sflzjtj_info.jsp",600,275);	
		if(parent.YMLib.Var.xmlx=="gs_fwq")
			openWindow("详情","/jxcsxm/page/zjtj/gs/fwqzjtj_info.jsp",600,275);	
		if(parent.YMLib.Var.xmlx=="gs_yhzx")
			openWindow("详情","/jxcsxm/page/zjtj/gs/yhzxzjtj_info.jsp",600,295);	
	
	}
	function openDwInfo(id){
		YMLib.Var.id=id;
		if(parent.YMLib.Var.xmlx=="gs_gsdgz")
		openWindow("详情","/jxcsxm/page/zjdw/gs/gsdgzzjdw_info.jsp",600,350);
		if(parent.YMLib.Var.xmlx=="gs_yhdzx")
		openWindow("详情","/jxcsxm/page/zjdw/gs/yhdzxzjdw_info.jsp",600,280);
		if(parent.YMLib.Var.xmlx=="gs_zhhf")
		openWindow("详情","/jxcsxm/page/zjdw/gs/zhhfzjdw_info.jsp",600,350);
		if(parent.YMLib.Var.xmlx=="gs_lwjggz")
		openWindow("详情","/jxcsxm/page/zjdw/gs/lwjggzzjdw_info.jsp",600,250);
		if(parent.YMLib.Var.xmlx=="nc_lwjggz")
		openWindow("详情","/jxcsxm/page/zjdw/nc/lwjggzzjdw_info.jsp",600,250);
		if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
		openWindow("详情","/jxcsxm/page/zjdw/nc/nczjdw_info.jsp",600,250);
		if(parent.YMLib.Var.xmlx=="gs_sfl")
		openWindow("详情","/jxcsxm/page/zjdw/gs/sflzjdw_info.jsp",600,250);
		if(parent.YMLib.Var.xmlx=="gs_yhzx")
		openWindow("详情","/jxcsxm/page/zjdw/gs/yhzxzjdw_info.jsp",600,270);
		if(parent.YMLib.Var.xmlx=="gs_fwq")
		openWindow("详情","/jxcsxm/page/zjdw/gs/fwqzjdw_info.jsp",600,250);
	}
	
	function queryzjtjlist(){
		getbfTj();
		var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length,'sffy':0};
		var col;
		if(parent.YMLib.Var.xmlx=='gs_gsdgz')
		col=[[
			{field:'cz',title:'操作',width:60,align:'center',
			formatter: function(value,row,index){
				var result='<a style="color:#3399CC;" href="javascript:openBfInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
				return result; 
			}
		},
		{field:'zt',title:'状态',width:50,align:'center',
			formatter: function(value,row,index){
				var zt="";if(row.shzt=='已审核'){zt='已审核';
				}else{
					if($.cookie('unit2').length==11){zt=row.xsbzt;}
					if($.cookie('unit2').length==9){zt=row.ssbzt;}
					if($.cookie('unit2').length==7){zt=row.shzt;}
				}
				return zt;
		}},
		{field:'bfyf',title:'调剂月份',width:75,align:'center'},
		{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
		{field:'bd',title:'标段',width:50,align:'center'},
		{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
		{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
		{field:'gz',title:'国债(万元)',width:75,align:'center'},
		{field:'sz',title:'省债(万元)',width:75,align:'center'},
		{field:'zq',title:'债券(万元)',width:75,align:'center'},
		{field:'tdk',title:'厅贷款(万元)',width:75,align:'center'},
		{field:'jl',title:'奖励(万元)',width:75,align:'center'},
		{field:'qt',title:'其他(万元)',width:75,align:'center'},
		{field:'yhdk',title:'银行贷款(万元)',width:75,align:'center'},
		{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
		{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
	]]
		
		if(parent.YMLib.Var.xmlx=='gs_yhdzx')
			col=[[
				{field:'cz',title:'操作',width:60,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openBfInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'bfyf',title:'调剂月份',width:75,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'rys',title:'燃油税(万元)',width:75,align:'center'},
			{field:'tdk',title:'厅贷款(万元)',width:75,align:'center'},
			{field:'qt',title:'其他(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='gs_zhhf')
			col=[[
				{field:'cz',title:'操作',width:60,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openBfInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'bfyf',title:'调剂月份',width:75,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
			{field:'gz',title:'国债(万元)',width:75,align:'center'},
			{field:'sz',title:'省债(万元)',width:75,align:'center'},
			{field:'zq',title:'债券(万元)',width:75,align:'center'},
			{field:'tdk',title:'厅贷款(万元)',width:75,align:'center'},
			{field:'jl',title:'奖励(万元)',width:75,align:'center'},
			{field:'qt',title:'其他(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='gs_lwjggz')
			col=[[
				{field:'cz',title:'操作',width:60,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openBfInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'bfyf',title:'调剂月份',width:75,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
			{field:'stz',title:'省投资(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='nc_gljs'||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
			col=[[
					{field:'cz',title:'操作',width:60,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openBfInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						return result; 
					}
				},
				{field:'zt',title:'状态',width:50,align:'center',
					formatter: function(value,row,index){
						var zt="";if(row.shzt=='已审核'){zt='已审核';
						}else{
							if($.cookie('unit2').length==11){zt=row.xsbzt;}
							if($.cookie('unit2').length==9){zt=row.ssbzt;}
							if($.cookie('unit2').length==7){zt=row.shzt;}
						}
						return zt;
				}},
				{field:'bfyf',title:'调剂月份',width:75,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
				{field:'rys',title:'燃油税(万元)',width:75,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
			]]
		
		//--------------示范路-------
		if(parent.YMLib.Var.xmlx=='gs_sfl')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'bfyf',title:'调剂月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'stz',title:'省投资(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//--------------服务区-------
		if(parent.YMLib.Var.xmlx=='gs_fwq')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'bfyf',title:'调剂月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//--------------养护中心-------
		if(parent.YMLib.Var.xmlx=='gs_yhzx')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			
			{field:'bfyf',title:'调剂月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'stz',title:'省投资(万元)',width:80,align:'center'},
			{field:'zddzjl',title:'重点打造奖励(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		
		
		
		
		$('#zjtjgrid').datagrid({    
		    url:'/jxcsxm/zjtj/queryzjtjlist.do',
		    striped:true,
// 		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    checkOnSelect:true,
		    
		    queryParams: params,
		    columns:col
		}); 
		
	}
	
	
	//到位
	function queryzjdwlist(){
		getdwTj();
		var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length,'sffy':0};
		var col;
		if(parent.YMLib.Var.xmlx=='gs_gsdgz')
		col=[[
			{field:'cz',title:'操作',width:60,align:'center',
			formatter: function(value,row,index){
				var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
				
				return result; 
			}
		},
		{field:'zt',title:'状态',width:50,align:'center',
			formatter: function(value,row,index){
				var zt="";if(row.shzt=='已审核'){zt='已审核';
				}else{
					if($.cookie('unit2').length==11){zt=row.xsbzt;}
					if($.cookie('unit2').length==9){zt=row.ssbzt;}
					if($.cookie('unit2').length==7){zt=row.shzt;}
				}
				return zt;
		}},
		{field:'dwyf',title:'到位月份',width:75,align:'center'},
		{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//			{field:'bd',title:'标段',width:50,align:'center'},
		{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
		{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
		{field:'gz',title:'国债(万元)',width:75,align:'center'},
		{field:'sz',title:'省债(万元)',width:75,align:'center'},
		{field:'zq',title:'债券(万元)',width:75,align:'center'},
		{field:'tdk',title:'厅贷款(万元)',width:75,align:'center'},
		{field:'jl',title:'奖励(万元)',width:75,align:'center'},
		{field:'qt',title:'其他(万元)',width:75,align:'center'},
		{field:'yhdk',title:'银行贷款(万元)',width:75,align:'center'},
		{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
		{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
	]]
		
		if(parent.YMLib.Var.xmlx=='gs_yhdzx')
			col=[[
				{field:'cz',title:'操作',width:60,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'dwyf',title:'到位月份',width:75,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'rys',title:'燃油税(万元)',width:75,align:'center'},
			{field:'tdk',title:'厅贷款(万元)',width:75,align:'center'},
			{field:'qt',title:'其他(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='gs_zhhf')
			col=[[
				{field:'cz',title:'操作',width:60,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'dwyf',title:'到位月份',width:75,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
			{field:'gz',title:'国债(万元)',width:75,align:'center'},
			{field:'sz',title:'省债(万元)',width:75,align:'center'},
			{field:'zq',title:'债券(万元)',width:75,align:'center'},
			{field:'tdk',title:'厅贷款(万元)',width:75,align:'center'},
			{field:'jl',title:'奖励(万元)',width:75,align:'center'},
			{field:'qt',title:'其他(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='gs_lwjggz')
			col=[[
				{field:'cz',title:'操作',width:60,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'dwyf',title:'到位月份',width:75,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
			{field:'stz',title:'省投资(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
		]]
		if(parent.YMLib.Var.xmlx=='nc_gljs'||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
			col=[[
					{field:'cz',title:'操作',width:60,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						
						return result; 
					}
				},
				{field:'zt',title:'状态',width:50,align:'center',
					formatter: function(value,row,index){
						var zt="";if(row.shzt=='已审核'){zt='已审核';
						}else{
							if($.cookie('unit2').length==11){zt=row.xsbzt;}
							if($.cookie('unit2').length==9){zt=row.ssbzt;}
							if($.cookie('unit2').length==7){zt=row.shzt;}
						}
						return zt;
				}},
				{field:'dwyf',title:'到位月份',width:75,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//					{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:75,align:'center'},
				{field:'rys',title:'燃油税(万元)',width:75,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:75,align:'center'}
			]]
			
//-------------示范路---------
		
		if(parent.YMLib.Var.xmlx=='gs_sfl')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'dwyf',title:'到位月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'stz',title:'省投资(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//-----------------
		//-------------养护中心---------
		
		if(parent.YMLib.Var.xmlx=='gs_yhzx')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'dwyf',title:'到位月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'stz',title:'省投资(万元)',width:80,align:'center'},
			{field:'zddzjl',title:'重点打造奖励(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//-----------------
		//-------------服务区---------
		
		if(parent.YMLib.Var.xmlx=='gs_fwq')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'zt',title:'状态',width:50,align:'center',
				formatter: function(value,row,index){
					var zt="";if(row.shzt=='已审核'){zt='已审核';
					}else{
						if($.cookie('unit2').length==11){zt=row.xsbzt;}
						if($.cookie('unit2').length==9){zt=row.ssbzt;}
						if($.cookie('unit2').length==7){zt=row.shzt;}
					}
					return zt;
			}},
			{field:'dwyf',title:'到位月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//-----------------
		$('#zjdwgrid').datagrid({    
		    url:'/jxcsxm/zjdw/queryzjdwlist.do',
		    striped:true,
// 		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:100,
		    checkOnSelect:true,
		    
		    queryParams: params,
		    columns:col
		}); 
		
	}
	
	
	
	
	//下达
	function queryzjxdlist(){
		var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length,'sffy':0};
		var col;
		if(parent.YMLib.Var.xmlx=='gs_gsdgz')
		col=[[
		
		{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
		{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
		{field:'btzzj',title:'车购税(万元)',width:75,align:'center'},
		{field:'gz',title:'国债(万元)',width:75,align:'center'},
		{field:'sz',title:'省债(万元)',width:75,align:'center'},
		{field:'zq',title:'债券(万元)',width:75,align:'center'},
		{field:'dk',title:'厅贷款(万元)',width:75,align:'center'},
		{field:'jl',title:'奖励(万元)',width:75,align:'center'},
		{field:'qt',title:'其他(万元)',width:75,align:'center'},
		{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'},
		{field:'yhdk',title:'银行贷款(万元)',width:75,align:'center'}
	]]
		
		if(parent.YMLib.Var.xmlx=='gs_yhdzx')
			col=[[
			
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'rys',title:'燃油税(万元)',width:75,align:'center'},
			{field:'dk',title:'厅贷款(万元)',width:75,align:'center'},
			{field:'qt',title:'其他(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='gs_zhhf')
			col=[[
				
			
			{field:'jhxdwh',title:'计划下达文号',width:140,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'btzzj',title:'车购税(万元)',width:75,align:'center'},
			{field:'gz',title:'国债(万元)',width:75,align:'center'},
			{field:'sz',title:'省债(万元)',width:75,align:'center'},
			{field:'zq',title:'债券(万元)',width:75,align:'center'},
			{field:'dk',title:'厅贷款(万元)',width:75,align:'center'},
			{field:'jl',title:'奖励(万元)',width:75,align:'center'},
			{field:'qt',title:'其他(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='gs_lwjggz')
			col=[[
				
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'btzzj',title:'车购税(万元)',width:75,align:'center'},
			{field:'stz',title:'省投资(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'}
		]]
		
		if(parent.YMLib.Var.xmlx=='nc_gljs'||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
			col=[[
				
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
//				{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:75,align:'center'},
			{field:'btzzj',title:'车购税(万元)',width:75,align:'center'},
			{field:'stz',title:'省投资(万元)',width:75,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:75,align:'center'}
		]]
//-------------示范路---------
		
		if(parent.YMLib.Var.xmlx=='gs_sfl')
			col=[[
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'stz',title:'省投资(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//-----------------
		//-------------养护中心---------
		
		if(parent.YMLib.Var.xmlx=='gs_yhzx')
			col=[[
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'stz',title:'省投资(万元)',width:80,align:'center'},
			{field:'zddzjl',title:'重点打造奖励(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//-----------------
		//-------------服务区---------
		
		if(parent.YMLib.Var.xmlx=='gs_fwq')
			col=[[
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'btzzj',title:'车购税(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
		]]
		//-----------------
		
		
		
		$('#zjxdgrid').datagrid({    
		    url:'/jxcsxm/zjdw/queryzjxdlist.do',
		    striped:true,
// 		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:100,
		    checkOnSelect:true,
		    
		    queryParams: params,
		    columns:col
		}); 
		
	}
	
	
	
	function getxmInfo(){
		$.ajax({
			type:'post',
			url:'/jxcsxm/jhcx/getxmInfo.do',
			data:'xmjbxx.xmbm='+parent.YMLib.Var.xmbm,
			dataType:'json',
			success:function(msg){
				$('#xminfo').form("load",msg);
				var inputArray= $('input');
				$.each(inputArray,function(index,item){
					$(item).attr("readonly","readonly");
				});
			}
		});
	}
		
	</script>
	<style type="text/css">

-->
</style>
</head>
<body>
<div>
		<form id="xminfo">
			<table class='table' style="width: 97%;margin-left:5px;margin-right:5px; background-color: #FFE7BA; font-size: 12px" border="0" cellpadding="6" cellspacing="1">
				<tr style="height: 25px;">
					<td colspan="4" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #FFEFD5; width: 15%; padding-left: 10px;">
						项目信息
					</td>
				</tr>
				<tr style="height: 30px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				项目年份</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input id="xmnf" name="xmnf" type="text" style="width: 230px;"/>
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				项目名称</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input id="xmmc" name="xmmc" type="text" style="width: 230px;"/>
				</td>
				
            </tr>
            <tr style="height: 30px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:15%" align="right">
				管养单位</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="gydw" name="gydw" type="text" style="width: 230px;"/>
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:15%" align="right">
				行政区划</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="xzqh" name="xzqh" type="text" style="width: 230px;"/>
				</td>
				
            </tr>
            <tr style="height: 30px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:15%" align="right">
				项目类型</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<input id="xmlx" name="xmlx" type="text" style="width: 230px;"/>
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:15%" align="right">
				</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
				</td>
				
            </tr>
             <div id='zjxd'>
	            <tr>
	              <td colspan="4" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight:bold;  font-size: small; text-align: left; background-color: #FFEFD5; width: 15%; padding-left: 10px;height: 30px;">
		              	资金下达信息————计划下达补助资金共【<span id="jhxdzj_xd" style="color: Red; font-weight: bold;">0</span>】万元,车购税【<span id="jhxdzj_cgs" style="color: Red; font-weight: bold;">0</span>】万元,省投资【<span id="jhxdzj_stz" style="color: Red; font-weight: bold;">0</span>】万元。
		           </td>
	            </tr>   
				
	            <tr>
	                <td colspan="4">                
	                     <table id="zjxdgrid">           		
	                     </table>   
	                </td>
	            </tr>
            </div>
            
             <div id='zjdw'>
	            <tr>
	              <td colspan="4" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight:bold;  font-size: small; text-align: left; background-color: #FFEFD5; width: 15%; padding-left: 10px;height: 30px;">
		              	资金到位信息————计划下达补助资金共【<span id="jhxdzj_dw" style="color: Red; font-weight: bold;">0</span>】万元，
		                    到位补助资金共【<span id="dwzj_dw" style="color: Red; font-weight: bold;">0</span>】万元，
		                    其中，已审核到位补助资金共【<span id="yshdwzj_dw" style="color: Red; font-weight: bold;">0</span>】万元。
		           </td>
	            </tr>   
				
	            <tr>
	                <td colspan="4">                
	                     <table id="zjdwgrid">           		
	                     </table>   
	                </td>
	            </tr>
            </div>
            
            <div id='zjtj'>
	            <tr>
	              <td colspan="4" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight:bold;  font-size: small; text-align: left; background-color: #FFEFD5; width: 15%; padding-left: 10px;height: 30px;">
		              	资金调剂信息————计划下达补助资金共【<span id="jhxdzj_bf" style="color: Red; font-weight: bold;">0</span>】万元，
		                    到位补助资金共【<span id="dwzj_bf" style="color: Red; font-weight: bold;">0</span>】万元，
		                    调剂补助资金共【<span id="bfzj_bf" style="color: Red; font-weight: bold;">0</span>】万元，
		                    其中，已审核调剂补助资金共【<span id="yshbfzj_bf" style="color: Red; font-weight: bold;">0</span>】万元。
		           </td>
	            </tr>   
				
	            <tr>
	                <td colspan="4">                
	                     <table id="zjtjgrid">           		
	                     </table>   
	                </td>
	            </tr>
            </div>
            
				
				
			</table>
		</form>
		
		

	</div>

</body>
</html>