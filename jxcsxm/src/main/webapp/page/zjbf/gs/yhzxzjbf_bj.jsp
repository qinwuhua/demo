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
function yzsz(id){
	if(isNaN(Number($(id).val()))){  
		//当输入不是数字的时候，Number后返回的值是NaN;然后用isNaN判断。
        alert('请填入数字！');
        $(id).val('');
		$(id).focus();
    }
}
$(function(){
	
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjbf/queryBfByid.do',
		data:'id='+parent.YMLib.Var.id,
		dataType:'json',
		success:function(msg){
			$('#submit').form("load",msg);
			yztz=msg.ztz;
			$("#tbsj1").datebox('setValue',msg.tbsj);
			$('#bd1').combo('setText',msg.bd);
			loadBmbm('nf','项目年份',msg.bfyf.substr(0,4));
			loadBmbm('yf','月份',msg.bfyf.substr(msg.bfyf.length-2,msg.bfyf.length))
			loadWhBmbm('jhxdwh1',parent.parent.YMLib.Var.xmbm,msg.jhxdwh);
			$("#id").val(parent.YMLib.Var.id);
		}
	});
	
	$("#xmbm").val(parent.parent.YMLib.Var.xmbm);
	
})
var yztz=0;//用于计算是否超出计划下达
function zjbftj(){
	if($('#bd1').combo("getText")==""){alert("请选择或输入标段");return;}
	if($('#jhxdwh1').combo("getValue")==""){alert("请选择计划下达文号");return;}
	if($('#nf').combo("getValue")==""){alert("请选择年份");return;}
	if($('#yf').combo("getValue")==""){alert("请选择月份");return;}
	$('#bfyf').val($('#nf').combo("getValue")+"-"+$('#yf').combo("getValue"));
	$('#bd').val($('#bd1').combo("getText"));
	$('#tbsj').val($('#tbsj1').datebox("getValue"));
	$('#jhxdwh').val($('#jhxdwh1').combo("getValue"));
	var result=true;var ztz=0;
	
	result=validateInput("stz","number",result);
	if(result) ztz=accAdd(ztz,$("#stz").val()==""?0:$("#stz").val());
	result=validateInput("zddzjl","number",result);
	if(result) ztz=accAdd(ztz,$("#zddzjl").val()==""?0:$("#zddzjl").val());
	result=validateInput("ttc","number",result);
	if(result) ztz=accAdd(ztz,$("#ttc").val()==""?0:$("#ttc").val());
	var zbz=ztz;
	result=validateInput("dfzc","number",result);
	if(result) ztz=accAdd(ztz,$("#dfzc").val()==""?0:$("#dfzc").val());
	result=validateInput("yhdk","number",result);
	if(result) ztz=accAdd(ztz,$("#yhdk").val()==""?0:$("#yhdk").val());
	$('#ztz').val(ztz);
	var dyjhz = false;var dyjhb = false;  var xmbm=parent.parent.YMLib.Var.xmbm;var jhxdwh=$('#jhxdwh1').combo("getValue");
	var dwzj=0;var dwzbz=0;
	
	
	$.ajax({
		type:'post',
		url:'/jxcsxm/jhcx/getbfByWhbj.do',
		data:"xmjbxx.jhxdwh="+jhxdwh+"&xmjbxx.xmbm="+xmbm+"&xmjbxx.id="+parent.YMLib.Var.id,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg!=null){
				dwzj=msg.dwzj;dwzbz=msg.dwzbz;
			}
		}
	});
	$.ajax({
		type:'post',
		url:'/jxcsxm/jhcx/getdwByWh.do',
		data:"xmjbxx.jhxdwh="+jhxdwh+"&xmjbxx.xmbm="+xmbm,
		dataType:'json',
		async:false,
		success:function(msg){
			if(parseFloat(msg.dwzj)<parseFloat(accAdd(ztz,dwzj))){
				dyjhz=true;
			}
			if(parseFloat(msg.dwzbz)<parseFloat(accAdd(zbz,dwzbz))){
				dyjhb=true;
			}
			
		}
	});
	if(dyjhz){
		if(!confirm("所填总投资大于到位总投资，是否继续")){
			return;
		}
	}
	if(dyjhb){
		if(!confirm("所填总补助大于到位总补助，是否继续")){
			return;
		}
	}
	
	
	//验证是否金额是负数，是则提示
	if(parseFloat(ztz)<0||parseFloat(zbz)<0){
		if(!confirm("所填资金为负数，是否继续")){
			return;
		}
	}
	//验证时间是否超前
	if(parseFloat(new Date().getFullYear())<parseFloat($('#nf').combo("getValue"))){
		if(!confirm("所填时间大于现实时间，是否继续")){
			return;
		}
	}
	if(parseFloat(new Date().getFullYear())==parseFloat($('#nf').combo("getValue"))){
		if(parseFloat((new Date().getMonth()+1))<parseFloat($('#yf').combo("getValue"))){
			if(!confirm("所填时间大于现实时间，是否继续")){
				return;
			}
		}
	}
	if(result){
		$('#submit').ajaxSubmit({
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("保存成功！");
					parent.$("#grid").datagrid('reload');
					parent.getdwTj();
					parent.parent.$("#grid").datagrid('reload');
					parent.parent.loadTj();
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
<form id="submit" action="/jxcsxm/zjbf/updateZjbf.do" method="post">
<table class='table' style="width: 100%; background-color: #FFE7BA; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='1'>*</font>标段：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<select id="bd1" class='easyui-combobox' style="width: 124px">
						<option value="没有标段" >没有标段</option>
					</select>
					<br><span style="color: red">若有标段，请删掉手动输入</span>
					<input type="hidden" name='bd' id="bd" style="width: 120px" />
					<input type="hidden" name='id' id="id" style="width: 120px" />
					<input type="hidden" name='xmbm' id="xmbm" style="width: 120px" />
					<input type="hidden" name='ztz' id="ztz" style="width: 120px" />
					<input type="hidden" name='bfyf' id="bfyf" style="width: 120px" />
					
					</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				<font color='red' size='1'>*</font>计划下达文号：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="jhxdwh1" style="width: 124px" />
					<input type="hidden" name='jhxdwh' id="jhxdwh" style="width: 120px" />
					</td>
				
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				省投资：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="stz" id="stz" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				重点打造奖励：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zddzjl" id="zddzjl" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				
			</tr>
			<tr style="height: 35px;">
			<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="dfzc" id="dfzc" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				厅统筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="ttc" id="ttc" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				拨付月份:
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 <input type="text" class='easyui-combobox' id='nf' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 53px;">
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
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
				 	<input type="text" class='easyui-datebox' name="tbsj1" id="tbsj1" style="width: 124px" />
				 	<input type="hidden" name="tbsj" id="tbsj" style="width: 124px" />
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				备注：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea name="bz" id="bz" rows="2" style="width: 310px;"></textarea>
				
			</tr>
			<tr style="height: 35px;">
				<td colspan="4" style="background-color: #ffffff;"align="center">
				<a id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjbftj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">保存</a>
				<a id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:closeWindow()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">取消</a>
			
			</tr>
		</table>
	</form>
</body>
</html>