$(function() {
	var qx=getQxfromSession('qx3').split(",");
    var j=1;
    for(var i=0;i<qx.length;i++){
    	if(qx[i]=='01010501'){
			$('#aa').accordion('add', {
				id:"left_menu1",
				title: '普通国省道',
				selected: j==1?true:false,
				iconCls:'icon-none'
			});
			$("#left_menu1").append('<ul id="tree01010501"></ul>');
			createMenunew('01010501');
			j++;
		}
    	if(qx[i]=='01010502'){
			$('#aa').accordion('add', {
				id:"left_menu2",
				title: '农村公路',
				selected: j==1?true:false,
				iconCls:'icon-none'
			});
			$("#left_menu2").append('<ul id="tree01010502"></ul>');
			createMenunew('01010502');
			j++;
		}
    }
	
	
	
	
	/*createMenu('LeftMenu',{
		id:'menu_010401',
		title:'角色分配管理',
		imgSrc:'../../images/jsgl.png',
		renderTo:'left_menu1',
		href:'./jsgl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010402',
		title:'行政区划管理',
		imgSrc:'../../images/xzqhgl.png',
		renderTo:'left_menu1',
		href:'./xzqh.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010403',
		title:'部门信息管理',
		imgSrc:'../../images/bmgl.png',
		renderTo:'left_menu1',
		href:'./bmgl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010404',
		title:'特殊地区',
		imgSrc:'../../images/tsdq.png',
		renderTo:'left_menu1',
		href:'./tsdq.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010405',
		title:'用户信息管理',
		imgSrc:'../../images/yhgl.png',
		renderTo:'left_menu1',
		href:'./yhgl.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010406',
		title:'编目编码管理',
		imgSrc:'../../images/bmbm.png',
		renderTo:'left_menu1',
		href:'./bmbm.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010407',
		title:'路网项目补助标准',
		imgSrc:'../../images/bzbz.png',
		renderTo:'left_menu1',
		href:'./bzbz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010408',
		title:'非路网项目补助标准',
		imgSrc:'../../images/flwbzbz.png',
		renderTo:'left_menu1',
		href:'./flwbzbz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010409',
		title:'养护大中修路面结构参数',
		imgSrc:'../../images/jgcs.png',
		renderTo:'left_menu1',
		href:'./yhdzxlmcs.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010410',
		title:'危桥补助标准',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./wqbzbz.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010411',
		title:'月报上报时间点',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./ybsjd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010412',
		title:'月报上报默认时间点',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./ybmrsjd.jsp'
	});
	createMenu('LeftMenu',{
		id:'menu_010413',
		title:'危桥奖励标准',
		imgSrc:'../../images/wq.png',
		renderTo:'left_menu1',
		href:'./wqjlbz.jsp'
	});
	
	createMenu('LeftMenu',{
		id:'menu_010414',
		title:'项目筛选',
		imgSrc:'../../images/bzbz.png',
		renderTo:'left_menu1',
		href:'./xmss.jsp'
	});*/
	menuQx();
});
function menuQx(){
	var qx=getQxfromSession('qx2').split(",");
	for(var i=0;i<qx.length;i++){
		if($("#menu_"+qx[i])!=null) $("#menu_"+qx[i]).show();
	}
}