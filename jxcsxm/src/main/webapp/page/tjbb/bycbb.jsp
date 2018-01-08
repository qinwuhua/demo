<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>公路小修保养成本表</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid #FFEBCD;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid #FFEBCD;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
	$(function(){
		loadUnit1("gydw",$.cookie("unit"));
		loadBmbm('nf','资产年份',new Date().getFullYear());
		loadBmbm3('yf','月份',((new Date().getMonth()+1)+"").length==1? '0'+(new Date().getMonth()+1):(new Date().getMonth()+1));
		showBb();
	});
		
	var datalist="";var k=0;
	function showBb(){
		
		var tbody = $("#bblist");
				tbody.empty();

		//loadjzt();
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
		
		var nf=$("#nf").combobox('getValue');
		
		var yf=$("#yf").combobox("getValues").join(",");
		if(yf.substr(0,1)==',')
			yf=yf.substr(1,yf.length);
		
		$.ajax({
			url:"/jxcsxm/tjbb/getTjbb.do",
			data:'flag=0&nf='+nf+"&gydw="+xzqhstr+"&yf="+yf+"&xmlx="+"bycbb",
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalists=msg;
				disLoadjzt();
				if (msg != null) {
					k=0;
					datalist=JSON.stringify(msg);
					
					for ( var i = 0; i < msg.length; i++) {
						var tr="<tr height='28'>";
							tr+="<td>"+msg[i].v_0+"</td>"
							+"<td>"+msg[i].v_1+"</td>"+"<td>"+msg[i].v_2+"</td>"
							+"<td>"+msg[i].v_3+"</td>"+"<td>"+msg[i].v_4+"</td>"
							+"<td>"+msg[i].v_5+"</td>"+"<td>"+msg[i].v_6+"</td>"
							+"<td>"+msg[i].v_7+"</td>"+"<td>"+msg[i].v_8+"</td>"
							+"<td>"+msg[i].v_9+"</td>"+"<td>"+msg[i].v_10+"</td>"
							+"<td>"+msg[i].v_11+"</td>";
						tr+="</tr>";
						tbody.append(tr);
					}
				}
			}
		});
	}
	
	function exportBb(){
		if(datalist==""){
			alert("请您先查询报表数据");
			return;
		}
		
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
		
		var nf=$("#nf").combobox('getValue');
		var gydw="";if($.cookie('unit').substr(0,1)=='1') gydw='1';if($.cookie('unit').substr(0,1)=='2') gydw='2';
		var data='flag=1&nf='+nf+"&gydw="+xzqhstr+"&yf="+yf+"&xmlx="+"bycbb";
		loadjzt();
		 $.post('/jxcsxm/xtgl/exportBb_set.do',{sql:datalist,gydw:xzqhstr},function(){
			window.location.href='/jxcsxm/tjbb/getTjbb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
		
		
	}
	
	
	function importBb(){
		var url="";
		url="/jxcsxm/tjbb/importTjbb.do?gydwdm="+$.cookie("unit");
		var weatherDlg = new J.dialog( {
			id : 'ids',
			title : '请选择EXCEL文档！',
			page : './uploadwjbb.jsp?url='+url+'&flag='+'bycbb',
			width : 450,
			height : 400,
			top : 0,
			rang : true,
			resize : false,
			cover : true
		});
		
		weatherDlg.ShowDialog();
		
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
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
					<div id="righttop">
						<div id="p_top">当前位置>&nbsp;统计报表>&nbsp;公路小修保养成本表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					
								<tr height="28">
									<td align="right">管养单位：</td>
	        						<td><select id="gydw" style="width:165px;"></select></td>
									<td align="right">年份：</td>
        							<td><select id="nf" style="width: 80px;"></select></td>
									<td align="right">月份：</td>
        							<td><select id="yf" style="width: 80px;"></select></td>
									
								</tr>
        					
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:showBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
                            		<a id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:importBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">导入报表</a>
                            		<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:exportBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">导出报表</a>
								</td>
                            </tr>
							</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 450px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-140)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<div style="font-size:large;font-weight: bolder;" align="center">公路小修保养成本表</div>
							<div align="right">
									单位：元
									里程单位：公里
									养护事业05表
							</div>
							
							<table id='bbtable' width="100%">
								
								<tbody id='biaotou'>
									
									<tr>
									<td rowspan="2">项       目</td>
									<td rowspan="2">合   计</td>
									<td colspan="5">国     道</td>
									<td colspan="5">省     道</td>
									</tr>
									<tr>
									<td>里程</td>
									<td>小计</td>
									<td>砼路面</td>
									<td>沥青路面</td>
									<td>其他路面</td>
									<td>里程</td>
									<td>小计</td>
									<td>砼路面</td>
									<td>沥青路面</td>
									<td>其他路面</td>
									</tr>
									<tr>
									<td>行次</td>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
									<td>10</td>
									<td>11</td>
									</tr>
									
									
								</tbody>
								<tbody id="bblist"></tbody>
							</table>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>
