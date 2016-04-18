<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/page/qqgl/lxsh/js/sjgz.js"></script> --%>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<script type="text/javascript">
	    function ybnf(id){
		var myDate = new Date();
		var years=[];
		var first;
		for(var i=myDate.getFullYear();i>=2005;i--){
			years.push({text:(i),value:(i)});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});
			first=myDate.getFullYear();
		$('#'+id).combobox("setValue",+first);
	}
	function ybyf(id){
		var myDate = new Date();
		var years=[];
		var first;
		for(var i=1;i<=12;i++){
			years.push({text:(i),value:(i)});
		}
		$('#'+id).combobox({
		    data:years,
		    valueField:'value',
		    textField:'text'
		});		
			first=myDate.getMonth()+1;

		$('#'+id).combobox("setValue",+first);
	} 
		$(function(){
			ybnf('ybnf');
			ybyf('ybyf');
			setjhxdnf();
			loadUnit("gydw",$.cookie("unit"));
			loadDist("xzqh",$.cookie("dist"));
		//	loadBmbm2("xmlx","项目类型2");
			$("#xmlx").combobox("setValue",'升级改造');
			/* var myDate = new Date();
			var y = myDate.getFullYear();
			var arr = new Array(); 
			var i=0;
			for(var x=y;x>=2011;x--){
				arr[i]=x+'';
				i++;
			}
			$("#jhxdnf").combotree("setValues",arr);*/
			var urlid=getUrlParame('id');
			urlxmnf("jhxdnf",urlid);
			showAll();
		});
		function urlxmnf(id,flag){
			var myDate = new Date();
			var years=[];
			var first;
			years.push({text:'全部',value:''});
			if(flag=='01011404030101'
			){
				//$("#bstext").html('十二五');
				for(var i=0;i<5;i++){
					if(i==0){
						first=myDate.getFullYear()-i;
						if(first>2015)
							first=2015;
						if(first<2010)
							first=2010;
					}
					years.push({text:(2010+5-i),value:(2010+5-i)});
				}
			}
			if(flag=='01011404030201'){
				//$("#bstext").html('十san五');
				for(var i=0;i<5;i++){
					if(i==0){
						first=myDate.getFullYear()-i;
						if(first>2020)
							first=2020;
						if(first<2016)
							first=2016;
					}
					years.push({text:(2015+5-i),value:(2015+5-i)});
				}
			}
			
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#id'+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#id'+record.value).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(""+item.value,values)<0){
								$('#id'+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#id'+item.value).attr('checked', false);
						});
					}
				}
			});
			$('#'+id).combobox("setValue",first+'');
			$('#id'+first).attr('checked', true);
		}
		
		function setjhxdnf(){
			$("#jhxdnf").combotree({    
				checkbox: true,
			    url: '/jxzhpt/xmjzbb/setjhxdnf1.do',    
			    required: false,
			    multiple:true
			});
			
		}
		function showAll(){
			var xmnf=$("#jhxdnf").combotree("getValues");
			if(xmnf==''){
				alert("请选择年份");
				return;
			}
		
			var tbody = $("#wqgzlist");
			tbody.empty();
			var data="flag=&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybnf").combobox('getValue')+"&gcglwqgz.ybyf="+$("#ybyf").combobox('getValue');
			//alert(data);
			$.ajax({
				url:"/jxzhpt/gcybb/getHzgjxj.do",
				data:data,
				type:"post",
				dataType:"JSON",
				success:function(msg){
					
					var tbodystr="";
					if (msg != null) {
						for(var i=0;i<msg.length;i++){
							if(msg[i].v_0!='0'){
								tbodystr+="<tr><td rowspan="+msg[i].v_0+">"+msg[i].xzqh+"</td><td>"
								+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
								+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"+msg[i].v_6+"</td><td>"
								+msg[i].v_7+"</td><td>"+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"
								+msg[i].v_11+"</td><td>"+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
								+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"+msg[i].v_16+"</td><td>"
								+msg[i].v_17+"</td><td>"+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
								+msg[i].v_21+"</td><td>"+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
								+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"+msg[i].v_26+"</td><td>"
								+msg[i].v_27+"</td><td>"+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"
								+msg[i].v_31+"</td><td>"+msg[i].v_32+"</td></tr>";
							}
							else{
								tbodystr+="<tr><td>"+msg[i].v_1+"</td><td>"+msg[i].v_2+"</td><td>"+msg[i].v_3+"</td><td>"
								+msg[i].v_4+"</td><td>"+msg[i].v_5+"</td><td>"+msg[i].v_6+"</td><td>"
								+msg[i].v_7+"</td><td>"+msg[i].v_8+"</td><td>"+msg[i].v_9+"</td><td>"+msg[i].v_10+"</td><td>"
								+msg[i].v_11+"</td><td>"+msg[i].v_12+"</td><td>"+msg[i].v_13+"</td><td>"
								+msg[i].v_14+"</td><td>"+msg[i].v_15+"</td><td>"+msg[i].v_16+"</td><td>"
								+msg[i].v_17+"</td><td>"+msg[i].v_18+"</td><td>"+msg[i].v_19+"</td><td>"+msg[i].v_20+"</td><td>"
								+msg[i].v_21+"</td><td>"+msg[i].v_22+"</td><td>"+msg[i].v_23+"</td><td>"
								+msg[i].v_24+"</td><td>"+msg[i].v_25+"</td><td>"+msg[i].v_26+"</td><td>"
								+msg[i].v_27+"</td><td>"+msg[i].v_28+"</td><td>"+msg[i].v_29+"</td><td>"+msg[i].v_30+"</td><td>"
								+msg[i].v_31+"</td><td>"+msg[i].v_32+"</td></tr>";
							}
						}
					}
					tbody.append(tbodystr);
				}
			});
		}
	function exportWqgzyb(){
		var xmnf=$("#jhxdnf").combotree("getValues");
		if(xmnf==''){
			alert("请选择年份");
			return;
		}
		var data="flag=flag&gcglwqgz.xmnf="+xmnf+"&gcglwqgz.ybnf="+$("#ybnf").combobox('getValue')+"&gcglwqgz.ybyf="+$("#ybyf").combobox('getValue');
		window.location.href="/jxzhpt/gcybb/getHzgjxj.do?"+data;
	}	
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
}
a:active {
 text-decoration: none;
}
#kdtb {
	border-collapse:collapse;
}
#kdtb thead tr td {
	text-align:center; 	
	font-size:1em;
	font-weight:bold;
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
#kdtb tbody tr td {
	text-align:center; 	
	font-size:1em;
/* 	font-weight:bold; */
  	border:1px solid black;
  	padding:3px 7px 2px 7px;
}
-->
</style>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;" >
		<table width="100%" border="0" style="margin-top: 1px; margin-left: 1px;height:100%;" cellspacing="0" cellpadding="0" >
			<tr>
			<div id="righttop"  style="height: 30px">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;中央车购税改建、新建</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99%;height:40px; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>下达年份：</span>
        						<input type="text" id="jhxdnf"  style="width:80px;">
        						<!-- <span>项目类型：</span>
        						<select id="xmlx" style="width:80px;" class='easyui-combobox'>
        							<option value="升级改造">升级改造</option>
        							<option value="路面改造">路面改造</option>
        							<option value="灾毁重建">灾毁重建</option>
        						</select> -->
        						<span>截至进展年份：</span>
        						<input type="text" id="ybnf"  style="width:80px;">
        						<span>截至进展月份：</span>
        						<input type="text" id="ybyf"  style="width:80px;">	
        						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       							<img alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;" onclick="showAll()" />
								 <img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                       onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportWqgzyb()" style="vertical-align: -50%;" />
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">

        						
        					</p>         					
        				</div>
        			</fieldset>
        		</td>
        	</tr>

            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height:400px" >
                	<script type="text/javascript">
                	$("#gddiv").attr('style','width:100%;height:'+($(window).height()-110)+'px');
                	</script>
                		<div  class="easyui-layout" fit="true" >
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id="kdtb" width="6000px" >
								<caption align="top" style="font-size:x-large;font-weight: bolder;">中央车购税改建、新建</caption>
								<thead id="biaotou">
									<tr>
										<td rowspan="3" style="width: 100px;">各设区市</td>
										<td rowspan="3" style="width: 125px;">分项</td>
										<td rowspan="3" style="width: 125px;">计划文号</td>
										<td colspan="14">计划下达情况</td>
										<td colspan="16">计划执行情况</td>
										</tr>
									<tr>
										<td rowspan="1" colspan="7">小计</td>
										<td rowspan="1" colspan="7">资金情况</td>
										<td rowspan="2">本年项目完成数量</td>
										<td rowspan="1" colspan="6">本年完成里程</td>
										<td rowspan="2">累计完成项目数量</td>
										<td rowspan="1" colspan="6">累计完成里程</td>
										<td rowspan="2">本年完成投资(万元)</td>
										<td rowspan="2">累计完成投资(万元)</td>
									</tr>
									<tr>
										<td>项目数量</td>
										<td>计划里程(km)</td>
										<td>其中：国道升一级(km)</td>
										<td>其中：国道升二级(km)</td>
										<td>其中：省道升二级以上(km)</td>
										<td>其中：省道升三级(km)</td>
										<td>其他</td>
										<td>总投资(万元)</td>
										<td>升级改造    中央补助    资金    (万元)</td>
										<td>厅补助资金(万元)</td>
										<td>国債(万元)</td>
										<td>省債(万元)</td>
										<td>各地市统筹资金(万元)</td>
										<td>其他资金(万元)</td>
										<td>小计</td>
										<td>国道升一级(km)</td>
										<td>国道升二级(km)</td>
										<td>省道升二级以上(km)</td>
										<td>省道升三级(km)</td>
										<td>其他</td>
										<td>小计</td>
										<td>国道升一级(km)</td>
										<td>国道升二级(km)</td>
										<td>省道升二级以上(km)</td>
										<td>省道升三级(km)</td>
										<td>其他</td>
									</tr>
									<tr>
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
										<td>12</td>
										<td>13</td>
										<td>14</td>
										<td>15</td>
										<td>16</td>
										<td>17</td>
										<td>18</td>
										<td>19</td>
										<td>20</td>
										<td>21</td>
										<td>22</td>
										<td>23</td>
										<td>24</td>
										<td>25</td>
										<td>26</td>
										<td>27</td>
										<td>28</td>
										<td>29</td>
										<td>30</td>
										<td>31</td>
										<td>32</td>
										<td>33</td>
									</tr>
								</thead>
								<tbody id="wqgzlist">
									</tbody>	
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