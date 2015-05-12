<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>行政区划统计趋势分析</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/tjfx/js/jcktj.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jscharts.plug.mb.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/widget/anyChart/js/AnyChart.js"></script>
	<script type="text/javascript">
		$(function(){
			sbnf('endYear');
			$('#endYear').combobox("setValue",new Date().getFullYear());
			sbnf('startYear');
			$('#startYear').combobox("setValue",$('#endYear').combobox('getValue')-10);
			search();
		});
		function search(){
			load();
			queryTjt2();
		}
		function load(){
			var colYears =[],colZj=[];
			var col=[];
			var trJson='{"xzqh":null';//每一行的Json数据的字符串，在下面转为JSON数据并添加入databox中
			for (var i=$('#startYear').combobox("getValue");i<=$('#endYear').combobox('getValue');i++){
				trJson+=',"'+i+'xmzj":0'+',"'+i+'je":0'+',"'+i+'xmcgs":0'+',"'+i+'xmstz":0';
				var year ={title:i+'年',width:160,align:'center',colspan:4};
				colYears.push(year);
				var lczj={field:i+'je',title:'金额总计(万元)',width:90,align:'center'};
				colZj.push(lczj);
				var xmzycgs={field:i+'xmcgs',title:'车购税(万元)',width:80,align:'center'};
				colZj.push(xmzycgs);
				var xmzystz={field:i+'xmstz',title:'省投资(万元)',width:80,align:'center'};
				colZj.push(xmzystz);
				var xmgs={field:i+'xmzj',title:'项目总计(个)',width:80,align:'center'};
				colZj.push(xmgs);
				col[i+'je']=i;
				col[i+'xmzj']=i+"万元";
			}
			trJson+='}';
			var dataJson=new Array();
			$.ajax({
				type:'post',
				async : false,
				url:'../../../jhgl/queryChildXzqh.do',
				data:'xzqh.id=36__00',
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						var a=JSON.parse(trJson);
						var xzqhdm = item.id=="360000" ? item.id.substr(0,2) : item.id.substr(0,4);
						a['xzqh']=item.name;
						queryMessage($('#startYear').combobox('getValue'),$('#endYear').combobox('getValue'),xzqhdm,a);
						dataJson.push(a);
					});
				}
			});
			var zjtitle={title:'各年份项目金额和数量统计',colspan:colYears.length*4,width:900};
			var grid={id:'grid',data:dataJson,fitColumns:false,singleSelect:true,pagination:false,rownumbers:false,
					pageNumber:1,pageSize:20,height:380,width:$('#grid').width(),
				    columns:[
					    [
					     	{field:'xzqh',title:'行政区划',width:80,align:'center',rowspan:3,fixed:true},
					     	zjtitle
					    ],
					    colYears,colZj
				    ]
			};
			gridBind(grid);
		}
		function queryMessage(start,end,xzqhdm,a){
			$.ajax({
				type:'post',
				url:'../../../tjfx/queryJhktj2.do',
				async : false,
				data:'xzqhdm='+xzqhdm+'&nf='+start+'&end='+end,
				dataType:'json',
				success:function(data){
					$.each(data.gcgj,function(index,item){
						a[item.id+'xmzj']=parseInt(a[item.id+'xmzj'])+parseInt(item.bmid);
						a[item.id+'je']=parseFloat(a[item.id+'je'])+parseFloat(item.text);
						a[item.id+'xmcgs']=parseFloat(a[item.id+'xmcgs'])+parseFloat(item.name);
						a[item.id+'xmstz']=parseFloat(a[item.id+'xmstz'])+parseFloat(item.parent);
					});
				}
			});
		}
		function queryTjt2(){
			barChart_1= new AnyChart("/jxzhpt/widget/anyChart/swf/AnyChart.swf");    
		    barChart_1.width =980;
		    barChart_1.height =500;
		    barChart_1.padding =0;
		    barChart_1.wMode="transparent";
		    barChart_1.write("anychart_div");
		    $.ajax({
				type:"post",
				url:"../../../tjfx/queryJhktjt2.do?xzqhdm=36__00&nf="+$('#startYear').combobox('getValue')+"&end="+$('#endYear').combobox('getValue'),
				dataType:'text',
				success:function(msg){
					//var right=window.parent.window.document.getElementById("rightContent").contentWindow;
					barChart_1.setData(msg);
				}
			});
		}
		function sbnf(id){
			var myDate = new Date();
			var years=[];
			var first;
			for(var i=0;i<=10;i++){
				if(i==0)
					first=myDate.getFullYear()-i;
				years.push({text:(myDate.getFullYear()-i)});
			}
			$('#'+id).combobox({    
			    data:years,
			    valueField:'text',    
			    textField:'text'   
			});
			$('#'+id).combobox("setValue",first);
		}
	</script>
</head>
<body>
	<div style="text-align: left; font-size: 12px; margin: 0px;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			<tr>
				<td>
	                <div id="righttop">
						<div id="p_top">统计分析>&nbsp;计划库统计分析>&nbsp;行政区划统计趋势分析</div>
					</div>
	            </td>
        	</tr>
        	<tr>
        		<td style="padding-left: 8px;padding-right: 8px;padding-top: 8px;">
        			<fieldset style="width:99%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        					<p style="margin:8px 0px 8px 20px;vertical-align:middle;">
        						开始年份
        						<select id="startYear" style="width:70px;">
        							<option value="2011" selected="selected">2011年</option>
        							<option value="2012">2012年</option>
        							<option value="2013">2013年</option>
        							<option value="2014">2014年</option>
        							<option value="2015">2015年</option>
        						</select>
        						结束年份
        						<select id="endYear" style="width:70px">
        							<option value="2011">2011年</option>
        							<option value="2012">2012年</option>
        							<option value="2013">2013年</option>
        							<option value="2014">2014年</option>
        							<option value="2015" selected="selected">2015年</option>
        						</select>
        						<img onclick="search()" alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" style="vertical-align:middle;"/>
        					</p>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div style="width:99%;">
            			<table id="grid" width="100%"></table>
            		</div>
            	</td>
        	</tr>
        	<tr>
        		<td>
	        		<div style="margin-left: 10px;margin-top: 10px;">
	        			<div style="">
	        				<img alt="" src="${pageContext.request.contextPath}/images/jt.jpg">项目信息分布
	        			</div>
	        			<div style="height: 500px;border: 1px #C0C0C0 solid;text-align: center;width:98%;">
	        				<div id="anychart_div" style="width:97%;height:300px;margin:10px;"> 
								<div>
									<param name="wmode" value="transparent" />
								</div>
							</div>
	        			</div>
	        		</div>
        		</td>
        	</tr>
		</table>
	</div>
</body>
</html>