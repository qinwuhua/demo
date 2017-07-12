<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>计划执行情况表</title>
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
		loadBmbm('jhnf','项目年份',new Date().getFullYear());
		
	});
		
	function queryBb(){
		/* YMLib.Var.flag='';
		openWindow("字段选择","/jxcsxm/page/tjbb/tzhzb_zd.jsp",600,380);
 */
	 	var tbody = $("#bblist");
		tbody.empty();
		var bt = $("#biaotou");
		bt.empty();
		$.ajax({
			url:"/jxcsxm/tjbb/getTzmxb.do",
			data:'flag=0&jhnf='+$("#jhnf").combobox('getValue')+"&xmbm="+parent.YMLib.Var.xmbm,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				datalists=msg;
				disLoadjzt();
				if (msg != null) {
					var btstr="<tr><td rowspan='2' colspan='2'>科目明细</td><td rowspan='2'>计划下达数</td><td rowspan='2'>截至上年收款</td>";
					var dw=new Array();
						if(msg[0].dwbt!=null&&msg[0].dwbt!="")
						dw=msg[0].dwbt.split(",");
					var bf=new Array();
						if(msg[0].bfbt!=null&&msg[0].bfbt!="")
						bf=msg[0].bfbt.split(",");
					var t=10;
					
					if(dw.length>0){
						btstr+="<td colspan='"+(dw.length+1)+"'>本年收款明细</td>";
						t+=dw.length+1;
					}
					btstr+="<td rowspan='2'>截至上年拨款</td>"
					if(bf.length>0){
						btstr+="<td colspan='"+(bf.length+1)+"'>本年拨付明细</td>";
						t+=bf.length+1;
					}
					btstr+="<td rowspan='2'>累计收款</td><td rowspan='2'>累计拨款</td><td rowspan='2'>未收款数</td><td rowspan='2'>收款未拨数</td><td rowspan='2'>备注</td></tr>"
					btstr+="<tr>"
					for(var i=0;i<dw.length;i++){
						if(i==0){
							btstr+="<td>小计</td><td>"+dw[i]+"</td>"
						}else{
							btstr+="<td>"+dw[i]+"</td>"
						}
						
					}
					for(var i=0;i<bf.length;i++){
						if(i==0){
							btstr+="<td>小计</td><td>"+bf[i]+"</td>"
						}else{
							btstr+="<td>"+bf[i]+"</td>"
						}
					}
					btstr+="</tr>"
					
					bt.append(btstr);
					var myv=new Array();
					
					for ( var j = 0; j < t;j++) {
						myv[j]="v_"+j;
					}
					
					 for ( var i = 0; i < msg.length; i++) {
						var tr="<tr height='28'>";
						for ( var j = 0; j < myv.length;j++) {
							tr+="<td>"+msg[i][myv[j]]+"</td>";
						}
						tr+="</tr>";
					
						tbody.append(tr);
					} 
				}
			}
		});
 
 
 	
	}
	
	 function exportBb(){
		
		var data='flag=1&jhnf='+$("#jhnf").combobox('getValue')+"&xmbm="+parent.YMLib.Var.xmbm;
		loadjzt();
		 $.post('/jxcsxm/xtgl/exportBb_set.do',{nameValue:"",colValue:""},function(){
			window.location.href='/jxcsxm/tjbb/getTzmxb.do?'+data;
		 }); 
		 setTimeout('disLoadjzt()',4000);
		
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
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					
								<tr height="28">
									<td align="right">报表年份：</td>
        							<td><select id="jhnf" style="width: 80px;"></select></td>
									<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryBb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
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
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-70)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="100%">
								<caption align="top" style="font-size:large;font-weight: bolder;"> 台帐明细表</caption>
								<tbody id='biaotou'>
									
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
