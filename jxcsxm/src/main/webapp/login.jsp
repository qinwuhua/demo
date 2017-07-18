<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>江西省财审管理系统</title>
<link rel="stylesheet" type="text/css" href="css/Login.css" />
<link rel="stylesheet" type="text/css" href="/jxcsxm/js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="./easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="./js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="./js/YMLib.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body style="margin:0 0 0 0; min-width: 1000px;overflow-x:hidden; ">
<div id="bg">
	<div class="dlflash">
<div style="width:1000px;  height:258px;position:relative;top:49px;left:0px; margin:0 auto;">
<script type="text/javascript" src="js/wpFlashWrite.js"></script>
<script type="text/javascript">

 wpFlashWrite('images/login.swf',1000,573,'wpFlash70814','','');

$(function(){
	$("#name").focus();
	autoCompletelogin();
});
function rewrite(){
	$("#name").val("");
	$("#password").val("");
	$("#name").focus();
}
function autoCompletelogin(){
	$("#name").autocomplete("/jxcsxm/xtgl/userlogin.do", {
		multiple : false,
		minChars :2,
		multipleSeparator : ' ',
		mustMatch: true,
  		cacheLength : 0,
  		delay : 0,
  		max : 150,
  		extraParams : {
				name:function() {
  				var d = $("#name").val();
  				return d;
  			}
  		},
  		dataType : 'json',// 返回类型
  		// 对返回的json对象进行解析函数，函数返回一个数组
  		parse : function(data) {
  			var aa = [];
  			aa = $.map(eval(data), function(row) {
  					return {
  						data : row,
  						value : row.truename.replace(/(\s*$)/g,""),
  						result : row.truename.replace(/(\s*$)/g,"")
  					};
  				});
  			return aa;
  		},formatItem : function(row, i, max) {
  			return row.truename.replace(/(\s*$)/g,"");
  		}
  	}).result(function(e, item) {
  		//$("#name").val(item.truename)
	});
}
</script>

                
               <div id="perDword" class="perDword" >
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" height="118px">
           <tr>
           <td colspan="3">用户名：<input name="tbUser" type="text" id="name" style="height:23px;width:180px; line-height:23px;" /></td>
           </tr>
           <tr>
           <td colspan="3">密&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="tbPwd" type="password" id="password" style="height:23px;width:180px; line-height:23px;" /></td>
           </tr>
           <tr>
           <td width="15%"></td>
           <td align="center" > <input type="image" name="imgLogin" id="imgLogin"  src="images/dlClick.gif" onclick="login();" style="border-width:0px;" /></td>
           
           <td align="left">
           <input type="image" name="imgLogin" id="imgLogin"  src="images/DR2.gif" onclick="rewrite()" style="border-width:0px;" />
           </td>
           </tr>
           </table>
               </div> 
		</div>

</div>
</div>
</body>
</html>
