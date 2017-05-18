<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>行政区划管理</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
</head>
<body>
<script type="text/javascript">
function openDwUpdate(_id,_name,_desr){
	YMLib.Var.ID=_id;
	YMLib.Var.name=_name;
	YMLib.Var.desr=_desr;
	YMLib.UI.createWindow('dwgl_add_win','编辑行政区划','./xzqh_update.jsp','app_add',470,220);
}
function openDwInsert(_id){
	YMLib.Var.ID=_id;
	YMLib.UI.createWindow('dwgl_add_win','添加行政区划','./xzqh_add.jsp','app_add',470,220);
}
function deleteDw(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteXzqhById.do",
				 dataType : 'json',
				 data : 'unit.id=' +_id,
				 success : function(msg){
					 if(msg){
						 alert('删除成功！');
						 startSearch();
					 }else{
						 YMLib.Tools.Show('删除失败,请确认没有用户属于此单位',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}
function startSearch(){
	$('#xtgl_dwgl_table').treegrid({
		border:true,
		rownumbers: false,
		fit:true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectXzqhList.do',
		queryParams : {
			'unit.id' : $.cookie("unit")
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		columns:[[
			{field:'name',title:'行政区划名称',width:350,align : 'left'},
			{field:'id',title:'行政区划代码',width:100},
			{field:'desr',title:'描述',width:100,align : 'center'},
			{field : 'sc',title : '操作',width : 200,align : 'center',
				formatter : function(value,rec,index){
					if(rec.bmid.length<=12)
						var str1='|<a href=javascript:openDwInsert('+rec.id+')>添加</a>';
						else var str1='';
					return '<a href=javascript:openDwUpdate("'+rec.id+'","'+rec.name+'","'+rec.desr+'")>编辑</a>|'+
					'<a href=javascript:deleteDw("'+rec.id+'")>删除</a>'+str1;
				}
			}
		]]
	});
	$("#dwgl_layout").layout();
}
$(function(){
	startSearch();
});
</script>
<div border="false">
<div data-options="region:'north',border:true,split:true" style="height:40px;border-left:0px;border-right:0px;border-top:0px;">
	<div id="righttop">
		<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;行政区划管理</div>
	</div>
</div>
<div region="center" border="false" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;height:700px;" onselectstart="return false">
	<table id="xtgl_dwgl_table"></table>
</div>
</div>
</body>
</html>