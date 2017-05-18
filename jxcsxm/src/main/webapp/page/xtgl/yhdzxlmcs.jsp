<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护大中修路面参数设置</title>
	<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
	<link rel="stylesheet" type="text/css" href="../../css/style.css" />
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
	<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../../js/YMLib.js"></script>
	<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript">
		var row;
		$(function(){
			$('#tsdq').combotree({    
			    url:'../../jhgl/queryTsdq.do',
			    valueField:'id',
			    textField:'text',
			    width:125
			});
			loadData();
		});
		function loadData(){
			$('#xtgl_flwbzbz_table').datagrid({
				url:'../../xtgl/queryYhdzxcs.do',
				pagination:false,
				rownumbers:true,
			    pageNumber:1,
			    fitColumns:true,
			    queryParams:{
			    	//'yhdzxcs.cslx':$('#selCslx').val()
			    },
			    pageSize:10,
			    height:460,
			    //width:1000,
				columns:[[
					{field:'id',title:'操作',width:80,align:'center',
						formatter : function(value, row, index){
							$('#add').hide();
							$('#update').show();
							return '<a href="javascript:update('+"'"+row.id+"'"+')">编辑</a>';
						}
					},
					{field:'cslx',title:'类型',width:100,align:'center'},
					{field:'clmc',title:'项目',width:100,align:'center'},
					{field:'dw',title:'单位',width:100,align:'center'},
					{field:'lfmdj',title:'单价（元）',width:100,align:'center'},
					{field:'bz',title:'备注',width:150,align:'center'}
				]],
				onSelect:function(rowIndex,rowData){
					row=rowData;
				},
				toolbar:[
					{
						iconCls: 'icon-add',
						text:'添加',
						handler: function(){
							$('#add').show();
							$('#update').hide();
							$('#tsdq').combotree('clear');
							$('#addFlwbzbz').dialog("open",false);
						}
					},
					{
						iconCls: 'icon-remove',
						text:'删除',
						handler: function(){
							var rows = $('#xtgl_flwbzbz_table').datagrid('getSelections');
							if(rows.length==0){
								alert("请选择要删除的数据！");
								return;
							}
							var id="";
							$.each(rows,function(index,item){
								if(index==rows.length-1){
									id+=item.id;
								}else{
									id+=item.id+",";
								}
							});
							$.ajax({
								type:'post',
								url:'../../xtgl/dropYhdzxcsById.do',
								dataType:'json',
								data:'yhdzxcs.id='+id,
								success:function(data){
									if(data.result){
										alert("删除成功！");
										$('#xtgl_flwbzbz_table').datagrid('reload');
									}
								}
							});
						}
					}
				]
			});
		}
		
		function update(id){
			$('#addFlwbzbz').dialog("open",false);
			$('#yhdzxcsid').val(row.id);
			$('#addsellmjg').val(row.cslx);
			$('#txtclmc').val(row.clmc);
			$('#txtlfmdj').val(row.lfmdj);
			$('#txtdw').val(row.dw);
			$('#txtbz').val(row.bz);
		}
		function updateBtn(){
			var yhdzxcs={'yhdzxcs.id':$('#yhdzxcsid').val(),'yhdzxcs.cslx':$('#addsellmjg').val(),'yhdzxcs.clmc':$('#txtclmc').val(),
					'yhdzxcs.lfmdj':$('#txtlfmdj').val(),'yhdzxcs.bz':$('#txtbz').val(),'yhdzxcs.dw':$('#txtdw').val()};
			$.ajax({
				type:'post',
				async:false,
				url:'../../xtgl/editYhdzxcs.do',
				data:yhdzxcs,
				dataType:'json',
				success:function(data){
					if(data.result=="true"){
						alert("修改成功！");
						$('#addFlwbzbz').dialog("close");
						$('#xtgl_flwbzbz_table').datagrid("reload");
					}
				}
			});
		}
		function addYhdzxcs(){
			var yhdzxcs={'yhdzxcs.cslx':$('#addsellmjg').val(),'yhdzxcs.clmc':$('#txtclmc').val(),
					'yhdzxcs.lfmdj':$('#txtlfmdj').val(),'yhdzxcs.bz':$('#txtbz').val(),'yhdzxcs.dw':$('#txtdw').val()};
			$.ajax({
				type:'post',
				async:false,
				url:'../../xtgl/addYhdzxcs.do',
				data:yhdzxcs,
				dataType:'json',
				success:function(data){
					if(data.result=="true"){
						alert("添加成功！");
						$('#addFlwbzbz').dialog("close");
						$('#xtgl_flwbzbz_table').datagrid("reload");
					}
				}
			});
		}
	</script>
</head>
<body>
	<div border="false">
		<div data-options="region:'north',border:true,split:true" style="height:40px;border-left:0px;border-right:0px;border-top:0px;">
			<div id="righttop">
				<div id="p_top">当前位置>&nbsp;系统管理>&nbsp;养护大中修路面参数设置</div>
			</div>
		</div>
		<div style="margin-left: 20px;margin-bottom: 5px;">
<!-- 			<span>参数类型：</span> -->
		<!-- 	<select id="selCslx" style="width: 80px;" onchange="loadData()">
				<option value="" selected="selected">-请选择-</option>
				<option selected="selected">-请选择-</option>
				<option value="面层">面层</option>
				<option value="基层">基层</option>
				<option value="下封层">下封层</option>
				<option value="打板">打板</option>
				<option value="碎石化">碎石化</option>
				<option value="挖除面层与基层">挖除面层与基层</option>
				<option value="标线">标线</option>
			</select> -->
		</div>
		<div region="center" border="false" oncontextmenu='return false' unselectable="on" style="-webkit-user-select:none;-moz-user-select:none;" onselectstart="return false">
			<table id="xtgl_flwbzbz_table"></table>
		</div>
	</div>
	<div id="addFlwbzbz" class="easyui-dialog" title="添加补助标准" style="width:250px;height:200px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">
		<table>
			<tr style="height: 25px;">
				<td width="100" align="right" style="padding-right: 10px;">类型</td>
				<td width="150" align="left">
					<input type="hidden" id="yhdzxcsid"/>
					<select id="addsellmjg" style="width: 80px;">
						<option selected="selected">-请选择-</option>
						<option value="面层">面层</option>
						<option value="基层">基层</option>
						<option value="下封层">下封层</option>
						<option value="打板">打板</option>
						<option value="碎石化">碎石化</option>
						<option value="挖除面层与基层">挖除面层与基层</option>
						<option value="标线">标线</option>
					</select>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">项目</td>
				<td>
					<input id="txtclmc" type="text"/>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">单位</td>
				<td>
					<input type="text" id="txtdw"/>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">单价(元)</td>
				<td>
					<input type="text" id="txtlfmdj"/>
				</td>
			</tr>
			<tr style="height: 25px;">
				<td align="right" style="padding-right: 10px;">备注</td>
				<td>
					<input id="txtbz" type="text">
				</td>
			</tr>
			<tr style="height: 25px;">
				<td colspan="2" align="center">
					<input id="add" type="button" onclick="addYhdzxcs()" value="添加" style="margin-top: 5px;"/>
					<input id="update" type="button" onclick="updateBtn()" value="修改" style="margin-top: 5px;"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>