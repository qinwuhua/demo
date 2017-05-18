<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色添加</title>
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
<body>
<script type="text/javascript">
function save(){
	if($("#rolename").val()==""){
		alert("请输入角色名称！");
		return false;
	}
	if(YMLib.Var.note==undefined){
		alert("请选择角色权限！");
		return false;
	}
	param=$("#jsgl_form").serialize()+"&param.source="+YMLib.Var.note;
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/updateJs.do",
		 dataType : 'json',
		 data : param,
		 success : function(msg){
			 if(msg){
				 alert('保存成功！');
				 parent.$("#jsgl_table").datagrid('reload');
				 parent.$("#jsgl_add_win").window('destroy');
			 }else{
				 YMLib.Tools.Show('保存失败！',3000);
			 }
		 }
	});
	delete param;
}

function init(){
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/selectJsById.do",
		 dataType : 'json',
		 data : "param.roleid="+parent.YMLib.Var.ID,
		 success : function(msg){
			 if(msg){
				$("#roleid").val(msg.roleid);
				$("#rolename").val(msg.rolename);
				$("#desr").val(msg.desr);
			 }
		 }
	});
}

$(function(){
	init();
	$("#roleid").val(parent.YMLib.Var.ID);
	loadQx("source");
	$("#jsgl_btn_Save").click(function(){
		save();
	});
	$("#jsgl_btn_Cancel").click(function(){
		parent.$("#jsgl_add_win").window('destroy');
	});
});
function loadQx(_id){
	$('#'+_id).tree({
		checkbox: true,
		check: true,
		url: "../../xtgl/selQxByRoleid.do?param.roleid="+parent.YMLib.Var.ID+"&param.id=01",
		onLoadSuccess:function (node){
			
		},
		onCheck : function (node){
			var nodes=$('#'+_id).tree('getChecked');
			var codes=nodes[0].id;
			for(var i=1;i<nodes.length;i++){
				codes+=','+nodes[i].id;
			}
			YMLib.Var.note=codes;
		}
	});
}
</script>
<div id="jsgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="jsgl_form" style="overflow-x:hidden">
		<table id="jsgl_form_table" cellspacing="0"  class="table_grid">
			<tr height="30px">
				<td width="80px" align="right">
					角色名称<span style="color:red;">(*)</span>：
				</td>
				<td>
					<input style="width:248px;" type="text" id="rolename" name="param.rolename"/>
					<input type="hidden" id="roleid" name="param.roleid"/>
				</td>
			</tr>
			<tr>
				<td width="80px" align="right">
					权限分配<span style="color:red;">(*)</span>：
				</td>
				<td>
					<ul id="source"></ul> 
					
				</td>
			</tr>
			<tr>
				<td width="80px" align="right">
					角色描述：
				</td>
				<td>
					<input id="desr" name="param.desr" type="text" style="width:248px;"/>
				</td>
			</tr>
		</table>
</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
		<a id="jsgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		　<a id="jsgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>