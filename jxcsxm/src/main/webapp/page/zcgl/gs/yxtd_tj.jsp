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
$(function(){
	_xmid=parent.YMLib.Var.xmbm;
	loadBmbm('nf1','资产年份',new Date().getFullYear());
	if($.cookie("unit")=='36')
		loadUnits('gydw1','21101360000','21101360000');
	else
		loadUnits('gydw1',$.cookie('unit'),$.cookie('unit'));
	//文件上传
	loadFileUpload();
			
})

function zjdwtj(){
	//alert(($("#nf").val()-1)+$("#lxbm").val()+$("#qdzh").val()+$("#zdzh").val());
	if($.cookie('unit2').length==11){
		$("#xsbzt").val('未上报');$("#ssbzt").val('未上报');
	}
	if($.cookie('unit2').length==9){
		$("#xsbzt").val('已上报');$("#ssbzt").val('未上报');
		
	}
	if($.cookie('unit2').length==7){
		$("#xsbzt").val('已上报');$("#ssbzt").val('已上报');
	}
	$("#sbthcd").val($.cookie('unit2').length);
	$("#xmlx").val("yxtd");
	$("#fid").val(_xmid);
	var flag=true;
	if($("#gydw1").combo("getValue")=='36'){
		alert("请选择正确的管养单位");
		flag=false;
	}
	$("#gydwdm").val($("#gydw1").combo("getValue"));
	$("#gydw").val($("#gydw1").combo("getText"));
	$("#nf").val($("#nf1").datebox('getValue'));
	
	if(flag)
		$('#submit').ajaxSubmit({
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("保存成功！");
					parent.$("#grid").datagrid('reload');
					//parent.getdwTj();
					closeWindow();
				}else{
					alert("保存失败！");
				}
			},
			error:function(msg){
				alert("保存失败！");
			}
		});
	
}



function loadFileUpload(){
	$("#uploadFj").uploadify({
		/*注意前面需要书写path的代码*/
		'uploader' : '../../../js/uploader/uploadify.swf',
		'script' : '../../../zcgl/uploadFj.do',
		'cancelImg' : '../../../js/uploader/cancel.png',
		'queueID' : 'fileQueue',
		'fileDataName' : 'uploadFj',
		'auto' : false,
		'multi' : false,
		'buttonImg': '../../../js/uploader/bdll.png',
		'simUploadLimit' : 3,
		'sizeLimit' : 900000000000,
		'queueSizeLimit' : 5,
		'fileDesc' : '支持格式:xls',
		'fileExt' : '',
		'height' : 30,
		'width' : 92,
		'scriptData' : {
			'zcgl.xmlx':"yxtd",
			'zcgl.id':_xmid
		},
		onComplete : function(event, queueID, fileObj, response, data) {
			alert(response);
			fileShowdsc(_xmid,"fjTable");
		},
		onError : function(event, queueID, fileObj) {
			alert("文件:" + fileObj.name + "上传失败");
		},
		onCancel : function(event, queueID, fileObj) {
		},
		onQueueFull : function(event, queueSizeLimit) {
			alert("最多支持上传文件数为：" + queueSizeLimit);
		}
	});
}
function upload(){
		$("#uploadFj").uploadifySettings('scriptData',{'zcgl.xmlx':"yxtd",'zcgl.id':_xmid});
		$('#uploadFj').uploadifyUpload();
}

</script>
</head>
<body>
<script type="text/javascript">

</script>
<form id="submit" action="/jxcsxm/zcgl/insertZcglqt.do" method="post">
<table class='table' style="width: 100%; background-color: #FFE7BA; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				管养单位：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='gydw1' id="gydw1"  style="width: 263px" />
					<input type="hidden" name="gydw" id='gydw'>
					<input type="hidden" name="gydwdm" id='gydwdm'>
					<input type="hidden" name="xsbzt" id='xsbzt'>
					<input type="hidden" name="ssbzt" id='ssbzt'>
					<input type="hidden" name="sbthcd" id='sbthcd'>
					<input type="hidden" name="xmlx" id='xmlx'>
					<input type="hidden" name="fid" id='fid'>
					
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				年份：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='nf1' id="nf1"  style="width: 263px" />
					<input type="hidden" name="nf" id='nf'>
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				位置：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text" name='wz' id="wz"  style="width: 263px" />
					
					</td>
			
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;width:20%" align="right">
				面积（平方米）：</td>
				<td style="background-color: #ffffff; height: 20px;width:30%" align="left">
					<input type="text"  id="mj" name='mj'  style="width: 263px" />
					</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				资产（万元）：</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<input type="text" name="zcqms" id="zcqms" onchange="yzsz(this)" style="width: 263px" />
				</td>
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				负债（万元）：
				</td>
				<td style="background-color: #ffffff; height: 20px;" align="left">
				 	<input type="text" name="fzqms" id="fzqms" onchange="yzsz(this)" style="width: 263px" />
				</td>
			</tr>
			<tr style="height: 35px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				备注：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<textarea id='bz' name="bz" style="width: 550px"></textarea>
				</td>
				
			</tr>
			<tr style="height: 65px;">
				<td style="background-color:#FFEFD5;color: #007DB3; font-weight: bold;" align="right">
				附件：</td>
				<td colspan="3" style="background-color: #ffffff; height: 20px;" align="left">
					<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="0" cellspacing="0">
						<tbody id="fjTable"></tbody>
					</table>
					<table width="100%">
						<tr>
							<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadFj" id="uploadFj" /></td>
							<td width="100%"><div id="fileQueue" ></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="upload()"  style="border-width:0px;cursor: hand;" /><span style="color: red;font-size: x-small;vertical-align: 50%">*提示，上传附件时一定要点击上传按钮，等待文件上传百分百之后再保存。</span>
							</td>
						</tr>
					</table>
				</td>
				
			</tr>
			
			
			<tr style="height: 35px;">
				<td colspan="4" style="background-color: #ffffff;"align="center">
				<a id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjdwtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">保存</a>
			
			</tr>
		</table>
	</form>
</body>
</html>