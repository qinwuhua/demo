<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<title>角色添加</title>
</head>
<body>
<script type="text/javascript">
function saveDwgl(){
	if(!$("#dwgl_form #dwgl_form_table").form('validate')){
		return;
	}
	if($("#id").val().length!=6){
		alert("行政区划代码必须为6位数字！");
		return;
	}
	if($("#name").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("行政区划名称不能为空！");
		return;
	}
	var param = $("#dwgl_form").serialize()+"&unit.bmid=360000"+$("#parent").val()+$("#id").val();
	$.ajax({
		type : "POST",
		url : "../../xtgl/checkXzqhCfById.do",
		dataType : 'json',
		data : param,
		success : function(msg){
			if(msg.length!=0){
				alert("已存在该行政区划代码！");
				return;
			}else{
				trueSave(param);
			}
		}
	});
	delete param;
}
function trueSave(_param){
	$.ajax({
		type : "POST",
		url : "../../xtgl/insertXzqh.do",
		dataType : 'json',
		data : _param,
		success : function(msg){
			if(msg){
				alert('保存成功！');
				parent.startSearch();
				parent.$("#dwgl_add_win").window('destroy');
			}else{
				YMLib.Tools.Show('保存失败！',3000);
			}
		},
		error : function(){
			YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		}
	});
}
$(function(){
	$("#parent").val(parent.YMLib.Var.ID);
	$("#dwgl_btn_Save").click(function(){
		saveDwgl();
	});
	$("#dwgl_btn_Cancel").click(function(){
		parent.$("#dwgl_add_win").window('destroy');
	});
	$("#id").keypress(function(event){
		var keyCode = event.which;
		if(keyCode==46||(keyCode>=48&&keyCode<=57)||keyCode==8) return true;
		else return false;
	}).focus(function(){
		this.style.imeMode='disabled';
	});
	$("#id").keyup(function(event){
		if(this.value.length>6) $(this).val(this.value.substr(0,6));
	});
});
</script>
<div id="dwgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;border-bottom-width:1px;">
	<form id="dwgl_form" style="overflow-x:hidden">
		<table id="dwgl_form_table" cellspacing="0" class="table_grid">
			<tr>
				<td class="table_right" align="right">
					行政区划代码：
				</td>
				<td>
					<input id="id" name="unit.id" type="text" style="width:160px;"/><span style="color:red;">必填项</span>
					<input id="parent" name="unit.parent" type="hidden"/>
				</td>
			</tr>
			<tr>
				<td class="table_right" align="right">
					行政区划名称：
				</td>
				<td>
					<input id="name" name="unit.name" type="text" style="width:160px;"/><span style="color:red;">必填项</span>
				</td>
			</tr>
			
			<tr>
				<td class="table_right" align="right">
					描述：
				</td>
				<td>
					<textarea id="desr" name="unit.desr" style="width: 160px;height:50px;"></textarea>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;">
		<a id="dwgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		<a id="dwgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>