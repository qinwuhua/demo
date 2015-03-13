<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../js/autocomplete/jquery.autocomplete.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/autocomplete/jquery.autocomplete.js" ></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="./js/trqk.js"></script>

<style type="text/css">
TD {
font-size: 12px;
} 
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		var data=parent.obj;
		$("#gydw").text(data.gydwmc);
		$("#qxrs").text(data.qxrs);
		$("#trqxjf").text(data.trqxjf);
		$("#lq").text(data.lq);
		$("#sn").text(data.sn);
		$("#ss").text(data.ss);
		$("#bzd").text(data.bzd);
		$("#gyy").text(data.gyy);
		$("#lqlbl").text(data.lqlbl);
		$("#wjj").text(data.wjj);
		$("#zzj").text(data.zzj);
		$("#zxqc").text(data.zxqc);
		$("#cstb").text(data.cstb);
		$("#sbtbxj").text(data.sbtbxj);
		$("#tbdw").text(data.tbdwmc);
		$("#tjr").text(data.tjr);
		$("#shr").text(data.shry);
		$("#tbsj").text(data.tbsj);
	});
</script>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况基本信息 
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="gydw" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">抢修人数(工日)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="qxrs" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">投入抢修经费(万元)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="trqxjf" /></td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况材料 
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">沥青(吨)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="lq" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">水泥(吨)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sn" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">沙石(立方)：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="ss" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">编织袋(个)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="bzd" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">工业盐(吨)：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="gyy" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">沥青冷补料：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="lqlbl" /></td>
			</tr>
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况设备（台班）  
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">挖掘机 ：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="wjj" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">装载机：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="zzj" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">自卸汽车：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="zxqc" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">抽水台班：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="cstb" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">设备台班小计：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="sbtbxj" style="width: 156px" /></td>
			</tr>			
			<tr>
				<td colspan="6" style="background-color: #F1F8FF;color: #007DB3; height: 20px;" align="left">
					公路水毁抢修人财物投入情况填报信息  
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tbdw" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">统计人：</td>
				<td style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tjr" style="width: 156px" /></td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">审核人：</td>
				<td style="background-color: #ffffff; height: 20px;width:20%" align="left">
					<span id="shr" /></td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:15%" align="right">填报时间：</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;width:18%" align="left">
					<span id="tbsj" style="width: 156px" /></td>
			</tr>
			<tr style="height: 35px;">
				<td colspan="6" style="background-color: #ffffff;"align="center">
				<a href="javascript:void(0)" id="qx_window" class="easyui-linkbutton"  plain="true" iconCls="icon-cancel" onclick="closes('trqk_xx')">返回</a></td>
			</tr>
			</table>
</body>
</html>