



/**
 * I查询没有查询到数据的处理方法
 */
function notGetInfo() {
    //console.info("没有查询到数据");
}

//构造弹出窗口的函数
var selectedFeature = null;

//销毁弹出窗口的函数
function onFeatureUnselect(feature) {
    map.removePopup(feature.popup);
    feature.popup.destroy();
    feature.popup = null;
}
//关闭弹出窗口的函数
function onPopupClose(evt) {
    selectControl.unselect(selectedFeature);
}

/**
 * 属性查询示例
 */

//构造弹出窗口的函数
function onFeatureSelect(feature) {
	if(YMLib.Var.bm.length>11) YMLib.UI.createWindow('ql_add','桥梁项目查询','./dzdt_ql.jsp','app_add',630,330);
	else YMLib.UI.createWindow('lx_add','路线项目查询','./dzdt_lx.jsp','app_add',630,330);
}

function loadDataunit(){
	var right=parent.window.document.getElementById("rightContent").contentWindow; //获取右侧frame对象
	$("#dataunit_tree").treegrid({
		border : false,
		rownumbers: false,
		animate:true,
		collapsible:true,
		fit:true,
		fitColumns : true,
		pagination : false,
		loadMsg : '正在加载请稍候...',
		url:'../../xtgl/selectXzqhList.do',
		queryParams : {
			"unit.id":$.cookie("dist2")
		},
		idField:'id',
		treeField:'name',
		showFooter:false,
		columns:[[
            {field:'name',width:200}
		]],
		onBeforeExpand:function(row){
			if(row.id.length==6){
				var child=$("#dataunit_tree").treegrid("getChildren",row.id);
				if(child == ""){
					var node = $('#dataunit_tree').treegrid('getSelected');
					$('#dataunit_tree').treegrid('append',{
						parent: row.id,
						data: [{
							id: 'G'+row.id,name: '国道',state:'closed',iconCls:'icon-none',parent: row.id
						  	},{
							id: 'S'+row.id,name: '省道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'X'+row.id,name: '县道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'Y'+row.id,name: '乡道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'Z'+row.id,name: '专道',state:'closed',iconCls:'icon-none',parent: row.id
							},{
							id: 'C'+row.id,name: '村道',state:'closed',iconCls:'icon-none',parent: row.id
							}
						]
					});
				}
			}else{
				$("#dataunit_tree").treegrid("getChildren",row.id);
			}
		},onDblClickRow:function(row){
			if(row.bmid!="") right.attrQuery(row.id);
		},onClickRow:function(row){
			if(row.bmid!="") right.attrQuery(row.id);
		}
	});
}

function turnTo(_id,_parent,_name){
	var url="";
	var menuId="";
	var sj=$.cookie("dist2")=="36"?"1":"0";
	switch(_id.substr(0,8)){
		case "01010201": url="page/lwxm/Menu.jsp";menuId="Menu_2";break;
		case "01010203": url="page/lwxm/Menu.jsp";menuId="Menu_2";break;
		case "01010301": url="page/jhgl/Menu.jsp";menuId="Menu_3";break;
		case "01010402": url="page/gcgl/Menu.jsp";menuId="Menu_4";break;
	}
	url=url+"?id="+_id+"&sj="+sj;
	parent.$("#c1f").attr("src",url);
	parent.$("#Menu_1").removeClass('now');
	parent.$("#"+menuId).addClass('now');
}
function selAnyChartXml(){
	$.ajax({
		type:"post",
		async:false,
		url:"../../xtgl/selAnyChartXml.do",
		dataType:'json',
		data:"param.sourceid="+$.cookie("unit2")+"&param.xzqh="+$.cookie("dist"),
		success:function(msg){
			createAnyChartXml(msg.hm2.xml);
			var list1=msg.hm1.list;
			for(var i=0;i<list1.length;i++){
				$("#ip_"+list1[i].name).html(list1[i].id);
			}
			var list2=msg.hm1.list2;
			for(var i=0;i<list2.length;i++){
				$("#ip_"+list2[i].parent).html(list2[i].descr);
			}
		}
	});
}
function createAnyChartXml(_xml){
    barChart_1= new AnyChart("/jxcsxm/widget/anyChart/swf/AnyChart.swf");    
    barChart_1.width =350;
    barChart_1.height =300;
    barChart_1.padding =0;
    barChart_1.wMode="transparent";
    barChart_1.write("anychart_div");
    barChart_1.setData(_xml);
}
function xmlxTj(){
	$.ajax({
		type:"post",
		async:false,
		url:"../../xtgl/xmlxCountTj.do",
		dataType:'json',
		
		data:'param.id='+getQxfromSession('qx4'),
		//data:'param.id='+$.cookie("qx4"),
		success:function(msg){
			if(msg!=null){
				var htmlStr="";
				for(var i=0;i<msg.length;i++){
					if(msg[i].desr!=""){
						htmlStr+="<tr><td height='25' width='140px' bgcolor='#FfFfFf' align='center' rowspan="+msg[i].desr+"><span>"+msg[i].parent+"（<span style='font-weight:700; color:#b80f0f;' id='ip_"+msg[i].id.substr(0,8)+"'></span>）</span></td>"+
					    "<td width='210px' bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;' ><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}else{
						htmlStr+="<tr><td bgcolor='#FFFFFF' style='font-size: 12px' align='center'>"+msg[i].name+"</td>"+
					    "<td bgcolor='#FFFFFF' align='center'><a href='#' onclick=turnTo('"+msg[i].id+"','"+msg[i].parent+"','"+msg[i].name+"') style='font-size: 12px;font-weight:700; color:#b80f0f;'><span id='ip_"+msg[i].id+"'></span></a></td></tr>";
					}
				}
				$("#xmlxTj_table").html(htmlStr);
			}
		}
	});
	//selAnyChartXml();
}