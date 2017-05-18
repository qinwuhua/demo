<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
function openJsUpdate(_id){
	$("#jsgl_table").datagrid('unselectAll');
	YMLib.Var.ID = _id;
	YMLib.UI.createWindow('jsgl_add_win','编辑角色','./jsgl_update.jsp','xmgl_03',630,330);
}
function deleteJs(_id){
	$.messager.confirm('确认', '是否确认删除所选数据？', function(r){
		if (r){
			$.ajax({
				 type : "POST",
				 url : "../../xtgl/deleteJsById.do",
				 dataType : 'json',
				 data : 'param.roleid=' +_id,
				 success : function(msg){
					 if(msg){
						 YMLib.Tools.Show('删除成功！',3000);
						 $("#jsgl_table").datagrid('reload');
					 }else{
						 YMLib.Tools.Show('删除失败,请确认没有用户属于此角色',3000);
					 }
				 },
				 error : function(){
					 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
				 }
			});
		}
	});
}

$(function(){
	if(parent.YMLib.Var.xmbm!=null){
		parent.YMLib.Var.bm=parent.YMLib.Var.xmbm;
	}
	var feature=parent.YMLib.Var.feature;
	var html = "";
	console.log(feature);
	for (var o in feature.getProperties()) {
	    //此处可过滤需要显示的属性字段，并且翻译字段名称等
	   if(o=="LXDM" || o=="lxdm"){
	    	html+="<tr><td>路线编码：</td><td style='padding-right:20px;'>"+feature.getProperties()[o]+"</td></tr>";
	    }
	    if(o=="LXMC" || o=="lxmc"){
	    	html+="<tr><td>路线名称：</td><td style='padding-right:20px;'>"+feature.getProperties()[o]+"</td></tr>";
	    }
	    if(o=="QDZH" || o=="qdzh"){
	    	html+="<tr><td>止点桩号：</td><td style='padding-right:20px;'>"+feature.getProperties()[o]+"</td></tr>";
	    }
	    if(o=="ZDZH" || o=="zdzh"){
	    	html+="<tr><td>起点桩号：</td><td style='padding-right:20px;'>"+feature.getProperties()[o]+"</td></tr>";
	    }
	    if(o=="QDMC" || o=="qdmc"){
	    	html+="<tr><td>起点名称：</td><td style='padding-right:20px;' >"+feature.getProperties()[o]+"</td></tr>";
	    }
	    if(o=="ZDMC" || o=="zdmc"){
	    	html+="<tr><td>止点名称：</td><td style='padding-right:20px;'>"+feature.getProperties()[o]+"</td></tr>";
	    }
	}
	$("#lxjcsj").html(html);
	$("#jsgl_table").datagrid({
		border:true,
		fit : true,
		fitColumns : true,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectExistLxProgramList.do',
		queryParams : {
			"pb.roadcode":parent.YMLib.Var.bm,
			"pb.gydw":$.cookie("unit2"),
			"pb.xzqhmc":filterXzqhdm(parent.YMLib.Var.bm)
		},
		singleSelect : false,
		striped : true,
		pagination : true,
		rownumbers : true,
		pageNumber : 1,
		pageSize : 10,
		height:100,
		columns : [[
		{
			field : 'mx',
			title : '明细',
			width : 80,
			align : 'center',
			formatter : function(value,rec,index){
				return '<input onclick="onclickXx('+"'"+rec.unit+"',"+"'"+rec.id+"'"+')" style="width:60px;border:1px #8db2e3 solid;" type="button" value="查看明细"/>';
			}
		},{
			field : 'roadname',
			title : '项目名称',
			width : 100,
			align : 'center'
		},{
			field : 'unit',
			title : '项目类型',
			width : 100,
			align : 'center'
		},{
			field : 'roadstart',
			title : '起止点桩号',
			width : 100,
			align : 'center',
			formatter : function(value,rec,index){
				return rec.roadstart+'-'+rec.roadends;
			}
		},{
			field : 'gydw',
			title : '所属单位',
			width : 200,
			align : 'center'
		},{
			field : 'nf',
			title : '年份',
			width : 50,
			align : 'center'
		}
		]]
	});
});
function filterXzqhdm(xzqhdm){
	xzqhdm= xzqhdm.substr(xzqhdm.length-6);
	var yi1 = new RegExp("^36[0-9][1-9]00$");
	var yi2= new RegExp("^36[1-9][0-9]00$");
	var result=null;
	if(xzqhdm=="360000"){
		result='36%';
	}else if(yi1.test(xzqhdm) || yi2.test(xzqhdm)){
		result=xzqhdm.substring(0, xzqhdm.length-2)+"__";
	}else{
		result=xzqhdm.substring(0, xzqhdm.length-2)+"__";
	}
	if(result=="__"){
		result="";
	}
	//result = xzqhdm.substring(0, xzqhdm.length-2)+"__";
	return result;
}
function onclickXx(xmlx,xmid){
	parent.YMLib.Var.xmbm=xmid;
	if(xmid.substring(10,11)=="1"){
		parent.YMLib.UI.createWindow('lmsjxx','改建工程项目','/jxcsxm/page/qqgl/zjxd/lmsj_xx.jsp','lmsjxx',980,400);
	}else if(xmid.substring(10,11)=="2"){
		parent.YMLib.UI.createWindow('lmgzxx','路面改造工程项目','/jxcsxm/page/qqgl/zjxd/lmgz_xx.jsp','lmgzxx',980,400);
	}else if(xmid.substring(10,11)=="3"){
		parent.YMLib.UI.createWindow('xjgcxx','新建工程项目','/jxcsxm/page/qqgl/zjxd/xjgc_xx.jsp','xjgcxx',980,400);
	}else if(xmid.substring(10,11)=="4"){
		parent.YMLib.UI.createWindow('yhdzxxx','养护大中修项目','/jxcsxm/page/qqgl/zjxd/yhdzx_xx.jsp','yhdzxxx',980,400);
	}else if(xmid.substring(10,11)=="5"){
		parent.YMLib.UI.createWindow('shxmxx','灾毁重建','/jxcsxm/page/qqgl/zjxd/shxm_xx.jsp','shxmxx',980,400);
	}
}

</script>
<style>
.lxxx{padding:8px; line-height:23px;}
.table{ width:100%; margin:0 auto;
 margin-top:10px;scroll:no;
SCROLLBAR-HIGHLIGHT-COLOR: white; 
SCROLLBAR-SHADOW-COLOR: #81c2ee; 
SCROLLBAR-3DLIGHT-COLOR: #81c2ee; 
SCROLLBAR-ARROW-COLOR: #81c2ee; 
SCROLLBAR-TRACK-COLOR: white; 
SCROLLBAR-DARKSHADOW-COLOR: #81c2ee; 
}

.bt{ background-color:#e9f4fc; overflow:hidden; padding-top:20px;}
.table { width:100%;heigth:500px;
border-collapse: collapse; border:1px solid #cde0f3; margin:0 auto;}
.table td{border:1px solid #cde0f3; height:26px; line-height:26px; text-align:center;}
.lxxx span{font-weight:700;line-height:30px;color:#0b77c9;}
</style>
<div style="width:100%;">
	<div class="lxxx">
		<span>路段基本信息</span>
    	<table id="lxjcsj" class="table"></table>
    </div>
    <div style="height:500px;" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
    <span style="font-weight:700;line-height:30px;color:#0b77c9;margin-left:8px;">计划项目信息</span>
    	<table id="jsgl_table" ></table>
    </div>
</div>
</body>
</html>
