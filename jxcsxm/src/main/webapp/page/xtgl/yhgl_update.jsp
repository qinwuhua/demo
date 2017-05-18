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
function selQxList(){
	$.ajax({
		type : "POST",
		url : "../../xtgl/selQxList.do",
		dataType : 'json',
		success : function(msg){
			for (var i=0;i<msg.length;i++){
				$("#roleid").append("<option value='"+msg[i].ROLEID+"'>"+msg[i].ROLENAME+"</option>");
			}
		}
	});
}
function save(){
	if($("#truename").val().replace(/(^\s*)|(\s*$)/g,"")==""){
		alert("请输入用户名！");
		return false;
	}
	/* if(!/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test($("#tel").val())){
	alert("联系电话的格式不正确！");
	return false;
} */
	if($("#tel").val()!='')
	if(!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test($("#idcard").val())){
	    alert("请输入正确的身份证号码！");
	    return  false;
	}
	param = $("#yhgl_form").serialize();
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/updateYh.do",
		 dataType : 'json',
		 data : param,
		 success : function(msg){
			 if(msg){
				 alert('保存成功！');
				 parent.$("#jsgl_table").datagrid('reload');
				 parent.$("#yhgl_add_win").window('destroy');
			 }else{
				 YMLib.Tools.Show('保存失败！',3000);
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
	delete param;
}
function formTable(){
	$.ajax({
		type : "POST",
		url : "../../xtgl/selectYhById.do",
		dataType : 'json',
		data : "master.id="+parent.YMLib.Var.ID,
		success : function(msg){
			if(msg){
				$("#id").val(msg.id);
				$("#truename").val(msg.truename);
				$("#name").val(msg.name);
				$("#phone").val(msg.phone);
				$("#tel").val(msg.tel);
				$("#idcard").val(msg.idcard);
				$("#roleid").val(msg.roleid);
				if(msg.sex=="男") $("#_xb1").val(msg.sex);
				else $("#_xb2").attr('checked', 'true');
				loadUnit("unit",msg.unit);
			 }
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
	
}

$(function(){
	selQxList();
	formTable();
	$("#yhgl_btn_Save").click(function(){
		save();
	});
	$("#yhgl_btn_Cancel").click(function(){
		parent.$("#yhgl_add_win").window('destroy');
	});
});
</script>
<div id="yhgl_layout" class="easyui-layout" fit="true">
	<div region="center" border="false" style="padding:0px;">
	<form id="yhgl_form" style="overflow-x:hidden">
		<table id="yhgl_form_table" cellspacing="0"  class="table_grid">
			<tr>
				<td align="right" align="right">
					用户名：
				</td>
				<td>
					<input type="text" id="truename" name="master.truename"/>
					<input type="hidden" id="id" name="master.id"/>
				</td>
			</tr>
			<tr>
				<td align="right" align="right">
					 所属单位：
				</td>
				<td>
					<input  type="text" id="unit" name="master.unit" style="width:156px;"/>
				</td>
			</tr>
			<tr>
				<td align="right" align="right">
					 用户角色：
				</td>
				<td>
					<select id="roleid" name="master.roleid" style="width:156px;"></select>
				</td>
			</tr>
			<tr>
				<td align="right">
					真实姓名：
				</td>
				<td style="text-align: left">
					<input id="name" name="master.name"  type="text"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					性别：
				</td>
				<td align="left">
					<input id="_xb1" type="radio" name="master.sex" value="男" checked="checked" style="width:50px;"/><label for="_xb1">男</label>
					<input id="_xb2" type="radio" name="master.sex" value="女" style="width:50px;"/><label for="_xb2">女</label>
				</td>
			</tr>
			<tr>
				<td align="right">
					身份证号：
				</td>
				<td style="text-align: left">
					<input id="idcard" name="master.idcard" type="text"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					联系电话：
				</td>
				<td style="text-align: left">
					<input id="tel" name="master.tel" type="text"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					手机：
				</td>
				<td>
					<input id="phone" name="master.phone" type="text"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;color: red;" colspan="2">
					初始密码为：000000
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