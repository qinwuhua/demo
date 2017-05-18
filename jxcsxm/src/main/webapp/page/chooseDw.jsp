<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理安保工程项目</title>
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css" />
<script type="text/javascript" src="../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../js/YMLib.js"></script></script>
<script type="text/javascript" src="../js/util/jquery.cookie.js"></script></script>
<script type="text/javascript">
	$(function(){
		loadUnit("gydw",$.cookie("unit"));
		/* console.info($.cookie('unit'));
		console.info($.cookie('unit2'));
		console.info($.cookie('dist'));
		console.info($.cookie('dist2')); */
	});
	function exportModule_sc(){
		var tbdw=("36"==$('#gydw').combotree("getValue"))?"":$('#gydw').combotree("getValue");
		tbdw=filterGydwdm(tbdw);
		//alert($('#gydw').combotree("getValue") +' ____ '+tbdw)
		var sbdw=$.cookie('unit2');
		var filename = getParam('filename');
		var tempVar = filename.substring(0,filename.indexOf('_'));
		if(tempVar=='SCK')
			window.location.href="/jxcsxm/xtgl/getModule_sc.do?moduleName="+filename+"&sck_sbthcd="+(sbdw.length==2?7:sbdw.length)+"&tbdw="+tbdw+"&sbdw="+sbdw;
		else
			window.location.href="/jxcsxm/xtgl/getModule_jh.do?moduleName="+filename+"&sck_sbthcd="+(sbdw.length==2?7:sbdw.length)+"&tbdw="+tbdw+"&sbdw="+sbdw;
		setInterval(function(){window.parent.$('#exportChooseDw').window('close');},1000); 
		
	}
	function filterGydwdm(gydwdm){
		var result=null;
		var sheng = new RegExp("^[0-9]{7}0000$");
		var shi1=new RegExp("^[0-9]{7}[0-9][1-9]00$");
		var shi2=new RegExp("^[0-9]{7}[1-9][0-9]00$");
		if(gydwdm=="36"){
			result=null;
		}else if(shi1.test(gydwdm) || shi2.test(gydwdm) ){
			result=gydwdm.substring(0, gydwdm.length-2)+"__";
		}
		else if(sheng.test(gydwdm)){
			result=gydwdm.substring(0, gydwdm.length-4)+"____";
		}else{
			result=gydwdm;
		}
		return result;
	}
</script>
</head>
<body>
	<table width="100%" height="100%">
		<tr>
			<td align="right"><input type="text" id="gydw" style="width:180px"/></td>
			<td align="left"><img name="btnExcel" id="btnExcel" onmouseover="this.src='../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../images/Button/dcecl1.gif'" src="../images/Button/dcecl1.gif" onclick="exportModule_sc()" style="border-width:0px;cursor: hand;" /></td>
		</tr>
	</table>
</body>
</html>