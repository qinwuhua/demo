function dingwei(){
	alert("在地图上定位");
}
function wqxiangxi(){
	window.open("zhfzxx.jsp");
}
function sfkaigong(){
	if(confirm("确认开工吗？"))
		return;
}
function ybsb(){
	window.open("zhfzyb.jsp");
}
function AddInfo(){
	window.open("zhfzybtj.jsp");
}
function Showybxx(){
	window.open("zhfzybxx.jsp");
}
function Edityb(){
	window.open("zhfzybxg.jsp");
}
function Delyb(){
	if(confirm("确认删除吗？"))
		return;
}

function showAll(){
	$('#datagrid').datagrid({    
	    url:'js/zhfz.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[[
	         {field:'c',title:'操作',width:250,align:'center',formatter:function(value,row,index){
	        	return '定位    '+'<a href="#" onclick="wqxiangxi()">详细</a>    '+'<a href="#" onclick="ybsb()">月报审核</a>   ';
	        }},
	        {field:'gydw',title:'管养单位',width:150,align:'center'},
	        {field:'xzqh',title:'行政区划',width:120,align:'center'},
	        {field:'lxbm',title:'路线编码',width:120,align:'center'},
	        {field:'lxmc',title:'路线名称',width:120,align:'center'},
	        {field:'qdzh',title:'起点桩号',width:100,align:'center'},
	        {field:'zdzh',title:'止点桩号',width:80,align:'center'},
	        {field:'zlc',title:'总里程',width:80,align:'center'},
	        {field:'yhlc',title:'隐患里程',width:60,align:'center'},
	        {field:'jsdj',title:'路线技术等级',width:100,align:'center'},
	    ]]    
	}); 
}

function showYBlist(){
	$('#ybgrid').datagrid({    
	    url:'js/zhfzyb.json',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:325,
	    columns:[
	             [
	              	{field:'c',title:'操作',width:150,align:'center',rowspan:2,formatter:function(value,row,index){
			        	return '<a href="#" onclick="Showybxx()">详细</a>    '+'<a href="#" onclick="Edityb()">编辑</a>   '+'<a href="#" onclick="ybsh()">未审核</a>';
			        }},
			        {field:'sbyf',title:'上报月份',width:100,align:'center',rowspan:2},
			        {field:'sbsj',title:'上报时间',width:100,align:'center',rowspan:2},
			        {field:'bywcgl',title:'本月完成（公里）',width:100,align:'center',rowspan:2},
			        {field:'jzkgdl',title:'截至开工段落',width:100,align:'center',rowspan:2},
			        {title:'本月完成投资（万元）',colspan:3},
			        {title:'本月资金到位（万元）',colspan:3},
			        {field:'qksm',title:'情况说明',width:100,align:'center',rowspan:2}
	             ],
	             [
			        {field:'tzbtz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'tzstz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'tzqttz',title:'其他投资',width:79,align:'center',rowspan:1},
			        {field:'dwbtz',title:'部投资',width:79,align:'center',rowspan:1},
			        {field:'dwstz',title:'省投资',width:79,align:'center',rowspan:1},
			        {field:'dwqttz',title:'其他投资',width:79,align:'center',rowspan:1}
			    ]
	    ]
	});
}
