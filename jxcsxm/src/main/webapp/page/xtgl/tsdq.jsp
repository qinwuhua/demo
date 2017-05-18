<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色分配管理</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
function openJsUpdate(_id,_name,_xzqhdm){
	YMLib.Var.ID=_id;
	YMLib.Var.name=_name;
	YMLib.Var.xzqhdm=_xzqhdm;
	YMLib.UI.createWindow('jsgl_add_win','编辑特殊地区','./tsdq_update.jsp','xmgl_03',560,250);
}
function deleteTsdq(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				type : "POST",
				url : "../../xtgl/deleteTsdqById.do",
				dataType : 'json',
				data : 'param.id=' +_id,
				success : function(msg){
					if(msg){
						YMLib.Tools.Show('删除成功！',3000);
						$("#jsgl_table").datagrid('reload');
					}
				},error : function(){
					YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				}
			});
		}
	});
}
function updateZt(_id,_zt){
	if(_zt=="启用") _zt="禁用";
	else if(_zt=="禁用") _zt="启用";
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/updateTsdqZt.do",
		 dataType : 'json',
		 data : "param.id="+_id+"&param.state="+_zt,
		 success : function(msg){
			 if(msg){
				 YMLib.Tools.Show('修改成功！',3000);
				 $("#jsgl_table").datagrid('reload');
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}

$(function(){
	loadDist2("xzqhdm","360000");
	$("#jsgl_table").datagrid({
		border:true,
		fit : true,
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectTsdqList.do',
		striped : true,
		singleSelect : false,
		columns : [[
		{field:'ck',checkbox:true},
		{
			field : 'bj',
			title : '编辑',
			width : 80,
			align : 'center',
			formatter : function(value,rec,index){
				return '<a href=javascript:openJsUpdate("'+rec.id+'","'+rec.name+'","'+rec.xzqhdm+'")>编辑</a>';
			}
		},{
			field : 'state',
			title : '使用状态',
			width : 100,
			align : 'center',
			formatter : function(value,rec,index){
				if(value=="启用") return '<a onclick=updateZt("'+rec.id+'","'+value+'") href="#" style="color:blue;">启用</a>';
				else return '<a onclick=updateZt("'+rec.id+'","'+value+'") href="#" style="color:red;">禁用</a>';
			}
		},{
			field : 'name',
			title : '特殊地区',
			width : 100,
			align : 'center'
			
		},{
			field : 'xzqh',
			title : '包含行政区域',
			width : 300,
			align : 'center'
		},{
			field : 'bz',
			title : '备注',
			width : 100,
			align : 'center'
		}
		]],toolbar : [{
			text : '添加',
			iconCls: 'icon-add',
			handler : function(){
				YMLib.UI.createWindow('jsgl_add_win','添加特殊地区','./tsdq_add.jsp','app_add',560,250);
			}
		},{
			text : '删除',
			iconCls: 'icon-remove',
			handler : function(){
				if($('#jsgl_table').datagrid('getSelections')==""){
					alert("请选择要删除的角色!");
					return;
				}else{
					var rows = $('#jsgl_table').datagrid('getSelections');
					var _id="('"+rows[0].id;
					for(var i=1;i<rows.length;i++){
						_id+="','"+rows[i].id;
					}
					_id+="')";
					deleteTsdq(_id);
				}
			}
		}]
	});
});
</script>
<div style="width:100%;">
    <div  style="height:34px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;特殊地区管理</div>
		</div>
    </div>
    <div style="height:700px;">
    	<table id="jsgl_table" width="100%"></table>
    </div>
</div>
</body>
</html>