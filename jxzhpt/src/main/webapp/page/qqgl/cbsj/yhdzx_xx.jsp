<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安保工程添加</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/autocomplete/jquery.autocomplete.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/page/qqgl/js/util.js"></script>
	<script type="text/javascript">
		$(function(){
			loadBmbm2('jsjsdj','技术等级');
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryCbsjByXmbm.do',
				data:'cbsj.xmlx='+4+'&cbsj.xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(data){
					$('#cbsj').form("load",data);
					fileShow(parent.YMLib.Var.xmbm,"设计批复文件");
					$('#sfbj').val(1);
				}
			});
			$.ajax({
				type:'post',
				url:'../../../qqgl/queryXmsqByXmbm.do',
				data:'xmlx='+4+'&xmbm='+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(msg){
					loadDist("xzqh1",msg.xzqhdm);
					loadUnit("gydw1",msg.gydwdm);
					$('#xmsq').form("load",msg);
					$('#xmbm1').val(msg.xmbm);
					$('#xmbm1').attr("disabled","disabled");
					$('#xmlx').val(4);
					var inputArray= $('input');
					$.each(inputArray,function(index,item){
						$(item).attr("disabled","disabled");
					});
					$('#jsfa').attr("disabled","disabled");
					$('#bz').attr("disabled","disabled");
					if(msg.xfchd=='是'){
						$("#xfcse").attr('checked','checked');
					}
					if(msg.snhntmchbhd=='是'){
						$("#snhntmchbse").attr('checked','checked');
					}
					if(msg.bxhd=='是'){
						$("#bxse").attr('checked','checked');
					}
					if(msg.snhntmcsshhd=='是'){
						$("#snhntmcsshse").attr('checked','checked');
					}
					$("#sbzj1").html(msg.sbzj);
					$("#sbzj").val(msg.sbzj);
				}
			});
			loadFileUpload();
			getghxx(parent.YMLib.Var.xmbm);
		});
		function getghxx(xmid){
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/getghxx.do',
				data:"xmsq.xmbm="+xmid+"&xmsq.jsxz=jh",
				dataType:'json',
				success:function(msg){
					$("#ghlx").html(msg.ghlxbm);
					
				},
				error : function(){
				 YMLib.Tools.Show('未检索到数据错误！error code = 404',3000);
			 }
			});	
		}
		function loadFileUpload(){
			$("#uploadSjpf").uploadify({
				/*注意前面需要书写path的代码*/
				'uploader' : '../../../js/uploader/uploadify.swf',
				'script' : '../../../qqgl/uploadSjpf.do',
				'cancelImg' : '../../../js/uploader/cancel.png',
				'queueID' : 'fileQueue',
				'fileDataName' : 'uploadSjpf',
				'auto' : false,
				'multi' : false,
				'buttonImg': '../../../js/uploader/bdll.png',
				'simUploadLimit' : 3,
				'sizeLimit' : 20000000,
				'queueSizeLimit' : 5,
				'fileDesc' : '支持格式:xls',
				'fileExt' : '',
				'height' : 30,
				'width' : 92,
				'scriptData' : {
					'cbsj.xmbm':parent.YMLib.Var.xmbm
				},
				onComplete : function(event, queueID, fileObj, response, data) {
					alert(response);
					fileShow(parent.YMLib.Var.xmbm,"设计批复文件");
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
	</script>
</head>
<body style="font-size: 12px;">
	<div>
		<form id="xmsq" action="">
			<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						养护大中修项目 — 立项审核
					</td>
				</tr>
				<tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylxbh" name="ylxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
					<input id="xmlx" name="xmlx" value="4" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路线编号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ghlxbh" name="ghlxbh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					路面宽度</td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lmkd" name="lmkd" type="text" style="width: 80px;"/>&nbsp;米&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					路线名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lxmc" name="lxmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					起点名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="qdmc" name="qdmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span><br/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					止点名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zdmc" name="zdmc" type="text" style="width: 80px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					起点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="qdzh" name="qdzh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					止点桩号</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="zdzh" name="zdzh" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					里程</td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="lc" name="lc" type="text" style="width: 80px;"/>&nbsp;km&nbsp;<span style="color: red;">*</span>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					原路面类型</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylmlx" name="ylmlx" type="text" style="width: 120px;"/>&nbsp;
					<span style="color: red;">*</span><br/>
					
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					原路面结构</td>
				<td colspan="3" style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ylmjg" name="ylmjg" type="text" style="width: 120px;"/>&nbsp;
					<span style="color: red;">*</span><br/>
				</td>
				
            </tr>
            <tr style="height: 35px;">
				<td style="background-color:#F1F8FF;color: #007DB3; font-weight: bold;width:150px" align="right">
					规划路线信息</td>
				<td colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
					<span id="ghlx"></span>
				</td>
			</tr>
            <tr style="height: 30px;">
				<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级及里程
				</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
					二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
					三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
					四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
					等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
					高速公路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
				</td>
			</tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					技术等级</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jsdj" name="jsdj" type="text" style="width: 124px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					行政区划</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xzqh1" name="xzqh1" type="text" style="width: 124px;"/>
					<input id="xzqh" name="xzqh" type="hidden"/>
					<input id="xzqhdm" name="xzqhdm" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					管养单位</td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gydw1" name="gydw1" type="text" style="width: 120px;"/>
					<input id="gydw" name="gydw" type="hidden"/>
					<input id="gydwdm" name="gydwdm" type="hidden"/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					项目编码</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmbm1" name="xmbm1" type="text" style="width: 120px;"/>
					<input id="xmbm" name="xmbm" type="hidden"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					项目名称</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="xmmc" name="xmmc" type="text" style="width: 120px;"/>&nbsp;<span style="color: red;">*</span>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					总投资</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="ntz" name="ntz" type="text" style="width: 80px;"/>&nbsp;万元
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					计划开工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhkgsj" name="jhkgsj" type="text" class="easyui-datebox" style="width: 124px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					计划完工时间</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="jhwgsj" name="jhwgsj" type="text" class="easyui-datebox" style="width: 120px;"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					工期（月）</td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gq" name="gq" type="text" style="width: 80px;"/>
				</td>
            </tr>
            <tr style="height: 30px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					工程分类</td>
				<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="gcfl" name="gcfl" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
					特殊地区</td>
				<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<input id="tsdq" name="tsdq" type="text"/>
				</td>
				<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;"></td>
				<td style="border-left: 1px solid #C0C0C0;border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
            </tr>
            <tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					建设方案</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<textarea id="jsfa" name="jsfa" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
            <tr style="height: 70px;">
            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
					备注</td>
				<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
					<textarea id="bz" name="bz" rows="" cols="" style="width: 650px;height: 60px;"></textarea>
				</td>
            </tr>
            <tbody id='bzsf'>
	            <tr>
	            	<td rowspan="5" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青混凝土面层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqhntmcdj">1150</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：70号重胶沥青
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqhntmchd' value='0' onchange="jsbzzj('lqhntmc')" name='lqhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqhntmc' name='lqhntmc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						改性沥青混凝土面层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="gxlqhntmcdj">1300</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：SBS
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='gxlqhntmchd' value='0' onchange="jsbzzj('gxlqhntmc')" name='gxlqhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='gxlqhntmc' name='gxlqhntmc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
            	<tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmcdj">450</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='snhntmchd' value='0' onchange="jsbzzj('snhntmc')" name='snhntmchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmc' name='snhntmc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面就地热再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmjdrzsdj">1250</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmjdrzshd' value='0' onchange="jsbzzj('lqlmjdrzs')" name='lqlmjdrzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmjdrzs' name='lqlmjdrzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面场拌热再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmcbrzsdj">950</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmcbrzshd' value='0' onchange="jsbzzj('lqlmcbrzs')" name='lqlmcbrzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmcbrzs' name='lqlmcbrzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						基层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水稳基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="swjcdj">200</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='swjchd' value='0' onchange="jsbzzj('swjc')" name='swjchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='swjc' name='swjc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面泡沫沥青就地冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmpmlqjdlzsdj">600</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmpmlqjdlzshd' value='0' onchange="jsbzzj('lqlmpmlqjdlzs')" name='lqlmpmlqjdlzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmpmlqjdlzs' name='lqlmpmlqjdlzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面乳化沥青就地冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmrhlqjdlzsdj">700</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmrhlqjdlzshd' value='0' onchange="jsbzzj('lqlmrhlqjdlzs')" name='lqlmrhlqjdlzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmrhlqjdlzs' name='lqlmrhlqjdlzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						沥青路面场拌冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="lqlmcblzsdj">650</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：作柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='lqlmcblzshd' value='0' onchange="jsbzzj('lqlmcblzs')" name='lqlmcblzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='lqlmcblzs' name='lqlmcblzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						新做柔性基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xzrxjcdj">800</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='xzrxjchd' value='0' onchange="jsbzzj('xzrxjc')" name='xzrxjchd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xzrxjc' name='xzrxjc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水稳基层冷再生
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="swjclzsdj">170</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input id='swjclzshd' value='0' onchange="jsbzzj('swjclzs')" name='swjclzshd' type="text" class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='swjclzs' name='swjclzs' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						下封层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						下封层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="xfcdj">8</span>元/平方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='xfcse' onclick="jsbzzj('xfc')" type="checkbox"/>
						<input type="hidden" id='xfchd' name='xfchd'>
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='xfc' name='xfc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td rowspan="2" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						挖除面层与基层</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						挖除水泥面板
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wcsnmbdj">100</span>100元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：5MP
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input type="text" value='0' onchange="jsbzzj('wcsnmb')" id='wcsnmbhd' name='wcsnmbhd' class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wcsnmb' name='wcsnmb' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr >
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						挖除水稳基层
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="wcswjcdj">30</span>元/立方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						厚度：<input type="text" value='0' onchange="jsbzzj('wcswjc')" id='wcswjchd' name='wcswjchd' class="easyui-numberbox" style="width:50px;"/>cm
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='wcswjc' name='wcswjc' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						打板</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层换板
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmchbdj">160</span>元/平方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='snhntmchbse' onclick="jsbzzj('snhntmchb')" type="checkbox"/>
						<input type="hidden" id='snhntmchbhd' name='snhntmchbhd'>
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmchb' name='snhntmchb' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						标线</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						标线
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：二级及以下  <span id="bxerdj">10000</span>元/公里,一级<span id="bxyidj">15000</span>元/公里
						
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：中修打板不计
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='bxse' onclick="jsbzzj('bx')" type="checkbox"/>
						<input type="hidden" id='bxhd' name='bxhd'>
						
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='bx' name='bx' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr>
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						碎石化</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						水泥混凝土面层碎石化
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						单价：<span id="snhntmcsshdj">8</span>元/平方米
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						备注：
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						选择：<input id='snhntmcsshse' onclick="jsbzzj('snhntmcssh')" type="checkbox"/>
						<input type="hidden" id='snhntmcsshhd' name='snhntmcsshhd'>
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						补助：<input id='snhntmcssh' name='snhntmcssh' type="text" style="width: 50px;" disabled="disabled"/>万元
					</td>
	            </tr>
	            <tr style="height: 30px;">
	            	<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						省补资金</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-right: 1px solid #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<span id='sbzj1'></span>万元
						<input type="hidden" id='sbzj' name="sbzj">
					</td>
					
	            </tr>
	            
            </tbody>
            
         
		</table>
		</table>
		</form>
		<form id="cbsj" action="../../../qqgl/updateCbsj.do">
			<table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px; height: 45px;" cellspacing="0" cellpadding="0">
				<tr style="height: 25px;">
					<td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF; width: 15%; padding-left: 10px;">
						养护大中修项目 — 初步设计或施工图设计
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						项目编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmbm1" name="xmbm" style="width: 120px;" disabled="disabled" type="text"/>
						<input id="xmbm" name="xmbm" type="hidden"/>
						<input id="id" name="id" type="hidden">
						<input id="xmlx" name="xmlx" value="4" type="hidden"/>
						<input id="sfbj" name="sfbj" value="1" type="hidden"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						项目名称
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xmmc" name="xmmc" style="width:120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsdw" name="jsdw" style="width: 120px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						行政区划
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="xzqh" name="xzqh" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						建设技术等级
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsjsdj" name="jsjsdj" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						路线编码
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="ylxbh" name="ylxbh" type="text" style="width:120px;"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						起点桩号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="qdzh" name="qdzh" onchange="querymc('qdzh')" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						讫点桩号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="zdzh" name="zdzh" onchange="querymc('zdzh')" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="lc" name="lc" onchange="querymc('zdzh')" style="width: 100px;" type="text"/>&nbsp; Km
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						技术等级及里程
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						一级公路：<input id="yilc" name="yilc" style="width: 50px;" type="text"/>
						二级公路：<input id="erlc" name="erlc" style="width: 50px;" type="text"/>
						三级公路：<input id="sanlc" name="sanlc" style="width: 50px;" type="text"/>
						四级公路：<input id="silc" name="silc" style="width: 50px;" type="text"/>
						等外公路：<input id="dwlc" name="dwlc" style="width: 50px;" type="text"/>
						高速公路：<input id="wllc" name="wllc" style="width: 50px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层结构
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc" name="mc" style="width:125px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						基层结构
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc" name="jc" style="width:125px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						垫层结构
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc" name="dc" style="width:125px;" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						面层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="mc_lc" name="mc_lc" style="width:125px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						基层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jc_lc" name="jc_lc" style="width:125px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						垫层里程
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="dc_lc" name="dc_lc" style="width:125px;" type="text"/>
					</td>
				</tr>
				<!-- <tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						开工时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="kgsj" name="kgsj" style="width:125px;" class="easyui-datebox" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						完工时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="wgsj" name="wgsj" style="width: 125px;" class="easyui-datebox" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						工期（月）
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="gq" name="gq" style="width:120px;" type="text"/>
					</td>
				</tr> -->
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						设计单位
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjdw" name="sjdw" style="width:120px;" type="text"/>
					</td>
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						设计批复文号
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="sjpfwh" name="sjpfwh" style="width: 120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						批复时间
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="pfsj" name="pfsj" style="width:120px;" class="easyui-datebox" type="text"/>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设性质
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="jsxz" name="jsxz" style="width:120px;" type="text"/>
					</td>
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						工期（月）
					</td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<input id="gq" name="gq" style="width:120px;" type="text"/>
					</td>					
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;"></td>
					<td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;"></td>
				</tr>
				<tr style="height: 70px;">
					<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
						建设方案
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<textarea id="jsfa" name="jsfa" style="width: 650px;height: 50px;"></textarea>
					</td>
				</tr>
				<tr style="height: 30px;">
					<td style="border-left: 1px none #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; padding-right: 5px;">
						上传设计批复文件
					</td>
					<td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
						<table style="margin-top:5px;background-color: #aacbf8; font-size: 12px" border="0" cellpadding="1" cellspacing="1">
							<tbody id="sjpfTable"></tbody>
						</table>
						<table>
							<tr>
								<td><input type="file" value="选择图片" style="background-image: url('../../../js/uploader/bdll.png');" name="uploadSjpf" id="uploadSjpf" /></td>
								<td><div id="fileQueue" ></div></td>
							</tr>
							<tr>
								<td rowspan="2">
									<img name="uploadFile" id="uploadFile" src="../../../js/uploader/upload.png" onclick="$('#uploadSjpf').uploadifyUpload()"  style="border-width:0px;cursor: hand;" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>