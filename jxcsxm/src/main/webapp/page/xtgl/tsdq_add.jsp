<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
	
	if($("#name").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("特殊地区不能为空！");
		return false;
	}
	param = $("#yhgl_form").serialize()
	+"&param.xzqhdm="+$("#xzqhdm").combotree("getValues")
	+"&param.xzqh="+$("#xzqhdm").combotree("getText");
	$.ajax({
		type : "POST",
		url : "../../xtgl/insertTsdq.do",
		dataType : 'json',
		data : param,
		success : function(msg){
			if(msg){
				alert('保存成功！');
				parent.$("#jsgl_table").datagrid("reload");
				parent.$("#jsgl_add_win").window('destroy');
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
	loadDist2("xzqhdm","360000");
	$("#yhgl_btn_Save").click(function(){
		save();
	});
	$("#yhgl_btn_Cancel").click(function(){
		parent.$("#jsgl_add_win").window('destroy');
	});
});
</script>
<div id="yhgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;">
	<form id="yhgl_form" style="overflow-x:hidden">
		<table id="yhgl_form_table" cellspacing="0"  class="table_grid">
			<tr>
				<td align="right">
					特殊地区：
				</td>
				<td>
					<input type="text" id="name" name="param.name" style="width:298px;"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					 包含行政区划：
				</td>
				<td>
					<input  type="text" id="xzqhdm" style="width:300px;"/>
				</td>
			</tr>
			<tr>
				<td  align="right">
					 备注：
				</td>
				<td>
					<textarea  type="text" id="bz" name="param.bz" style="width:300px;height:50px;"></textarea>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<div region="south" border="false" style="text-align:right;height:30px;line-height:30px;">
		<a id="yhgl_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
		<a id="yhgl_btn_Cancel" iconCls="icon-cancel" href="javascript:void(0)" class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true">取　消</a>
	</div>
</div>
</body>
</html>