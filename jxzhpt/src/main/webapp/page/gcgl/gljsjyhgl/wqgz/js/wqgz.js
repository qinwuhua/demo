function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	YMLib.UI.createWindow('wqxx','危桥改造开工详情','wqgzxx.jsp','wqxx',740,450);
	//window.open("wqgzxx.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function sfkaigong(){
	if(confirm("确认开工吗？"))
		return;
}
function ybsb(){
	YMLib.UI.createWindow('wqxx','危桥改造月报上报','wqgzyb.jsp','wqxx',1059,450);
	//window.open("wqgzyb.jsp");
}
function AddInfo(){
	YMLib.UI.createWindow('wqxx','危桥改造月报添加','wqgzybtj.jsp','wqxx',650,350);
	//window.open("wqgzybtj.jsp");
}
function Showybxx(){
	YMLib.UI.createWindow('wqxx','危桥改造月报详情','wqgzybxx.jsp','wqxx',700,430);
	//window.open("wqgzybxx.jsp");
}
function Edityb(){
	YMLib.UI.createWindow('wqxx','危桥改造月报编辑','wqgzybxg.jsp','wqxx',900,400);
	//window.open("wqgzybxg.jsp");
}
function Delyb(){
	if(confirm("确认删除吗？"))
		return;
}
var jhid=10;
//添加月报
function tjwqgzyb(){
	var myDate = new Date();
	var y = myDate.getYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	var sbsj = y+"-"+m+"-"+d;
	var sbyf = y+"-"+m;
	var data = "gcglwqgz.wc_btz="+$("#tj_wc_btz").val()+"&gcglwqgz.wc_stz="+$("#tj_wc_stz").val()+"&gcglwqgz.wc_qttz="+$("#tj_wc_qttz").val()
	+"&gcglwqgz.zjdw_btz="+$("#tj_zjdw_btz").val()+"&gcglwqgz.zjdw_stz="+$("#tj_zjdw_stz").val()+"&gcglwqgz.zjdw_qttz="+$("#tj_zjdw_qttz").val()
	+"&gcglwqgz.bywcmc="+$("#tj_bywcmc").val()+"&gcglwqgz.kgdl="+$("#tj_kgdl").val()+"&gcglwqgz.qksm="+$("#tj_qksm").val()+"&gcglwqgz.wcqk="+$("#tj_wcqk").val()
	+"&gcglwqgz.sbsj="+sbsj+"&gcglwqgz.sbyf="+sbyf+"&gcglwqgz.jhid="+jhid;
	alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertWqgzYb.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				closes('wqxx');
				
			}else{
				alert('该月月报可能已存在，保存失败！');
			}
		}
	});	
}
//显示所有
var wqData;
function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/wqgz.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:440,
	    columns:[[
	        {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'开工    '+'删除    '+'<a href="#" onclick="ybsb()">月报上报</a>   '+'完工   '+'未完工   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'qlbm',title:'桥梁编码',width:120,align:'center'},
	        {field:'qlmc',title:'桥梁名称',width:120,align:'center'},
	        {field:'qlzxzh',title:'桥梁中心桩号',width:100,align:'center'},
	        {field:'qlqk',title:'桥梁全宽',width:80,align:'center'},
	        {field:'qlqc',title:'桥梁全长',width:80,align:'center'},
	        {field:'kjzc',title:'跨径总长',width:60,align:'center'},
	        {field:'jsdj',title:'技术等级',width:60,align:'center'},
	        {field:'gjnf',title:'改建/修建年度',width:100,align:'center'}
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'../../../../gcgl/selectWqgzYbByJhid.do?jhid='+jhid,
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
			        	return '<a href="#" onclick="Showybxx()">详细</a>    '+'<a href="#" onclick="Edityb(row)">编辑</a>   '+'删除   ';
			        }},
			        {field:'sbyf',title:'上报月份',width:120,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:130,align:'center',rowspan:2},
			        {field:'bywcmc',title:'本月完成面层（公里）',width:120,align:'center',rowspan:2},
			        {field:'kgdl',title:'截至开工段落',width:120,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
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