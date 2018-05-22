<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>通自然村</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/uploader/swfobject.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploader/jquery.uploadify.v2.1.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgcore.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/widget/newlhgdialog/lhgdialog.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>

	<script type="text/javascript">
		var anqxstr="";
		$(function(){
			anqxstr=getxqxbyid(getUrlParame("id"));
			loadDist1("xzqh",$.cookie("dist"));
			loadBmbm3('xmnf','项目年份',new Date().getFullYear());
			//loadBmbm3('gcfl','养护大中修工程分类');
			loadUnit1("gydw",$.cookie("unit"));
			loadjhxdwh("jhxdwh",'nc_tzrc');
			loadBmbm3('shzt','审核状态');
			loadBmbm3('ssbzt','上报状态');
			loadBmbm3('xsbzt','上报状态');
			loadBmbm3('sfqbbf','是否全部拨付');
			loadBmbm3('knw','库内外');
			if($.cookie('unit2').length==11){
				$("td[name='xian']").show();
				$("td[name='shi']").hide();
				$("td[name='sheng']").hide();
				$("a[name='sheng']").hide();
				$("a[name='xian']").show();
				$("a[name='shi']").hide();
				if(anqxstr.indexOf("上报")!=-1){
					$("a[name='xian']").show();
				}else{
					$("a[name='xian']").hide();
				}
				
				
			}
			if($.cookie('unit2').length==9){
				$("td[name='shi']").show();
				$("td[name='xian']").hide();
				$("td[name='sheng']").hide();
				$("a[name='sheng']").hide();
				$("a[name='xian']").hide();
				$("a[name='shi']").show();
				if(anqxstr.indexOf("上报")!=-1){
					$("a[name='shi']").show();
				}else{
					$("a[name='shi']").hide();
				}
				//导入功能开放
				$("#mybuttion3").show();
				$("#mybuttion4").show();
				
			}
			if($.cookie('unit2').length==7){
				$("a[name='sheng']").show();
				$("td[name='sheng']").show();
				$("td[name='xian']").hide();
				$("td[name='shi']").hide();
				$("a[name='xian']").hide();
				$("a[name='shi']").hide();
				if(anqxstr.indexOf("审核")!=-1){
					$("a[name='sheng']").show();
				}else{
					$("a[name='sheng']").hide();
				}
			}
			//YMLib.Var.jdbs=2;
			queryXmlist();
			
			
		});
		function queryXmlist(){
			
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
			var jsxz="通自然村";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);
			var sfqbbf=$("#sfqbbf").combobox("getValues").join(",");
			if(sfqbbf.substr(0,1)==',')
				sfqbbf=sfqbbf.substr(1,sfqbbf.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':getValuesById("knw"),
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':gydwstr,'xmjbxx.sfqbbf':sfqbbf
			};
	
			loadTj();
			
			$('#grid').datagrid({    
			    url:'/jxcsxm/zjbf/queryXmlist.do',
			    striped:true,
			    pagination:true,
			    rownumbers:true,
			    pageNumber:1,
			    pageSize:10,
			    checkOnSelect:true,
			    height:$(window).height()-190,
			    width:$('#searchField').width()+2,
			    queryParams: params,
			    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
							{field:'cz',title:'操作',width:130,align:'center',
								formatter: function(value,row,index){
									var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','nc_tzrc','zjbf'"+')" >项目详情</a>&nbsp;';
									result+='<a style="color:#3399CC;" href="javascript:openZjbf('+"'"+row.xmbm+"','"+row.gydwdm+"','nc_tzrc'"+')" >拨付详情</a>';	
									return result;
								}
							},
							{field:'xmnf',title:'项目年份',width:60,align:'center'},
							{field:'xmmc',title:'项目名称',width:250,align:'center'},
							{field:'gydw',title:'管养单位',width:180,align:'center'},
							{field:'xzqh',title:'行政区划',width:100,align:'center'},
							{field:'ztz',title:'总投资',width:110,align:'center'},
							{field:'jhxdwh',title:'计划下达文号',width:270,align:'center'}
			    ]],
			    rowStyler:function(index,row){
			    	if($.cookie('unit2').length==11){
					if (row.xsbzt>0 ){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==9){
						if (row.ssbzt>0 && row.xsbzt==0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	if($.cookie('unit2').length==7){
						if (row.shzt>0 && row.ssbzt==0){
						return 'background-color:pink;color:black;font-weight:bold;';
					}}
			    	
			    	
				}
			}); 
		}
		
		
		function loadTj(){
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
			var jsxz="通自然村";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var sfqbbf=$("#sfqbbf").combobox("getValues").join(",");
			if(sfqbbf.substr(0,1)==',')
				sfqbbf=sfqbbf.substr(1,sfqbbf.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':getValuesById("knw"),
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':gydwstr,'xmjbxx.sfqbbf':sfqbbf
			};
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjbf/getbfTjAll.do',
				data:params,
				dataType:'json',
				success:function(msg){
					$("#xmsl").html(msg.xmsl);
					$("#xdzbz").html(msg.xdzbz);$("#xdbb").html(msg.xdbb);$("#xdsb").html(msg.xdsb);$("#xddf").html(msg.xddf);
					$("#dwzbz").html(msg.dwzbz);$("#dwbb").html(msg.dwbb);$("#dwsb").html(msg.dwsb);$("#dwdf").html(msg.dwdf);
					$("#bfzbz").html(msg.bfzbz);$("#bfbb").html(msg.bfbb);$("#bfsb").html(msg.bfsb);$("#bfdf").html(msg.bfdf);
					$("#tjzbz").html(msg.tjzbz);$("#tjbb").html(msg.tjbb);$("#tjsb").html(msg.tjsb);$("#tjdf").html(msg.tjdf);
				}
			});
		}
		
		
		
		function dcmb(){
			loadjzt();
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
			var jsxz="通自然村";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':getValuesById("knw"),
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':gydwstr
			};
			postDownLoadFile({
	            url:'/jxcsxm/zjbf/dcmb.do',
	            data:params,
	            method:'post'
	          });
				
			setTimeout('disLoadjzt()',4000);
		}
		
		
		
		
		
		
		
		
		
		
		
		function drsj(){
			var url="/jxcsxm/zjbf/importZjbf.do?gydwdm="+$.cookie("unit");
			var flag='tzrczjbf';
			importSj(url,flag);
		} 
		
		
		function qbshdw(){
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
			var jsxz="通自然村";
			
			
			var xmnf=$("#xmnf").combobox("getValues").join(",");
			if(xmnf.substr(0,1)==',')
				xmnf=xmnf.substr(1,xmnf.length);
			
			var jhxdwh=$("#jhxdwh").combobox("getText");
			if(jhxdwh.substr(0,1)==',')
				jhxdwh=jhxdwh.substr(1,jhxdwh.length);

			var sfqbbf=$("#sfqbbf").combobox("getValues").join(",");
			if(sfqbbf.substr(0,1)==',')
				sfqbbf=sfqbbf.substr(1,sfqbbf.length);
			var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':getValuesById("knw"),
					   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,
					   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':gydwstr,'xmjbxx.sfqbbf':sfqbbf
			};
				
				$.ajax({
					type:'post',
					url:'/jxcsxm/zjbf/qbshbf.do',
					data:params,
					dataType:'json',
					success:function(msg){
						if(msg){
							alert("审核成功");
							$("#grid").datagrid('reload');
							loadTj();
						}
						else{
							alert("审核失败");
						}
					}
				});
				
		 }
		
		//批量删除数据
		 function qbscbf(){
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
				var jsxz="通自然村";
				YMLib.Var.params={'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.gydwdm':gydwstr
				};
				YMLib.Var.data='xmjbxx.xzqh='+xzqhstr+'&xmjbxx.jsxz='+jsxz+'&xmjbxx.gydwdm='+gydwstr;
			 if(confirm("按填报时间进行删除操作,删除后不可恢复,确认吗？")){
				 openWindow("删除","/jxcsxm/page/zjbf/zjbf_del.jsp",400,350);
			 }
		 }
		
		
		
		 function qbthsj(){
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
				var jsxz="通自然村";
				var xmnf=$("#xmnf").combobox("getValues").join(",");
				if(xmnf.substr(0,1)==',')
					xmnf=xmnf.substr(1,xmnf.length);
				
				var jhxdwh=$("#jhxdwh").combobox("getText");
				if(jhxdwh.substr(0,1)==',')
					jhxdwh=jhxdwh.substr(1,jhxdwh.length);
				var sfqbbf=$("#sfqbbf").combobox("getValues").join(",");
				if(sfqbbf.substr(0,1)==',')
					sfqbbf=sfqbbf.substr(1,sfqbbf.length);
				var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':getValuesById("knw"),
						   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,'xmjbxx.zgx':$.cookie('zgx'),
						   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':gydwstr,'xmjbxx.sfqbbf':sfqbbf
				};
					
				$.ajax({
					type:'post',
					url:'/jxcsxm/zjdw/qbthsj.do',
					data:params,
					dataType:'json',
					success:function(msg){
						if(msg){
							alert("退回成功");
							$("#grid").datagrid('reload');
							loadTj();
						}
						else{
							alert("退回失败");
						}
					}
				});
				 
				 
				 
			 }
			 
			 
			 function qbthxj(){
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
					var jsxz="通自然村";
					var xmnf=$("#xmnf").combobox("getValues").join(",");
					if(xmnf.substr(0,1)==',')
						xmnf=xmnf.substr(1,xmnf.length);
					
					var jhxdwh=$("#jhxdwh").combobox("getText");
					if(jhxdwh.substr(0,1)==',')
						jhxdwh=jhxdwh.substr(1,jhxdwh.length);
					var sfqbbf=$("#sfqbbf").combobox("getValues").join(",");
					if(sfqbbf.substr(0,1)==',')
						sfqbbf=sfqbbf.substr(1,sfqbbf.length);
					var params={'xmjbxx.sbthcd':$.cookie("unit2").length,'xmjbxx.xmbm':$("#xmbm").val(),'xmjbxx.xzqh':xzqhstr,'xmjbxx.jsxz':jsxz,'xmjbxx.knw':getValuesById("knw"),
							   'xmjbxx.xmnf':xmnf,'xmjbxx.xmmc':$("#xmmc").val(),'xmjbxx.jhxdwh':jhxdwh,'xmjbxx.zgx':'',
							   'xmjbxx.shzt':getValuesById("shzt"),'xmjbxx.ssbzt':getValuesById("ssbzt"),'xmjbxx.xsbzt':getValuesById("xsbzt"),'xmjbxx.gydwdm':gydwstr,'xmjbxx.sfqbbf':sfqbbf
					};
						
					$.ajax({
						type:'post',
						url:'/jxcsxm/zjbf/qbthxj.do',
						data:params,
						dataType:'json',
						success:function(msg){
							if(msg){
								alert("退回成功");
								$("#grid").datagrid('reload');
								loadTj();
							}
							else{
								alert("退回失败");
							}
						}
					});
					 
					 
					 
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
		<div id="p_top">资金拨付>&nbsp;农村公路>&nbsp;通自然村</div>
	</div>
		<table width="99.9%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
        	<tr>
        		<td align="left" style="padding-left:10px;padding-right: 10px; padding-top: 5px;">
        			<fieldset id="searchField" style="width:99.9%; text-align: left; vertical-align: middle;">
        				<legend style="padding: 0 0 0 0; font-weight: bold; color: Gray; font-size: 12px;">
        					<font style="color: #0866A0; font-weight: bold"></font>
        				</legend>
        				<div>
        				<table style="margin:4px; vertical-align:middle;" cellspacing="0" class="abgc_td" >
							<tr height="28">
								<td align="right">行政区划：</td>
        						<td><select id="xzqh" style="width:165px;"></select></td>
        						<td align="right">管养单位：</td>
        						<td><select id="gydw" style="width:165px;"></select></td>
								<td align="right">项目年份：</td>
        						<td><select id="xmnf" style="width: 80px;"></select></td>
								<td align="right">项目编码：</td>
        						<td><input name="xmbm" type="text" id="xmbm" style="width:140px;" /></td>
        						<td align="right">项目名称：</td>
        						<td><input name="xmmc" type="text" id="xmmc" style="width:140px;" /></td>
        						
								</tr>
        					<tr height="28">
								<td align="right">计划下达文号：</td>
        						<td><input name="jhxdwh" type="text" id="jhxdwh" style="width:165px;" /></td>
								<!-- 县市上报状态 省审核状态-->
								<td align="right" name='sheng'>审核状态：</td>
								<td name='sheng'><select name="shzt" id="shzt" style="width:80px;" ></select></td>
        						<td align="right" name='shi'>上报状态：</td>
								<td name='shi'><select name="ssbzt" id="ssbzt" style="width:80px;" ></select></td>
        						<td align="right" name='xian'>上报状态：</td>
								<td name='xian'><select name="xsbzt" id="xsbzt" style="width:80px;" ></select></td>
        						<td align="right">是否全部拨付：</td>
								<td><select name="sfqbbf" id="sfqbbf" style="width:144px;" ></select></td>
        						<td align="right">库内外：</td>
								<td><select id="knw" style="width:144px;"></select></td>
        						
        					</tr>
        					<tr height="28">
                            	<td colspan="8">
                            		<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:queryXmlist()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
									<a name='sheng' id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plshbf()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">批量审核</a>
									<a name='xian' id='mybuttion3' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:dcmb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion3')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion3')"  class="button button-tiny button-rounded button-raised button-primary">导出模版</a>
									<a name='xian' id='mybuttion4' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:drsj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">导入数据</a>
									<a name='xian' id='mybuttion5' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbbfxj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion5')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion5')"  class="button button-tiny button-rounded button-raised button-primary">批量上报</a>
									<a name='shi' id='mybuttion6' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:plsbbfsj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion6')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion6')"  class="button button-tiny button-rounded button-raised button-primary">批量上报</a>
									<a name='sheng' id='mybuttion10' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:qbshdw()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion10')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion10')"  class="button button-tiny button-rounded button-raised button-primary">全部审核</a>
									<a name='xian' id='mybuttion7' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:qbscbf()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion4')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion4')"  class="button button-tiny button-rounded button-raised button-primary">全部删除</a>
									<a name='sheng' id='mybuttion11' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:qbthsj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion11')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion11')"  class="button button-tiny button-rounded button-raised button-primary">全部退回</a>
									<a name='shi' id='mybuttion12' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:qbthxj()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion12')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion12')"  class="button button-tiny button-rounded button-raised button-primary">全部退回</a>
									
								
								</td>
                            </tr>
        					</table>
        				</div>
        			</fieldset>
        		</td>
        	</tr>
        	
        	<tr>
            	<td style="padding-left: 10px; font-size:12px;">
            		<table>
                   			<tr>
	                		<td colspan="2">共有项目【<span id="xmsl" style="color: red;font-weight: bold;">0</span>】个。</td>
	                		</tr>
                   			<tr>
	                		<td>下达补助【<span id="xdzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="xdbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="xdsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="xddf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		<td style="padding-left: 10px;">到位补助【<span id="dwzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="dwbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="dwsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="dwdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		</tr>
	                		<tr>
	                		<td>拨付补助【<span id="bfzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="bfbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="bfsb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="bfdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		<td style="padding-left: 10px;">调剂补助【<span id="tjzbz" style="color: Red; font-weight: bold;">0</span>】万元（部补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元，省补【<span id="tjbb" style="color: Red; font-weight: bold;">0</span>】万元），地方自筹【<span id="tjdf" style="color: Red; font-weight: bold;">0</span>】万元。</td>
	                		</tr>
                   		</table>
            		<div><table id="grid"></table></div>
            	</td>
        	</tr>
		</table>
		

</body>
</html>
