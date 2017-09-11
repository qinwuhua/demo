<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>道班房资产管理</title>
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
	var anqxstr="";
	$(function(){
		anqxstr=getxqxbyid(getUrlParame("id"));
			if($.cookie("unit")=='36')
			loadUnit1("gydw",'21101360000');
			else
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm('nf','资产年份',new Date().getFullYear());
			loadBmbm3('shzt','审核状态2');
			loadBmbm3('ssbzt','上报状态2');
			loadBmbm3('xsbzt','上报状态2');
			//YMLib.Var.jdbs=2;
			loadBmbm('oldnf','资产年份',new Date().getFullYear()-1);
			loadBmbm('newnf','资产年份',new Date().getFullYear());
			
			
			if($.cookie('unit2').length==11){
				$("td[name='xian']").show();
				$("td[name='shi']").hide();
				$("td[name='sheng']").hide();
				$("a[name='xian']").show();
				$("a[name='shi']").hide();
				$("a[name='sheng']").hide();
				if(anqxstr.indexOf("上报")!=-1){
					$("a[name='xian']").show();
				}else{
					$("a[name='xian']").hide();
				}
				if(anqxstr.indexOf("增删改")!=-1){
					$("#mybuttion11").show();
					$("#mybuttion13").show();
					$("#mybuttion14").show();
				}else{
					$("#mybuttion11").hide();
					$("#mybuttion13").hide();
					$("#mybuttion14").hide();
				}
				
			}
			if($.cookie('unit2').length==9){
				$("td[name='shi']").show();
				$("td[name='xian']").hide();
				$("td[name='sheng']").hide();
				$("a[name='shi']").show();
				$("a[name='xian']").hide();
				$("a[name='sheng']").hide();
				if(anqxstr.indexOf("上报")!=-1){
					$("a[name='shi']").show();
				}else{
					$("a[name='shi']").hide();
				}
				if($.cookie('unit2').substr(0,1)=='2')
					$("#mybuttion5").hide();
				
				if(anqxstr.indexOf("增删改")!=-1){
					$("#mybuttion11").show();
					$("#mybuttion12").show();
					$("#mybuttion14").show();
				}else{
					$("#mybuttion11").hide();
					$("#mybuttion12").hide();
					$("#mybuttion14").hide();
				}
			}
			if($.cookie('unit2').length==7){
				$("a[name='sheng']").show();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
				$("td[name='sheng']").show();
				$("td[name='xian']").hide();
				$("td[name='shi']").hide();
				
				if(anqxstr.indexOf("审核")!=-1){
					$("a[name='sheng']").show();
				}else{
					$("a[name='sheng']").hide();
				}
				if(anqxstr.indexOf("增删改")!=-1){
					$("#mybuttion11").show();
					$("#mybuttion14").show();
				}else{
					$("#mybuttion11").hide();
					$("#mybuttion14").hide();
				}
				
			}
			
			queryXmlist();
			
		});
		function queryXmlist(){
			
			var xzqhdm=$("#gydw").combotree("getValues");
			if(xzqhdm.length==0){
				if($.cookie('unit')=='36')
					xzqhstr='2110136'
				else
					xzqhstr= $.cookie("unit2");
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			
			var params={'gydw':xzqhstr,'xmlx':'dbf','sbthcd':$.cookie('unit2').length,
					   'nf':$("#nf").combobox('getValue'),'dbmc':$("#dbmc").val(),'lxbm':$("#lxbm").val(),
					   'shzt':getValuesById("shzt"),'ssbzt':getValuesById("ssbzt"),'xsbzt':getValuesById("xsbzt")
			};
			
			//loadTj();
			var columns;
			
				columns=[[	{field:'allSel',title:'全选',width:50,align:'center',rowspan:1,checkbox:'true'},
					{field:'cz',title:'操作',width:90,align:'center',
						formatter: function(value,row,index){
							var result='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','info'"+')" >详情</a>&nbsp;';
							if($.cookie('unit2').length==11){
								if(row.xsbzt=='未上报'){
									if(anqxstr.indexOf("增删改")!=-1){
										result+='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','bj'"+')" >编辑</a>&nbsp;'+'<a style="color:#3399CC;" href="javascript:deleteInfo('+"'"+index+"'"+')" >删除</a>';
									}else{
										result+='编辑&nbsp;删除&nbsp;';
									}
								}
								else
									result+='编辑&nbsp;删除&nbsp;';
							}
							if($.cookie('unit2').length==9){
								if(row.ssbzt=='未上报'){
									if(anqxstr.indexOf("增删改")!=-1){
										result+='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','bj'"+')" >编辑</a>&nbsp;'+'<a style="color:#3399CC;" href="javascript:deleteInfo('+"'"+index+"'"+')" >删除</a>';
									}else{
										result+='编辑&nbsp;删除&nbsp;';
									}
								}
								else
									result+='编辑&nbsp;删除&nbsp;';
							}
							if($.cookie('unit2').length==7){
								if(row.shzt=='未审核'){
									if(anqxstr.indexOf("增删改")!=-1){
										result+='<a style="color:#3399CC;" href="javascript:openZcgl('+"'"+index+"','bj'"+')" >编辑</a>&nbsp;'+'<a style="color:#3399CC;" href="javascript:deleteInfo('+"'"+index+"'"+')" >删除</a>';
									}else{
										result+='编辑&nbsp;删除&nbsp;';
									}
								}
								else
									result+='编辑&nbsp;删除&nbsp;';
							}
							
							return result;
							
							
						}
					},
					
					{field:'sbzt',title:'上报状态',width:55,align:'center',
						formatter: function(value,row,index){
							var result="";
							if($.cookie('unit2').length==11){
								if(row.xsbzt=='未上报'){
									if(anqxstr.indexOf("上报")!=-1){
										result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','xian'"+')" >未上报</a>';
									}else{
										result="未上报";
									}
								}
								else
									result="已上报";
							}else if($.cookie('unit2').length==9){
								if(row.ssbzt=='未上报'){
									if(anqxstr.indexOf("上报")!=-1){
										result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','shi'"+')" >未上报</a>';
									}else{
										result="未上报";
									}
								}
								else
									result="已上报";
							}else{
								if(row.ssbzt=='未上报')
									result="未上报";
								else
									result="已上报";
							}
							
							return result;
						}
					},
					
					{field:'shzt',title:'审核状态',width:55,align:'center',
						formatter: function(value,row,index){
							var result="";
							if(row.shzt=='未审核'){
								if($.cookie('unit2').length==7){
									if(anqxstr.indexOf("审核")!=-1){
										result='<a style="color:#3399CC;" href="javascript:sbshzc('+"'"+index+"','sheng'"+')" >未审核</a>';
									}else{
										result="未审核";
									}
								}
								else
								result='未审核';
							}
							else
								result="已审核";
							return result;
						}
					},
					{field:'thyy',title:'退回原因',width:55,align:'center',
						formatter: function(value,row,index){
							var result="";
							if(row.thyy!='')
								result='<a style="color:#3399CC;" href="javascript:showStr('+"'"+row.thyy+"'"+')" >退回原因</a>';
							else
								result="退回原因";
							
							return result;
						}
					},
					{field:'nf',title:'年份',width:50,align:'center'},
					{field:'dbmc',title:'道班名称',width:250,align:'center'},
					{field:'lxbm',title:'路线编码',width:100,align:'center'},
					{field:'szzh',title:'所在桩号',width:100,align:'center'},
					{field:'mj',title:'占地面积（平方米）',width:100,align:'center'},
					{field:'zc',title:'资产（万元）',width:72,align:'center'},
					{field:'fz',title:'债务（万元）',width:72,align:'center'},
					{field:'bz',title:'备注',width:265,align:'center'}
					]]
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zcgl/queryZcqtlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-120,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:columns,
			    rowStyler:function(index,row){
			    	if($.cookie('unit2').length==11){
					if (row.xsbzt=='已上报'){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==9){
						if (row.ssbzt=='未上报'&&row.xsbzt=='已上报'){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==7){
						if (row.shzt=='未审核'&&row.ssbzt=='已上报'){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	
			    	
				}
			}); 
		}
		
		
		
		
		function plsbshzc(flag){
			var rows;var _id="";
			rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请勾选记录！");
				return;
			}
			
			for(var i=0;i<rows.length;i++){
				
				if(flag=='xian'){
					if(rows[i].xsbzt=='已上报'){
						alert('请勾选未上报的记录！');
						return;
					}
				}
				if(flag=='shi'){
					if(rows[i].ssbzt=='已上报'){
						alert('请勾选未上报的记录！');
						return;
					}
				}
				if(flag=='sheng'){
					if(rows[i].shzt=='已审核'){
						alert('请勾选未审核的记录！');
						return;
					}
				}
				if(flag=='thsh'){
					if(rows[i].shzt=='未审核'){
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
				data="xsbzt=已上报&ssbzt=已上报&shzt=已审核&sbthcd="+$.cookie('unit2').length;
			}
			if(flag=='shi'){
				data="xsbzt=已上报&ssbzt=已上报&shzt=未审核&sbthcd="+($.cookie('unit2').length-2);
			}
			if(flag=='thsh'){
				data="xsbzt=已上报&ssbzt=已上报&shzt=未审核&sbthcd="+$.cookie('unit2').length;
			}
			if(flag=='xian'){
				data="xsbzt=已上报&ssbzt=未上报&shzt=未审核&sbthcd="+($.cookie('unit2').length-2);
			}
			data+="&id="+_id+"&thyy=";
			if(confirm("确认操作吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zcgl/plsbshzcqt.do',
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
		
		
		function sbshzc(index,flag){
			var rows;var _id="";
			rows=$("#grid").datagrid('getRows')[index];
			if(flag=='xian'){
				if(rows.xsbzt=='已上报'){
					alert('请勾选未上报的记录！');
					return;
				}
			}
			if(flag=='shi'){
				if(rows.ssbzt=='已上报'){
					alert('请勾选未上报的记录！');
					return;
				}
			}
			if(flag=='sheng'){
				if(rows.shzt=='已审核'){
					alert('请勾选未审核的记录！');
					return;
				}
			}
			if(flag=='thsh'){
				if(rows.shzt==0){
					alert('请勾选已审核的记录！');
					return;
				}
			}
				
			
			_id=rows.id;
			
			var data="";
			if(flag=='sheng'){
				data="xsbzt=已上报&ssbzt=已上报&shzt=已审核&sbthcd="+$.cookie('unit2').length;
			}
			if(flag=='shi'){
				data="xsbzt=已上报&ssbzt=已上报&shzt=未审核&sbthcd="+($.cookie('unit2').length-2);
			}
			if(flag=='xian'){
				data="xsbzt=已上报&ssbzt=未上报&shzt=未审核&sbthcd="+($.cookie('unit2').length-2);
			}
			data+="&id="+_id+"&thyy=";
			if(confirm("确认操作吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zcgl/plsbshzcqt.do',
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
		
		
		var _flag="";
		function thxjzc(flag){
			_flag=flag;
			var rows;var _id="";
			rows=$('#grid').datagrid('getSelections');
			if(rows.length==0) {
				alert("请勾选记录！");
				return;
			}
			
			for(var i=0;i<rows.length;i++){
			
				if(flag=='shi'){
					if(rows[i].xsbzt=='已上报'&&rows[i].ssbzt=='未上报'){
						
					}else{
						alert('请勾选县级已上报的记录！');
						return;
					}
				}
				if(flag=='sheng'){
					if(rows[i].ssbzt=='已上报'&&rows[i].shzt=='未审核'){
						
					}else{
						alert('请勾选市级已上报的记录！');
						return;
					}
				}
			}
			
			$("#thyywin").window('open');
			$("#thyywin").show();
			
			  
			
		}
		
		//退回下级确定
		function thxjQd(){
			var flag=_flag;
			var rows;var _id="";
			rows=$('#grid').datagrid('getSelections');
			_id=rows[0].id;
			for(var i=1;i<rows.length;i++){
				_id+=","+rows[i].id;
			}
			
			var name=$("#thyy").val();
			if (name==""){
				alert("请填写退回原因") 
				return;
			}
			
			var data="";
			if(flag=='sheng'){
				data="xsbzt=已上报&ssbzt=未上报&shzt=未审核&sbthcd=9&thyy="+name;
			}
			if(flag=='shi'){
				data="xsbzt=未上报&ssbzt=未上报&shzt=未审核&sbthcd=11&thyy="+name;
			}
			
			data+="&id="+_id;
			if(confirm("确认操作吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zcgl/plsbshzcqt.do',
				async:false,
				data:data,
				dataType:'json',
				success:function(msg){
					if(msg){
						$("#grid").datagrid('reload');
						$("#thyywin").window('close');
						$("#thyy").val("");
						alert("退回成功。");
					}
					else
						alert("退回失败。");
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
	
		 function addInfo(){
			 YMLib.Var.xmbm=newGuid();
			 YMLib.UI.createWindowFj('mywin',"添加","/jxcsxm/page/zcgl/gs/dbf_tj.jsp",'mywin',850,400);	
		 }	
		function copyInfo(){
			$("#win").window('open');
			$("#win").show();
			
		}
		
		//openZcgl
		function openZcgl(id,flag){
			YMLib.Var.index=id;
			if(flag=='bj')
				openWindow("编辑","/jxcsxm/page/zcgl/gs/dbf_bj.jsp",850,400);	
			if(flag=='info')
				openWindow("详情","/jxcsxm/page/zcgl/gs/dbf_info.jsp",850,350);
		}
		
	 function addInfoQd(){
		var newnf=$("#newnf").datebox('getValue');
		var oldnf=$("#oldnf").datebox('getValue');
		
		if((newnf-oldnf)!=1){
			alert("请选择正确的年份");return;
		}else{
			$.ajax({
				data:'zcgl.oldnf='+oldnf+"&zcgl.newnf="+newnf+"&zcgl.xmlx=dbf",
				type:'post',
				dataType:'json',
				url:'/jxcsxm/zcgl/copydatabyyear.do',
				success:function(msg){
					alert("复制成功");
					$("#grid").datagrid('reload');
				}
				
			})
		}
		 
		 $("#win").window('close');
		 
	 }
	 //删除
	 function deleteInfo(index){
		 var rows;var _id="";var _fid="";
		 if(index!=null)
		 rows=$("#grid").datagrid('getRows')[index];
		 else	
		 rows=$('#grid').datagrid('getSelections');
		 if(rows.length==0){
			 alert("请选择要删除的记录");
			 return;
		 }
			 
		 for(var i=0;i<rows.length;i++){
			 if($.cookie('unit2').length==11){
				if (rows[i].xsbzt=='已上报'){
					alert("请选择未上报的记录");	
					return;
				}
			}
			if($.cookie('unit2').length==9){
				if (rows[i].ssbzt=='已上报'){
					alert("请选择未上报的记录");	
					return;
				}
			}
			if($.cookie('unit2').length==7){
				if (rows[i].shzt=='已审核'){
					alert("请选择未审核的记录");	
					return;
				}
			}
			_id+=",'"+rows[i].id+"'";
			_fid+=",'"+rows[i].fid+"'";
		 }
		 if(confirm("确认删除吗？"))
		 $.ajax({
				type:'post',
				url:'/jxcsxm/zcgl/deleteZcqt.do',
				async:false,
				data:"id="+_id.substring(1,_id.length)+"&fid="+_fid.substring(1,_fid.length),
				dataType:'json',
				success:function(msg){
					if(msg){
						$("#grid").datagrid('reload');
						alert("删除成功。");
					}
					else
						alert("删除失败。");
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
<!-- 选择win -->
	<div id="win" class="easyui-window" title="请选择" style="width:400px;height:120px;display: none;"
    data-options="closed:true,collapsible: false, minimizable: false, maximizable: false, resizable: false">
    <table style="width: 100%">
    <tr>
    <td style="padding-top: 15px;" align="center">
   		
   		复制<input type="text" id='oldnf' style="width: 65px;">年数据至<input type="text" id='newnf' style="width: 65px;">年
   		
    </td>
    </tr>
    <tr>
   <td style="padding-top: 15px;" align="center">
    	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:addInfoQd()" class="button button-tiny button-rounded button-raised button-primary">确定</a>
    	</td>
    </tr>
    
    </table>
    
	</div>
	<!-- 选择win -->
	<div id="thyywin" class="easyui-window" title="请填写退回原因" style="width:400px;height:120px;display: none;"
    data-options="closed:true,collapsible: false, minimizable: false, maximizable: false, resizable: false">
    <table style="width: 100%">
    <tr>
    <td style="padding-top: 15px;" align="center">
   		
   		退回原因<input type="text" id='thyy' style="width: 265px;">
   		
    </td>
    </tr>
    <tr>
   <td style="padding-top: 15px;" align="center">
    	<a style="margin-top: 1px;margin-bottom: 1px;" href="javascript:thxjQd()" class="button button-tiny button-rounded button-raised button-primary">确定</a>
    	</td>
    </tr>
    
    </table>
    
	</div>

	
	<div id="righttop">
		<div id="p_top">当前位置>&nbsp;普通国省道>&nbsp;道班房资产管理</div>
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
								<td align="right">道班名称：</td>
        						<td><input name="dbmc" type="text" id="dbmc" style="width:140px;" /></td>
        						<td align="right">路线编码：</td>
        						<td><input name="lxbm" type="text" id="lxbm" style="width:140px;" /></td>
        						
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
									<a id='mybuttion11' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:addInfo()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion11')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion11')"  class="button button-tiny button-rounded button-raised button-primary">添加</a>
									<a name='shi' id='mybuttion12' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:copyInfo()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion12')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion12')"  class="button button-tiny button-rounded button-raised button-primary">复制</a>
									<a name='xian' id='mybuttion13' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:copyInfo()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion13')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion13')"  class="button button-tiny button-rounded button-raised button-primary">复制</a>
									<a id='mybuttion14' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:deleteInfo()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion14')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion14')"  class="button button-tiny button-rounded button-raised button-primary">删除</a>
									
									
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
