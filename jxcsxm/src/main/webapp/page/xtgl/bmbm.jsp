<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编目编码管理</title>
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
var dwxx;
var lxData = new Array();
function openDwInsert(_id){
	YMLib.Var.ID=_id;
	YMLib.UI.createWindow('dwgl_add_win','添加编目编码','./bmbm_add.jsp','app_add',450,180);
}
function getbmbmbyid(id){
	$.ajax({
		 type : "POST",
		 url : "../../xtgl/getbmbmbyid.do",
		 dataType : 'json',
		 data : 'unit.id=' +id,
		 success : function(msg){
			 openDwUpdate(msg.id,msg.name,msg.parent,msg.bmid);
		 },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}

function openDwUpdate(_id,_name,_parent,_bmid){
	YMLib.Var.ID=_id;
	YMLib.Var.name=_name;
	YMLib.Var.parent=_parent;
	YMLib.Var.bmid=_bmid;
	YMLib.UI.createWindow('dwgl_add_win','编辑编目编码','./bmbm_update.jsp','app_add',450,180);
}
function deleteDw(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteBmbmById.do",
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
		fit : true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectBmbmList.do',
		queryParams : {
			'unit.id' : ''
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		rowStyler:function(row){
			if (row.persons > 1){
				return 'background:#AAD684;color:#fff';
			}
		},
		columns:[[
            {field:'name',title:'编目编码名称',width:300},
			{field:'id',title:'编目编码id',width:100,align : 'center'},
			{field:'bmid',title:'编码值',width:100,align : 'center'},
			{field : 'sc',title : '操作',width : 200,align : 'center',
				formatter : function(value,rec,index){
					if(rec.id.length<6){
						var str='<a style="text-decoration:none;color:#3399CC;" href=javascript:openDwInsert("'+rec.id+'")>添加</a>&nbsp;&nbsp;';
					}else var str="";
					
					var str3='<a style="text-decoration:none;color:#3399CC;" href=javascript:getbmbmbyid("'+rec.id+'")>修改</a>&nbsp;&nbsp;';
					var str2='<a style="text-decoration:none;color:#3399CC;" href=javascript:deleteDw("'+rec.id+'")>删除</a>&nbsp;&nbsp;';
					
					return str+str3+str2;
				}
			}
		]]
	});
	$("#dwgl_layout").layout();
}
$(function(){
	startSearch();
	/* loadBmbm("test", "开工状态");
	$("#test2").click(function(){
		alert($("#test").combobox("getValues")+"|"+$("#test").combobox("getText"));
	}); */
});
</script>
<div border="false">
<div data-options="region:'north',border:true,split:true" style="height:40px;border-left:0px;border-right:0px;border-top:0px;">
	<div id="righttop">
		<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;编目编码管理</div>
	</div>
</div>
<div region="center" border="false" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;height:700px;" onselectstart="return false">
	<!-- <input id="test"/>
	<input type="button" value="s" id="test2"/> -->
	<table id="xtgl_dwgl_table"></table>
</div>
</div>
</body>
</html>