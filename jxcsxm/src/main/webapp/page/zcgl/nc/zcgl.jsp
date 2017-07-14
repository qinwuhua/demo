<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资产管理</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>

	<script type="text/javascript">
		$(function(){
			if($.cookie("unit")=='36')
				loadUnit1("gydw",'11101360000');
				else
				loadUnit1("gydw",$.cookie("unit"));
			loadBmbm('nf','资产年份',new Date().getFullYear());
			loadBmbm3('jsdj','技术等级');
			loadBmbm3('shzt','审核状态1');
			loadBmbm3('ssbzt','上报状态1');
			loadBmbm3('xsbzt','上报状态1');
			//YMLib.Var.jdbs=2;
			
			
			if($.cookie('unit2').length==11){
				$("td[name='xian']").show();
				$("td[name='shi']").hide();
				$("td[name='sheng']").hide();
				$("a[name='xian']").show();
				$("a[name='shi']").hide();
				$("a[name='sheng']").hide();
			}
			if($.cookie('unit2').length==9){
				$("td[name='shi']").show();
				$("td[name='xian']").hide();
				$("td[name='sheng']").hide();
				$("a[name='shi']").show();
				$("a[name='xian']").hide();
				$("a[name='sheng']").hide();
			}
			if($.cookie('unit2').length==7){
				$("a[name='sheng']").show();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
				$("td[name='sheng']").show();
				$("td[name='xian']").hide();
				$("td[name='shi']").hide();
			}
			
			queryXmlist();
			
		});
		function queryXmlist(){
			
			var xzqhdm=$("#gydw").combotree("getValues");
			if(xzqhdm.length==0){
				if($.cookie('unit')=='36')
					xzqhstr='1110136'
				else
					xzqhstr= $.cookie("unit2");
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			
			var params={'lxbm':$("#lxbm").val(),'lxmc':$("#lxmc").val(),'gydw':xzqhstr,'dwlx':'1',
					   'nf':$("#nf").combobox('getValue'),'jsdj':$("#jsdj").combobox('getValues').join(','),
					   'shzt':getValuesById("shzt"),'ssbzt':getValuesById("ssbzt"),'xsbzt':getValuesById("xsbzt")
			};
			
			//loadTj();
			var columns;
			
			if($("#nf").combobox('getValue')=='2016'){
				columns=[[	{field:'allSel',title:'全选',width:50,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:90,align:'center',
						formatter: function(value,row,index){
							var result='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','info'"+')" >详情</a>&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','bj'"+')" >编辑</a>';
							return result;
						}
					},
					
					{field:'sbzt',title:'上报状态',width:50,align:'center',
						formatter: function(value,row,index){
							var result="";
							if($.cookie('unit2').length==11){
								if(row.xsbzt=='0')
									if(row.sfbj=='1')
									result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','xian'"+')" >未上报</a>';
									else result="未上报";
								else
									result="已上报";
							}else if($.cookie('unit2').length==9){
								if(row.ssbzt=='0')
									if(row.sfbj=='1')
									result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','shi'"+')" >未上报</a>';
									else result="未上报";
								else
									result="已上报";
							}else{
								if(row.ssbzt=='1')
									result="已上报";
								else
									result="未上报";
							}
							
							return result;
						}
					},
					{field:'shzt',title:'审核状态',width:50,align:'center',
						formatter: function(value,row,index){
							var result="";
							if(row.shzt=='0'){
								if($.cookie('unit2').length==7&&row.sfbj=='1'&&row.ssbzt=='1')
									result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','sheng'"+')" >未审核</a>';
								else result="未审核";
							}
							else
								result="已审核";
							return result;
						}
					},
					{field:'nf',title:'年份',width:50,align:'center'},
					{field:'lxbm',title:'路线编码',width:75,align:'center'},
					{field:'lxmc',title:'路线名称',width:100,align:'center'},
					{field:'qdzh',title:'起点桩号',width:50,align:'center'},
					{field:'zdzh',title:'止点桩号',width:50,align:'center'},
					{field:'lc',title:'里程',width:50,align:'center'},
					{field:'jsdj',title:'技术等级',width:60,align:'center'},
					{field:'gydw',title:'管养单位',width:150,align:'center'},
					{field:'zcqcs',title:'资产期初数',width:70,align:'center'},
					{field:'zcqms',title:'资产期末数',width:70,align:'center'},
					{field:'fzqcs',title:'负债期初数',width:70,align:'center'},
					{field:'fzqms',title:'负债期末数',width:70,align:'center'}
					]]
			}else{
				columns=[[	{field:'allSel',title:'全选',width:50,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:115,align:'center',
						formatter: function(value,row,index){
							var result='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','info'"+')" >详情</a>&nbsp;';
							result+='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','bj'"+')" >编辑</a>';
							return result;
						}
					},
					
					{field:'sbzt',title:'上报状态',width:50,align:'center',
						formatter: function(value,row,index){
							var result="";
							if($.cookie('unit2').length==11){
								if(row.xsbzt=='0')
									if(row.sfbj=='1')
									result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','xian'"+')" >未上报</a>';
									else result="未上报";
								else
									result="已上报";
							}else if($.cookie('unit2').length==9){
								if(row.ssbzt=='0')
									if(row.sfbj=='1')
									result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','shi'"+')" >未上报</a>';
									else result="未上报";
								else
									result="已上报";
							}else{
								if(row.ssbzt=='1')
									result="已上报";
								else
									result="未上报";
							}
							
							return result;
						}
					},
					{field:'shzt',title:'审核状态',width:50,align:'center',
						formatter: function(value,row,index){
							var result="";
							if(row.shzt=='0'){
								if($.cookie('unit2').length==7&&row.sfbj=='1'&&row.ssbzt=='1')
									result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','sheng'"+')" >未审核</a>';
								else result="未审核";
							}
							else
								result="已审核";
							return result;
						}
					},
					{field:'nf',title:'年份',width:60,align:'center'},
					{field:'lxbm',title:'路线编码',width:90,align:'center'},
					{field:'lxmc',title:'路线名称',width:110,align:'center'},
					{field:'qdzh',title:'起点桩号',width:60,align:'center'},
					{field:'zdzh',title:'止点桩号',width:60,align:'center'},
					{field:'lc',title:'里程',width:60,align:'center'},
					{field:'jsdj',title:'技术等级',width:70,align:'center'},
					{field:'gydw',title:'管养单位',width:170,align:'center'},
					{field:'zcqms',title:'资产期末数',width:70,align:'center'},
					{field:'fzqms',title:'负债期末数',width:70,align:'center'}
					]]
			}
			
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zcgl/queryZclist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-160,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:columns/* [[	{field:'allSel',title:'全选',width:50,align:'center',rowspan:1,checkbox:'true'},
							{field:'cz',title:'操作',width:105,align:'center',
								formatter: function(value,row,index){
									var result='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','info'"+')" >详情</a>&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','bj'"+')" >编辑</a>';
									return result;
								}
							},
							
							{field:'sbzt',title:'上报状态',width:60,align:'center',
								formatter: function(value,row,index){
									var result="";
									if($.cookie('unit2').length==11){
										if(row.xsbzt=='0')
											result="未上报";
										else
											result="已上报";
									}else{
										if(row.ssbzt=='0')
											result="未上报";
										else
											result="已上报";
									}
									return result;
								}
							},
							{field:'shzt',title:'审核状态',width:60,align:'center',
								formatter: function(value,row,index){
									var result="";
									if(row.shzt=='0')
										result="未审核";
									else
										result="已审核";
									return result;
								}
							},
							{field:'nf',title:'年份',width:50,align:'center'},
							{field:'lxbm',title:'路线编码',width:80,align:'center'},
							{field:'lxmc',title:'路线名称',width:110,align:'center'},
							{field:'qdzh',title:'起点桩号',width:50,align:'center'},
							{field:'zdzh',title:'止点桩号',width:50,align:'center'},
							{field:'lc',title:'里程',width:50,align:'center'},
							{field:'jsdj',title:'技术等级',width:60,align:'center'},
							{field:'gydw',title:'管养单位',width:150,align:'center'},
							{field:'zcqcs',title:'资产期初数',width:70,align:'center'},
							{field:'zcqms',title:'资产期末数',width:70,align:'center'},
							{field:'fzqcs',title:'负债期初数',width:70,align:'center'},
							{field:'fzqms',title:'负债期末数',width:70,align:'center'}
			    ]] */,
			    rowStyler:function(index,row){
			    	if($.cookie('unit2').length==11){
					if (row.xsbzt==0&&row.sfbj==1){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==9){
						if (row.ssbzt==0&&row.sfbj==1&&row.xsbzt==1){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==7){
						if (row.shzt==0&&row.sfbj==1&&row.ssbzt==1){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	
			    	
				}
			}); 
		}
		
		
		//openZcgl
		function openZcgl(id,flag){
			YMLib.Var.index=id;
			if(flag=='bj')
			openWindow("编辑","/jxcsxm/page/zcgl/nc/zcgl_bj.jsp",700,310);
			if(flag=='info')
			openWindow("详情","/jxcsxm/page/zcgl/nc/zcgl_info.jsp",700,285);
				
		}
		
		function plsbshzc(flag){
			var rows;var _id="";
			rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请勾选记录！");
				return;
			}
			
			for(var i=0;i<rows.length;i++){
				if(rows[i].sfbj==0){
					alert('请勾选已填写的记录！');
					return;
				}
				if(flag=='xian'){
					if(rows[i].xsbzt==1){
						alert('请勾选未上报的记录！');
						return;
					}
				}
				if(flag=='shi'){
					if(rows[i].ssbzt==1){
						alert('请勾选未上报的记录！');
						return;
					}
				}
				if(flag=='sheng'){
					if(rows[i].shzt==1){
						alert('请勾选未审核的记录！');
						return;
					}
				}
				if(flag=='thsh'){
					if(rows[i].shzt==0){
						alert('请勾选已审核的记录！');
						return;
					}
				}
				
			}
			_id=rows[0].id;
			for(var i=1;i<rows.length;i++){
				_id+=","+rows[i].id;
			}
			var data="";
			if(flag=='sheng'){
				data="xsbzt=1&ssbzt=1&shzt=1";
			}
			if(flag=='shi'||flag=='thsh'){
				data="xsbzt=1&ssbzt=1&shzt=0";
			}
			if(flag=='xian'){
				data="xsbzt=1&ssbzt=0&shzt=0";
			}
			data+="&id="+_id+"&thyy=";
			if(confirm("确认操作吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zcgl/plsbshzc.do',
				async:false,
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg){
						$("#grid").datagrid('reload');
						alert("操作成功。");
					}
					else
						alert("操作失败。");
				}
			});
		}
		
		
		function thxjzc(flag){
			var rows;var _id="";
			rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请勾选记录！");
				return;
			}
			
			for(var i=0;i<rows.length;i++){
				if(rows[i].sfbj==0){
					alert('请勾选已填写的记录！');
					return;
				}
				if(flag=='shi'){
					if(rows[i].xsbzt==1&&rows[i].ssbzt==0){
						
					}else{
						alert('请勾选县级已上报的记录！');
						return;
					}
				}
				if(flag=='sheng'){
					if(rows[i].ssbzt==1&&rows[i].shzt==0){
						
					}else{
						alert('请勾选市级已上报的记录！');
						return;
					}
				}
			}
			_id=rows[0].id;
			for(var i=1;i<rows.length;i++){
				_id+=","+rows[i].id;
			}
			var name=prompt("请填写退回原因","")
			if (name==""){
				alert("请填写退回原因") 
				return;
			}
			else if (name&&name!=""){
			}
			else{
				return;
			}
			
			
			  
			var data="";
			if(flag=='sheng'){
				data="xsbzt=1&ssbzt=0&shzt=0&thyy="+name;
			}
			if(flag=='shi'){
				data="xsbzt=0&ssbzt=0&shzt=0&thyy="+name;
			}
			
			data+="&id="+_id;
			if(confirm("确认操作吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zcgl/plsbshzc.do',
				async:false,
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg){
						$("#grid").datagrid('reload');
						alert("操作成功。");
					}
					else
						alert("操作失败。");
				}
			});
		}
		
		
		
		
		
		
		
		
		function loadTj(){
			var xzqhdm=$("#gydw").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			
			var params={'lxbm':$("#lxbm").val(),'lxbm':$("#lxmc").val(),'gydw':xzqhstr,
					   'nf':$("#nf").combobox('getValue'),
					   'shzt':getValuesById("shzt"),'ssbzt':getValuesById("ssbzt"),'xsbzt':getValuesById("xsbzt")
			};
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjdw/getdwTjAll.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$("#xmsl").html(msg.xmsl);
					$("#jhxdzj").html(msg.jhxdzj);
					$("#dwzj").html(msg.dwzj);
					$("#yshdwzj").html(msg.yshdwzj);
				}
			});
		}
	
	</script>
	<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
.abgc_td td{padding-right:5px;}
</style>
</head>
<body>
	<div id="righttop">
		<div id="p_top">当前位置>&nbsp;农村公路>&nbsp;资产管理</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 5px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:4px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="28"> 
								<td align="right">管养单位：</td>
        						<td><select id="gydw" style="width:195px;"></select></td>
								<td align="right">年份：</td>
        						<td><select id="nf" style="width: 80px;"></select></td>
								<td align="right">路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:140px;" /></td>
        						<td align="right">路线名称：</td>
        						<td><input name="lxmc" type="text" id="lxmc" style="width:140px;" /></td>
        						
								</tr>
        					<tr height="28">
								<td align="right">技术等级：</td>
        						<td><select id="jsdj" style="width:195px;"></select></td>
        						<!-- 县市上报状态 省审核状态-->
								<td align="right" name='sheng'>审核状态：</td>
								<td name='sheng'><select name="shzt" id="shzt" style="width:80px;" ></select></td>
        						<td align="right" name='shi'>上报状态：</td>
								<td name='shi'><select name="ssbzt" id="ssbzt" style="width:80px;" ></select></td>
        						<td align="right" name='xian'>上报状态：</td>
								<td name='xian'><select name="xsbzt" id="xsbzt" style="width:80px;" ></select></td>
        						
								
        					
        					</tr>
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
									<a name='sheng' id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbshzc('sheng')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">批量审核</a>
									<a name='shi' id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbshzc('shi')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">批量上报</a>
									<a name='xian' id='mybuttion4' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbshzc('xian')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">批量上报</a>
									<a name='shi' id='mybuttion5' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:thxjzc('shi')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion5')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion5')"  class="button button-tiny button-rounded button-raised button-primary">退回下级</a>
									<a name='sheng' id='mybuttion6' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:thxjzc('sheng')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion6')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion6')"  class="button button-tiny button-rounded button-raised button-primary">退回下级</a>
									<a name='sheng' id='mybuttion7' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbshzc('thsh')" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion7')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion7')"  class="button button-tiny button-rounded button-raised button-primary">退回未审核</a>
								</td>
								
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<!-- <div>共有路段【<span id="xmsl" style="color: red;font-weight: bold;">0</span>】条,
           		        其中【<span id="jhxdzj" style="color: Red; font-weight: bold;">0</span>】万元，
		                        到位资金共【<span id="dwzj" style="color: Red; font-weight: bold;">0</span>】万元，
		                        其中，已审核到位资金共【<span id="yshdwzj" style="color: Red; font-weight: bold;">0</span>】万元。
            		</div> -->
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
