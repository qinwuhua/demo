<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>资金下达页面</title>
</head>
<body>
	<script type="text/javascript">
		
	</script>
	<center>
		<table width="100%" height="60%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px; margin-left: 13px;">
			<tr>
				<td><br />
					<table width="100%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 35px;">
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<font color="#009ACD" style="cursor: hand; font-size: 12px">下达年份：
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
								<select name="ddlXDNF" id="ddlXDNF" style="width: 80px;">
									<option selected="selected" value="2015">2015年</option>
									<option value="2014">2014年</option>
									<option value="2013">2013年</option>
									<option value="2012">2012年</option>
									<option value="2011">2011年</option>
									<option value="2010">2010年</option>
									<option value="2009">2009年</option>
									<option value="2008">2008年</option>
									<option value="2007">2007年</option>
									<option value="2006">2006年</option>
									<option value="2005">2005年</option>
									<option value="2004">2004年</option>
									<option value="2003">2003年</option>
									<option value="2002">2002年</option>
									<option value="2001">2001年</option>
									<option value="2000">2000年</option>
							</select>
							</td>
							<td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<b><font color="#009ACD"
									style="cursor: hand; font-size: 12px">下达资金：</font></b>
							</td>
							<td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<input name="XDZJ" type="text"  style="width: 80px;" id="XDZJ" onkeyup="clearNoNum(event,this)" onblur="clearNoNum(event,this)" />&nbsp;万元
							</td>
							<td style="border-bottom: 1px solid #C0C0C0; width: 19%;">
								&nbsp;</td>
							<td style="border-bottom: 1px solid #C0C0C0; width: 19%;">
								&nbsp;</td>
						</tr>
						<tr style="height: 35px;">
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<font color="#009ACD" style="cursor: hand; font-size: 12px">是否为追加资金：</font>
							</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<table id="rList" border="0">
									<tr>
										<td>
											<input id="rList_0" type="radio" name="rList" value="0" checked="checked" />
											<label for="rList_0">否</label></td>
										<td>
											<input id="rList_1" type="radio" name="rList" value="1" />
											<label for="rList_1">是</label></td>
									</tr>
								</table>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<font color="#009ACD" style="cursor: hand; font-size: 12px">填报部门：</font>
							</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<span id="lblTBDW">江西省</span>
							</td>
							<td
								style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0; color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF; width: 15%; padding-right: 5px;">
								<font color="#009ACD" style="cursor: hand; font-size: 12px">填报时间：</font>
							</td>
							<td
								style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px; font-size: 12px;">
								<span id="lblTBSJ">2015-01-16</span>
							</td>
						</tr>
					</table>
					<table width="100%" border="0"
						style="border-style: solid; border-width: 3px 1px 1px 1px; margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;"
						cellspacing="0" cellpadding="0">
						<tr style="height: 30px;">
							<td align="center">
							<td align="center">
								<input type="image" name="btnAdd" id="btnAdd"
								onmouseover="this.src='${pageContext.request.contextPath}/images/Button/baocun2.gif'" alt="保存"
								onmouseout="this.src='${pageContext.request.contextPath}/images/Button/baocun1.gif'"
								src="${pageContext.request.contextPath}/images/Button/baocun1.gif" style="border-width: 0px;" />
								&nbsp; <input type="image" name="btnCancel" id="btnCancel"
								onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'" alt="返回"
								onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'"
								src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" style="border-width: 0px;" />
							</td>
							</td>
						</tr>
					</table></td>
			</tr>
		</table>
	</center>
</body>
</html>