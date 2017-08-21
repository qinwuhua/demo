<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>道班房详情</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>
<style type="text/css">.table{border: 1px solid #FFE7BA;} .table tr{border: 1px solid #FFE7BA;} .table tr td{border: 1px solid #FFE7BA;}</style>
<script type="text/javascript">
var _xmid;
function yzsz(id){
	if(isNaN(Number($(id).val()))){  
		//当输入不是数字的时候，Number后返回的值是NaN;然后用isNaN判断。
        alert('请填入数字！');
        $(id).val('');
		$(id).focus();
    }
}

function toupcase(id){
	$(id).val($(id).val().toUpperCase());
}

$(function(){
	var obj=parent.$("#grid").datagrid('getRows')[parent.YMLib.Var.index];
	
	$('#submit').form("load",obj);
	_xmid=obj.fid;
	var inputArray= $('input');
	$.each(inputArray,function(index,item){
		$(item).attr("readonly","readonly");
	});
	fileShowbdsc(_xmid,"fjTable");		
})

</script>
</head>
<body>
<script type="text/javascript">

</script>
<form id="submit" action="/jxcsxm/zcgl/updateZcglqt.do" method="post">
<table class='table' style="width: 100%; background-color: #FFE7BA; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:25%" align="right">
				管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:25%" align="left">
					<input type="text" name="gydw" id='gydw' style="width: 263px">
					<input type="hidden" name="gydwdm" id='gydwdm'>
					<input type="hidden" name="xsbzt" id='xsbzt'>
					<input type="hidden" name="ssbzt" id='ssbzt'>
					<input type="hidden" name="sbthcd" id='sbthcd'>
					<input type="hidden" name="xmlx" id='xmlx'>
					<input type="hidden" name="fid" id='fid'>
					<input type="hidden" name="id" id='id'>
					
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:25%" align="right">
				年份：</td>
				<td style="background-color: #ffffff; height: 20px;width:25%" align="left">
					<input type="text" name="nf" id='nf' style="width: 263px" >
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				道班名称：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='dbmc' id="dbmc"  style="width: 263px" />
					</td>
			
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				路线编码：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="lxbm" name='lxbm'  style="width: 263px" onchange="toupcase(this)"/>
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				所在桩号：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='szzh' id="szzh" onchange="yzsz(this)" style="width: 263px" />
					
					</td>
			
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				占地面积（平方米）：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="mj" name='mj'  style="width: 263px" />
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				资产（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zc" id="zc" onchange="yzsz(this)" style="width: 263px" />
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				债务（万元）：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 	<input type="text" name="fz" id="fz" onchange="yzsz(this)" style="width: 263px" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				备注：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea readonly="readonly" id='bz' name="bz" style="width: 550px"></textarea>
				</td>
				
			</tr>
			<tr style="height: 65px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				附件：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="0" cellspacing="0">
						<tbody id="fjTable"></tbody>
					</table>
					
				</td>
				
			</tr>
			
		</table>
	</form>
</body>
</html>