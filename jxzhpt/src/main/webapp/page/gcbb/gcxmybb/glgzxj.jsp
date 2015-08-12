<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/css/searchAndNavigation.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<style>
		#p_top{height:33px;line-height:33px;letter-spacing:1px;text-indent:18px;background:url(${pageContext.request.contextPath}/images/jianjiao.png) 8px 0 no-repeat;}
		#righttop{height:33px;background:url(${pageContext.request.contextPath}/images/righttopbg.gif) 0 0 repeat-x;}
	</style>
	<style type="text/css">
		<!--
		a:link {text-decoration: none;}
		a:visited {text-decoration: none;}
		a:hover {text-decoration: none;}
		a:active {text-decoration: none;}
		#bbtable {border-collapse:collapse;}
		#bbtable thead tr td {text-align:center;font-size:1em;font-weight:bold;border:1px solid black;padding:3px 7px 2px 7px;}
		#bbtable tbody tr td {text-align:center;font-size:1em;border:1px solid black;padding:3px 7px 2px 7px;}
		-->
	</style>
	<script type="text/javascript">
		$(function(){
			var myDate = new Date();
			loadUnit1("gydw",$.cookie("unit"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('xzdj','公路等级');
			var y = myDate.getFullYear();
			var m = myDate.getMonth()+1; 
			for(var x=y;x>=y-10;x--){
				$("#ddlYear").append("<option value="+x+">"+x+"</option>");
				$("#ddlYear1").append("<option value="+x+">"+x+"</option>");
			}
			$('#ddlMonth').val(m);
			search();
		});
		function search(){
			$('#tbody_gcgj').empty();
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
	 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}
		var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}

			var xmbb = 'flag=""&xmbb.ybny='+$('#ddlYear').val()+"-"+$('#ddlMonth').val()+'&xmbb.sbnf='+$('#ddlYear1').val()+
			'&xmbb.tiaojian='+$('#xzdj').combotree('getValue')+"&xmbb.xzqh="+xzqhstr+"&xmbb.gydw="+gydwstr+"&xmbb.xmmc="+$('#xmmc').val()+"&xmbb.lxmc="+$('#lxmc').val();
			$.ajax({
				type:'post',
				url:'/jxzhpt/gcbb/selGcbb5.do',
				dataType:'json',
				data:xmbb,
				success:function(data){
					$.each(data,function(index,item){
						var tr="<tr style='height:20px;'>";
						tr+="<td>"+item.jsdd+"</td>";
						//bmmc:项目名称【路线编码(起点-止点)】
						//yjsdj:原技术等级;xmlc:项目里程
						var bmmc=item.xmmc+'【'+item.lxbm+'】',yjsdj=item.yjsdj,xmlc=item.yhlc;
						tr+="<td>"+bmmc+"</td>";
						tr+="<td>"+item.qdzh+"</td>";
						tr+="<td>"+item.zdzh+"</td>";
						tr+="<td>"+yjsdj+"</td>";
						tr+="<td>"+item.jsjsbz+"</td>";
						tr+="<td>"+xmlc+"</td>";
						tr+="<td>"+item.pfztz+"</td>";
						tr+="<td>"+item.cgs+"</td>";
						tr+="<td>"+item.dfpt+"</td>";
						var zj="0",wg="0",wkg="0";
						if(item.kgzt=="0"){
							wkg="1";
						}else if(item.kgzt=="1" && item.jgzt=="0"){
							zj="1";
						}else if(item.kgzt=="1" && item.jgzt=="1"){
							wg="0";
						}
						tr+="<td>"+zj+"</td>";
						tr+="<td>"+wg+"</td>";
						tr+="<td>"+wkg+"</td>";
						tr+="<td>"+item.kgsj+"</td>";
						tr+="<td>"+item.jgsj+"</td>";
						tr+="<td>"+item.bndsslc+"</td>";
						tr+="<td>"+item.bndjhtz+"</td>";
						tr+="<td>"+item.bnzycgs+"</td>";
						tr+="<td>"+item.bnwctz+"</td>";
						tr+="<td>"+item.bnzycgs1+"</td>";
						tr+="<td>"+item.bndfpt+"</td>";
						tr+="<td>"+item.bnyhdk+"</td>";
						tr+="<td>"+item.jsjsbz+"</td>";
						tr+="<td>"+item.bnqtzj+"</td>";
						tr+="<td>"+item.bnwctz+"</td>";
						var a = Number(item.bnwctz)==0 ? "0" : Number(Number(item.bnwctz)/Number(item.bnwctz)*100).toFixed(2);
						tr+="<td>"+a+"</td>";
						tr+="<td>"+item.bnwcgzl+"</td>";
						tr+="<td>"+item.bngzl1+"</td>";
						tr+="<td>"+item.bngzl2+"</td>";
						tr+="<td>"+item.bngzl3+"</td>";
						tr+="<td>"+item.bngzl4+"</td>";
						tr+="<td>"+item.bnlqlmwcqk+"</td>";
						tr+="<td>"+item.bnsnlmwcqk+"</td>";
						tr+="<td>"+item.ssdctc+"</td>";
						tr+="<td>"+item.zjwctz+"</td>";
						tr+="<td>"+item.zjwcgzl+"</td>";
						tr+="<td>"+item.zjgzl1+"</td>";
						tr+="<td>"+item.zjgzl2+"</td>";
						tr+="<td>"+item.zjgzl3+"</td>";
						tr+="<td>"+item.zjgzl4+"</td>";
						tr+="<td>"+item.zjlqlmwcqk+"</td>";
						tr+="<td>"+item.zjsnlmwcqk+"</td>";
						tr+="<td>"+item.ssdctc+"</td>";
						tr+="<td>"+(Number(xmlc)-Number(item.zjwcgzl)).toFixed(3)+"</td>";
						tr+="</tr>";
						$('#tbody_gcgj').append(tr);
					});
				},
				error:function(e){
					alert("系统错误！");
				}
			});
		}
		function exportExcel(){
			var gydw=$("#gydw").combotree("getValues");
			if(gydw.length==0){
				if($.cookie("unit2")=='_____36')
					gydwstr=36;
				else gydwstr= $.cookie("unit2");
			}else if(gydw.length==1){
				if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
	 		if(gydw[0].substr(gydw[0].length-2,gydw[0].length)=="00") gydw[0]=gydw[0].substr(0,gydw[0].length-2);
				gydwstr=gydw[0] ;
			}else{
				gydwstr= gydw.join(',');
			}
		var xzqhdm=$("#xzqh").combotree("getValues");
			if(xzqhdm.length==0){
				xzqhstr= $.cookie("dist2");
				
			}else if(xzqhdm.length==1){
				if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		if(xzqhdm[0].substr(xzqhdm[0].length-2,xzqhdm[0].length)=="00") xzqhdm[0]=xzqhdm[0].substr(0,xzqhdm[0].length-2);
	 		xzqhstr=xzqhdm[0] ;
			}else{
				xzqhstr= xzqhdm.join(',');
			}

			var data = 'flag=flag&xmbb.ybny='+$('#ddlYear').val()+"-"+$('#ddlMonth').val()+'&xmbb.sbnf='+$('#ddlYear1').val()+
			'&xmbb.tiaojian='+$('#xzdj').combotree('getValue')+"&xmbb.xmmc="+$('#xmmc').val()+"&xmbb.lxmc="+$('#lxmc').val();
			$.post('/jxzhpt/gcbb/exportbbsj_set.do',{gydw:gydwstr,xzqh:xzqhstr},function(){
				window.location.href='/jxzhpt/gcbb/selGcbb5.do?'+data;
			 });
		}
	</script>
</head>
<body style="padding-right:1px">
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
					<div id="righttop">
						<div id="p_top">当前位置>&nbsp;工程报表>&nbsp;工程项目月报表>&nbsp;公路改造工程新上、续建工程项目完成情况明细表</div>
					</div>
        	</tr>
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;">
        			<fieldset style="width:99.9%; text-align: left; vertical-align: middle;margin: 8px 0px 0px 0px;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>管养单位：</span>
        						<select id="gydw" style="width:150px;"></select>
        						<span>月报年份：</span>
		 						<select name="ddlYear" id="ddlYear" style="width: 80px;">
								</select>
		 						<span>月报月份：</span>
		 						<select name="ddlMonth" id="ddlMonth" style="width: 60px;">
									<option id="yf1" value="1">01</option>
									<option id="yf2" value="2">02</option>
									<option id="yf3" value="3">03</option>
									<option id="yf4" value="4">04</option>
									<option id="yf5" value="5">05</option>
									<option id="yf6" value="6">06</option>
									<option id="yf7" value="7">07</option>
									<option id="yf8" value="8">08</option>
									<option id="yf9" value="9">09</option>
									<option id="yf10" value="10">10</option>
									<option id="yf11" value="11">11</option>
									<option id="yf12" value="12">12</option>
								</select>
		        				<span>项目名称：</span>
		        				<input id="xmmc" type="text"  style="width: 100px">
		        				<img onclick="search()" alt="查询" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif' "  style="border-width:0px;cursor: hand;vertical-align: -50%;"/>
        					</p>
        					<p style="margin: 8px 0px 8px 20px;">
        						<span>行政区划：</span>
        						<select id="xzqh" style="width:150px;"></select>
        						<span>项目年份：</span>
        						<select  id="ddlYear1" style="width: 80px;"></select>
        						<span>行政等级：</span>
        						<select id="xzdj" class="easyui-combobox" style="width:60px;">
        						</select>
        						<span>路线编码：</span>
        						<input id="lxmc" type="text"  style="width: 100px">
								<img alt="导出Ecel" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"
                                	onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif' " onclick="exportExcel()" style="vertical-align: -50%;" />
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
            <tr>
            	<td style="padding-top: 10px;padding-left:10px;padding-right:10px;">
                	<div id="gddiv" style="width:100%;height: 400px;" >
                		<script type="text/javascript">
                			$("#gddiv").attr('style','width:100%;height:'+($(window).height()-150)+'px;');
                		</script>
                		<div class="easyui-layout"  fit="true">
							<div data-options="region:'center',border:false" style="overflow:auto;">
							<table id='bbtable' width="4000px">
								<caption align="top" style="font-size:x-large;font-weight: bolder;"> 江西省2015年公路路网结构改造工程统计月报表（三）    灾害防治 </caption>
								<thead>
									<tr>
										<td colspan="15">一、 项 目 计 划</td>
										<td colspan="19">二、 本年元月至本月完成情况</td>
										<td colspan="16">四、 自开工至本月底累计完成情况</td>
									</tr>
									<tr>
										<td rowspan="3"  style="width: 125px;">项目所在县市</td>
										<td rowspan="3" style="width: 125px;">路线编码、项目名称</td>
										<td rowspan="3" style="width: 125px;">起点桩号</td>
										<td rowspan="3" style="width: 125px;">讫点桩号</td>
										<td rowspan="3" style="width: 125px;">原技术等级</td>
										<td rowspan="3" style="width: 125px;">建设技术标准</td>
										<td rowspan="3" style="width: 125px;">项目里程<br>（公里）</td>
										<td rowspan="3" style="width: 125px;">总投资<br>（万元）</td>
										<td rowspan="3" style="width: 125px;">中央车购税<br>（万元）</td>
										<td rowspan="3" style="width: 125px;">地方配套<br>（万元）</td>
										<td rowspan="3" style="width: 125px;">项目在建个数<br>（个）</td>										
										<td rowspan="3" style="width: 125px;">项目完工个数<br>（个）</td>
										<td rowspan="3" style="width: 125px;">项目未开工个数<br>（个）</td>
										<td rowspan="3" style="width: 125px;">开工时间</td>
										<td rowspan="3" style="width: 125px;">竣工时间</td>
										<td rowspan="3" style="width: 125px;">本年实施里程<br>(公里)</td>
										<td colspan="2">本年计划投资</td>
										<td colspan="6">累计资金到位<br>（万 元）</td>
										<td rowspan="3" style="width: 125px;">项目完成投资<br>(万元)</td>
										<td rowspan="3" style="width: 125px;">占投资比例<br>（%)</td>
										<td colspan="8">完 成 工 程 量<br>（公里)</td>
										<td rowspan="3" style="width: 125px;">项目完成投资<br>（万元）</td>
										<td colspan="8">累 计 完 成 工 程 量 <br>（ 公 里 )</td>
										<td rowspan="3" style="width: 125px;">项目未完工程量<br>（公里）</td>
									</tr>	
									<tr>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td rowspan="2" style="width: 125px;">其中：<br>中央车购税</td>
										<td rowspan="2" style="width: 125px;">合计</td>
										<td rowspan="2" style="width: 125px;">中央车购税</td>
										<td colspan="2">地方配套</td>
										<td rowspan="2" style="width: 125px;">省厅贴息<br>(贷款)</td>
										<td rowspan="2" style="width: 125px;">其他资金</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2" style="width: 125px;">砂石垫层通车</td>
										<td colspan="5">按技术等级</td>
										<td colspan="2">按路面类型</td>
										<td rowspan="2" style="width: 125px;">砂石垫层通车</td>
									</tr>
									<tr>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">其中：银行贷款</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">一级</td>
										<td style="width: 100px;">二级</td>
										<td style="width: 100px;">三级</td>
										<td style="width: 100px;">四级</td>
										<td style="width: 100px;">沥青路</td>
										<td style="width: 100px;">水泥砼</td>
										<td style="width: 100px;">小计</td>
										<td style="width: 100px;">一级</td>
										<td style="width: 100px;">二级</td>
										<td style="width: 100px;">三级</td>
										<td style="width: 100px;">四级</td>
										<td style="width: 100px;">沥青路</td>
										<td style="width: 100px;">水泥砼</td>
									</tr>
								</thead>
								<tbody id="tbody_gcgj"></tbody>
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
