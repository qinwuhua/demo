<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造</title>
</head>
<body>
	<div style="text-align: center;">
        <table width="97%" height="90%" cellpadding="0" cellspacing="0" border="0" style="margin-top: 10px;
            margin-left: 13px;">
            <tr>
                <td height="25" align="left" background="../images/page/dht_bg.jpg" style="padding-left: 25px;
                    background-repeat: no-repeat; font-size: 12px;">
                    <font color="#1a5780" style="font-size: small">计划管理</font>&nbsp;>&nbsp; <font color="#1a5780"
                        style="font-size: small">项目计划库管理</font>&nbsp;>&nbsp; <font color="Gray" style="font-size: small">
                            危桥改造项目管理</font>
                </td>
            </tr>
            <tr>
                <td height="45" align="left" background="../images/page/jt.jpg" style="padding-left: 15px;
                    font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat;
                    background-position: left center; background-repeat: no-repeat;">
                    危桥改造项目基础库信息
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
                        border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; height: 45px;" cellspacing="0"
                        cellpadding="0">
                        <tr style="height: 25px;">
                            <td colspan="6" style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #55BEEE; font-weight: bold; font-size: small; text-align: left; background-color: #F1F8FF;
                                width: 15%; padding-left: 10px;">
                                危桥改造项目基本信息
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                桥梁名称
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="QLMC"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                桥梁编码
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="QLBH"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                桥梁中心桩号
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 18%; text-align: left; padding-left: 10px;">
                                <span id="QLZXZH"></span>
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                &nbsp;管养单位
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="GYDW"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                行政区划代码
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="XZQHDM"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                行政区划名称
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="XZQHMC"></span>
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                路线名称
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="LXMC"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                路线编码
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="LXBM"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                跨径总长
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0; border-bottom: 1px solid #C0C0C0;
                                width: 19%; text-align: left; padding-left: 10px;">
                                <span id="KJZC"></span>
                                米
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                桥梁全长&nbsp;
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="QLQC"></span>
                                米
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                桥梁全宽
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="QLKD"></span>
                                米
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                单孔最大跨径
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="DKZDKJ"></span>
                                米
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                技术等级
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="JSDJ"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                评定等级
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="PDDJ"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                修建/改建年度
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="XJND"></span>
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                按跨径分类
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="AKJFL"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                上部结构形式
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="SBJGXS"></span>
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                特殊地区
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="lblTSDQ"></span>&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr style="height: 30px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                项目年份
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="Lab_xmnf"></span>&nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                width: 15%; padding-right: 5px;">
                                项目状态
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; width: 19%; text-align: left; padding-left: 10px;">
                                <span id="Lab_xmtype"></span>
                                &nbsp;
                            </td>
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                &nbsp;
                            </td>
                            <td style="border-left: 1px solid #C0C0C0; border-right: 1px none #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <td style="border-style: none none solid none; border-width: 1px; border-color: #C0C0C0;
                                color: #007DB3; font-weight: bold; font-size: small; text-align: right; background-color: #F1F8FF;
                                padding-right: 5px;">
                                病害内容
                            </td>
                            <td class="style3" colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                border-bottom: 1px solid #C0C0C0; text-align: left; padding-left: 10px;">
                                <span id="BHNR"></span>
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 50px;">
                            <td style="color: #007DB3; font-weight: bold; font-size: small; text-align: right;
                                background-color: #F1F8FF; padding-right: 5px;">
                                备注
                            </td>
                            <td colspan="5" style="border-left: 1px solid #C0C0C0; border-top: 1px none #C0C0C0;
                                text-align: left; padding-left: 10px;">
                                <span id="BZ"></span>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="45" align="left" background="../images/page/jt.jpg" style="padding-left: 15px;
                    font-size: 14px; color: #007DB2; font-weight: bold; background-repeat: no-repeat;
                    background-position: left center; background-repeat: no-repeat;">
                    危桥改造项目资金下发信息
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-left: 20px; font-size: 12px;">
                    共有【&nbsp;<span id="lblTzCount" style="font-weight: bold; color: #FF0000">1</span>&nbsp;】个下发信息，下发资金共【&nbsp;<span id="lblXDZJ" style="font-weight: bold; color: #FF0000">1</span>&nbsp;】万元。
                </td>
            </tr>
            <tr>
                <td align="center">
                    
                            <table width="100%" height="90%" cellpadding="0" cellspacing="0" border="1" style="padding-top: 10px;">
                                <tr>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #C0C0C0;
                                        color: #007DB3; font-weight: bold; font-size: 12px; text-align: center; background-color: #F1F8FF;
                                        padding-right: 5px;">
                                        操作
                                    </td>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #C0C0C0;
                                        color: #007DB3; font-weight: bold; font-size: 12px; text-align: center; background-color: #F1F8FF;
                                        padding-right: 5px;">
                                        资金追加
                                    </td>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #C0C0C0;
                                        color: #007DB3; font-weight: bold; font-size: 12px; text-align: center; background-color: #F1F8FF;
                                        padding-right: 5px;">
                                        下达年份
                                    </td>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #C0C0C0;
                                        color: #007DB3; font-weight: bold; font-size: 12px; text-align: center; background-color: #F1F8FF;
                                        padding-right: 5px;">
                                        下达资金
                                    </td>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #C0C0C0;
                                        color: #007DB3; font-weight: bold; font-size: 12px; text-align: center; background-color: #F1F8FF;
                                        padding-right: 5px;">
                                        填报部门
                                    </td>
                                    <td style="border-style: solid solid solid solid; border-width: 1px; border-color: #C0C0C0;
                                        color: #007DB3; font-weight: bold; font-size: 12px; text-align: center; background-color: #F1F8FF;
                                        padding-right: 5px;">
                                        填报时间
                                    </td>
                                </tr>
                        
                            <tr>
                                <td>
                                    <a id="rpZJXX_ctl01_btnEdit" href="javascript:__doPostBack('rpZJXX$ctl01$btnEdit','')" style="color:#0066CB;">编辑</a>
                                    &nbsp;|&nbsp;
                                    <a onclick="return CheckDel(&quot;2014&quot;,&quot;0&quot;);" id="rpZJXX_ctl01_btnDel" disabled="disabled" style="color:#0066CB;">删除</a>
                                </td>
                                <td>
                                    <span id="rpZJXX_ctl01_SFZJ" style="font-size:10pt;">否</span>
                                </td>
                                <td>
                                    <span id="rpZJXX_ctl01_XDNF" style="font-size:10pt;">2014</span>
                                </td>
                                <td>
                                    <span id="rpZJXX_ctl01_XDZJ" style="font-size:10pt;">1</span>
                                </td>
                                <td>
                                    <span id="rpZJXX_ctl01_TBDW" style="font-size:10pt;">江西省</span>
                                </td>
                                <td>
                                    <span id="rpZJXX_ctl01_TBSJ" style="font-size:10pt;">2014-12-16</span>
                                </td>
                            </tr>
                        
                            </table>
                            
                        
                </td>
            </tr>
            <tr>
                <td>
                    共
                    <span id="lblcount">1</span>条记录，当前
                    <span id="lblcurrent">1/1</span>页&nbsp;&nbsp;
                    <a id="hlfist" disabled="disabled">首页</a>&nbsp;
                    <a id="hlprev" disabled="disabled">上一页</a>&nbsp;
                    <a id="hlnext" disabled="disabled">下一页</a>&nbsp;
                    <a id="hllast" disabled="disabled">末页</a>&nbsp;&nbsp;
                    <select name="ddlPage" onchange="javascript:setTimeout('__doPostBack(\'ddlPage\',\'\')', 0)" id="ddlPage">
	<option selected="selected" value="1">1</option>

</select>
                </td>
            </tr>
        </table>
        <table width="97%" border="0" style="border-style: solid; border-width: 3px 1px 1px 1px;
            margin-top: 20px; border-color: #55BEEE #C0C0C0 #C0C0C0 #C0C0C0; margin-left: 13px;
            height: 45px;" cellspacing="0" cellpadding="0">
            <tr style="height: 30px;">
                <td align="center">
                    <table>
                        <tr>
                            <td>
                            	<a href="javascript:openZjxd('zjxd','资金下达','../zjxd/zjxd.jsp','800','250')">
                            		<img id="imgAdd" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/tianj2.gif'" alt="添加"
									onmouseout="this.src='${pageContext.request.contextPath}/images/Button/tianj1.gif'"   src="${pageContext.request.contextPath}/images/Button/tianj1.gif"
									style="border-width: 0px; cursor: hand;" /></a>
							</td>
							<td>
								<a href="javascript:void(0)" >
									<img src="${pageContext.request.contextPath}/images/Button/fanhui1.GIF" alt="返回" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/fanhui2.GIF'"
										onmouseout="this.src='${pageContext.request.contextPath}/images/Button/fanhui1.GIF'" style="border: 0">
								</a>
							</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div id="zjxd" style="font-size: 12px;width:80%;"></div>
</body>
</html>