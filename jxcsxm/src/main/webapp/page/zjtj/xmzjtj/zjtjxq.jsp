<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金调剂</title>
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
			
			
			gettjTj();
			queryzjtjlist();
		});
		function gettjTj(){
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/gettjTj.do',
				data:'xmbm='+parent.YMLib.Var.xmbm+"&sbthcd="+$.cookie("unit2").length,
				dataType:'json',
				success:function(msg){
					dwzj=msg.dwzj;
					bfzj=msg.bfzj;
					$("#xmmc").html(msg.xmmc);
					$("#jhxdzj").html(msg.jhxdzj);
					$("#dwzj").html(msg.dwzj);
					$("#bfzj").html(msg.bfzj);
					$("#tjzj").html(msg.tjzj);
					$("#syktjzj").html(msg.syktjzj);
				}
			});
		}
		var dwzj=0;var bfzj=0;
		function zjtjtj(){
			if($("#syktjzj").html()==0){
				alert("该项目剩余可调剂资金位0，不可调剂");
				return;
			}
			//parent.YMLib.UI.createWindow('mywin1',"添加","/jxcsxm/page/zjtj/xmzjtj/zjtj_tj.jsp",'mywin1',800,355);
			openWindow("添加","/jxcsxm/page/zjtj/xmzjtj/zjtj_tj.jsp",800,355);	
			
		}
		function openDwInfo(id){
			YMLib.Var.id=id;
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("详情","/jxcsxm/page/zjtj/gs/gsdgzzjtj_info.jsp",600,385);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("详情","/jxcsxm/page/zjtj/gs/yhdzxzjtj_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("详情","/jxcsxm/page/zjtj/gs/zhhfzjtj_info.jsp",600,345);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("详情","/jxcsxm/page/zjtj/gs/lwjggzzjtj_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("详情","/jxcsxm/page/zjtj/nc/lwjggzzjtj_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=="nc_tzrc"||parent.YMLib.Var.xmlx=="nc_yhgc")
			openWindow("详情","/jxcsxm/page/zjtj/nc/nczjtj_info.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="gs_sfl")
				openWindow("详情","/jxcsxm/page/zjtj/gs/sflzjtj_info.jsp",600,275);	
			if(parent.YMLib.Var.xmlx=="gs_fwq")
				openWindow("详情","/jxcsxm/page/zjtj/gs/fwqzjtj_info.jsp",600,275);	
			if(parent.YMLib.Var.xmlx=="gs_yhzx")
				openWindow("详情","/jxcsxm/page/zjtj/gs/yhzxzjtj_info.jsp",600,295);	
		
		}
		function editDw(id){
			if(parent.anqxstr.indexOf("增删改")==-1){
				alert("你不具备增删改的权限");
				return;
			}
			
			YMLib.Var.id=id;
			if(parent.YMLib.Var.xmlx=="gs_gsdgz")
			openWindow("编辑","/jxcsxm/page/zjtj/gs/gsdgzzjtj_bj.jsp",600,385);
			if(parent.YMLib.Var.xmlx=="gs_yhdzx")
			openWindow("编辑","/jxcsxm/page/zjtj/gs/yhdzxzjtj_bj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="gs_zhhf")
			openWindow("编辑","/jxcsxm/page/zjtj/gs/zhhfzjtj_bj.jsp",600,345);
			if(parent.YMLib.Var.xmlx=="gs_lwjggz")
			openWindow("编辑","/jxcsxm/page/zjtj/gs/lwjggzzjtj_bj.jsp",600,275);
			if(parent.YMLib.Var.xmlx=="nc_lwjggz")
			openWindow("编辑","/jxcsxm/page/zjtj/nc/lwjggzzjtj_bj.jsp",600,275);		
			if(parent.YMLib.Var.xmlx=="nc_gljs"||parent.YMLib.Var.xmlx=="nc_tzrc"||parent.YMLib.Var.xmlx=="nc_yhgc")
			openWindow("编辑","/jxcsxm/page/zjtj/nc/nczjtj_bj.jsp",600,275);		
			if(parent.YMLib.Var.xmlx=="gs_sfl")
				openWindow("编辑","/jxcsxm/page/zjtj/gs/sflzjtj_bj.jsp",600,275);	
			if(parent.YMLib.Var.xmlx=="gs_fwq")
				openWindow("编辑","/jxcsxm/page/zjtj/gs/fwqzjtj_bj.jsp",600,275);	
			if(parent.YMLib.Var.xmlx=="gs_yhzx")
				openWindow("编辑","/jxcsxm/page/zjtj/gs/yhzxzjtj_bj.jsp",600,295);	
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
				url:'/jxcsxm/zjtj/delbf.do',
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
			//alert(data);
			if(confirm("您确认"+str+"吗？"))
			//return;
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/updateZjtjType.do',
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
				openWindow("退回","/jxcsxm/page/zjtj/zjtj_th.jsp",400,150);
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
				openWindow("退回","/jxcsxm/page/zjtj/zjtj_th.jsp",400,150);
			}
			
		}
		
		
		function queryzjtjlist(){
			var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length};
			var col;
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:160,align:'center',
				formatter: function(value,row,index){
					var result='<a style="color:#3399CC;" href="javascript:openTjInfo('+"'"+row.id+"'"+')" >详情</a>&nbsp;&nbsp;';
					result+='<a style="color:#3399CC;" href="javascript:editTj('+"'"+row.id+"'"+')" >编辑</a>&nbsp;&nbsp;';
					result+='<a style="color:#3399CC;" href="javascript:delTj('+"'"+row.id+"'"+')" >删除</a>&nbsp;&nbsp;';
					return result; 
				}
			},
			{field:'xmlx',title:'项目类型',width:70,align:'center'},
			{field:'xmnf',title:'项目年份',width:70,align:'center'},
			{field:'xmmc',title:'项目名称',width:200,align:'center'},
			{field:'gydw',title:'管养单位',width:130,align:'center'},
			{field:'xzqh',title:'行政区划',width:130,align:'center'},
			{field:'ztz',title:'总投资(万元)',width:80,align:'center'},
			{field:'jhxdwh',title:'计划下达文号',width:120,align:'center'}
		]]
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjtj/queryzjtjlist.do',
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
	                    计划下达补助资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    到位补助资金共【<span id="dwzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    拨付补助资金共【<span id="bfzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    调剂补助资金共【<span id="tjzj" style="color: Red; font-weight: bold;">0</span>】万元，
	                    剩余可调剂补助资金共【<span id="syktjzj" style="color: Red; font-weight: bold;">0</span>】万元。
            	
            </td>
            </tr>
            <tr>
            <td>
            <a name='tianjia' id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjtjtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">添加</a>
			<a name='shanchu' id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:deldw()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">删除</a>
			
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