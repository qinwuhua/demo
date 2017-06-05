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
<style type="text/css">.table{border: 1px solid #CBE0FF;} .table tr{border: 1px solid #CBE0FF;} .table tr td{border: 1px solid #CBE0FF;}</style>
<script type="text/javascript">

$(function(){
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjbf/queryBfByid.do',
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
<form id="submit" action="/jxcsxm/zjbf/insertZjdw.do" method="post">
<table class='table' style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='1'>*</font>标段：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='bd' id="bd" style="width: 120px" />
					
					
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='1'>*</font>计划下达文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='jhxdwh' id="jhxdwh" style="width: 120px" />
					</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				车购税：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="cgs" id="cgs" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				国债：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="gz" id="gz" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				省债：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sz" id="sz" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				债券：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zq" id="zq" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				厅贷款：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="tdk" id="tdk" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				奖励：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="jl" id="jl" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				其他：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qt" id="qt" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				拨付月份：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name='bfyf' id="bfyf" style="width: 120px" />
				</td>
			</tr>
			
			<tr style="height: 35px;">
				<td colspan="4" style="background-color: #ffffff;"align="center">
				<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:closeWindow()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">关闭</a>
			</tr>
		</table>
	</form>
</body>
</html>