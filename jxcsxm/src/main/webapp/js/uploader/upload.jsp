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
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/jquery.uploadify.v2.1.4.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<link href="${pageContext.request.contextPath }/js/uploader/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<style type="text/css">
.as {
	font-size: 14px;
	color: #4E4E4E;
	text-decoration: none;
}
</style>
<script type="text/javascript">
        var dg = frameElement.lhgDG;
        $(document).ready(function() {
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
				'tbbmbm1':$.cookie("unit2"),
				'tbbmbm2':$.cookie("unit"),
				'xmlx':flag,
				'sbthcd1':$.cookie("unit2").length
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
	});
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
		//基础库数据导入返回
		if(flag=='wqgz'){
			parent.window.location = '/jxcsxm/page/lwxm/jckgl/wqgz.jsp';
		}
		if(flag=='abgc'){
			parent.window.location = '/jxcsxm/page/lwxm/jckgl/abgc.jsp';
		}
		if(flag=='zhfz'){
			parent.window.location = '/jxcsxm/page/lwxm/jckgl/zhfz.jsp';
		}
		//审查库数据导入返回
		if(flag=='wqgz_sc'){
			parent.window.location = '/jxcsxm/page/lwxm/sckgl/wqgz.jsp';
		}
		if(flag=='abgc_sc'){
			parent.window.location = '/jxcsxm/page/lwxm/sckgl/abgc.jsp';
		}
		if(flag=='zhfz_sc'){
			parent.window.location = '/jxcsxm/page/lwxm/sckgl/zhfz.jsp';
		}
		//计划库数据导入返回
		if(flag=='wqgz_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/wqgz.jsp';
		}
		if(flag=='abgc_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/abgc.jsp';
		}
		if(flag=='zhfz_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/zhfz.jsp';
		}
		if(flag=='gcgj_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/gclmgj.jsp';
		}
		if(flag=='gcsj_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/gclmsj.jsp';
		}
		if(flag=='shuih_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/shxm.jsp';
		}
		if(flag=='yhdzx_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/yhdzx.jsp';
		}
		if(flag=='hsly_jh'){
			parent.window.location = '/jxcsxm/page/jhgl/jhkgl/hslygl.jsp';
		}
		if(flag==1){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/gsdgz.jsp';
		}
		if(flag==2){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/gsdgz.jsp';
		}
		if(flag==3){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/gsdgz.jsp';
		}
		if(flag==4){
			parent.window.location = '/jxcsxm/page/qqgl/zjxd/gsdgz.jsp';
		}
		if(flag==5){
			parent.window.location = '/jxcsxm/page/qqgl/zjxd/gsdgz.jsp';
		}
		if(flag==6){
			parent.window.location = '/jxcsxm/page/qqgl/zjxd/gsdgz.jsp';
		}
		if(flag=="yhlxsh"){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/yhdzxgl.jsp';
		}
		if(flag=="shlxsh"){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/shxmgl.jsp';
		}
		if(flag=="yhcbsj"){
			parent.window.location = '/jxcsxm/page/qqgl/cbsj/yhdzx_sh.jsp';
		}
		if(flag=="shcbsj"){
			parent.window.location = '/jxcsxm/page/qqgl/cbsj/shxm_sh.jsp';
		}
		if(flag=="gzcbsj"){
			parent.window.location = '/jxcsxm/page/qqgl/cbsj/lmgz_sh.jsp';
		}
		if(flag=="sjcbsj"){
			parent.window.location = '/jxcsxm/page/qqgl/cbsj/lmsj_sh.jsp';
		}
		if(flag=="xjcbsj"){
			parent.window.location = '/jxcsxm/page/qqgl/cbsj/xjgc_sh.jsp';
		}
		if(flag=="yhjhxd"){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/yhdzxsh.jsp';
		}
		if(flag=="shjhxd"){
			parent.window.location = '/jxcsxm/page/qqgl/jhsh/shxmsh.jsp';
		}
 		dg.cancel();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body onunload="fanhui()">
	<form method="post" enctype="multipart/form-data" id="formfile">
		<center>
		<input type="file" name="fileupload" id="fileupload" />
		<div id="fileQueue"></div>
		<p>
			<a href="javascript:;" onClick="javascript:uploadifyUpload()"
				class="as"> 开始上传 </a> &nbsp; <a
				href="javascript:jQuery('#fileupload').uploadifyClearQueue()"
				class="as"> 取消所有上传 </a> 
            <a href="#" class="as" onclick="fanhui()" >返回 </a>
		</p>
		<ol class=files>
		</ol>
		<span id="sp"></span>
		</center>
	</form>
</body>
</html>
