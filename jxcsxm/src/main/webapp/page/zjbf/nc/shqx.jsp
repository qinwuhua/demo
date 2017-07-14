<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>水毁抢修</title>
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
			
			if($.cookie("unit")=="36"){
				loadUnit1("gydw",'11101360000');
			}else{
				loadUnit1("gydw",$.cookie("unit"));
			}
			
			loadBmbm3('nf','项目年份',new Date().getFullYear());
			var yf=new Date().getMonth()+1;
			if(yf<10)loadBmbm('yf','月份',"0"+yf);else loadBmbm('yf','月份',yf);
			
			
			queryXmlist();
			
			
		});
		function queryXmlist(){
			
			var gydwdm=$("#gydw").combotree("getValues");
			if(gydwdm.length==0){
				if($.cookie('unit')=='36')
					gydwstr='1110136'
				else
				gydwstr= $.cookie("unit2");
				
			}else if(gydwdm.length==1){
				if(gydwdm[0].substr(gydwdm[0].length-2,gydwdm[0].length)=="00") gydwdm[0]=gydwdm[0].substr(0,gydwdm[0].length-2);
				if(gydwdm[0].substr(gydwdm[0].length-2,gydwdm[0].length)=="00") gydwdm[0]=gydwdm[0].substr(0,gydwdm[0].length-2);
				gydwstr=gydwdm[0] ;
			}else{
				gydwstr= gydwdm.join(',');
			}
			
			
			/* 
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
 */
			var params={'gydw':gydwstr,'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue')
			};
	
 			//loadLj(params);
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjbf/queryXmlistshqx.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-140,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[
							
							{field:'bd',title:'标段',width:90,align:'center'},
							{field:'jhxdwh',title:'计划下达文号',width:300,align:'center'},
							{field:'bfyf',title:'拨付月份',width:90,align:'center'},
							{field:'gydw',title:'管养单位',width:140,align:'center'},
							{field:'ztz',title:'总投资(万元)',width:95,align:'center'},
							{field:'cgs',title:'车购税(万元)',width:95,align:'center'},
							{field:'rys',title:'燃油税(万元)',width:95,align:'center'},
							{field:'ttc',title:'厅统筹(万元)',width:95,align:'center'},
							{field:'dfzc',title:'地方自筹(万元)',width:95,align:'center'}
			    ]]
			    /* ,
			    rowStyler:function(index,row){
			    	if($.cookie('unit2').length==11){
					if (row.xsbzt>0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==9){
						if (row.ssbzt>0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==7){
						if (row.shzt>0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}} 
				}*/
			}); 
		}
		
		function addshqx(){
			openWindow("添加或编辑","/jxcsxm/page/zjbf/nc/shqx_tj.jsp",940,450);
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
		<div id="p_top">资金拨付>&nbsp;农村公路>&nbsp;水毁抢修</div>
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
        						<td><select id="gydw" style="width:250px;"></select></td>
								<td align="right">拨付月份：</td>
        						<td><input type="text" class='easyui-combobox' id='nf' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 53px;"></td>
								
								</tr>
        					
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
                            		<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:addshqx()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">添加或编辑</a>
								</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<!-- <div>共有项目【<span id="xmsl" style="color: red;">0</span>】个
            		</div> -->
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
