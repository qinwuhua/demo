<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="../../../../js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="js/bhsd.js"></script>
	<script type="text/javascript">
		$(function(){
			loadUnit1("gydw",$.cookie("unit"));
			loadBmbm2("kgzt","开工状态");
			if(getParam("t")=='1'){
				$("#ybzt").val('未上报');
			}
			//var myDate = new Date();
			//var y = myDate.getFullYear();
			// var m = myDate.getMonth()+1; 
			//for(var x=y;x>=2010;x--){
			//	$("#ddlYear").append("<option value="+x+">"+x+"</option>");
			//}
			//$("#ddlYear").val(myDate.getFullYear());
			
			var urlid=getUrlParame('id');
			if(urlid==null){
				xmnfdx("ddlYear"); 
			}else{
				setxmnf("ddlYear",urlid);
			}
			
			showAll();
		});
	</script>
	<style type="text/css">
<!--
a:link {
 text-decoration: none;
}
a:visited {
 text-decoration: none;
}
a:hover {
 text-decoration: none;
  cursor: pointer;
}
a:active {
 text-decoration: none;
}
-->
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
		<div id="p_top">工程管理>&nbsp;进度报表>&nbsp;<span id="astext">进度填报</span>>&nbsp;<span id="bstext"></span>>&nbsp;路网结构工程>&nbsp;病害隧道</div>
	</div>
		<table width="99.8%" border="0" style="margin-top: 0.1%; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px; padding-top:5px;">
        			<fieldset style="width:99.7%;text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<table style="margin:5px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="30">
        						<td align="right">管养单位：</td>
        						<td><input id="gydw" style="width: 150px;"></td>
        						<td align="right">开工状态：</td>
        						<td><input id="kgzt" style="width:102px;"></td>
        						<td align="right">项目年份：</td>
        						<td><select name="ddlYear" id="ddlYear" style="width: 60px;">
        						<option value="">全部</option>
        						</select></td>
        						<td align="right">月报状态：</td>
        						<td><select id="ybzt" style="width: 60px;">
        							<option value="">全&nbsp;&nbsp;部</option>
        							<option value="已上报">已上报</option>
        							<option value="未上报">未上报</option>
        						</select></td>
        						
        						</tr>
        								<tr height="30">
        						<td align="right">路线名称：</td>
        						<td>	<input type="text" id="lxmc"  style="width: 150px;"></td>
        						<td align="right">隧道名称：</td>
        						<td><input type="text" id="sdmc" style="width: 100px;"></td>
        						<td align="right">隧道代码：</td>
        						<td><input type="text" id="sddm" style="width: 60px;"></td>
        						</tr>
        								<tr height="30">
        								<td colspan="10">
        						<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                        onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -60%;" onclick="showAll()"/>        					
                            </td> </tr></table>  </p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
                <td style="padding-top: 5px;padding-left: 10px;">
                    <div>
						<table id="datagrid" >
						</table>
					</div>
			</td>
		</tr>
	</table>
	
</body>
</html>