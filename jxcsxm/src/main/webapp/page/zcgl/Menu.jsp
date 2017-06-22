
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="./js/Menu.js"></script>
<script type="text/javascript">
$(function(){
    $("#rightContent").attr("src", "../../welcome.jsp");
});
</script>
</head>
<body id="index_layout" class="easyui-layout">
    <div data-options="region:'west',split:true, iconCls: 'icon-west'" style="width:200px;overflow:hidden">
		<div id="aa" fit="true" class="easyui-accordion" style="width:195px;">  
		    <!-- <div id="left_menu1" title="系统管理" data-options="iconCls:'icon-note',selected:true" style="overflow:auto;">
		    	<ul id="tree0104"></ul>
		    </div> -->
		</div>
    </div>
    <div data-options="region:'center',border:'false'" style="margin: 0px; padding: 0px;overflow: hidden;">
        <iframe id="rightContent" name="rightContent"  frameborder='0' height=100%' width='100%'></iframe>
    </div>
</body>
</html>