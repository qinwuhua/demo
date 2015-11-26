<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>危桥改造项目</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/plan_wqgz.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/page/jhgl/js/loadTask.js"></script>
	<script type="text/javascript">
		$(function(){
			sbnf("sbnf");
			loadUnit1("gydw",$.cookie("unit")); 
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm2('ddlPDDJ','技术等级');
			loadBmbm2('ddlGldj','公路等级');
			tsdq('tsdq');
			var jh={jhnf:$('#sbnf').combobox('getValue'),sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh')};
			querySumWqgz(jh,lx);
			
			//querySumWqgz(jh,lx);
			if($.cookie("unit2").length==7 || $.cookie("unit2").length==2){
				$('#imglrjh').show();
			}
			wqxm1(jh,lx);
		});
		function searchWqgz(){
			var jh={jhnf:null,sbzt:null,spzt:null,sfylsjl:$('#sfylsjl').combo("getValue")};
			var lx={gydwbm:getgydw("gydw"),xzqhdm:getxzqhdm('xzqh'),lxmc:null,lxjsdj:null,lxbm:null,qlmc:null,qlbh:null,akjfl:null};
			if($('#txtRoad').val()!=""){
				lx.lxmc=$('#txtRoad').val();
			}
			if($('#txtBridge').val()!=''){
				lx.qlmc=$('#txtBridge').val();
			}
			if($('#txtqlbm').val()!=''){
				lx.qlbh=$('#txtqlbm').val();
			}
			if($('#sbnf').combobox('getText')!=""){
				jh.jhnf=$('#sbnf').combobox('getValue');
			}
			if($('#ddlSHZT').combo("getValue")!="" && $('#ddlSHZT').combo("getValue")!='全部'){
				var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
				var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
				var xian=true;
				if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit"))){
					xian=false;
				}
				if($('#ddlSHZT').combo("getValue")=="未上报"){
					if(xian){
						jh.jh_sbthcd=0;
					}else{
						jh.jh_sbthcd=2;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="已上报"){
					if(xian){
						jh.jh_sbthcd=2;
					}else{
						jh.jh_sbthcd=4;
					}
				}
				if($('#ddlSHZT').combo("getValue")=="未审核"){
					jh.jh_sbthcd=4;
				}
				if($('#ddlSHZT').combo("getValue")=="已审核"){
					jh.jh_sbthcd=6;
				}
			}
			if($('#ddlPDDJ').combobox('getText')!="全部"){
				lx.lxjsdj=$('#ddlPDDJ').combobox('getValue');
			}
			if($('#ddlGldj').combobox('getText')!='全部'){
				lx.lxbm=$('#ddlGldj').combobox('getValue');
			}
			if($('#ddlAKJFL').combobox('getText')!="全部"){
				lx.akjfl=$('#ddlAKJFL').combobox('getValue');
			}
			wqxm1(jh,lx);
			querySumWqgz(jh,lx);
		}
		$(window).resize(function () { 
			$('#grid').datagrid('resize'); 
		});
		
		
		function wqxm1(jh,lx){
			var params={"jh.sbzt":jh.sbzt,"jh.spzt":jh.spzt,"jh.sbnf":jh.jhnf,"jh.jhkgsj":jh.jhkgsj,
					'jh.sfylsjl':jh.sfylsjl,'jh.jh_sbthcd':jh.jh_sbthcd,
					"lx.gydwbm":lx.gydwbm,"lx.xzqhdm":lx.xzqhdm,"lx.lxmc":lx.lxmc,
					"lx.lxbm":lx.lxbm,"lx.qlmc":lx.qlmc,"lx.qlbh":lx.qlbh,"lx.akjfl":lx.akjfl};
			
			queryParams='&jh.sbzt='+jh.sbzt+'&jh.spzt='+jh.spzt+'&jh.sbnf='+jh.sbnf+'&lx.gydwbm='+lx.gydwbm+
			'&lx.xzqhdm='+lx.xzqhdm+'&lx.lxmc='+lx.lxmc+"&lx.lxbm"+lx.lxbm+"&lx.lxbm"+lx.lxbm+"&lx.qlmc"+lx.qlmc+"&lx.akjfl"+lx.akjfl;
			var grid={id:'grid',url:'../../../jhgl/queryWqgzList.do',pagination:true,rownumbers:false,
				    pageNumber:1,pageSize:10,height:$(window).height()-180,width:$('#searchField').width(),queryParams:params,
				    columns:[[
				        {field:'ck',checkbox:true},
				        {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
				        	var result='<a href="javascript:locationQl('+"'"+row.jckwqgz.qlbh+"',"+"'"+row.jckwqgz.qlzxzh+"'"+')" style="text-decoration:none;color:#3399CC;">定位</a>    ';
				        	result+='<a href="javascript:openWindow('+"'"+row.id+"'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
				        	
				        	return result;
				        }},
				       
				        {field:'sfylsjl',title:'是否有修建记录',width:80,align:'center',formatter:function(value,row,index){
				        	if(row.sfylsjl=='无')
				        		return '无';
				        	else if(row.sfylsjl=='有')
				        		return '有';
				        }},
				        {field:'sbnf',title:'上报年份',width:80,align:'center'},
				        {field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
				        {field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
				        {field:'gydw',title:'管养单位',width:150,align:'center',
				        	formatter:function(value, row, index){
				        		return row.jckwqgz.gydw;
				        	}
				        },
				        {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
				        	formatter:function(value, row, index){
				        		return row.jckwqgz.xzqhmc;
				        	}
				        },
				        {field:'lxbm',title:'路线编码',width:80,align:'center',
				        	formatter:function(value,row,index){
					        	return row.jckwqgz.lxbm;
				        	}
				        },
				        {field:'lxmc',title:'路线名称',width:80,align:'center',
				        	formatter:function(value,row,index){
					        	return row.jckwqgz.lxmc;
				        	}
				        },
				        {field:'qlbm',title:'桥梁编码',width:60,align:'center',
				        	formatter:function(value,row,index){
					        	return row.jckwqgz.qlbh;
				        	}
				       },
				        {field:'qlmc',title:'桥梁名称',width:60,align:'center',
				    	   formatter:function(value,row,index){
					        	return row.jckwqgz.qlmc;
				        	}
				    	},
				        {field:'pfztz',title:'批复总投资',width:80,align:'center'}
				    ]],
				    onClickRow:function(rowIndex,rowDate){
						if(oldIndex!=-1){
							gridObj.datagrid("unselectRow",oldIndex);
						}
						selRow.push(rowIndex);
						gridObj.datagrid("selectRow",rowIndex);
						oldIndex=rowIndex;
					},
					onLoadSuccess:function(data){
						querySumWqgz(jh,lx);
					}
			};
			gridBind(grid);
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
	<div id="righttop">
		<div id="p_top">计划管理>&nbsp;项目计划库管理>&nbsp;危桥改造项目</div>
	</div>
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left: 10px; padding-right: 10px;padding-top: 10px;">
        			<fieldset id="searchField" style="width:100%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:7px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
					<tr height="32">
        						<td>管养单位：</td>
        						<td  colspan="3" style="width:220px;"><select id="gydw" style="width:220px;"></select></td>
        						<td>行政区划：</td>
        						<td  colspan="3" style="width:230px;"><select id="xzqh" style="width:230px;"></select></td>
        						<td>路线名称：</td>
        						<td><input name="txtRoad" type="text" id="txtRoad" style="width:90px;" /></td>
        						<td>桥梁名称：</td>
        						<td><input name="txtBridge" type="text" id="txtBridge" style="width:90px;" /></td>
        					</tr>
        					<tr height="32">
        						<td>上报年份：</td>
        						<td><select id="sbnf" style="width: 80px;"></select></td>
        						<td>计划状态：</td>
        						<td><select name="ddlSHZT" id="ddlSHZT" style="width:70px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="未上报">未上报</option>
									<option value="已上报">已上报</option>
									<option value="未审核">未审核</option>
									<option value="已审核">已审核</option>
								</select></td>
								<td>特殊地区：</td>
								<td><select name="tsdq" id="tsdq" style="width:80px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="2FCE5964394642BAA014CBD9E3829F84">丘陵</option>
									<option value="82C37FE603D54C969D86BAB42D7CABE0">河流</option>
									<option value="ACDB9299F81642E3B2F0526F70492823">罗霄山山脉</option>
									<option value="AEF17CEA8582409CBDA7E7356D9C93B0">盆地</option>
									<option value="FEE9AE40475863D6E040007F010045D7">cs</option>
									<option value="517e0f37-12cd-4de9-a452-6aca259457c1">csss</option>
								</select></td>
								<td>技术等级：</td>
								<td><select name="ddlPDDJ" id="ddlPDDJ" style="width:65px;" class="easyui-combobox">
								</select></td>
								<td>公路等级：</td>
								<td><select name="ddlGldj" id="ddlGldj" style="width:94px;" class="easyui-combobox">
								</select></td>
								<td>跨径分类：</td>
        						<td><select name="ddlAKJFL" id="ddlAKJFL" style="width:94px;" class="easyui-combobox">
									<option selected="selected" value="">全部</option>
									<option value="特大桥">特大桥</option>
									<option value="大桥">大桥</option>
									<option value="中桥">中桥</option>
									<option value="小桥">小桥</option>
								</select></td>
        					</tr>
								<tr height="32">
                              <td colspan="10">
								<span>是否有补助历史：</span>
								<select name="sfylsjl" id="sfylsjl" class="easyui-combobox" style="width:104px;">
									<option value="" selected="selected">全部</option>
									<option value="无">否</option>
									<option value="是">是</option>
								</select>
								<span>桥梁编码：</span>
        						<input name="txtRoad" type="text" id="txtqlbm" style="width:80px;" />
								<img alt="搜索" src="${pageContext.request.contextPath}/images/Button/Serch01.gif" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/Serch02.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/Serch01.gif'" onclick="searchWqgz()" style="vertical-align:middle;"/>
<%-- 								<img alt="导出模版" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/DC2.gif'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/DC1.gif'" src="${pageContext.request.contextPath}/images/Button/DC1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportModule('Plan_Bridge')"/> --%>
<%-- 								<img alt="导入" src="${pageContext.request.contextPath}/images/Button/dreclLeave.GIF" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dreclClick.GIF'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dreclLeave.GIF'" onclick="importData_jh('wqgz_jh')" style="vertical-align:middle;"/> --%>
<%-- 				                <img onclick="dropWqgzs()" alt="删除" src="${pageContext.request.contextPath}/images/Button/delete1.jpg" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/delete2.jpg'" onmouseout="this.src='${pageContext.request.contextPath}/images/Button/delete1.jpg'" style="vertical-align:middle;"> --%>
				                <img alt="导出Excel" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/dcecl2.gif'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/dcecl1.gif'" src="${pageContext.request.contextPath}/images/Button/dcecl1.gif" style="border-width:0px;cursor: hand;vertical-align:middle;" onclick="exportExcel('wqgz')"/>
								<!-- <img id="imglrjh" alt="列入计划" onmouseover="this.src='${pageContext.request.contextPath}/images/Button/lrjh_2.png'"  onmouseout="this.src='${pageContext.request.contextPath}/images/Button/lrjh_1.png'" src="${pageContext.request.contextPath}/images/Button/lrjh_1.png" style="border-width:0px;cursor: hand;vertical-align:middle;display: none;"  onclick="showLrjh('lrjh_wq.jsp','1100','500');"/> -->
							</td>
                            </tr></table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	<tr style="margin: 0px;">
        		<td style="text-align: left; padding:8px 0px 5px 20px; font-size: 12px;">
        			共有【&nbsp;<span id="lblCount" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】个危桥改造项目，
        			批复总投资【&nbsp;<span id="lblZTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			其中部投资【&nbsp;<span id="lblBTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元，
        			地方投资【&nbsp;<span id="lblDFTZ" style="font-weight: bold; color: #FF0000">0</span>&nbsp;】万元。
        		</td>
        	</tr>
        	<tr>
            	<td style="padding-left: 10px;padding-top:5px; font-size:12px;">
            		<div>
            			<table id="grid" ></table>
            		</div>
            	</td>
        	</tr>
		</table>
	
	<div id="wqgz_xx" style="text-align: left;font-size: 12px;width:80%;"></div>
	<div id="wqgz_add" style="text-align: left;font-size: 12px;width:80%;"></div>
</body>
</html>