<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel='stylesheet' href='http://js.arcgis.com/3.12/esri/css/esri.css' />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.plug.mb.js"></script>
<script type="text/javascript" src="../../widget/anyChart/js/AnyChart.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="js/Menu.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src='http://js.arcgis.com/3.12/init.js'></script>
<script type="text/javascript">
var map;
$(function(){
	var LeftHeight = $(window).height();
	$('#tab01').css('height', LeftHeight-39);
	loadDataunit();
	$(".datagrid-header").css("display","none");
	dojo.addOnLoad(init);
	xmlxTj();
});
function turnTo(_id,_parent,_name){
	//alert(_id);
	var url="";
	switch(_id.substr(0,8)){
		case "01010201": url="page/dzdt/Menu.jsp";break;
		case "01010203": url="page/lwxm/Menu.jsp";break;
		case "01010301": url="page/jhgl/Menu.jsp";break;
		case "01010402": url="page/gcgl/Menu.jsp";break;
	}
	parent.$("#c1f").attr("src","page/dzdt/Menu.jsp");
	parent.$("#Menu_1").removeClass('now');
	parent.$("#Menu_2").addClass('now');
	
}
</script>
</head>
<body class="easyui-layout" style="background:#fafafa;" scroll="no">
	<div region="west" iconCls="icon-table"  split="true" href="" style="width:250px;">
		<div border="false" class="easyui-tabs" fit="true">
			<div title="定位" class="tab_content" style="overflow:hidden;height:500px;"  id="tab01">
				<table id="dataunit_tree" cellspacing="0" cellpadding="0"></table>
			</div>
    	</div>
    </div>
	
	<div region="east" iconCls="icon-table"  split="true" style="width:420px;">
		<div border="false" class="easyui-tabs">
	    	<div title="提醒信息">您当前共有 10 条信息需要处理， 共有 0 条通知。
	    	<table id="xmlxTj_table" width="398" border="0" align="center" cellpadding="0" cellspacing="1" class="ll" bgcolor="#b8bdc1" style="font-size:12px;"></table>
	    	<div id="anychart_div" style="width:350px;height:300px;margin:10px;"> 
				<div>
					<param name="wmode" value="transparent" />
				</div>
			</div>
			</div>
	    </div>
	</div>
	
    <div region="center" style="padding:0px;background:#eee;">
    	<div class="easyui-layout" fit="true">
			<!-- 地图区域开始 -->
		    <div region="center" style="padding:0px;" border="false">
				<div id="mainTab" border="false" class="easyui-tabs" fit="true">
					
					 <div title="地图" style="overflow: hidden;" href="" iconCls="icon-note">
						<div id="map" style="width:100%;height:100%;"></div>
					</div>
				</div>
		    </div>
		    <!-- 地图区域结束 -->
		</div> 
    </div>  
</body>
</html>
