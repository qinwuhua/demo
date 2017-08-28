<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金拨付</title>
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
		$(function(){
			$("#nf").html(new Date().getFullYear());
			if($.cookie('unit2').length==11){
				$("a[name='xian']").show();
				$("a[name='shi']").hide();
				$("a[name='sheng']").hide();
			}
			if($.cookie('unit2').length==9){
				$("a[name='shi']").show();
				$("a[name='xian']").hide();
				$("a[name='sheng']").hide();
				if($.cookie('unit2').substr(0,1)=='2')
					$("#mybuttion51").hide();
			}
			if($.cookie('unit2').length==7){
				$("a[name='sheng']").show();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
			}
			getdwTj();
			queryzjbflist();
		});
		function getdwTj(){
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjbf/getbfTj.do',
				data:'xmbm='+parent.YMLib.Var.xmbm+"&sbthcd="+$.cookie("unit2").length,
				dataType:'json',
				success:function(msg){
					dwzj=msg.dwzj;
					bfzj=msg.bfzj;
					$("#xmmc").html(msg.xmmc);
					$("#jhxdzj").html(msg.jhxdzj);
					$("#dwzj").html(msg.dwzj);
					$("#bfzj").html(msg.bfzj);
					$("#yshbfzj").html(msg.yshbfzj);
				}
			});
		}
		var dwzj=0;var bfzj=0;
		function zjbftj(){
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("添加","/jxcsxm/page/zjbf/gs/gsdgzzjbf_tj.jsp",600,385);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("添加","/jxcsxm/page/zjbf/gs/yhdzxzjbf_tj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("添加","/jxcsxm/page/zjbf/gs/zhhfzjbf_tj.jsp",600,345);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("添加","/jxcsxm/page/zjbf/gs/lwjggzzjbf_tj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("添加","/jxcsxm/page/zjbf/nc/lwjggzzjbf_tj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=="nc_tzrc"||parent.YMLib.Var.xmlx=="nc_yhgc")
			openWindow("添加","/jxcsxm/page/zjbf/nc/nczjbf_tj.jsp",600,275);
				
			
		}
		function openDwInfo(id){
			YMLib.Var.id=id;
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("详情","/jxcsxm/page/zjbf/gs/gsdgzzjbf_info.jsp",600,385);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("详情","/jxcsxm/page/zjbf/gs/yhdzxzjbf_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("详情","/jxcsxm/page/zjbf/gs/zhhfzjbf_info.jsp",600,345);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("详情","/jxcsxm/page/zjbf/gs/lwjggzzjbf_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("详情","/jxcsxm/page/zjbf/nc/lwjggzzjbf_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=="nc_tzrc"||parent.YMLib.Var.xmlx=="nc_yhgc")
			openWindow("详情","/jxcsxm/page/zjbf/nc/nczjbf_info.jsp",600,275);
		}
		function editDw(id){
			YMLib.Var.id=id;
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("编辑","/jxcsxm/page/zjbf/gs/gsdgzzjbf_bj.jsp",600,385);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("编辑","/jxcsxm/page/zjbf/gs/yhdzxzjbf_bj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("编辑","/jxcsxm/page/zjbf/gs/zhhfzjbf_bj.jsp",600,345);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("编辑","/jxcsxm/page/zjbf/gs/lwjggzzjbf_bj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("编辑","/jxcsxm/page/zjbf/nc/lwjggzzjbf_bj.jsp",600,275);		
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=="nc_tzrc"||parent.YMLib.Var.xmlx=="nc_yhgc")
			openWindow("编辑","/jxcsxm/page/zjbf/nc/nczjbf_bj.jsp",600,275);		
		}
		function deldw(){
			var rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请勾选记录！");
				return;
			}
			var _id=rows[0].id;
			for(var i=1;i<rows.length;i++){
				_id+=","+rows[i].id;
			}
			for(var i=0;i<rows.length;i++){
				if(rows[i].xsbzt!='未上报'){
					alert('请勾选未上报的记录！');
					return;
				}
			}
			if(confirm("您确认删除吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjbf/delbf.do',
				data:"id="+_id,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("删除成功");
						getdwTj();
						$("#grid").datagrid('reload');
						parent.$("#grid").datagrid('reload');
						parent.loadTj();
					}else{
						alert("删除失败");
					}
					
				}
			});
		}
		function updateBfType(type,id){
			var rows;var isMore=false;var _id="";
			if(id==null){
				isMore=true;
				rows=$('#grid').datagrid('getSelections');
				if(rows.length==0) {
					alert("请勾选记录！");
					return;
				}
				_id=rows[0].id;
				for(var i=1;i<rows.length;i++){
					_id+=","+rows[i].id;
				}
			}else
			 _id=id;
			var str="";
			var data="";
			if(type=='xsbzt'){
				if(isMore)
				for(var i=0;i<rows.length;i++){
					if(rows[i].xsbzt!='未上报'){
						alert('请勾选未上报的记录！');
						return;
					}
				}
				if($.cookie('zgx').indexOf(parent.YMLib.Var.gydwdm)!=-1)
				data="xsbzt=已上报&ssbzt=已上报&sbthcd=7&sfth=否&thyy=&id="+_id;
				else
				data="xsbzt=已上报&sbthcd=9&sfth=否&thyy=&id="+_id;
				str="上报";
			}
			if(type=='ssbzt'){
				if(isMore)
					for(var i=0;i<rows.length;i++){
						if(rows[i].ssbzt!='未上报'){
							alert('请勾选未上报的记录！');
							return;
						}
				}
				data="ssbzt=已上报&sbthcd=7&sfth=否&thyy=&id="+_id;
				str="上报";
			}
			if(type=='shzt'){
				if(isMore)
					for(var i=0;i<rows.length;i++){
						if(rows[i].shzt!='未审核'){
							alert('请勾选未审核的记录！');
							return;
						}
					}
				data="shzt=已审核&sbthcd=7&sfth=否&thyy=&id="+_id;
				str="审核";
			}
			if(type=='thwsh'){
				if(isMore)
					for(var i=0;i<rows.length;i++){
						if(rows[i].shzt!='已审核'){
							alert('请勾选已审核的记录！');
							return;
						}
					}
				
				data="shzt=未审核&sbthcd=7&id="+_id;
				str="退回未审核";
			}
			
			if(confirm("您确认"+str+"吗？"))
			//return;
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjbf/updateZjbfType.do',
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert(str+"成功");
						getdwTj();
						$("#grid").datagrid('reload');
						parent.$("#grid").datagrid('reload');
						parent.loadTj();
					}else{
						alert(str+"失败");
					}
					
				}
			});
		}
		
		function thXj(type,_id){
			var id="";var isMore=false;
			var rows;
			if(_id==null){
				isMore=true;
				rows=$('#grid').datagrid('getSelections');
				if(rows.length==0) {
					alert("请勾选记录！");
					return;
				}
				id=rows[0].id;
				for(var i=1;i<rows.length;i++){
					id+=","+rows[i].id;
				}
			}else
			 id=_id;
			if(type=='thsj'){
				if(isMore)
					for(var i=0;i<rows.length;i++){
						if(rows[i].shzt!='未审核'){
							alert('请勾选未审核的记录！');
							return;
						}
					}
				if($.cookie('zgx').indexOf(parent.YMLib.Var.gydwdm)!=-1)
				YMLib.Var.data="ssbzt=未上报&xsbzt=未上报&sfth=是&sbthcd=11&id="+id;
				else
				YMLib.Var.data="ssbzt=未上报&sfth=是&sbthcd=9&id="+id;
				openWindow("退回","/jxcsxm/page/zjbf/zjbf_th.jsp",400,150);
			}
			if(type=='thxj'){
				if(isMore)
					for(var i=0;i<rows.length;i++){
						if(rows[i].ssbzt!='未上报'){
							alert('请勾选未上报的记录！');
							return;
						}
					}
				YMLib.Var.data="xsbzt=未上报&sfth=是&sbthcd=11&id="+id;
				openWindow("退回","/jxcsxm/page/zjbf/zjbf_th.jsp",400,150);
			}
			
		}
		
		
		function queryzjbflist(){
			var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length};
			var col;
			if(parent.YMLib.Var.xmlx=='gs_gsdgz')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					if($.cookie('unit2').length==11){
						if(row.xsbzt=='未上报'){
							result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
							if(row.sfth=='是')
								result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
							else result+='退回原因&nbsp;&nbsp;';	
						}else{
							result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
						}
					}
					if($.cookie('unit2').length==9){
						if(row.ssbzt=='未上报'){
							result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
							if(row.sfth=='是')
								result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
							else result+='退回原因&nbsp;&nbsp;';	
						}else{
							result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
						}
					}
					if($.cookie('unit2').length==7){
						if(row.shzt=='未审核'){
							result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
							result+='退回未审核&nbsp;&nbsp;';
						}else{
							result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
							result+='退回下级&nbsp;&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
						}
					}
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
			{field:'bfyf',title:'拨付月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
			{field:'bd',title:'标段',width:50,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
			{field:'gz',title:'国债(万元)',width:80,align:'center'},
			{field:'sz',title:'省债(万元)',width:80,align:'center'},
			{field:'zq',title:'债券(万元)',width:80,align:'center'},
			{field:'tdk',title:'厅贷款(万元)',width:80,align:'center'},
			{field:'jl',title:'奖励(万元)',width:80,align:'center'},
			{field:'qt',title:'其他(万元)',width:80,align:'center'},
			{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
			{field:'yhdk',title:'银行贷款(万元)',width:80,align:'center'},
			{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			
		]]
			
			if(parent.YMLib.Var.xmlx=='gs_yhdzx')
				col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:230,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								result+='退回未审核&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
								result+='退回下级&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
							}
						}
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
				{field:'bfyf',title:'拨付月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'rys',title:'燃油税(万元)',width:80,align:'center'},
				{field:'tdk',title:'厅贷款(万元)',width:80,align:'center'},
				{field:'qt',title:'其他(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			
			if(parent.YMLib.Var.xmlx=='gs_zhhf')
				col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:230,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								result+='退回未审核&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
								result+='退回下级&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
							}
						}
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
				{field:'bfyf',title:'拨付月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
				{field:'gz',title:'国债(万元)',width:80,align:'center'},
				{field:'sz',title:'省债(万元)',width:80,align:'center'},
				{field:'zq',title:'债券(万元)',width:80,align:'center'},
				{field:'tdk',title:'厅贷款(万元)',width:80,align:'center'},
				{field:'jl',title:'奖励(万元)',width:80,align:'center'},
				{field:'qt',title:'其他(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			
			
			if(parent.YMLib.Var.xmlx=='gs_lwjggz'||parent.YMLib.Var.xmlx=='nc_lwjggz')
				col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:230,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								result+='退回未审核&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
								result+='退回下级&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
							}
						}
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
				{field:'bfyf',title:'拨付月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
				{field:'stz',title:'省投资(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			
			if(parent.YMLib.Var.xmlx=='nc_gljs'||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
				col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:230,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								result+='退回未审核&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
								result+='退回下级&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateBfType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
							}
						}
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
				{field:'bfyf',title:'拨付月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
				{field:'rys',title:'燃油税(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjbf/queryzjbflist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-62,
			    queryParams: params,
			    columns:col
			}); 
			
		}
		
		
	</script>
	<style type="text/css">

-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 5px;" cellspacing="0" cellpadding="0">
            <tr>
                <td height="30" align="left" style="font-size: 12px;">
	                    项目【<span id="xmmc" style="color: Red; font-weight: bold;">xxx</span>】<br/>
	                    计划下达资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    到位资金共【<span id="dwzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    拨付资金共【<span id="bfzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    其中，已审核拨付资金共【<span id="yshbfzj" style="color: Red; font-weight: bold;">0</span>】万元。
            </td>
            </tr>
            <tr>
            <td>
            <a id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjbftj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">添加</a>
			<a name='xian' id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:deldw()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">删除</a>
			<a name='xian' id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateBfType('xsbzt')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">上报</a>
			<a name='shi' id='mybuttion31' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateBfType('ssbzt')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion31')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion31')"  class="button button-tiny button-rounded button-raised button-primary">上报</a>
			
			<a name='sheng' id='mybuttion4' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateBfType('shzt')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">审核</a>
			<a name='sheng' id='mybuttion5' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:thXj('thsj')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion5')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion5')"  class="button button-tiny button-rounded button-raised button-primary">退回下级</a>
			<a name='shi' id='mybuttion51' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:thXj('thxj')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion51')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion51')"  class="button button-tiny button-rounded button-raised button-primary">退回下级</a>
			
			<a name='sheng' id='mybuttion6' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateBfType('thwsh')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion6')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion6')"  class="button button-tiny button-rounded button-raised button-primary">退回未审核</a>
			
			
			
			
			
            </td>
            </tr>
           
            <tr>
                <td >                
                     <table id="grid">           		
                     </table>   
                </td>
            </tr>

        </table>
        

    </div>

	</center>
</body>
</html>