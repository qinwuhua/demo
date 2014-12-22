<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审查库管理危桥改造项目</title>
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../../js/YMLib.js"></script>
<script type="text/javascript" src="../js/Menu.js"></script>
<script type="text/javascript">
$(function(){
 
});
</script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
	<table align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td align="left" background="../../images/dht_bg.jpg"  style="padding-left: 25px; background-repeat:no-repeat; height: 25px;"width="90%">
			<font color="#1a5780" style="font-size: small">路网项目</font>&nbsp;&gt;&nbsp; 
			<font color="#1a5780" style="font-size: small">项目审查库管理</font>&nbsp;&gt;&nbsp; 
			<font color="#5C5C5C" style="font-size: small">危桥改造项目管理</font></td>
		</tr>
		<tr>
			<td align="left" style="padding-left:10px; padding-right:25px;">
				<fieldset style="width:1050px;text-align:left;vertical-align:middle;">
				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
				<font style="color: #0866A0; font-weight: bold">项目信息：</font>
				</legend>
					<table width="100%" cellpadding="2" cellspacing="0" border="0" style="padding-left: 20px">
						<tbody>
							<tr>
							  <td align="right" width="7%" >管养单位：
                              </td>
                              <td align="left" colspan="3" >
                              	<select id="cc" class="easyui-combobox" style="width:238px">
                              		<option>===请选择===</option>
                              		<option>嘿嘿</option>
                              	</select>
                              </td>
                              <td align="right" width="7%" >行政区划：
                              </td>
                              <td align="left" colspan="3" >
                              	<select id="ss" class="easyui-combobox" style="width:238px">
                              		<option>===请选择===</option>
                              		<option>嘿嘿</option>
                              	</select>
                              </td>
                               <td align="right" width="7%" >路线名称：
                              </td>
                              <td align="left" >
                              	<input type="text" style="width:110px"/>
                              </td>
                              <td align="right" width="8%" >桥梁名称：
                              </td>
                              <td align="left" >
                              	<input type="text" style="width:110px"/>
                              </td>
                              
                             </tr>
                             <tr>
							  <td align="right" width="7%" >项目年份：</td>
                              <td align="left" >
                              	<select id="cc1" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" value="">全部</option>
									<option value="2014年">2014年</option>
									<option value="2013年">2013年</option>
									<option value="2012年">2012年</option>
									<option value="2011年">2011年</option>
                              	</select>
                              </td>
                              <td align="right" width="7%" >项目状态： </td>
                              <td align="left" >
                              	<select id="ss1" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">待上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">已入库</option>
									<option value="已审核">已下达</option>
                              	</select>
                              </td>
                               <td align="right" width="7%" >审核状态：</td>
                              <td align="left" >
                              	<select id="ss2" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
                              	</select>
                              </td>
                              <td align="right" width="7%" >审查状态：</td>
                              <td align="left" >
                              	<select id="ss3" class="easyui-combobox" style="width:80px">
                              		<option selected="selected" >全部</option>
                              		<option>已审查</option>
                              		<option>未审查</option>
                              	</select>
                              </td>
                              <td align="right" width="7%" >技术等级：</td>
                              <td align="left" >
                              	<select id="ss5" class="easyui-combobox" style="width:115px">
                              		<option selected="selected" value="">全部</option>
									<option value="1">一级公路</option>
									<option value="2">二级公路</option>
									<option value="3">三级公路</option>
									<option value="4">四级公路</option>
									<option value="5">等外公路</option>
                              	</select></td>
                              	<td align="right" width="8%" >按跨径分类：</td>
                              	<td align="left" >
                              	<select id="ss6" class="easyui-combobox" style="width:115px">
                              		<option selected="selected" value="">全部</option>
									<option value="1">特大桥</option>
									<option value="2">大桥</option>
									<option value="3">中桥</option>
									<option value="4">小桥</option>
                              	</select></td>
                             </tr>
                             <tr>
                             	<td colspan="14" align="left" >
								<input type="image" name="btnSelect" id="btnSelect" onmouseover="this.src='../../../images/Button/Serch02.gif'" alt="查询" onmouseout="this.src='../../../images/Button/Serch01.gif'" src="../../../images/Button/Serch01.gif" style="border-width:0px;cursor: hand;" />
								<input type="image" name="shangBao" id="shangBao" src="../../../images/Button/shangbao_1.png" onmouseover="this.src='../../../images/Button/shangbao_2.png'" onmouseout="this.src='../../../images/Button/shangbao_1.png'   " src="" onclick="shangB();" style="border-width:0px;" />
								<input type="image" name="btnDCMB" id="btnDCMB" onmouseover="this.src='../../../images/Button/DC2.gif'" alt="导出模版" onmouseout="this.src='../../../images/Button/DC1.gif'" src="../../../images/Button/DC1.gif" style="border-width:0px;cursor: hand;" />
								<input type="image" name="insertData"id="insertData" alt="导入数据" src="../../../images/Button/dreclLeave.GIF" onmouseover="this.src='../../../images/Button/dreclClick.GIF'" onmouseout="this.src='../../../images/Button/dreclLeave.GIF'" onclick="importExcel();" style="border-width:0px;" />
                                <input type="image" name="addOne" id="addOne" src="../../../images/Button/tianj1.gif" onmouseover="this.src='../../../images/Button/tianj2.gif'" onmouseout="this.src='../../../images/Button/tianj1.gif'   " src="" onclick="addJck();" style="border-width:0px;" />
                                <input type="image" name="delAll" id="delAll" src="../../../images/Button/delete1.jpg" onmouseover="this.src='../../../images/Button/delete2.jpg'" onmouseout="this.src='../../../images/Button/delete1.jpg'   " src="" onclick="javascript:return CheckSelect();" style="border-width:0px;" />
                                <input type="image" name="btnExcel" id="btnExcel" onmouseover="this.src='../../../images/Button/dcecl2.gif'" alt="导出Excel" onmouseout="this.src='../../../images/Button/dcecl1.gif'" src="../../../images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;" />
							 </td>
                             </tr>
						</tbody>
					</table>
				</fieldset>
			</td>
		</tr>
		<tr>
                   <td style="text-align: left; padding-left: 20px; padding-top: 5px; height: 25px; font-size: 12px;" >
        					共有【&nbsp;<span id="wqgz" style="font-weight: bold; color: #FF0000">15</span>&nbsp;】个危桥改造项目。</td>
        </tr>
		</table>
</body>
</html>
