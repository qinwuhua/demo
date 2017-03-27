<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公路技术状况汇总明细表</title>
<link rel="stylesheet" type="text/css" href="../../css/Top.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
<script type="text/javascript" src="./js/lkpd.js"></script>
</head>
<body style="margin: 0px; overflow: auto;">
	<script type="text/javascript">
		var id= obj.tabs('getSelected').panel('options').id;
		var data="id="+id.substr(0,32);
		$.ajax({
			url:"/jxzhpt/wjxt/getHzmxbDataList.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				var tbody = $("#"+id+" #mxbdata");
				tbody.empty();
				if (msg != null) {
					for ( var i = 0; i < msg.length; i++) {
						tbody.append( "<tr style='background-color: #FFFFFF; height: 15px;'><td>"
								+ msg[i].lxbh + "</td><td>"
								+ msg[i].lxmc + "</td><td>"
								+ msg[i].qdzh + "</td><td>"
								+ msg[i].zdzh + "</td><td>"
								+ msg[i].qjfx + "</td><td>"
								+ msg[i].pdlc + "</td><td>"
								+ msg[i].mqi + "</td><td>"
								+ msg[i].pqi + "</td><td>"
								+ msg[i].sci + "</td><td>"
								+ msg[i].bci + "</td><td>"
								+ msg[i].tci + "</td><td>"
								+ msg[i].ydl + "</td><td>"
								+ msg[i].ldl + "</td><td>"
								+ msg[i].zdl + "</td><td>"
								+ msg[i].cdl + "</td><td>"
								+ msg[i].cadl + "</td><td>"
								+ msg[i].yllv + "</td>"
								+  "</tr>");
					}
				}
			}
		});
		$.ajax({
			url:"/jxzhpt/wjxt/getHzbDataList.do",
			data:data,
			type:"post",
			dataType:"JSON",
			success:function(msg){
				$("#"+id+" #tbdw").text(msg.tbdw);
				$("#"+id+" #bt").html("<pre>"+msg.bt1+"<br>"+msg.bt2+"<br>"+msg.bt3+"<br>"+msg.bt4+"<br>"+msg.bt5+"</pre>");
				$("#"+id+" #tbnf").text(msg.tbnf);
				$("#"+id+" #bw").text(msg.bw)
			}
		});
		
	</script>
    <div style="text-align: left; vertical-align: top; margin: 0px; height: 100%;width: 99.9%;">
        <table border="0" style="margin-top: 1px; margin-left: 1px; width: 99.9%;" cellspacing="0"
            cellpadding="0">
            <tr>
                <td align="center" style="padding-top: 20px;">
                    <table cellpadding="0" cellspacing="0" style="width: 99.9%;">
                        <tr style="height: 110px;">
                            <td>
                                <table cellpadding="0" cellspacing="0" style=" width: 99.9%;">
                                    <tr>
                                        <td align="center" colspan="3" style="height: 20px; font-size: 20px; font-weight: bolder;">
                                            公路技术状况汇总明细表
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 30%">
                                            &nbsp;
                                        </td>
                                        <td align="center" style="width: 50%; font-size: 14px; padding-left: 240px;">
                                            <span id="lblFBT">——高速公路、普通国道级省道</span>
                                        </td>
                                        <td rowspan="3" align="right" style="width: 20%; margin: 0px; padding: 0px;">
                                            <div  id="bt" style="text-align: left; width: 200px;"></div>
<!--                                             <textarea id='bt' name="txtReport" rows="2" cols="20" readonly="readonly" id="txtReport" style="border-style:None;font-size:11px;height:90px;width:100%;overflow: hidden;font-size: x-small;background-color: #ffffff;"></textarea> -->
                                        </td>
                                    </tr>
                                    <tr style="vertical-align: bottom;">
                                        <td align="left" style="font-size: 12px;">
                                            填报单位：<span id="tbdw"></span>
                                        </td>
                                        <td align="center" style="font-size: 12px;">
                                            <span id="tbnf"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top;">
                                <table cellpadding="1" cellspacing="1" style="vertical-align: middle; text-align: center;
                                    background-color: #4B4B4B" border="1">
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td rowspan="2" style="width: 140px;">
                                            路线编码
                                        </td>
                                        <td rowspan="2" style="width: 160px;">
                                            路线名称
                                        </td>
                                        <td rowspan="2" style="width: 100px;">
                                            起点桩号
                                        </td>
                                        <td rowspan="2" style="width: 100px;">
                                            终点桩号
                                        </td>
                                        <td rowspan="2" style="width: 100px;">
                                           前进方向
                                        </td>
                                        <td rowspan="2" style="width: 100px;">
                                           评定里程（公里）
                                        </td>
                                        <td colspan="5" style="width: 100px;">
                                           评定结果
                                        </td>
                                        <td colspan="5" style="width: 100px;">
                                          评级里程(公里)
                                        </td>
                                        <td rowspan="2" style="width: 300px;">
                                           优良路率(%)
                                        </td>
                                    </tr>
                                    <tr style="background-color: #999999; height: 12px;">
                                        <td colspan="1" style="width: 60px;">
                                            MQI
                                        </td>
                                     	<td colspan="1" style="width: 60px;">
                                            PQI
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            SCI
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            BCI
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                           TCI
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            优等路
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            良等路
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            中等路
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            次等路
                                        </td>
                                        <td colspan="1" style="width: 60px;">
                                            差等路
                                        </td>
                                     </tr>
                                    <tr style="background-color: #999999; height: 15px;">
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            2
                                        </td>
                                        <td>
                                            3
                                        </td>
                                        <td>
                                            4
                                        </td>
                                        <td>
                                            5
                                        </td>
                                        <td>
                                            6
                                        </td>
                                        <td>
                                            7
                                        </td>
                                        <td>
                                            8
                                        </td>
                                        <td>
                                            9
                                        </td>
                                        <td>
                                            10
                                        </td>
                                        <td>
                                            11
                                        </td>
                                        <td>
                                            12
                                        </td>
                                        <td>
                                            13
                                        </td>
                                        <td>
                                            14
                                        </td>
                                        <td>
                                            15
                                        </td>
                                        <td>
                                            16
                                        </td>
                                        <td>
                                            17
                                        </td>
                                    </tr>
                                    <tbody id="mxbdata"></tbody>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 20px;">
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left" style="width: 25%;">
                                            <span id="bw"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
