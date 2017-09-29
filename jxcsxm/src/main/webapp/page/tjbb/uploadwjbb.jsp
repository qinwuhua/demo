<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<link href="${pageContext.request.contextPath }/js/uploader/uploadify.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>
<style type="text/css">
.as {
	font-size: 14px;
	color: #4E4E4E;
	text-decoration: none;
}
</style>
<script type="text/javascript">
   var dg = frameElement.lhgDG;
   function loadUpload(){
	   var flag=request('flag');
       var url=request('url');
		$("#fileupload").uploadify({
			/*注意前面需要书写path的代码*/
			'uploader' : '../../js/uploader/uploadify.swf',
			'script' : url,
			//'script': function(){return '../../bbdc/fileupload.do?' & ${a}'},
			'cancelImg' : '../../js/uploader/cancel.png',
			'queueID' : 'fileQueue',
			//和存放队列的DIV的id一致 
			'fileDataName' : 'fileupload',
			//和以下input的name属性一致 
			'auto' : false,
			//是否自动开始 
			'multi' : false,
			//是否支持多文件上传 
			//'buttonText' : '浏览...',
			'buttonImg': '../../js/uploader/btn_view.png',
			//按钮上的文字 
			'simUploadLimit' : 3,
			//一次同步上传的文件数目 
			'sizeLimit' : 100000000,
			//设置单个文件大小限制 
			'queueSizeLimit' : 5,
			//队列中同时存在的文件个数限制 
			'fileDesc' : '支持格式:xls',
			//如果配置了以下的'fileExt'属性，那么这个属性是必须的 
			'fileExt' : '',
			//允许的格式   
			'height' : 30,
			'width' : 92,
			//另外上传的参数
			'scriptData' : {
				'gydw':$.cookie("unit"),
				'xmlx':flag
			},
			onComplete : function(event, queueID, fileObj, response, data) {
				/* $('<li></li>').appendTo('.files').text(response); */
				$("#sp").html(response);
			},
			onError : function(event, queueID, fileObj) {
				alert("文件:" + fileObj.name + "上传失败");
			},
			onCancel : function(event, queueID, fileObj) {
				//alert("取消了" + fileObj.name+"上传");
			},
			onQueueFull : function(event, queueSizeLimit) {
				alert("最多支持上传文件数为：" + queueSizeLimit);

			}
		});
   }
   
   function request(strParame) {
   	var args = new Object( );
   	var query = location.search.substring(1);

   	var pairs = query.split("&"); // Break at ampersand
   	for(var i = 0; i < pairs.length; i++) {
   	var pos = pairs[i].indexOf('=');
   	if (pos == -1) continue;
   	var argname = pairs[i].substring(0,pos);
   	var value = pairs[i].substring(pos+1);
   	value = decodeURIComponent(value);
   	args[argname] = value;
   	}
   	return args[strParame];
   	} 
</script>
<script type="text/javascript">
	//必须的 
	function uploadifyUpload() {
		$('#fileupload').uploadifyUpload();
	}
	function fanhui() {
		var flag=request('flag');
		
 		dg.cancel();
	}
	$(function(){
		loadBmbm('nf','项目年份',new Date().getFullYear());
		loadBmbm('yf','月份',((new Date().getMonth()+1)+"").length==1? '0'+(new Date().getMonth()+1):(new Date().getMonth()+1));
		loadUpload();
	});
	function upload(){
		
		if($("#nf").combo("getValue")==""){
			alert("请选择年份");
			return;
		}
		if($("#yf").combo("getValue")==""){
			alert("请选择月份");
			return;
		}
		
		$.post('/jxcsxm/xtgl/exportBb_set.do',{nf:$("#nf").combo("getValue"),yf:$("#yf").combo("getValue")},function(){
			
			
			uploadifyUpload();
		 });
		
		
		
		//jQuery('#fileupload').uploadifyClearQueue();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body onunload="fanhui()">
	<form method="post" enctype="multipart/form-data" id="formfile">
		<center>
		<div style="margin-bottom: 10px;">
		<input id="nf" style="width:60px;">
		
		年
		<input id="yf" style="width:60px;">
			
		月
		</div>
		
		<input type="file" name="fileupload" id="fileupload" />
		<div id="fileQueue"></div>
		<p>
		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:upload()" class="button button-tiny button-rounded button-raised button-primary">上传</a>
		<a id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:fanhui()" class="button button-tiny button-rounded button-raised button-primary">返回</a>
		
		<!-- 
			<a href="javascript:;" onClick="javascript:uploadifyUpload()"
				class="as"> 开始上传 </a> &nbsp; <a
				href="javascript:jQuery('#fileupload').uploadifyClearQueue()"
				class="as"> 取消所有上传 </a> 
            <a href="#" class="as" onclick="fanhui()" >返回 </a> -->
		</p>
		<ol class=files>
		</ol>
		<span id="sp"></span>
		</center>
	</form>
</body>
</html>
