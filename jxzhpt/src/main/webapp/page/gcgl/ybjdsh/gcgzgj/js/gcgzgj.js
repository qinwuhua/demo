var obj=new Object();
var obj1=new Object();
function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建开工详情','gcgzgjxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function Showybxx(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建月报详情','gcgzgjybxx.jsp','wqxx',700,430);
	//window.open("wqgzybxx.jsp");
}
function ybsb(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','工程改造路面改建月报列表','gcgzgjyb.jsp','wqxx1',1059,450);
	//window.open("wqgzyb.jsp");
}
function Edityb(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建月报编辑','gcgzgjybxg.jsp','wqxx',680,360);
	//window.open("gcgzgjybxg.jsp");
}
//修改
function xggcgzgjyb(){
	//alert("xx");
	var data = "gcglgcgzgj.wc_btz="+$("#xg_wc_btz").val()+"&gcglgcgzgj.wc_stz="+$("#xg_wc_stz").val()+"&gcglgcgzgj.wc_qttz="+$("#xg_wc_qttz").val()
	+"&gcglgcgzgj.zjdw_btz="+$("#xg_zjdw_btz").val()+"&gcglgcgzgj.zjdw_stz="+$("#xg_zjdw_stz").val()+"&gcglgcgzgj.zjdw_qttz="+$("#xg_zjdw_qttz").val()
	+"&gcglgcgzgj.bywcdc="+$("#xg_bywcdc").val()+"&gcglgcgzgj.bywcjc="+$("#xg_bywcjc").val()+"&gcglgcgzgj.bywcmc="+$("#xg_bywcmc").val()+"&gcglgcgzgj.kgdl="+$("#xg_kgdl").val()
	+"&gcglgcgzgj.qksm="+$("#xg_qksm").val()+"&gcglgcgzgj.wcqk="+$("#xg_wcqk").val()
	+"&gcglgcgzgj.jhid="+parent.obj.jhid+"&gcglgcgzgj.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updategcgzgjYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
//审核
function ybsh(index){
	var data=$("#ybgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','工程改造路面改建月报审核','gcgzgjybsh.jsp','wqxx',450,280);
}
function shgcgzgjyb(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var data = "gcglgcgzgj.zjje="+$("#tj_zjje").val()+"&gcglgcgzgj.xgcsyj="+$("#tj_xgcsyj").val()+"&gcglgcgzgj.cscyj="+$("#tj_cscyj").val()
	+"&gcglgcgzgj.shtime="+sbsj+"&gcglgcgzgj.shuser="+$.cookie("truename")+"&gcglgcgzgj.jhid="+parent.obj.jhid+"&gcglgcgzgj.id="+parent.obj.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/shgcgzgjYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#ybgrid").datagrid('reload');
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
}
function showAll(){
	var gydw=$("#gydw").combobox("getValue");
	if(gydw=='36')
		gydw='';
	var jgzt='0';
	var kgzt='1';
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzgjjhList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    queryParams: {
	    	gydw: gydw,
	    	kgzt: kgzt,
	    	jgzt: jgzt,
	    	lxmc:lxmc,
		},
	    columns:[[
	         {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
 	        	 return '定位    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="wqxiangxi('+index+')">详细</a>    '+'<a href="#" style="text-decoration:none;color:#3399CC;" onclick="ybsb('+index+')">月报审核</a>    ';
 	        }},
 	       {field:'gydw',title:'管养单位',width:130,align:'center'},
	        {field:'xzqhmc',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:100,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:60,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:60,align:'center'},
	        {field:'qzlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:80,align:'center'},
	        {field:'ylmlx',title:'原路面类型',width:100,align:'center'},
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectgcgzgjYbByJhid1.do?jhid='+parent.obj1.id,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
						{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
	              		if(row.shzt=='未审核'&&row.sfth=='否')
				        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'<a href="#" onclick="Edityb('+index+')">编辑</a>   '+'<a href="#" onclick="ybsh('+index+')">未审核</a>   '+'<a href="#" onclick="thsjyb('+index+')">退回</a>';
		              		if(row.shzt=='未审核'&&row.sfth=='是')
					        	return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'未审核   '+'退回';
		              		if(row.shzt=='已审核')
		              		return '<a href="#" onclick="Showybxx('+index+')">详细</a>    '+'编辑   '+'已审核   '+'退回   ';
						}},
						{field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
						{field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
						{field:'bywcdc',title:'本月完成垫层（m³）',width:120,align:'center',rowspan:2},
						{field:'bywcjc',title:'本月完成基层（m³）',width:120,align:'center',rowspan:2},
						{field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
						{field:'kgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
						{title:'本月完成投资（万元）',colspan:3},
						{title:'本月资金到位（万元）',colspan:3},
						{field:'qksm',title:'情况说明',width:150,align:'center',rowspan:2}
						],
						[
						{field:'wc_btz',title:'部投资',width:79,align:'center',rowspan:1},
						{field:'wc_stz',title:'省投资',width:79,align:'center',rowspan:1},
						{field:'wc_qttz',title:'其他投资',width:79,align:'center',rowspan:1},
						{field:'zjdw_btz',title:'部投资',width:79,align:'center',rowspan:1},
						{field:'zjdw_stz',title:'省投资',width:79,align:'center',rowspan:1},
						{field:'zjdw_qttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
function thsjyb(index){
	var data1=$("#ybgrid").datagrid('getRows')[index];
	var data="gcglgcgzgj.id="+data1.id+"&gcglgcgzgj.sfsj=是"+"&gcglgcgzgj.sfth=是";
	if(confirm("确认退回吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/sbGcgzgjYb.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('退回成功！');
					$("#ybgrid").datagrid('reload');
				}else{
					alert('退回失败！');
				}
			}
		});	
	}	
}
//
function uploadFile(str){
	//alert(str);
	var title='';
	if(str=='sgxkwj')
		title='请选择施工许可文件';
	if(str=='jgtcwj')
		title='请选择交工通车文件';
	if(str=='jgyswj')
		title='请选择完工验收文件';
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : title,
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzgjFile.do"+'&flag='+'ybjdsh%2fgcgzgj%2fgcgzgjxx'+'&type='+str+'&jhid='+parent.obj1.id,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

function downFile(str){
	if($("#xz_"+str).text()=='下载附件'){
		parent.window.location.href="../../../../gcgl/downGcgzgjFile.do?type="+str+"&jhid="+parent.obj1.id;
	}
	else return;
}
function deleteFile(str){
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.id+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteGcgzgjFile.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('删除成功！');
				location.reload();
			}else{
				alert('删除失败！');
			}
		}
	});	
	}
}
function jiazai(ooo){
//	alert(ooo);
	var data=ooo;

	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectGcgzgjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
				if(msg.sgxkwj!=''){
					$("#xz_sgxkwj").text("下载附件");
				}
				if(msg.jgtcwj!=''){
					$("#xz_jgtcwj").text("下载附件");
				}
				if(msg.jgyswj!=''){
					$("#xz_jgyswj").text("下载附件");
				}
			}
	});	
}