<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>水毁抢修</title>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>
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
				loadZj($.cookie("unit"));
				
				loadWhBmbmSh('jhxdwh',$("#nf").combobox('getValue')+"21101360000");
			}})
			$("#yf").combobox({onSelect:function(record){
				loadZj($.cookie("unit"));
			}})
			loadBmbm('bd','标段');
			loadBmbm('nf','项目年份',new Date().getFullYear());
			
			var yf=new Date().getMonth()+1;
			if(yf<10)loadBmbm('yf','月份',"0"+yf);else loadBmbm('yf','月份',yf);
			loadWhBmbmSh('jhxdwh',new Date().getFullYear()+"21101360000");
			
			var gydw=$.cookie("unit");
			if(gydw=="36"){
				loadChildGydw("21101360000");
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
						$('#zjbf_table_tbody').append('<tr name="'+$.cookie("unit")+'" id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /></td><td  align="center"><input type="number" width="60" /><input type="hidden" value="'+item.parent+'"/></td></tr>');
					});
				}
			});
			
			loadZj($.cookie("unit"));
		}
		
		
		function loadZj(gydwdm){
			
			var zjq;
			if($.cookie("unit")=="36")
			zj={'gydwdm':"21101360000",'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue')};
			else zj={'gydwdm':gydwdm,'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue')};
			$.ajax({
				type:'post',
				async:false,
				url:'/jxcsxm/zjbf/queryZjByGydwdm.do',
				data:zj,
				dataType:'json',
				success:function(data){
					if(data.length>0){
						$.each(data,function(index,item){
							var input=$("#"+item.gydwdm+" input");
							$(input[0]).val(item.cgs);
							$(input[1]).val(item.rys);
							$(input[2]).val(item.ttc);
							$(input[3]).val(item.dfzc);
							$(input[4]).val(item.parent);
							$("#jhxdwh").combobox('setValue',item.jhxdwh);
							$("#nf").combobox('setValue',item.bfyf.substr(0,4));
							$("#yf").combobox('setValue',item.bfyf.substr(item.bfyf.length-2,item.bfyf.length));
							$("#bd").combobox('setValue',item.bd);
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
			if($('#bd').combo("getValue")==""){alert("请选择标段");return;}
			if($('#nf').combo("getValue")==""){alert("请选择年份");return;}
			if($('#yf').combo("getValue")==""){alert("请选择月份");return;}
			if($('#jhxdwh').combo("getValue")==""){alert("请选择计划下达文号");return;}
			/* var json_data = JSON.stringify(caiji($.cookie("unit"))); 
			alert(json_data); */
			
			$.ajax({
				type:'post',
				url:'/jxcsxm/zjbf/insertOrUpdateShqx.do',
				data:caiji($.cookie("unit")),
				dataType:'json',
				success:function(data){
					alert("保存成功！");
					parent.queryXmlist();
					closeWindow();
				}
			});
			
			
			
		}
		
		
		
		
		
		function caiji(name){
 			var zj = {gydwdm:"",parent:"",bfyf:"",cgs1:"",rys1:"",ttc1:"",dfzc1:"",ztz1:"",bd:"",jhxdwh:""};
			var tr = $("tr[name='"+name+"']");
			 $.each(tr,function(index,item){
				 
				var inputList = $("#"+item.id+" input");
				var ztz1=0;var cgs1=0;var rys1=0;var ttc1=0;var dfzc1=0;
				
				if(index==0){
					zj.gydwdm+=item.id;
					zj.parent+=$(inputList[4]).val();
					zj.bfyf+=$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue');
					cgs1=$(inputList[0]).val()==""?0:$(inputList[0]).val();
					rys1=$(inputList[1]).val()==""?0:$(inputList[1]).val();
					ttc1=$(inputList[2]).val()==""?0:$(inputList[2]).val();
					dfzc1=$(inputList[3]).val()==""?0:$(inputList[3]).val();
					zj.cgs1+=cgs1;zj.rys1+=rys1;zj.ttc1+=ttc1;zj.dfzc1+=dfzc1;
					ztz1=accAdd(ztz1,$(inputList[0]).val()==""?0:$(inputList[0]).val());
					ztz1=accAdd(ztz1,$(inputList[1]).val()==""?0:$(inputList[1]).val());
					ztz1=accAdd(ztz1,$(inputList[2]).val()==""?0:$(inputList[2]).val());
					ztz1=accAdd(ztz1,$(inputList[3]).val()==""?0:$(inputList[3]).val());
					zj.ztz1+=ztz1;
					zj.bd+=$("#bd").combo('getValue');
					zj.jhxdwh+=$("#jhxdwh").combo('getValue');
				}else{
					zj.gydwdm+=","+item.id;
					zj.parent+=","+$(inputList[4]).val();
					zj.bfyf+=","+$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue');
					cgs1=$(inputList[0]).val()==""?0:$(inputList[0]).val();
					rys1=$(inputList[1]).val()==""?0:$(inputList[1]).val();
					ttc1=$(inputList[2]).val()==""?0:$(inputList[2]).val();
					dfzc1=$(inputList[3]).val()==""?0:$(inputList[3]).val();
					zj.cgs1+=","+cgs1;zj.rys1+=","+rys1;zj.ttc1+=","+ttc1;zj.dfzc1+=","+dfzc1;
					ztz1=accAdd(ztz1,$(inputList[0]).val()==""?0:$(inputList[0]).val());
					ztz1=accAdd(ztz1,$(inputList[1]).val()==""?0:$(inputList[1]).val());
					ztz1=accAdd(ztz1,$(inputList[2]).val()==""?0:$(inputList[2]).val());
					ztz1=accAdd(ztz1,$(inputList[3]).val()==""?0:$(inputList[3]).val());
					zj.ztz1+=","+ztz1;
					zj.bd+=","+$("#bd").combo('getValue');
					zj.jhxdwh+=","+$("#jhxdwh").combo('getValue');
					
				}
			}); 
			return zj;
		}
	</script>
</head>
<body>
	<div style="text-align: left;font-size: 12px;margin: 0px;width:99%;">
		<table width="99%" border="0" style="margin-top: 1px; margin-left: 1px;" cellspacing="0" cellpadding="0">
			
        	<tr>
        		<td>
        			<div align="center">
        				<table class="table1" cellpadding="0" cellspacing="0" width="800">
        				<tr align='center' height="28">
        						<td width="100">拨付月份</td>
								<td width="100"><input type="text" class='easyui-combobox' id='nf' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 53px;"></td>
								<td width="100">标段</td>
								<td width="100"><input type='text' id='bd' style="width: 65px;"></td>
								<td width="100">计划下达文号</td>
								<td width="100"><input type='text' id='jhxdwh' style="width: 125px;"></td>
							</tr>
						</table>
						<table id="zjbf_table" width="800" class="table" cellpadding="0" cellspacing="0">
							
							<tr align='center' height="28">
								<td>单位名称</td>
								<td>车购税(万元)</td>
								<td>燃油税(万元)</td>
								<td>厅统筹(万元)</td>
								<td>地方自筹(万元)</td>
							</tr>
							<tbody id="zjbf_table_tbody"></tbody>
						</table>
						<table width="600">
							<tr align="center">
								<td>
									<input value=" 保  存  " onclick="save()" style="text-align: center;" type="button"/>
								</td>
							</tr>
						</table>
					</div>
				</td>
        	</tr>
		</table>
	</div>
</body>
</html>
