<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资产管理编辑</title>
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
	var obj=parent.$("#grid").datagrid('getRows')[parent.YMLib.Var.index];
	$('#submit').form("load",obj);
	var inputArray= $('input');
	$.each(inputArray,function(index,item){
		$(item).attr("readonly","readonly");
	});
	if($("#nf").val()>2016){
	$("#qcs").hide();
	}
})

</script>
</head>
<body>
<script type="text/javascript">

</script>
<form id="submit" action="/jxcsxm/zcgl/insertZcgl.do" method="post">
<table class='table' style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:20%" align="right">
				年份：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='nf' id="nf" style="width: 135px" />
					
					<input type="hidden" name='id' id="id" style="width: 135px" />
					<input type="hidden" name='gydwdm' id="gydwdm" style="width: 135px" />
					<input type="hidden" name='sfbj' id="sfbj" style="width: 135px" />
					
					
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:20%" align="right">
				管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="gydw" name='gydw' style="width: 135px" />
					</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lxbm" id="lxbm"  style="width: 135px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				路线名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lxmc" id="lxmc"  style="width: 135px" /></td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				起点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qdzh" id="qdzh"  style="width: 135px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				止点桩号：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zdzh" id="zdzh"  style="width: 135px" /></td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				里程：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="lc" id="lc"  style="width: 135px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				技术等级：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="jsdj" id="jsdj"  style="width: 135px" /></td>
				
			</tr>
			<tr id='qcs' style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				资产期初数：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zcqcs" id="zcqcs" class='bread' onchange="yzsz(this)" style="width: 135px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				负债期初数：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="fzqcs" id="fzqcs" class='bread' onchange="yzsz(this)" style="width: 135px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				资产期末数：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zcqms" id="zcqms" onchange="yzsz(this)" style="width: 135px" />万元</td>
				
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				负债期末数：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 	<input type="text" name="fzqms" id="fzqms" onchange="yzsz(this)" style="width: 135px" />万元
				</td>
			</tr>
			
			
		</table>
	</form>
</body>
</html>