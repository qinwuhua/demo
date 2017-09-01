<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>水毁抢修</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/Top.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
	<style type="text/css">
		.table{border: 1px solid #FFE7BA;}
		.table tr{border: 1px solid #FFE7BA;}
		.table tr td{border: 1px solid #FFE7BA;}
		.table tr td input{width: 50px;}
	</style>
	<style type="text/css">
		.table1{border: 1px solid #FFE7BA;}
		.table1 tr{border: 1px solid #FFE7BA;}
		.table1 tr td{border: 1px solid #FFE7BA;}
	</style>
	<script type="text/javascript">
		$(function(){
			$("#nf").combobox({onSelect:function(record){
// 				loadZj($.cookie("unit"));
				loadWhBmbmSh('jhxdwh',$("#nf").combobox('getValue')+"11101360000");
			}})
			
			loadBmbm('nf','项目年份',new Date().getFullYear());
			loadWhBmbmSh('jhxdwh',$("#nf").combobox('getValue')+"11101360000");
			var gydw=$.cookie("unit");
			if(gydw=="36"){
				loadChildGydw("11101360000");
				//loadChildGydw("11101360000");
			}else{
				loadChildGydw(gydw);
			}
			
		});
		function loadChildGydw(gydw){
			$.ajax({
				type:'post',
				async:false,
				url:'/jxcsxm/zjdw/queryChildGydw.do',
				data:'gydw='+gydw,
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						$('#zjdw_table_tbody').append('<tr name="'+$.cookie("unit")+'" id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" readonly="readonly"  width="60" /></td><td  align="center"><input type="number" readonly="readonly" width="60" /></td><td  align="center"><input type="number" readonly="readonly" width="60" /></td><td  align="center"><input type="number" readonly="readonly" width="60" /><input type="hidden" value="'+item.parent+'"/></td></tr>');
					});
				}
			});
			
			//loadZj($.cookie("unit"));
		}
		
		
		function loadZj(gydwdm){
			if($("#jhxdwh").combo('getValue')==""||$("#jhxdwh").combo('getValue')==""){
				alert("请选择计划下达文号");
				return;
			}
			var zj;
			if($.cookie("unit")=="36")
			zj={'xmjbxx.gydwdm':"11101360000",'xmjbxx.xdnf':$("#nf").combo('getValue'),'jhxdwh':$("#jhxdwh").combo('getValue')};
			else zj={'xmjbxx.gydwdm':$.cookie('unit'),'xmjbxx.xdnf':$("#nf").combo('getValue'),'jhxdwh':$("#jhxdwh").combo('getValue')};
			$.ajax({
				type:'post',
				async:false,
				url:'/jxcsxm/jhcx/queryZjByGydwdm.do',
				data:zj,
				dataType:'json',
				success:function(data){
					if(data.length>0){
						$.each(data,function(index,item){
							var input=$("#"+item.gydwdm+" input");
							$(input[0]).val(item.btzzj);
							$(input[1]).val(item.rys);
							$(input[2]).val(item.ttc);
							$(input[3]).val(item.dfzc);
							$(input[4]).val(item.parent);
							$("#jhxdwh").val(item.jhxdwh);
							//alert(item.xdnf);
							$("#nf").combobox('setValue',item.xdnf.substr(0,4));
							
							//$("#bd").combobox('setValue',item.bd);
						});
					}else{
						var tr = $("tr[name='"+gydwdm+"']");
						$.each(tr,function(index,item){
							var inputList = $("#"+item.id+" input");
							$(inputList[0]).val("");
							$(inputList[1]).val("");
							$(inputList[2]).val("");
							$(inputList[3]).val("");
						});
					}
				}
			});
		}
		
		function save(){
			//if($('#bd').combo("getValue")==""){alert("请选择标段");return;}
			if($('#nf').combo("getValue")==""){alert("请选择年份");return;}
			if($('#jhxdwh').val()==""){alert("请填写计划下达文号");return;}
			/* var json_data = JSON.stringify(caiji($.cookie("unit"))); 
			alert(json_data); */
			
			$.ajax({
				type:'post',
				url:'/jxzhpt/qqgl/insertOrUpdateShqx.do',
				data:caiji($.cookie("unit")),
				dataType:'json',
				success:function(data){
					alert("保存成功！");
					parent.queryXmlist();
					closeWindow();
				}
			});
			
			
			
		}
		function closeWindow(){
			parent.$('#mywin').window('destroy');
		}
		
		
		
		
		function caiji(name){
 			var zj = {gydwdm:"",parent:"",xdnf:"",btzzj:"",rys:"",ttc:"",dfzc:"",ztz:"",jhxdwh:""};
			var tr = $("tr[name='"+name+"']");
			 $.each(tr,function(index,item){
				 
				var inputList = $("#"+item.id+" input");
				var ztz=0;var btzzj=0;var rys=0;var ttc=0;var dfzc=0;
				
				if(index==0){
					zj.gydwdm+=item.id;
					zj.parent+=$(inputList[4]).val();
					zj.xdnf+=$("#nf").combo('getValue');
					btzzj=$(inputList[0]).val()==""?0:$(inputList[0]).val();
					rys=$(inputList[1]).val()==""?0:$(inputList[1]).val();
					ttc=$(inputList[2]).val()==""?0:$(inputList[2]).val();
					dfzc=$(inputList[3]).val()==""?0:$(inputList[3]).val();
					zj.btzzj+=btzzj;zj.rys+=rys;zj.ttc+=ttc;zj.dfzc+=dfzc;
					ztz=accAdd(ztz,$(inputList[0]).val()==""?0:$(inputList[0]).val());
					ztz=accAdd(ztz,$(inputList[1]).val()==""?0:$(inputList[1]).val());
					ztz=accAdd(ztz,$(inputList[2]).val()==""?0:$(inputList[2]).val());
					ztz=accAdd(ztz,$(inputList[3]).val()==""?0:$(inputList[3]).val());
					zj.ztz+=ztz;
					zj.jhxdwh+=$("#jhxdwh").val();
				}else{
					zj.gydwdm+=","+item.id;
					zj.parent+=","+$(inputList[4]).val();
					zj.xdnf+=","+$("#nf").combo('getValue');
					btzzj=$(inputList[0]).val()==""?0:$(inputList[0]).val();
					rys=$(inputList[1]).val()==""?0:$(inputList[1]).val();
					ttc=$(inputList[2]).val()==""?0:$(inputList[2]).val();
					dfzc=$(inputList[3]).val()==""?0:$(inputList[3]).val();
					zj.btzzj+=","+btzzj;zj.rys+=","+rys;zj.ttc+=","+ttc;zj.dfzc+=","+dfzc;
					ztz=accAdd(ztz,$(inputList[0]).val()==""?0:$(inputList[0]).val());
					ztz=accAdd(ztz,$(inputList[1]).val()==""?0:$(inputList[1]).val());
					ztz=accAdd(ztz,$(inputList[2]).val()==""?0:$(inputList[2]).val());
					ztz=accAdd(ztz,$(inputList[3]).val()==""?0:$(inputList[3]).val());
					zj.ztz+=","+ztz;
					zj.jhxdwh+=","+$("#jhxdwh").val();
					
				}
			}); 
			return zj;
		}
	</script>
</head>
<body>
	<div id="righttop">
		<div id="p_top">计划查询>&nbsp;农村公路>&nbsp;水毁抢修</div>
	</div>
	<div style="text-align: left;font-size: 12px;margin: 0px;width:99%;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			
        	<tr>
        		<td>
        			<div align="center">
        				<table class="table1" cellpadding="0" cellspacing="0" width="800">
        				<tr align='center' height="28">
        						<td width="100">下达年份</td>
								<td width="100">
								<input type="text" class='easyui-combobox' id='nf' style="width: 65px;">
								<td width="100">计划下达文号</td>
								<td width="100">
<!-- 								<input readonly="readonly" type='text' id='jhxdwh'style="width: 145px;"> -->
								<input type='text' id='jhxdwh'style="width: 145px;">
								</td>
								<td width="100">
									<input value=" 查询  " onclick="loadZj()" style="text-align: center;" type="button"/>
								</td>
							</tr>
						</table>
						<table id="zjdw_table" width="800" class="table" cellpadding="0" cellspacing="0">
							
							<tr align='center' height="28">
								<td>单位名称</td>
								<td>车购税(万元)</td>
								<td>燃油税(万元)</td>
								<td>厅统筹(万元)</td>
								<td>地方自筹(万元)</td>
							</tr>
							<tbody id="zjdw_table_tbody"></tbody>
						</table>
						
					</div>
				</td>
        	</tr>
		</table>
	</div>
</body>
</html>
