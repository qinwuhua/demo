<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金到位</title>
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
				if(parent.anqxstr.indexOf("上报")!=-1){
					$("a[name='xian']").show();
				}else{
					$("a[name='xian']").hide();
				}
				
			}
			if($.cookie('unit2').length==9){
				$("a[name='shi']").show();
				$("a[name='xian']").hide();
				$("a[name='sheng']").hide();
				if(parent.anqxstr.indexOf("上报")!=-1){
					$("a[name='shi']").show();
				}else{
					$("a[name='shi']").hide();
				}
				
				if($.cookie('unit2').substr(0,1)=='2')
					$("#mybuttion51").hide();
			}
			if($.cookie('unit2').length==7){
				$("a[name='sheng']").show();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
				if(parent.anqxstr.indexOf("审核")!=-1){
					$("a[name='sheng']").show();
				}else{
					$("a[name='sheng']").hide();
				}
				
			}
			if(parent.anqxstr.indexOf("增删改")!=-1){
				$("a[name='tianjia']").show();$("a[name='shanchu']").hide();
				if($.cookie('unit2').length==11){
					$("a[name='shanchu']").show();
				}else{
					$("a[name='shanchu']").hide();
				}
				if($.cookie('unit2').substr(0,1)=='2'&&$.cookie('unit2').length==9){
					$("a[name='shanchu']").show();
				}
			}else{
				$("a[name='tianjia']").hide();$("a[name='shanchu']").hide();
			}
			
			
			
			
			getdwTj();
			queryzjdwlist();
		});
		function getdwTj(){
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjdw/getdwTj.do',
				data:'xmbm='+parent.YMLib.Var.xmbm+"&sbthcd="+$.cookie("unit2").length,
				dataType:'json',
				success:function(msg){
					jhxdzj=msg.jhxdzj;
					dwzj=msg.dwzj;
					$("#xmmc").html(msg.xmmc);
					$("#jhxdzj").html(msg.jhxdzj);
					$("#jhxdcgs").html(msg.jhxdcgs);
					$("#jhxdrys").html(msg.jhxdrys);
					$("#jhxdttc").html(msg.jhxdttc);
					$("#jhxdtdk").html(msg.jhxdtdk);
					$("#jhxddfzc").html(msg.jhxddfzc);
					$("#dwzj").html(msg.dwzj);
					$("#yshdwzj").html(msg.yshdwzj);
				}
			});
		}
		
		var jhxdzj=0;var dwzj=0;
		
		function zjdwtj(){
			if(parent.anqxstr.indexOf("增删改")==-1){
				alert("你不具备增删改的权限");
				return;
			}
			
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("添加","/jxcsxm/page/zjdw/gs/gsdgzzjdw_tj.jsp",600,350);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("添加","/jxcsxm/page/zjdw/gs/yhdzxzjdw_tj.jsp",600,280);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("添加","/jxcsxm/page/zjdw/gs/zhhfzjdw_tj.jsp",600,350);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("添加","/jxcsxm/page/zjdw/gs/lwjggzzjdw_tj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("添加","/jxcsxm/page/zjdw/nc/lwjggzzjdw_tj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
			openWindow("添加","/jxcsxm/page/zjdw/nc/nczjdw_tj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="gs_sfl")
			openWindow("添加","/jxcsxm/page/zjdw/gs/sflzjdw_tj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="gs_yhzx")
			openWindow("添加","/jxcsxm/page/zjdw/gs/yhzxzjdw_tj.jsp",600,270);
			if(parent.YMLib.Var.xmlx=="gs_fwq")
			openWindow("添加","/jxcsxm/page/zjdw/gs/fwqzjdw_tj.jsp",600,250);
					
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
		function editDw(id){
			if(parent.anqxstr.indexOf("增删改")==-1){
				alert("你不具备增删改的权限");
				return;
			}
			YMLib.Var.id=id;
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/gsdgzzjdw_bj.jsp",600,350);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/yhdzxzjdw_bj.jsp",600,280);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/zhhfzjdw_bj.jsp",600,350);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/lwjggzzjdw_bj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("编辑","/jxcsxm/page/zjdw/nc/lwjggzzjdw_bj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=='nc_tzrc'||parent.YMLib.Var.xmlx=='nc_yhgc')
			openWindow("编辑","/jxcsxm/page/zjdw/nc/nczjdw_bj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="gs_sfl")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/sflzjdw_bj.jsp",600,250);
			if(parent.YMLib.Var.xmlx=="gs_yhzx")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/yhzxzjdw_bj.jsp",600,270);
			if(parent.YMLib.Var.xmlx=="gs_fwq")
			openWindow("编辑","/jxcsxm/page/zjdw/gs/fwqzjdw_bj.jsp",600,250);
						
		}
		function deldw(){
			if(parent.anqxstr.indexOf("增删改")==-1){
				alert("你不具备增删改的权限");
				return;
			}
			
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
				if(rows[i].xsbzt!='未上报'&&rows[i].ssbzt!='未上报'){
					alert('请勾选未上报的记录！');
					return;
				}
			}
			if(confirm("您确认删除吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjdw/deldw.do',
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
		function updateDwType(type,id){
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
				url:'/jxcsxm/zjdw/updateZjdwType.do',
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
				openWindow("退回","/jxcsxm/page/zjdw/zjdw_th.jsp",400,150);
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
				openWindow("退回","/jxcsxm/page/zjdw/zjdw_th.jsp",400,150);
			}
			
		}
		
		
		function queryzjdwlist(){
			var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length};
			var col;
			if(parent.YMLib.Var.xmlx=='gs_gsdgz')
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:230,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
							
							if(row.sfth=='是')
								result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
							else result+='退回原因&nbsp;&nbsp;';	
						}else{
							result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
						}
					}
					if($.cookie('unit2').length==9){
						if(row.ssbzt=='未上报'){
							if(parent.anqxstr.indexOf("增删改")!=-1){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;';
							}
							if(parent.anqxstr.indexOf("上报")!=-1){
								result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
								if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
							}else{
								result+='未上报&nbsp;&nbsp;';
								if($.cookie('unit2').substr(0,1)=='1')
									result+='退回下级&nbsp;&nbsp;';
								
							}		
						
							if(row.sfth=='是')
								result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
							else result+='退回原因&nbsp;&nbsp;';	
						}else{
							if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
						}
					}
					if($.cookie('unit2').length==7){
						if(row.shzt=='未审核'){
							if(parent.anqxstr.indexOf("增删改")!=-1){
								result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;';
							}
							
							if(parent.anqxstr.indexOf("审核")!=-1){
								result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								result+='退回未审核&nbsp;&nbsp;';
							}else{
								result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
							}
						}else{
							if(parent.anqxstr.indexOf("审核")!=-1){
								result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
								result+='退回下级&nbsp;&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
							}else{
								result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
							}
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
			{field:'dwyf',title:'到位月份',width:70,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
// 			{field:'bd',title:'标段',width:50,align:'center'},
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
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
				{field:'dwyf',title:'到位月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
// 				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'rys',title:'燃油税(万元)',width:80,align:'center'},
				{field:'tdk',title:'厅贷款(万元)',width:80,align:'center'},
				{field:'qt',title:'其他(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			
			//-------------示范路---------
			
			if(parent.YMLib.Var.xmlx=='gs_sfl')
				col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:230,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
				{field:'dwyf',title:'到位月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			//-----------------
			
			if(parent.YMLib.Var.xmlx=='gs_zhhf')
				col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:230,align:'center',
					formatter: function(value,row,index){
						var result='<a style="color:#3399CC;" href="javascript:openDwInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
						if($.cookie('unit2').length==11){
							if(row.xsbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
				{field:'dwyf',title:'到位月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
// 				{field:'bd',title:'标段',width:50,align:'center'},
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
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
				{field:'dwyf',title:'到位月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
// 				{field:'bd',title:'标段',width:50,align:'center'},
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
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'xsbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									
								}else{
									result+='未上报&nbsp;&nbsp;';
								}	
									
								
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==9){
							if(row.ssbzt=='未上报'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								if(parent.anqxstr.indexOf("上报")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'ssbzt','"+row.id+"'"+')" >未上报</a>&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thxj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
								}else{
									result+='未上报&nbsp;&nbsp;';
									if($.cookie('unit2').substr(0,1)=='1')
										result+='退回下级&nbsp;&nbsp;';
									
								}	
								if(row.sfth=='是')
									result+='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>&nbsp;&nbsp;';
								else result+='退回原因&nbsp;&nbsp;';	
							}else{
								if($.cookie('unit2').substr(0,1)=='1')
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
								else
								result+='编辑&nbsp;&nbsp;已上报&nbsp;&nbsp;退回原因&nbsp;&nbsp;';
							}
						}
						if($.cookie('unit2').length==7){
							if(row.shzt=='未审核'){
								if(parent.anqxstr.indexOf("增删改")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:editDw('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;';
								}
								
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'shzt','"+row.id+"'"+')" >未审核</a>&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:thXj('+"'thsj','"+row.id+"'"+')" >退回下级</a>&nbsp;&nbsp;';
									result+='退回未审核&nbsp;&nbsp;';
								}else{
									result+='未审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
							}else{
								if(parent.anqxstr.indexOf("审核")!=-1){
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;';
									result+='退回下级&nbsp;&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:updateDwType('+"'thwsh','"+row.id+"'"+')" >退回未审核</a>&nbsp;&nbsp;';
								}else{
									result+='编辑&nbsp;&nbsp;已审核&nbsp;&nbsp;退回下级&nbsp;&nbsp;退回未审核&nbsp;&nbsp;';
								}
								
								
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
				{field:'dwyf',title:'到位月份',width:70,align:'center'},
				{field:'jhxdwh',title:'计划下达文号',width:150,align:'center'},
// 				{field:'bd',title:'标段',width:50,align:'center'},
				{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
				{field:'cgs',title:'车购税(万元)',width:80,align:'center'},
				{field:'rys',title:'燃油税(万元)',width:80,align:'center'},
				{field:'dfzc',title:'地方自筹(万元)',width:80,align:'center'},
				{field:'ttc',title:'厅统筹(万元)',width:80,align:'center'}
			]]
			
			
			
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjdw/queryzjdwlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-82,
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
	                    计划下达补助资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    其中，车购税【<span id="jhxdcgs" style="color: Red; font-weight: bold;">0</span>】万元，
	                    燃油税【<span id="jhxdrys" style="color: Red; font-weight: bold;">0</span>】万元，
	                    厅统筹【<span id="jhxdttc" style="color: Red; font-weight: bold;">0</span>】万元，
	                    厅贷款【<span id="jhxdtdk" style="color: Red; font-weight: bold;">0</span>】万元，
	                    地方自筹【<span id="jhxddfzc" style="color: Red; font-weight: bold;">0</span>】万元。<br/>
	                    到位补助资金共【<span id="dwzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    其中，已审核到位补助资金共【<span id="yshdwzj" style="color: Red; font-weight: bold;">0</span>】万元。
            </td>
            </tr>
            <tr>
            <td>
            <a name='tianjia' id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjdwtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">添加</a>
			<a name='shanchu' id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:deldw()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">删除</a>
			<a name='xian' id='mybuttion3' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateDwType('xsbzt')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">上报</a>
			<a name='shi' id='mybuttion31' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateDwType('ssbzt')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion31')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion31')"  class="button button-tiny button-rounded button-raised button-primary">上报</a>
			
			<a name='sheng' id='mybuttion4' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateDwType('shzt')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">审核</a>
			<a name='sheng' id='mybuttion5' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:thXj('thsj')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion5')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion5')"  class="button button-tiny button-rounded button-raised button-primary">退回下级</a>
			<a name='shi' id='mybuttion51' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:thXj('thxj')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion51')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion51')"  class="button button-tiny button-rounded button-raised button-primary">退回下级</a>
			
			<a name='sheng' id='mybuttion6' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:updateDwType('thwsh')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion6')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion6')"  class="button button-tiny button-rounded button-raised button-primary">退回未审核</a>
			
			
			
			
			
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