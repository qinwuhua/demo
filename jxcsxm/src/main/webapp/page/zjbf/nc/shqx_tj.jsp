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
			$("#nf1").combobox({onSelect:function(record){
				loadWhBmbmSh('jhxdwh',$("#nf1").combobox('getValue')+"11101360000");
			}})
			/* $("#nf").combobox({onSelect:function(record){
				loadZj($.cookie("unit"));
				loadWhBmbmSh('jhxdwh',$("#nf").combobox('getValue')+"11101360000");
			}})
			$("#yf").combobox({onSelect:function(record){
				loadZj($.cookie("unit"));
			}}) */
// 			loadBmbm('bd','标段');
			loadBmbm('nf','项目年份',new Date().getFullYear());
			loadBmbm('nf1','项目年份',new Date().getFullYear());
			
			var yf=new Date().getMonth()+1;
			if(yf<10)loadBmbm('yf','月份',"0"+yf);else loadBmbm('yf','月份',yf);
			loadWhBmbmSh('jhxdwh',new Date().getFullYear()+"11101360000");
			var gydw=$.cookie("unit");
			if(gydw=="36"){
				loadChildGydw("11101360000");
				//loadChildGydw("11101360000");
			}else{
				loadChildGydw(gydw);
			}
			
		});
		function search(){
			
			loadZj($.cookie("unit"));
			loadxddw($.cookie("unit"));
		}
		
		function loadChildGydw(gydw){
			$.ajax({
				type:'post',
				async:false,
				url:'/jxcsxm/zjdw/queryChildGydw.do',
				data:'gydw='+gydw,
				dataType:'json',
				success:function(data){
					$.each(data,function(index,item){
						if(item.sfds=='1'){
							$('#zjbf_table_tbody').append('<tr name="'+$.cookie("unit")+'" id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" width="60" readonly="readonly"/><font color="red"></font></td><td  align="center"><input type="number" width="60" readonly="readonly"/><font color="red"></font></td><td  align="center"><input type="number" width="60" readonly="readonly"/><font color="red"></font></td><td  align="center"><input type="number" width="60" readonly="readonly"/><font color="red"></font><input type="hidden" value="'+item.parent+'"/><input type="hidden" value="'+item.sfds+'"/><input type="hidden" value="'+item.sftj+'"/></td></tr>');
						}else{
							if(item.sftj=='1'){
								$('#zjbf_table_tbody').append('<tr class="'+item.parent+'" name="'+$.cookie("unit")+'" id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" width="60" onchange="jssjzj('+item.parent+')"/><font color="red"></font></td><td  align="center"><input type="number" width="60" onchange="jssjzj('+item.parent+')"/><font color="red"></font></td><td  align="center"><input type="number" width="60" onchange="jssjzj('+item.parent+')"/><font color="red"></font></td><td  align="center"><input type="number" width="60" onchange="jssjzj('+item.parent+')"/><font color="red"></font><input type="hidden" value="'+item.parent+'"/><input type="hidden" value="'+item.sfds+'"/><input type="hidden" value="'+item.sftj+'"/></td></tr>');
							}else{
								$('#zjbf_table_tbody').append('<tr name="'+$.cookie("unit")+'" id="'+item.id+'"><td align="center">'+item.name+'</td><td align="center"><input type="number" width="60" /><font color="red"></font></td><td  align="center"><input type="number" width="60" /><font color="red"></font></td><td  align="center"><input type="number" width="60" /><font color="red"></font></td><td  align="center"><input type="number" width="60" /><font color="red"></font><input type="hidden" value="'+item.parent+'"/><input type="hidden" value="'+item.sfds+'"/><input type="hidden" value="'+item.sftj+'"/></td></tr>');
							}
						}
					});
				}
			});
			
			loadZj($.cookie("unit"));
		}
		
		function jssjzj(parent){
			var cgs=0,rys=0,ttc=0,dfzc=0;
			var tr = $("tr[class='"+parent+"']");
			 $.each(tr,function(index,item){
				var inputList = $("#"+item.id+" input");
				cgs=accAdd(cgs,$(inputList[0]).val()==""?0:$(inputList[0]).val());
				rys=accAdd(rys,$(inputList[1]).val()==""?0:$(inputList[1]).val());
				ttc=accAdd(ttc,$(inputList[2]).val()==""?0:$(inputList[2]).val());
				dfzc=accAdd(dfzc,$(inputList[3]).val()==""?0:$(inputList[3]).val());
			}); 
			 var inputList = $("#"+parent+" input");
			 $(inputList[0]).val(cgs);
			 $(inputList[1]).val(rys);
			 $(inputList[2]).val(ttc);
			 $(inputList[3]).val(dfzc);
		}
		
		
		function loadZj(gydwdm){
			
			var zjq;
			if($.cookie("unit")=="36")
			zj={'gydwdm':"11101360000",'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue'),'nf':$("#nf1").combo('getValue'),'jhxdwh':$("#jhxdwh").combo('getValue')};
			else zj={'gydwdm':gydwdm,'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue'),'nf':$("#nf1").combo('getValue'),'jhxdwh':$("#jhxdwh").combo('getValue')};
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
							$("#bd").combobox('setText',item.bd);
							$("#bz").val(item.bz);
							$("#tbr").val(item.tbr);
							$("#tbsj").datebox('setValue',item.tbsj);
							
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
						$("#tbr").val($.cookie('name'));
						var yf=new Date().getMonth()+1;
						var day=new Date().getDate();
						if(yf<10) yf='0'+yf;
						if(day<10) day='0'+day;
						$("#tbsj").datebox('setValue',new Date().getFullYear()+"-"+yf+"-"+day);
						
					}
				}
			});
		}
		
		function loadxddw(gydwdm){
			
			var zjq;
			if($.cookie("unit")=="36")
			zj={'gydwdm':"11101360000",'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue'),'nf':$("#nf1").combo('getValue'),'jhxdwh':$("#jhxdwh").combo('getValue')};
			else zj={'gydwdm':gydwdm,'bfyf':$("#nf").combo('getValue')+"-"+$("#yf").combo('getValue'),'nf':$("#nf1").combo('getValue'),'jhxdwh':$("#jhxdwh").combo('getValue')};
			$.ajax({
				type:'post',
				async:false,
				url:'/jxcsxm/zjbf/queryZjdwbfByGydwdm.do',
				data:zj,
				dataType:'json',
				success:function(data){
					if(data.length>0){
						$.each(data,function(index,item){
							var font=$("#"+item.gydwdm+" font");
							$(font[0]).html("余"+item.cgs);
							$(font[1]).html("余"+item.rys);
							$(font[2]).html("余"+item.ttc);
							$(font[3]).html("余"+item.dfzc);
							
						});
					}
				}
			});
		}
		
		
		function save(){
			if($('#bd').combo("getText")==""){alert("请选择或输入标段");return;}
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
 			var zj = {gydwdm:"",parent:"",bfyf:"",cgs1:"",rys1:"",ttc1:"",dfzc1:"",ztz1:"",bd:"",jhxdwh:"",bz:'',nf:"",tbr:"",rbsj:""};
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
					zj.bd+=$("#bd").combo('getText');
					zj.jhxdwh+=$("#jhxdwh").combo('getValue');
					zj.bz=$("#bz").val();
					zj.nf+=$("#nf1").combo('getValue');
					zj.tbr+=$("#tbr").val();
					zj.tbsj+=$("#tbsj").combo('getValue');
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
					zj.bd+=","+$("#bd").combo('getText');
					zj.jhxdwh+=","+$("#jhxdwh").combo('getValue');
					zj.bz+=","+$("#bz").val();
					zj.nf+=","+$("#nf1").combo('getValue');
					zj.tbr+=","+$("#tbr").val();
					zj.tbsj+=","+$("#tbsj").combo('getValue');
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
        						<td width="100">年份</td>
								<td  align="left" style="padding-left: 10px;" width="100">
								<input type="text" class='easyui-combobox' id='nf1' style="width: 125px;">
								<td width="100">计划下达文号</td>
								<td align="left" style="padding-left: 10px;" width="100"><input type='text' id='jhxdwh'style="width: 140px;"></td>
								<td align="center" rowspan="3">
								<input value=" 查询  " onclick="search()" style="text-align: center;" type="button"/><br><font color="red">*选择年份、拨付月份、计划下达文号后点击查询自动计算剩余资金</font>
							</td>
						</tr>
        				
        				<tr align='center' height="28">
        						<td width="100">拨付月份</td>
								<td align="left" style="padding-left: 10px;" width="150"><input type="text" class='easyui-combobox' id='nf' style="width: 65px;">-<input type="text" class='easyui-combobox' id='yf' style="width: 53px;"></td>
								<td width="100">标段</td>
								<td align="left" style="padding-left: 10px;" width="140"><select id="bd" class='easyui-combobox' style="width: 140px">
								<option value="没有标段" selected="selected">没有标段</option>
								</select>
								
							</tr>
							<tr align='center' height="28">
        						<td width="100">填报人</td>
								<td align="left" style="padding-left: 10px;" width="100">
								<input type="text" id='tbr' style="width: 125px;">
								<td width="100">填报时间</td>
								<td align="left" style="padding-left: 10px;" width="100"><input type='text' class='easyui-datebox' id='tbsj'style="width: 140px;"></td>
							</tr>
							<tr align='center' height="28">
        						<td >备注</td>
								<td align="left" style="padding-left: 10px;" colspan="5" style="background-color: #ffffff; height: 20px;" align="left">
									<textarea name="bz" id="bz" rows="2" style="width: 510px;"></textarea>
								</td>
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
