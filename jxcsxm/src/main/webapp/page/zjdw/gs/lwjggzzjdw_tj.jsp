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
<style type="text/css">TD {font-size: 12px;} a{text-decoration:none;}</style>
<script type="text/javascript">
function yzsz(id){
	if(isNaN(Number($(id).val()))){  
		//当输入不是数字的时候，Number后返回的值是NaN;然后用isNaN判断。
        alert('请填入数字！');
        $(id).val('');
		$(id).focus();
    }
}
$(function(){
	loadBmbm('bd1','标段');
	loadBmbm('nf','项目年份',new Date().getFullYear());
	var yf=new Date().getMonth()+1;
	if(yf<10)loadBmbm('yf','月份',"0"+yf);else loadBmbm('yf','月份',yf);
	loadWhBmbm('jhxdwh1',parent.parent.YMLib.Var.xmbm);
	$("#sbthcd").val($.cookie('unit2').length);
	var xsbzt="";var ssbzt="";
	if($.cookie('unit2').length==7){
		xsbzt='已上报';ssbzt='已上报'
	}
	if($.cookie('unit2').length==9){
		xsbzt='已上报';ssbzt='未上报'
	}
	if($.cookie('unit2').length==11){
		xsbzt='未上报';ssbzt='未上报'
	}
	$("#xsbzt").val(xsbzt);
	$("#ssbzt").val(ssbzt);
	$("#xmbm").val(parent.parent.YMLib.Var.xmbm);
	
})

function zjdwtj(){
	if($('#bd1').combo("getValue")==""){alert("请选择标段");return;}
	if($('#jhxdwh1').combo("getValue")==""){alert("请选择计划下达文号");return;}
	if($('#nf').combo("getValue")==""){alert("请选择年份");return;}
	if($('#yf').combo("getValue")==""){alert("请选择月份");return;}
	$('#dwyf').val($('#nf').combo("getValue")+"-"+$('#yf').combo("getValue"));
	$('#bd').val($('#bd1').combo("getValue"));
	$('#jhxdwh').val($('#jhxdwh1').combo("getValue"));
	var result=true;var ztz=0;
	result=validateInput("cgs","number",result);
	if(result) ztz=accAdd(ztz,$("#cgs").val()==""?0:$("#cgs").val());
	result=validateInput("stz","number",result);
	if(result) ztz=accAdd(ztz,$("#stz").val()==""?0:$("#stz").val());
	result=validateInput("dfzc","number",result);
	if(result) ztz=accAdd(ztz,$("#dfzc").val()==""?0:$("#dfzc").val());
	
	$('#ztz').val(ztz);
	
	if(result){
		$('#submit').ajaxSubmit({
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("保存成功！");
					parent.$("#grid").datagrid('reload');
					parent.getdwTj();
					closeWindow();
				}else{
					alert("保存失败！");
					
				}
			},
			error:function(msg){
				alert("保存失败！");
			}
		});
	}else{
		return;
	}
	
}




</script>
</head>
<body>
<script type="text/javascript">

</script>
<form id="submit" action="/jxcsxm/zjdw/insertZjdw.do" method="post">
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='2'>*&nbsp;</font>标段：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="bd1" style="width: 124px" />
					<input type="hidden" name='bd' id="bd" style="width: 120px" />
					
					<input type="hidden" name='xmbm' id="xmbm" style="width: 120px" />
					<input type="hidden" name='sbthcd' id="sbthcd" style="width: 120px" />
					<input type="hidden" name='xsbzt' id="xsbzt" style="width: 120px" />
					<input type="hidden" name='ssbzt' id="ssbzt" style="width: 120px" />
					<input type="hidden" name='ztz' id="ztz" style="width: 120px" />
					<input type="hidden" name='dwyf' id="dwyf" style="width: 120px" />
					
					</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='2'>*&nbsp;</font>计划下达文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="jhxdwh1" style="width: 124px" />
					<input type="hidden" name='jhxdwh' id="jhxdwh" style="width: 120px" />
					</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				车购税：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="cgs" id="cgs" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				省投资：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="stz" id="stz" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="dfzc" id="dfzc" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;" align="right">
				到位月份：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 <input type="text" class='easyui-combobox' id='nf' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 53px;">
				
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td colspan="4" style="background-color: #ffffff;"align="center">
				<a id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjdwtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">保存</a>
				<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:closeWindow()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">取消</a>
			
			</tr>
		</table>
	</form>
</body>
</html>