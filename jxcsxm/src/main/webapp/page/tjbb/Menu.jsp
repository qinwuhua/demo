
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjbb/js/Menu.js"></script>

<style type="text/css">
body{
	margin:0;
	padding:0;
	background:#f1f1f1;
	font:70% Arial, Helvetica, sans-serif; 
	color:#555;
	line-height:150%;
	text-align:left;
}
a{
	text-decoration:none;
	color:#057fac;
}
a:hover{
	text-decoration:none;
	color:#999;
}
h1{
	font-size:140%;
	margin:0 20px;
	line-height:80px;	
}
#container{
	margin:0 auto;
	width:680px;
	background:#fff;
	padding-bottom:20px;
}
#content{margin:0 20px;}
p{	
	margin:0 auto;
	width:680px;
	padding:1em 0;
}
</style>
<script type="text/javascript">
$(function(){
	if(getParam("id")=="") $("#rightContent").attr("src", "../../welcome.jsp");
});
</script>
</head>
<body id="index_layout" class="easyui-layout">
    <div data-options="region:'west',split:true, iconCls: 'icon-west'" style="width:293px;overflow:hidden">
		<div id="aa" fit="true" class="easyui-accordion" style="width:285px;">
			
			
			
		</div>
    </div>
    <div data-options="region:'center',border:'false'" style="margin: 0px; padding: 0px;overflow: hidden;">
        <iframe id="rightContent" name="rightContent"  frameborder='0' height=100%' width='100%'></iframe>
    </div>
</body>
</html>