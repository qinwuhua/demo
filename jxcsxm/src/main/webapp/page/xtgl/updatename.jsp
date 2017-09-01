<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
</head>
<body style="margin: 10px; overflow-x: hidden; overflow-y: hidden">
<script type="text/javascript">
$(function(){
	$("#username").val($.cookie("truename"));
    $("#register_btn_Save").click(function(){
    	if($("#name").val()!="")
    	suc_user();
    	else{
    		alert("真实姓名不能为空");
    	}
    });
});

function suc_user(){
	var username=$("#username").val();
	var password=$("#name").val();
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/updateName.do",
		 dataType : 'json',
		 data : {
				'username' : username,
				'password' : password
			},
		 success : function(msg){
			 alert('修改成功！');
			 parent.$.cookie("name",$("#name").val(), {expires: 1});//将用户名放入cookie中
		     parent.$("#index_user").html($("#name").val());
		 	 parent.$("#updateName").window('destroy');
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求失败！',3000);
		 }
	});
}
</script>
<object classid="clsid:B6BE32E6-5B1B-4A44-BA6C-FB24016CF9A7" id="IAWebClient" name="IAWebClient" style="left: 0px; top: 0px" widtd="0" height="0"></object>
<div>
	<form>
		<table  cellspacing="0" class="table_grid">
			<tr>
				<td align="right" >用户名：</td>
				<td align="left"  >
					<input widtd="200px" type="text" id="username" name="username" readonly="readonly">
				</td>
			</tr>
			
			<tr>
				<td align="right" >真实姓名：</td>
				<td align="left"  >
					<input type="text" id="name">
				</td>
			</tr>
			
		</table>
	</form>
</div>
<div style="text-align: center;">	
	<a id="register_btn_Save" iconCls="icon-save" href="javascript:void(0)"  class="easyui-linkbutton" style="margin:2px 3px 0px 0px;" plain="true" >保　存</a>
</div>
</body>
</html>