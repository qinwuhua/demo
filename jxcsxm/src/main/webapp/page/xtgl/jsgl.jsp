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
function openJsUpdate(_id){
	$("#jsgl_table").datagrid('unselectAll');
	YMLib.Var.ID = _id;
	YMLib.UI.createWindow('jsgl_add_win','编辑角色','./jsgl_update.jsp','xmgl_03',630,330);
}
function deleteJs(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteJsById.do",
				 dataType : 'json',
				 data : 'param.roleid=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#jsgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败,请确认没有用户属于此角色',3000);
					 }
				 }
			});
		}
	});
}
function checkDeleteJs(_id){
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/selJsUsedById.do",
		 dataType : 'json',
		 data : 'param.roleid=' +_id,
		 success : function(msg){
			 if(msg.length>0){
				  YMLib.Tools.Show('该角色正在被使用，不能删除！',3000);
			 }else{
			 	deleteJs(_id);
			 }
		 }
	});
}
$(function(){
	$("#jsgl_table").datagrid({
		border:true,
		fit : true,
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectJsList.do',
		queryParams : {
			'param.name' : $('#jsgl_name').val(),
			'param.descr' : $("#jsgl_descr").val()
		},
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
				return '<a href=javascript:openJsUpdate("'+rec.roleid+'")>编辑</a>';
			}
		},{
			field : 'rolename',
			title : '角色名称',
			width : 300,
			align : 'center'
		},{
			field : 'desr',
			title : '角色描述',
			width : 300,
			align : 'center'
		}
		]],toolbar : [{
			text : '添加',
			iconCls: 'icon-add',
			handler : function(){
				YMLib.UI.createWindow('jsgl_add_win','添加角色','./jsgl_add.jsp','app_add',630,330);
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
					var _id="('"+rows[0].roleid;
					for(var i=1;i<rows.length;i++){
						_id+="','"+rows[i].roleid;
					}
					_id+="')";
					checkDeleteJs(_id);
				}
			}
		}]
	});
});
</script>
<div style="width:100%;">
    <div  style="height:34px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;角色分配管理</div>
		</div>
    </div>
    <div style="height:500px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    	<table id="jsgl_table" style="height:100%;" ></table>
    </div>
</div>
</body>
</html>