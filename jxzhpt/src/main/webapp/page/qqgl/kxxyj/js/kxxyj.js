
function showkxxTjxx(xmlx){
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
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	if(xmlx!='xj')
	var lsjl=$("#lsjl").combobox('getValue');
	else lsjl='';
	var xmlx1='';
	if(xmlx=='gsdgz'){
		xmlx1=$("#xmlx").combobox("getValues").join(",");
		if(xmlx1.substr(0,1)==',')
			xmlx1=xmlx1.substr(1,xmlx1.length);
	}
var  data='lxsh.lsjl='+lsjl+'&lxsh.xmlx1='+xmlx1+'&lxsh.xzqh='+xzqhstr+'&lxsh.gydw='+gydwstr
+'&lxsh.xmmc='+xmmc+'&lxsh.xmnf='+xmnf+'&lxsh.tsdq='+tsdq+'&lxsh.jsdj='+jsdj
+'&lxsh.gldj='+gldj+'&lxsh.ghlxbh='+$("#lxbm").val()+'&lxsh.lxmc='+$("#lxmc").val()+'&lxsh.xmlx='+xmlx;
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/showkxxTjxx.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$('#xmsl').html(msg.sl);
				$('#tz').html(msg.tz);
				$('#lc').html(msg.lc);
				$('#bzcs').html(msg.bzcs);
			}else{
				$('#xmsl').html('0');
				$('#tz').html('0');
				$('#lc').html('0');
				$('#bzcs').html('0');
			}
			
		}
	});
}

function showkxxtzTjxx(xmlx){
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
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	if(xmlx!='xj')
	var lsjl=$("#lsjl").combobox('getValue');
	else lsjl='';
var  data='lxsh.lsjl='+lsjl+'&lxsh.xzqh='+xzqhstr+'&lxsh.gydw='+gydwstr
+'&lxsh.xmmc='+xmmc+'&lxsh.xmnf='+xmnf+'&lxsh.tsdq='+tsdq+'&lxsh.jsdj='+jsdj
+'&lxsh.gldj='+gldj+'&lxsh.ghlxbh='+$("#lxbm").val()+'&lxsh.lxmc='+$("#lxmc").val()+'&lxsh.xmlx='+xmlx+'&lxsh.tzxz='+$("#tzxz").combobox("getValue");
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/showkxxtzTjxx.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg!=null){
				$('#xmsl').html(msg.sl);
				$('#tz').html(msg.tz);
				$('#lc').html(msg.lc);
				$('#bzcs').html(msg.bzcs);
			}else{
				$('#xmsl').html('0');
				$('#tz').html('0');
				$('#lc').html('0');
				$('#bzcs').html('0');
			}
			
		}
	});
}

function jsyzlc(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#yilc').val()!='')
		yilc=parseFloat($('#yilc').val());
	if($('#erlc').val()!='')
		erlc=parseFloat($('#erlc').val());
	if($('#sanlc').val()!='')
		sanlc=parseFloat($('#sanlc').val());
	if($('#silc').val()!='')
		silc=parseFloat($('#silc').val());
	if($('#wllc').val()!='')
		wllc=parseFloat($('#wllc').val());
	if($('#dwlc').val()!='')
		dwlc=parseFloat($('#dwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#lc').val(hj5);
}
function jsjszlc(){
	var yilc=0;var erlc=0;var sanlc=0;var silc=0;var wulc=0;var dwlc=0;
	if($('#jhyilc').val()!='')
		yilc=parseFloat($('#jhyilc').val());
	if($('#jherlc').val()!='')
		erlc=parseFloat($('#jherlc').val());
	if($('#jhsanlc').val()!='')
		sanlc=parseFloat($('#jhsanlc').val());
	if($('#jhsilc').val()!='')
		silc=parseFloat($('#jhsilc').val());
	if($('#jhwllc').val()!='')
		wllc=parseFloat($('#jhwllc').val());
	if($('#jhdwlc').val()!='')
		dwlc=parseFloat($('#jhdwlc').val());
	var hj1=accAdd(yilc,erlc);var hj2=accAdd(sanlc,silc);var hj3=accAdd(wulc,dwlc);
	var hj4=accAdd(hj1,hj2);var hj5=accAdd(hj3,hj4);
	$('#jszlc').val(hj5);
}




var obj=new Object();
/**
 * 判断项目类型，返回文字
 * @param xmbm 项目编码
 * @result 返回项目类型
 */
function panduanxmlx(xmbm){
	var result="";
	var xmlx = xmbm.substring(10,11);
	if(xmlx=="1"){
		result="升级改造工程项目";
	}else if(xmlx=="2"){
		result="路面改造工程项目";
	}else if(xmlx=="3"){
		result="新建工程项目";
	}else if(xmlx=="4"){
		result="养护大中修项目";
	}else if(xmlx=="5"){
		result="水毁项目";
	}
	return result;
}
function xiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','sjgzsb_xx.jsp','lxxx',900,400);
}
function xiangxitz(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','sjgzsb_xx1.jsp','lxxx',900,400);
}
function edit(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑可行性研究信息','sjgzsb_edit.jsp','lxxx',900,400);
}
function shenh(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shsjgzkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shenh1(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shlmgzkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
function shenh2(index){
	var data1=$("#datagrid").datagrid('getRows')[index];
	var id=data1.id;
	if(confirm('您确定审核该项目？')){
		var data = "lxsh.id="+id;
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/qqgl/shxjkxx.do",
			 dataType : 'json',
			 data : data,
			 success : function(msg){
				 if(msg){
					 alert('审核成功！');
					 $("#datagrid").datagrid('reload');
				 }else{
					 alert('审核失败,请选择要上报项目！');
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
//
function xiangxi1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','lmgzsb_xx.jsp','lxxx',900,400);
}
function xiangxi1tz(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','lmgzsb_xx1.jsp','lxxx',900,400);
}
function edit1(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑可行性研究信息','lmgzsb_edit.jsp','lxxx',900,400);
}
//
function xiangxi2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','xjsb_xx.jsp','lxxx',900,400);
}
function xiangxi2tz(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','可行性研究详细信息','xjsb_xx1.jsp','lxxx',900,400);
}
function edit2(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('lxxx','编辑可行性研究信息','xjsb_edit.jsp','lxxx',900,400);
}
function removes(id){
	parent.$('#'+id).window('destroy');
}
function dingwei(index){
		var data=$("#datagrid").datagrid('getRows')[index];
		$.ajax({
			type:'post',
			url:'/jxzhpt/qqgl/selectlxbyxmid.do',
			data:"lxsh.xmbm="+data.xmbm+"&lxsh.jdbs=1",
			dataType:'json',
			success:function(msg){
				var lxbm="";
				var qdzh="";
				var zdzh="";
				for(var i=0;i<msg.length;i++){
					if(i==msg.length-1){
						lxbm=lxbm+msg[i].lxbm;
						qdzh=qdzh+msg[i].qdzh;
						zdzh=zdzh+msg[i].zdzh;
					}else{
						lxbm=lxbm+msg[i].lxbm+"-";
						qdzh=qdzh+msg[i].qdzh+"-";
						zdzh=zdzh+msg[i].zdzh+"-";
					}
				}
				locationXm1(lxbm,qdzh,zdzh);
			},
			error : function(){
			 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
		 }
	});	
}
function showsjgzAll(){
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
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValue');
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	            //if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
//	        {field:'c1',title:'上报状态',width:100,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '未上报';
//	        	else if(row.sbzt1=='1'||sbthcd==7)
//	        		return '已上报';
//	        	else return '未知';
//	        }},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'}

	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
					 	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delsjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
//lmgz
function showlmgzAll(){
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
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValue');
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	 //if(row.sbzt1=='1')
		        //		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    ';
		        return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
//	        {field:'c1',title:'上报状态',width:100,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '未上报';
//	        	else 
//	        		return '已上报';
//
//	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dellmlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
//xj
function showxjAll(){
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
	var sbthcd='';
	var yhjb=$.cookie("unit2");
	if(yhjb.length==11){
		sbthcd=11;
	}
	if(yhjb.length==9||yhjb.length==8){
		sbthcd=9;
	}
	if(yhjb.length<8&&yhjb.length>=2){
		sbthcd=7;
	}
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValue');
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValue');
	var gldj=$("#gldj").combobox('getValue');
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			sbthcd:sbthcd
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	 //if(row.sbzt1=='1')
		        //		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    ';
		        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
	        }},
//	        {field:'c1',title:'上报状态',width:100,align:'center',formatter:function(value,row,index){
//	        	if(row.sbzt1=='0')
//        		return '未上报';
//	        	else if(row.sbzt1=='1'||sbthcd==7)
//	        		return '已上报';
//	        	else return '未知';
//	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';
		        else if(row.sbzt1=='1')
	        		return '添加路线';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center'},
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'minqdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'maxzdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'}	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	parentindex=index;
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'c3',title:'删除',width:70,align:'center',formatter:function(value,row,index){
						   if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='0'){
						return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="delxjlx('+parentindex+','+index+')">删除</a>   ';
						   }if(($("#datagrid").datagrid('getRows')[parentindex].sbzt1)=='1')
							   return '删除';
					}},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
//升级审核
function showAllsjsh(){
	
	showkxxTjxx('sjgz');
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").val(),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
	        	if($.cookie("unit2").length!=7)
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑 ';

	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  <a href="javascript:tz('+"'"+row.xmbm+"','sjgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjsjlx('+index+')">添加路线</a>   ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0'){
	        		if($.cookie("unit2").length!=7)
	        			return '未审核';
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	}else if(row.sbzt1=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'jszlc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
var xmbm;
var xmlx;
function tz(id,lx){
	xmbm=id;
	xmlx=lx;
	YMLib.UI.createWindow('wq_tz','项目变更',"xm_tz.jsp",'wq_tz',500,200);
}

function editSjlx(xmid,index){
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线信息','sjgzlx_add.jsp','lxxx',900,350);
}
//lm
function showAlllmsh(){
	showkxxTjxx('lmgz');
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").val(),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    ';
	        	if($.cookie("unit2").length!=7)
		        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑  ';

	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>   <a href="javascript:tz('+"'"+row.xmbm+"','lmgz'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjlmlx('+index+')">添加路线</a>   ';
		       
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0'){
	        		if($.cookie("unit2").length!=7)
	        			return '未审核';
	            		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';

	        	}
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},
	        
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
function editGzlx(xmid,index){
	var data=$("#table_lx"+xmid).datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.UI.createWindow('lxxx','编辑路线信息','lmgzlx_add.jsp','lxxx',900,350);
}
//xj
function showAllxjsh(){
	showkxxTjxx('xj');
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	
	var tsdq=$("#tsdq").combobox("getValues").join(",");
	if(tsdq.substr(0,1)==',')
		tsdq=tsdq.substr(1,tsdq.length);
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj,
			'lxsh.ghlxbh':$("#lxbm").val(),
			'lxsh.lxmc':$("#lxmc").val()
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    ';
	        	if($.cookie("unit2").length!=7)
		        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+' 编辑 ';

	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  <a href="javascript:tz('+"'"+row.xmbm+"','xj'"+')" style="text-decoration:none;color:#3399CC; ">变更</a>';
	        }},
	        {field:'c2',title:'添加路线',width:70,align:'center',formatter:function(value,row,index){
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="tjxjlx('+index+')">添加路线</a>   ';

	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0'){
	        		if($.cookie("unit2").length!=7)
	        			return '未审核';
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';

	        	}
	        	else if(row.sbzt1=='1')
	        		return '已审核';
	        }},
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'},
		    {field : 'gkpfwh',title : '工可批复文号',width : 190,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}
//
function fileShow(xmbm,type){
	$.ajax({
		type:'post',
//		url:'/jxzhpt/qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#gkpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'>" +
					'<a href="javascript:downFile('+"'"+data[i].fileurl.replace(/\\/g,"%2F")+"',"+"'"+data[i].filename+"'"+')" style="text-decoration:none;color:#3399CC;">下载</a>  |  ' +
					"<a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"')>删除</a></td></tr>";
					$("#gkpfTable").append(tr);
				}
			}
		}
	});
}
function fileShow1(xmbm,type){
	$.ajax({
		type:'post',
//		url:'../../../qqgl/queryFileByXmbm.do',
//		data:'file.parentid='+xmbm+'&file.filetype='+type,
//		dataType:'json',
		url:'/jxzhpt/jhgl/queryFjByParentId.do',
		dataType:'json',
		data:'uploads.id='+xmbm,
		success:function(data){
			$("#gkpfTable").empty();
			for ( var i = 0; i < data.length; i++) {
				if(data[i].filetype==type){
				var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  </td></tr>";
				$("#gkpfTable").append(tr);
				}
			}
		}
	});
}
/**
 * 下载文件
 * @param id 文件ID
 */
function downFile(fileurl,filename){
	parent.window.location.href="/jxzhpt/jhgl/downAbgcFile.do?uploads.fileurl="+fileurl+"&uploads.filename="+filename;
}
/**
 * 删除文件
 * @param id 文件ID
 */
function deleteFile(id){
	if(confirm('确定删除所选数据？')){
		$.ajax({
			 type : "POST",
			 url : "/jxzhpt/jhgl/deleteFile.do",
			 dataType : 'json',
			 data : 'uploads.id=' +id,
			 success : function(msg){
				 if(msg){
					 alert('删除成功！');
					 fileShow(parent.obj.xmbm,'工可批复文件');
				 }else{
					 YMLib.Tools.Show('删除失败,请选择要删除数据！',3000);
				 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
}
//
function xmny(id){
	$('#'+id).datebox({    
	    required:false,
	    formatter:function(date){
	    	var y = date.getFullYear();
	    	var m = date.getMonth()+1;
	    	return y+'-'+m;
	    }
	});  
	
}
function xmsj(id){
	$('#'+id).datebox({    
	    required:false,
	    formatter:function(date){
	    	var y = date.getFullYear();
	    	var m = date.getMonth()+1;
	    	var d = date.getDate();
	    	return y+'-'+m+'-'+d;
	    }
	});  
}

function selectTSDQ(lxbm,qdzh,zdzh){
	$("#tsdq").text("");
	var data="lxbm="+lxbm+"&qdzh="+qdzh+"&zdzh="+zdzh;
	$.ajax({
		type:'post',
		url:'/jxzhpt/xmjck/selectTSDQ.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				var tsdqstr="";
				for(var i=0;i<msg.length;i++){
					tsdqstr=tsdqstr+msg[i]+"、";
				}
				tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
				$("#tsdq").text(tsdqstr);
			}
		}
	});	
}
function getbzcs(gldj,jsdj,lc,xmlx){
	var data="lxsh.xmlx="+xmlx+"&lxsh.gldj="+gldj+"&lxsh.jsdj="+jsdj+"&lxsh.lc="+lc;
	$("#bzcs").html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/selectbzcs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			$("#bzcs").html(msg.bzys);
		},
		error : function(){
		 YMLib.Tools.Show('未检索到补助标准错误！error code = 404',3000);
	 }
	});	
}
function tjsjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','sjgzlx_add2.jsp','lxxx',900,400);
}
function tjlmlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	YMLib.Var.Obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','lmgzlx_add2.jsp','lxxx',900,400);
}
function tjxjlx(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj=data;
	YMLib.Var.sq='sq';
	YMLib.UI.createWindow('lxxx','添加路线信息','xjlx_add.jsp','lxxx',900,400);
}
function delsjlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=sjgz"+"&lxsh.jdbs=0",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showsjgzAll();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}

function dellmlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=lmgz",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showlmgzAll();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}
function delxjlx(index1,index){
	var data=$("#table_lx"+index1).datagrid('getRows')[index];
	//alert(data.xmbm+"--"+data.id);
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/deleteLx.do',
        data:'lxsh.xmbm='+data.xmbm+'&lxsh.id='+data.id+"&lxsh.xmlx=xj",
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert("删除成功！");
				showxjAll();
				removes('lxxx');
			}else{
				alert('删除失败！');
			}
		}
	});
}

function cxqdmc(lxbm,qdzh){
	$('#qdmc').html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxqdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#qdmc').html(msg.qdmc);
		}
	});
}
function cxzdmc(lxbm,qdzh){
	$('#zdmc').html('');
	$.ajax({
		type:'post',
		url:'/jxzhpt/qqgl/cxzdmc.do',
        data:'lxsh.ghlxbh='+lxbm+'&lxsh.qdzh='+qdzh,
		dataType:'json',
		success:function(msg){
			$('#zdmc').html(msg.zdmc);
		}
	});
}

function importsjgzkxx(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '工可信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importsjgzkxx.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

function importlmgzkxx(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '工可信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importlmgzkxx.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}

function importxjkxx(flag){
	var weatherDlg = new J.dialog( {
		id : 'id1',
		title : '工可信息导入',
		page : 'upload.jsp?url='+"/jxzhpt/qqgl/importxjkxx.do"+'&flag='+flag,
		width : 570,
		height : 440,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	weatherDlg.ShowDialog();
	return false;
}
//----------------------------------------------------------
function showAlllmsh__ck(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectLmgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	     /*   {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'编辑    ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi1('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit1('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.shzt=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh1('+index+')">未审核</a>';
	        	else if(row.shzt=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editGzlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function showAllsjsh__ck(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	var lsjl=$("#lsjl").combobox('getValue');
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectSjgzkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	lsjl:lsjl,
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	        /*{field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'编辑    ';
		        return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh('+index+')">未审核</a>';
	        	else if(row.sbzt1=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + row.xmbm + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+row.xmbm).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
					/*{field:'cz',title:'操作',width:150,align:'center',
						formatter: function(value,row,index){
							return '<a href="javascript:editSjlx('+"'"+row.xmid+"',"+"'"+index+"'"+')" style="color:#3399CC;">编辑</a>';
						}
					},*/
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}

function showAllxjsh__ck(){
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
	
	var xmmc=$("#xmmc").val();
	var xmnf=$("#xmnf").combobox('getValues').join(",");
	
	var tsdq=$("#tsdq").combobox('getText');
	if(tsdq=='全部'){
		tsdq="";
	}
	var jsdj=$("#jsdj").combobox('getValues').join(",");
	var gldj=$("#gldj").combobox('getValues').join(",");
	
	$('#datagrid').datagrid({    
	    url:'/jxzhpt/qqgl/selectXjkxList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    checkOnSelect:true,
	    height:$(window).height()-160,
	    width:$(window).width()-30,
	    queryParams: {
	    	xzqh:xzqhstr,
	    	gydw:gydwstr,
	    	xmmc:xmmc,
			xmnf:xmnf,
//			sbzt:sbzt,
			tsdq:tsdq,
			jsdj:jsdj,
			gldj:gldj
		},
	    columns:[[
	        {field:'allSel',title:'全选',width:60,align:'center',checkbox:'true'},
	      /*  {field:'c',title:'操作',width:200,align:'center',formatter:function(value,row,index){
	        	//if(row.sbzt1=='1')
	        	//	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'编辑    ';
	        	return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>   '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="xiangxi2('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="edit2('+index+')">编辑</a>  ';
	        }},
	        {field:'c1',title:'审核状态',width:60,align:'center',formatter:function(value,row,index){
	        	if(row.sbzt1=='0')
	        		return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="shenh2('+index+')">未审核</a>';
	        	else if(row.sbzt1=='1')
	        		return '已审核';
	        }},*/
	        {field:'lsjl',title:'是否有历史记录',width:150,align:'center',
				formatter: function(value,row,index){
					if(value=="是"){
						return '<a href="javascript:openLsjl('+"'"+row.xmbm+"'"+')" style="color:#3399CC;">是</a>';
					}else{
						return value;
					}
				}
			},
	        {field : 'xmmc',title : '项目名称',width : 220,align : 'center',
				formatter: function(value,row,index){
	        		if(Number(row.xmsl)>1){
	        			return '<label style="color:red;">'+value+'</label>';
	        		}else{
	        			return value;
	        		}
	        	}
	        },
		    {field : 'xmbm',title : '项目编码',width : 120,align : 'center'}, 
		    {field : 'xzqh',title : '行政区划',width : 180,align : 'center'},
		    {field : 'lxbh',title : '路线编号',width : 100,align : 'center'},
		    {field : 'qdzh',title : '起点桩号',width : 100,align : 'center'},
		    {field : 'zdzh',title : '止点桩号',width : 100,align : 'center'},
		    {field : 'lc',title : '里程',width : 100,align : 'center'},
		    {field:'jsjsdj',title:'建设技术等级',width:100,align:'center'},
		    {field : 'kgny',title : '开工年月',width : 100,align : 'center'},
		    {field : 'wgny',title : '完工年月',width : 100,align : 'center'}
	    ]],
		view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		url:'/jxzhpt/qqgl/selectlxList.do',
	    		 queryParams: {
	    			 'lx.jdbs':1,
	    			 'lx.xmid':row.xmbm,
	    			 'lx.sffirst':'1'
	    			},
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:150,align:'center'},    
    			    {field:'xzqh',title:'行政区划',width:150,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:120,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:80,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:80,align:'center'},
    			    {field:'qdmc',title:'起点名称',width:100,align:'center'},
    			    {field:'zdmc',title:'止点名称',width:100,align:'center'},
    			    {field:'jsjsdj',title:'建设技术等级',width:80,align:'center'},
    			    {field:'xjsdj',title:'现技术等级',width:80,align:'center'},
    			    {field:'lc',title:'里程',width:60,align:'center'},
    			    {field:'bzys',title:'补助测算',width:60,align:'center'}
    			]]
	    	});
	    }   
	}); 
}