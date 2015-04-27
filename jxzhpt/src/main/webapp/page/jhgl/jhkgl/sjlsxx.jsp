<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>工程路面改建路面升级项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_gcsj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			var row = parent.YMLib.Var.Row;
			if(row!=null){
				$('#searchDiv').hide();
				queryByRowData(row);
				parent.YMLib.Var.Row=null;
			}
		});
		function queryByRowData(row){
			var data=new Array();
			$.each(row.plan_lx_gcsjs,function(index,item){
				var l={'lx.lxbm':item.lxbm,'lx.zdzh':item.zdzh,'lx.xzqhdm':item.xzqhdm,
						'lx.qdzh':item.qdzh,'lx.jhid':row.id};
				$.ajax({
					type:'post',
					url:'../../../jhgl/queryXjls.do',
					async:false,
					data:l,
					dataType:'json',
					success:function(result){
						$.each(result,function(index,item){
							data.push(item);
						});
					}
				});
			});
			$('#grid').datagrid({
				data:data,
				columns:[[    
					{field:'scbz',title:'项目名称',width:200,fixed:true,align:'center',
						formatter:function(value,row,index){
							var a='<a href="javascript:onclickXx('+"'"+row.id+"','"+row.jhid+"'"+')" style="color:#0066CB;font-size:12px;">';
							a+=value+'</a>';
							return a;
						}
					},
					{field:'bz',title:'计划年份',width:100,align:'center'},
					{field:'lxbm',title:'现路线编码',width:100,align:'center'},
					{field:'yjsdj',title:'原技术等级',width:100,align:'center'},
					{field:'gjjsdj',title:'现技术等级',width:100,align:'center'},
					{field:'xqdzh',title:'现起点桩号',width:100,align:'center'},
					{field:'xzdzh',title:'现止点桩号',width:150,fixed:true,align:'center'},
					{field:'ylxbm',title:'原路线编码',width:100,align:'center'},
					{field:'yqdzh',title:'原起点桩号',width:100,align:'center'},
					{field:'yzdzh',title:'原止点桩号',width:100,align:'center'}
				]]
			});
		}
		function search(){
			if($('#txtLxbm').val()==""){
				alert("请填写路线编码！");
				return;
			}
			if($('#txtQdzh').val()==""){
				alert("请填写起点桩号！");
				return;
			}
			if($('#txtZdzh').val()==""){
				alert("请填写止点桩号！");
				return;
			}
			var l={'lx.lxbm':$('#txtLxbm').val(),'lx.zdzh':$('#txtZdzh').val(),'lx.xzqhdm':$.cookie("unit"),
					'lx.qdzh':$('#txtQdzh').val(),'lx.jhid':null};
			$('#grid').datagrid({
				url:'../../../jhgl/queryXjls.do',
				queryParams:l,
				columns:[[    
					{field:'scbz',title:'项目名称',width:200,fixed:true,align:'center',
						formatter:function(value,row,index){
							var a='<a href="javascript:onclickXx('+"'"+row.id+"','"+row.jhid+"'"+')" style="color:#0066CB;font-size:12px;">';
							a+=value+'</a>';
							return a;
						}
					},
					{field:'bz',title:'计划年份',width:100,align:'center'},
					{field:'lxbm',title:'现路线编码',width:100,align:'center'},
					{field:'yjsdj',title:'原技术等级',width:100,align:'center'},
					{field:'gjjsdj',title:'现技术等级',width:100,align:'center'},
					{field:'xqdzh',title:'现起点桩号',width:100,align:'center'},
					{field:'xzdzh',title:'现止点桩号',width:150,fixed:true,align:'center'},
					{field:'ylxbm',title:'原路线编码',width:100,align:'center'},
					{field:'yqdzh',title:'原起点桩号',width:100,align:'center'},
					{field:'yzdzh',title:'原止点桩号',width:100,align:'center'}
				]]
			});
		}
	</script>
</head>
<body>
	<div id="searchDiv" style="margin-left: 20px;margin-top: 5px;margin-bottom: 5px;">
		<table>
			<tr>
				<td>路线编码：<input id="txtLxbm" type="text" style="width: 100px;margin-right: 10px;"/></td>
				<td>起点桩号：<input id="txtQdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td>止点桩号：<input id="txtZdzh" type="text" style="width: 80px;margin-right: 10px;"/></td>
				<td><img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/></td>
			</tr>
		</table>
	</div>
	<table id="grid" width="99%" border="0" class="easyui-datagrid" data-options="fitColumns:true" style="margin-top:1px;margin-left:1px;" cellspacing="0" cellpadding="0">
		<thead>   
        	<tr>
        		<th data-options="field:'scbz',width:150,fixed:true,align:'center'">项目名称</th>
				<th data-options="field:'lxbm',width:100,align:'center'">现路线编码</th>
				<th data-options="field:'yjsjd',width:100,align:'center'">原技术等级</th>
				<th data-options="field:'gjjsdj',width:100,align:'center'">现技术等级</th>
				<th data-options="field:'xqdzh',width:100,align:'center'">现起点桩号</th>
				<th data-options="field:'xzdzh',width:100,align:'center'">现指点桩号</th>
				<th data-options="field:'ylxbm',width:100,align:'center'">原路线编码</th>
				<th data-options="field:'yqdzh',width:100,align:'center'">原起点桩号</th>
				<th data-options="field:'yzdzh',width:100,align:'center'">原止点桩号</th>
        	</tr>
    	</thead>
	</table>
</body>
</html>
