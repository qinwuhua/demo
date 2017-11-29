<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资金到位</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>
<style type="text/css">.table{border: 1px solid #FFE7BA;} .table tr{border: 1px solid #FFE7BA;} .table tr td{border: 1px solid #FFE7BA;}</style>
<script type="text/javascript">

$(function(){
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjtj/queryBfByid.do',
		data:'id='+parent.YMLib.Var.id,
		dataType:'json',
		success:function(msg){
			$('#submit').form("load",msg);
			var inputArray= $('input');
			$.each(inputArray,function(index,item){
				$(item).attr("readonly","readonly");
			});
			
		}
	});
})


</script>
</head>
<body>
<script type="text/javascript">

</script>
<form id="submit" action="/jxcsxm/zjtj/insertZjdw.do" method="post">
<table class='table' style="width: 100%; background-color: #FFE7BA; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='1'>*</font>标段：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='bd' id="bd" style="width: 120px" />
					
					
					</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='1'>*</font>计划下达文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='jhxdwh' id="jhxdwh" style="width: 120px" />
					</td>
				
			</tr>
			
			
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				车购税：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="cgs" id="cgs" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="dfzc" id="dfzc" onchange="yzsz(this)" style="width: 120px" />万元</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				厅统筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="ttc" id="ttc" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				调剂月份:
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				<input type="text" name='bfyf' id="bfyf" style="width: 120px" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				填报人：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="tbr" id="tbr" style="width: 120px" /></td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				填报时间：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 	<input type="text" name="tbsj" id="tbsj" style="width: 120px" />
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				备注：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea readonly="readonly" name="bz" id="bz" rows="2" style="width: 310px;"></textarea>
				
			</tr>
			<tr style="height: 35px;">
				<td colspan="4" style="background-color: #ffffff;"align="center">
				<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:closeWindow()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">关闭</a>
			</tr>
		</table>
	</form>
</body>
</html>