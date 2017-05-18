<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息管理</title>
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
<body style="margin:0 0 0 0;overflow: hidden;">
<script type="text/javascript">
function openYhUpdate(_id){
	YMLib.Var.ID=_id;
	YMLib.UI.createWindow('yhgl_add_win','编辑用户','./yhgl_update.jsp','xmgl_03',470,380);
}
function deleteYh(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteYh.do",
				 dataType : 'json',
				 data : 'yhm=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#jsgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}

function mimcz(index){
	var obj=$("#jsgl_table").datagrid('getRows')[index]
	var name=obj.name;
	if(name=='')
		name=obj.truename;
	if(confirm("确认重置   "+name+"  的密码吗？")){
		var username=obj.truename;
		var password="000000";//原密码
		$.ajax({
			 type : "POST",
			 url : "../../xtgl/updatePassword.do",
			 dataType : 'json',
			 data : {
					'username' : username,
					'password' : password
				},
			 success : function(msg){
				 alert('修改密码成功！');
				 parent.$("#updatePassword").window('destroy');
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求失败！',3000);
			 }
		});
	}
	
}



function startSearch(){
	//alert($('#test').combobox("getValue")+"|"+$('#test').combobox("getText"));
	
	$("#jsgl_table").datagrid({
		border:true,
		//fit:true,
		height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
		pagination:true,
	    rownumbers:true, 
	    pageNumber:1,
	    pageSize:10,
	    fitColumns:true,
		loadMsg:'正在加载请稍候...',
		url:'../../xtgl/selectYhList.do',
		queryParams : {
			"master.truename":$("#yhm").val(),
			"master.unit":$("#unit").combotree("getValue")
		},
		striped:true,
		singleSelect:false,
		columns:[[
		{
			field : 'bj',
			title : '编辑',
			width : 150,
			align : 'center',
			formatter : function(value,rec,index){
				return '<a style="text-decoration:none;color:#3399CC;" href=javascript:openYhUpdate("'+rec.id+'")>编辑</a>&nbsp;&nbsp;'+
				'<a style="text-decoration:none;color:#3399CC;" href=javascript:mimcz("'+index+'")>密码重置</a>&nbsp;&nbsp;'+
				'<a style="text-decoration:none;color:#3399CC;" href=javascript:deleteYh("'+rec.id+'")>删除</a>&nbsp;&nbsp;';
			}
		},{
			field : 'unit',
			title : '所属单位',
			width : 100,
			align : 'center'
		},{
			field : 'truename',
			title : '用户名',
			width : 100,
			align : 'center'
		},{
			field : 'name',
			title : '真实姓名',
			width : 100,
			align : 'center'
		},{
			field : 'sex',
			title : '性别',
			width : 100,
			align : 'center'
		},{
			field : 'idcard',
			title : '身份证号',
			width : 100,
			align : 'center'
		},{
			field : 'tel',
			title : '电话',
			width : 100,
			align : 'center'
		},{
			field : 'phone',
			title : '手机',
			width : 100,
			align : 'center'
		},{
			field : 'roleid',
			title : '角色',
			width : 100,
			align : 'center'
		}
		]]
	});
}
$(function(){
	loadUnit("unit",$.cookie("unit"));
	startSearch();
	$("#yhgl_btn_add").click(function(){
		YMLib.UI.createWindow('yhgl_add_win','添加用户','./yhgl_add.jsp','app_add',470,380);
	});
	$("#yhgl_btn_search").click(function(){
		startSearch();
	});
});
</script>
<div style="width:100%;">
    <div  style="height:96px;" border="false">
	    <div id="righttop">
			<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;用户信息管理</div>
		</div>
		<div  style="padding-left: 10px; padding-right: 10px;padding-top:8px;">
			<fieldset style="width:99%; text-align: left; vertical-align: middle;	border:1px solid #b0caf3;">
 				<legend style="padding: 3px 0 3px 0; font-weight: bold; color: Gray; font-size: 12px;">
 					
 				</legend>
 				<div>
 					<p style="margin: 5px;">
 						<span>所属单位：</span>
 						<input id="unit" style="width:227px;"/>
 						<span>&nbsp;用户名：</span>
 						<input id="yhm" type="text"/>
 						<a id="yhgl_btn_search" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-search">查　询</a>
	 					<a id="yhgl_btn_add" href="javascript:void(0)" class="easyui-linkbutton" plain="true" iconCls="icon-add">添　加</a>
 					</p>
 				</div>
 			</fieldset>
        </div>
    </div>
    <div style="height:350px;">
    	<table id="jsgl_table" width="100%"></table>
    </div>
</div>
</body>
</html>