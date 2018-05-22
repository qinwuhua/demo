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
	$("#syzbz").html(parent.$("#syzbz").html());
	$("#sydf").html(parent.$("#sydf").html());
 	loadBmbm('xmlx1','项目类型');
	loadBmbm('nf','项目年份',new Date().getFullYear());
	loadBmbm('nf1','项目年份',new Date().getFullYear());
	loadBmbm('xmnf1','项目年份',new Date().getFullYear());
	
	loadUnit('gydw1',$.cookie('unit'));
	loadDist('xzqh1',$.cookie('dist'));
	var yf=new Date().getMonth()+1;
	var day=new Date().getDate();
	
	if(yf<10)loadBmbm('yf','月份',"0"+yf);else loadBmbm('yf','月份',yf);
	if(yf<10)loadBmbm('yf1','月份',"0"+yf);else loadBmbm('yf1','月份',yf);
	if(yf<10) yf='0'+yf;
	if(day<10) day='0'+day;
	$("#tbr").val($.cookie('name'));
	$("#tbsj1").datebox('setValue',new Date().getFullYear()+"-"+yf+"-"+day);
	$("#sbthcd").val($.cookie('unit2').length);

	$("#trxmbm").val(parent.parent.YMLib.Var.xmbm);
	
})

function zjdwtj(){
	if($('#xmlx1').combo("getValue")==""){alert("请选择调剂的项目类型");return;}
// 	if($('#jhxdwh1').val()==""||$('#jhxdwh2').val()==""||$('#jhxdwh3').val()==""){alert("请选择计划下达文号");return;}
	if($('#gydw1').combo("getValues")==''){alert("请选择管养单位");return;}
	if($('#xzqh1').combo("getValues")==''){alert("请选择行政区划");return;}
	if($('#xmnf1').combo("getValue")==""){alert("请选择项目年份");return;}
	if($('#nf1').combo("getValue")==""){alert("请选择年份");return;}
	if($('#yf1').combo("getValue")==""){alert("请选择月份");return;}
	if($('#nf').combo("getValue")==""){alert("请选择年份");return;}
	if($('#yf').combo("getValue")==""){alert("请选择月份");return;}
	$('#dwyf').val($('#nf').combo("getValue")+"-"+$('#yf').combo("getValue"));
	$('#tjyf').val($('#nf1').combo("getValue")+"-"+$('#yf1').combo("getValue"));
	$('#tbsj').val($('#tbsj1').datebox("getValue"));
	$('#jhxdwh').val("无文号"); 
	$("#xmlx").val($('#xmlx1').combo("getValue"));$("#xmnf").val($('#xmnf1').combo("getValue"));
	$("#gydw").val($('#gydw1').combo("getText"));$("#gydwdm").val($('#gydw1').combo("getValues"));
	$("#xzqh").val($('#xzqh1').combo("getText"));$("#xzqhdm").val($('#xzqh1').combo("getValues"));
	var result=true;var ztz=0;var zbz=0;var zdf=0;
	
	result=validateInput("cgs","number",result);
	if(result) ztz=accAdd(ztz,$("#cgs").val()==""?0:$("#cgs").val());
	result=validateInput("gz","number",result);
	if(result) ztz=accAdd(ztz,$("#gz").val()==""?0:$("#gz").val());
	result=validateInput("sz","number",result);
	if(result) ztz=accAdd(ztz,$("#sz").val()==""?0:$("#sz").val());
	result=validateInput("zq","number",result);
	if(result) ztz=accAdd(ztz,$("#zq").val()==""?0:$("#zq").val());
	result=validateInput("tdk","number",result);
	if(result) ztz=accAdd(ztz,$("#tdk").val()==""?0:$("#tdk").val());
	result=validateInput("jl","number",result);
	if(result) ztz=accAdd(ztz,$("#jl").val()==""?0:$("#jl").val());
	result=validateInput("qt","number",result);
	if(result) ztz=accAdd(ztz,$("#qt").val()==""?0:$("#qt").val());
	result=validateInput("dfzc","number",result);
	if(result) ztz=accAdd(ztz,$("#dfzc").val()==""?0:$("#dfzc").val());
	result=validateInput("ttc","number",result);
	if(result) ztz=accAdd(ztz,$("#ttc").val()==""?0:$("#ttc").val());
	result=validateInput("yhdk","number",result);
	if(result) ztz=accAdd(ztz,$("#yhdk").val()==""?0:$("#yhdk").val());
	result=validateInput("rys","number",result);
	if(result) ztz=accAdd(ztz,$("#rys").val()==""?0:$("#rys").val());
	$('#ztz').val(ztz);
	zbz=accSub(ztz,$("#dfzc").val()==""?0:$("#dfzc").val());
	zbz=accSub(ztz,$("#yhdk").val()==""?0:$("#yhdk").val());
	$('#zbz').val(zbz);
	if(parseFloat(zbz)>parseFloat(parent.$("#syzbz").html())){
		alert("已经超出剩余可调剂补助资金"+parent.$("#syzbz").html());return;
	}
	if(result){
		$('#submit').ajaxSubmit({
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("保存成功！");
					parent.$("#grid").datagrid('reload');
					parent.gettjTj();
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
<form id="submit" action="/jxcsxm/zjtj/insertZjtj.do" method="post">
<table class='table' style="width: 100%; background-color: #FFE7BA; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			<tr style="height: 35px;">
				<td colspan="4" style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="center">
				当前项目剩余可调剂补助资金<font color="red"><span id='syzbz'></span></font>万元，
				地方自筹<font color="red"><span id='sydf'></span></font>万元
				</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:15%" align="right">
				<font color='red' size='1'>*</font>调剂项目类型：</td>
				<td style="background-color: #ffffff; height: 20px;width:35%" align="left">
					<input type="text"  id='xmlx1'    style="width: 181px" />
					<input type="hidden" name='xmlx' id="xmlx" style="width: 120px" />
					<input type="hidden" name='trxmbm' id="trxmbm" style="width: 120px" />
					<input type="hidden" name='ztz' id="ztz" style="width: 120px" />
					<input type="hidden" name='zbz' id="zbz" style="width: 120px" />
					<input type="hidden" name='dwyf' id="dwyf" style="width: 120px" />
					<input type="hidden" name='tjyf' id="tjyf" style="width: 120px" />
					
					</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				调剂月份：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 <input type="text" class='easyui-combobox' id='nf1' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf1' style="width: 53px;">
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				项目名称：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xmmc" id="xmmc"  style="width: 178px" /></td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				项目年份：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xmnf1" id="xmnf1"  style="width: 181px" />
					<input type="hidden" name='xmnf' id="xmnf" style="width: 120px" />
					</td>
				    
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xzqh1" id="gydw1"  style="width: 251px" />
					<input type="hidden" name="gydw" id="gydw"  style="width: 120px" />
					<input type="hidden" name="gydwdm" id="gydwdm"  style="width: 120px" />
					</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				行政区划：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="xzqh1" id="xzqh1"  style="width: 251px" />
					<input type="hidden" name="xzqh" id="xzqh"  style="width: 120px" />
					<input type="hidden" name="xzqhdm" id="xzqhdm"  style="width: 120px" />
					</td>
				
			</tr>
			
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				车购税：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="cgs" id="cgs" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				国债：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="gz" id="gz" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				省债：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="sz" id="sz" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				债券：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zq" id="zq" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				厅贷款：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="tdk" id="tdk" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				奖励：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="jl" id="jl" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				其他：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="qt" id="qt" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				银行贷款：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="yhdk" id="yhdk" onchange="yzsz(this)" style="width: 120px" />万元</td>
				
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				燃油税：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="rys" id="rys" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				厅统筹：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 	<input type="text" name="ttc" id="ttc" onchange="yzsz(this)" style="width: 120px" />万元
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				地方自筹：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="dfzc" id="dfzc" onchange="yzsz(this)" style="width: 120px" />万元</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				到位月份：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 <input type="text" class='easyui-combobox' id='nf' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 53px;">
				<br/><font color="red">调剂项目默认该笔资金已经全部到位</font>
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
					<textarea name="bz" id="bz" rows="2" style="width: 510px;"></textarea>
				
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