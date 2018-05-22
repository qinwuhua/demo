<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金调剂</title>
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
			$("#nf").html(new Date().getFullYear());
			
			
			gettjTj();
			queryzjtjlist();
		});
		function gettjTj(){
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/gettjTj.do',
				data:'xmbm='+parent.YMLib.Var.xmbm+"&sbthcd="+$.cookie("unit2").length,
				dataType:'json',
				success:function(msg){
					dwzj=msg.dwzj;
					bfzj=msg.bfzj;
					$("#xmmc").html(msg.xmmc);
					$("#xdzbz").html(msg.xdzbz);$("#xdbb").html(msg.xdbb);$("#xdsb").html(msg.xdsb);$("#xddf").html(msg.xddf);
					$("#dwzbz").html(msg.dwzbz);$("#dwbb").html(msg.dwbb);$("#dwsb").html(msg.dwsb);$("#dwdf").html(msg.dwdf);
					$("#bfzbz").html(msg.bfzbz);$("#bfbb").html(msg.bfbb);$("#bfsb").html(msg.bfsb);$("#bfdf").html(msg.bfdf);
					$("#tjzbz").html(msg.tjzbz);$("#tjbb").html(msg.tjbb);$("#tjsb").html(msg.tjsb);$("#tjdf").html(msg.tjdf);
					$("#syzbz").html(msg.syzbz);$("#sydf").html(msg.sydf);
				}
			});
		}
		var dwzj=0;var bfzj=0;
		function zjtjtj(){
			if($("#syzbz").html()==0&&$("#sydf").html()==0){
				alert("该项目剩余可调剂资金为0，不可调剂");
				return;
			}
			//parent.YMLib.UI.createWindow('mywin1',"添加","/jxcsxm/page/zjtj/xmzjtj/zjtj_tj.jsp",'mywin1',800,355);
			openWindow("添加","/jxcsxm/page/zjtj/xmzjtj/zjtj_tj.jsp",800,365);	
			
		}
		function zjtjtjxz(){
			if($("#syzbz").html()==0&&$("#sydf").html()==0){
				alert("该项目剩余可调剂资金为0，不可调剂");
				return;
			}
			openWindow("添加","/jxcsxm/page/zjtj/xmzjtj/zjtj_tj2.jsp",800,365);	
		}
		
		function openTjInfo(xmbm){
			YMLib.Var.xmbm=xmbm;
			openWindow("详情","/jxcsxm/page/zjtj/xmzjtj/zjtj_info.jsp",800,365);
			
		}
		function editTj(xmbm){
			YMLib.Var.xmbm=xmbm;
			openWindow("编辑","/jxcsxm/page/zjtj/xmzjtj/zjtj_bj.jsp",800,365);
		}
		function delTj(xmbm){
			if(confirm("您确认删除吗？"))
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/deltj.do',
				data:"xmbm="+xmbm+"&trxmbm="+parent.YMLib.Var.xmbm,
				dataType:'json',
				success:function(msg){
					if(msg){
						alert("删除成功");
						gettjTj();
						$("#grid").datagrid('reload');
						parent.$("#grid").datagrid('reload');
						parent.loadTj();
					}else{
						alert("删除失败");
					}
					
				}
			});
		}
		
		
		function queryzjtjlist(){
			var params={'xmbm':parent.YMLib.Var.xmbm,'sbthcd':$.cookie('unit2').length};
			var col;
			col=[[{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
				{field:'cz',title:'操作',width:120,align:'center',
				formatter: function(value,row,index){
					if(row.sfppjh=='是'||row.sfbfzj=='是'){
						var result='<a style="color:#3399CC;" href="javascript:openTjInfo('+"'"+row.xmbm+"'"+')" >详情</a>&nbsp;&nbsp;';
						result+='编辑&nbsp;&nbsp;';
						result+='删除&nbsp;&nbsp;';
						return result; 
					}else{
						var result='<a style="color:#3399CC;" href="javascript:openTjInfo('+"'"+row.xmbm+"'"+')" >详情</a>&nbsp;&nbsp;';
						result+='<a style="color:#3399CC;" href="javascript:editTj('+"'"+row.xmbm+"'"+')" >编辑</a>&nbsp;&nbsp;';
						result+='<a style="color:#3399CC;" href="javascript:delTj('+"'"+row.xmbm+"'"+')" >删除</a>&nbsp;&nbsp;';
						return result; 
					}
				}
			},
			{field:'xmlx',title:'项目类型',width:70,align:'center'},
			{field:'xmnf',title:'项目年份',width:70,align:'center'},
			{field:'xmmc',title:'项目名称',width:200,align:'center'},
			{field:'gydw',title:'管养单位',width:170,align:'center'},
			{field:'xzqh',title:'行政区划',width:130,align:'center'},
			{field:'allzbz',title:'项目总补助(万元)',width:100,align:'center'},
			{field:'bczbz',title:'本次总补助(万元)',width:100,align:'center'}
		]]
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjtj/queryzjtjlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:50,
			    checkOnSelect:true,
			    height:$(window).height()-102,
			    queryParams: params,
			    columns:col
			}); 	
		}
		
	</script>
	<style type="text/css">

-->
</style>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 5px;" cellspacing="0" cellpadding="0">
            <tr>
                <td height="30" align="left" style="font-size: 12px;">
                	<table border="0" >
                		<tr>
                		<td colspan="2"> 项目【<span id="xmmc" style="color: Red; font-weight: bold;">xxx</span>】</td>
                		</tr>
                		<tr>
                		<td>下达补助【<span id="xdzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="xdbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="xdsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="xddf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
                		<td style="padding-left: 10px;">到位补助【<span id="dwzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="dwbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="dwsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="dwdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
                		</tr>
                		<tr>
                		<td>拨付补助【<span id="bfzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="bfbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="bfsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="bfdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
                		<td style="padding-left: 10px;">调剂补助【<span id="tjzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="tjdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
                		</tr>
                		<tr>
                		<td colspan="2">剩余补助【<span id="syzbz" style="color: Red; font-weight: bold;">0</span>】万元，地方自筹【<span id="sydf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
                		</tr>
                	</table>
	                    
	                    
	                    
	                    
	                    
            	
            </td>
            </tr>
            <tr>
            <td>
            <a name='tianjia' id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjtjtj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">添加调剂（新项目）</a>
			<a name='tianjia' id='mybuttion2' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:zjtjtjxz()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">添加调剂（已有项目）</a>
			
            </td>
            </tr>
           
            <tr>
                <td >                
                     <table id="grid">           		
                     </table>   
                </td>
            </tr>

        </table>
        

    </div>

	</center>
</body>
</html>