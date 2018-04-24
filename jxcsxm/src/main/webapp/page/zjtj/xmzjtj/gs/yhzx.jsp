<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>养护中心</title>
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
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('xmnf','项目年份',new Date().getFullYear());
			loadjhxdwh("jhxdwh",'gs_yhzx');
			loadBmbm3('sfkytj','是否全部调剂');
			loadBmbm3('sfygtj','是否全部调剂');
			queryXmlist();
			
		});
		function queryXmlist(){
			
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			var jsxz="养护中心";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var sfkytj=$("#sfkytj").combobox("getValues").join(",");
			if(sfkytj.substr(0,1)==',')
				sfkytj=sfkytj.substr(1,sfkytj.length);
			var sfygtj=$("#sfygtj").combobox("getValues").join(",");
			if(sfygtj.substr(0,1)==',')
				sfygtj=sfygtj.substr(1,sfygtj.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.gcfl':jsxz,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':'','xmjbxx.ssbzt':'','xmjbxx.xsbzt':'','xmjbxx.sfkytj':sfkytj,'xmjbxx.sfygtj':sfygtj
			};
			loadTj();
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjtj/queryXmlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-157,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
							{field:'cz',title:'操作',width:130,align:'center',
								formatter: function(value,row,index){
									var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','gs_yhzx','zjtj'"+')" >项目详情</a>&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:openZjtj('+"'"+row.xmbm+"','"+row.gydwdm+"','gs_yhzx'"+')" >调剂详情</a>';	
									return result;
								}
							},
							{field:'xmnf',title:'项目年份',width:60,align:'center'},
							{field:'xmmc',title:'项目名称',width:250,align:'center'},
							{field:'gydw',title:'管养单位',width:180,align:'center'},
							{field:'xzqh',title:'行政区划',width:100,align:'center'},
							{field:'jhxdwh',title:'计划下达文号',width:270,align:'center'}
			    ]]
			}); 
		}
		
		
		function loadTj(){
			var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
				xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}
			
			var jsxz="养护中心";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var sfkytj=$("#sfkytj").combobox("getValues").join(",");
			if(sfkytj.substr(0,1)==',')
				sfkytj=sfkytj.substr(1,sfqbbf.length);
			var sfygtj=$("#sfygtj").combobox("getValues").join(",");
			if(sfygtj.substr(0,1)==',')
				sfygtj=sfygtj.substr(1,sfygtj.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.gcfl':jsxz,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':'',
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':'','xmjbxx.ssbzt':'','xmjbxx.xsbzt':'','xmjbxx.sfkytj':sfkytj,'xmjbxx.sfygtj':sfygtj
			};
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjtj/gettjTjAll.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$("#xmsl").html(msg.xmsl);
					$("#jhxdzj").html(msg.jhxdzj);
					$("#dwzj").html(msg.dwzj);
					$("#bfzj").html(msg.bfzj);
					$("#yshbfzj").html(msg.yshbfzj);
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
		<div id="p_top">资金调剂>&nbsp;普通国省道>&nbsp;养护中心</div>
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
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:165px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 144px;"></select></td>
								<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:140px;" /></td>
        						
								</tr>
        					<tr height="28">
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
								<td align="right">是否可以调剂：</td>
								<td><select name="sfkytj" id="sfkytj" style="width:144px;" ></select></td>
        						<td align="right">是否有过调剂：</td>
								<td><select name="sfygtj" id="sfygtj" style="width:144px;" ></select></td>
        						
        					</tr>
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
								</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<div>共有项目【<span id="xmsl" style="color: red;font-weight: bold;">0</span>】个,
           		        计划下达补助资金共【<span id="jhxdzj" style="color: Red; font-weight: bold;">0</span>】万元，
		                        到位补助资金共【<span id="dwzj" style="color: Red; font-weight: bold;">0</span>】万元，
                   	调剂补助资金共【<span id="bfzj" style="color: Red; font-weight: bold;">0</span>】万元，
                   	其中，已审核调剂补助资金共【<span id="yshbfzj" style="color: Red; font-weight: bold;">0</span>】万元。
            		</div>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
