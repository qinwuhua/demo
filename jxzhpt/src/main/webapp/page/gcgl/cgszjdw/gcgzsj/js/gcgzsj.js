var obj=new Object();
var obj1=new Object();
function dingwei(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	locationXm(data.plan_lx_gcsjs[0].lxbm,"");
}
function wqxiangxi(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.Var.jhbm=data.id;
	YMLib.UI.createWindow('gclmsj_xx','工程改造路面升级项目计划详情',"/jxzhpt/page/jhgl/jhkxx/gclmsj.jsp",'gclmsj_xx',1000,500);
	//window.open("gcgzsjxx.jsp");
}
function zjdw(index){
	var data=$("#datagrid").datagrid('getRows')[index];
	obj1=data;
	YMLib.UI.createWindow('wqxx1','车购税资金到位情况','gcgzsjzjdw.jsp','wqxx1',800,500);
	//window.open("gcgzsjzjdw.jsp");
}
function closes(str){
	 parent.$('#'+str).window('destroy');
}
function addCgs(){
	YMLib.UI.createWindow('wqxx','车购税资金到位添加','gcgzsjzjdwtj.jsp','wqxx',550,250);
}
function editCgs(index){
	var data=$("#zjgrid").datagrid('getRows')[index];
	obj=data;
	YMLib.UI.createWindow('wqxx','车购税资金到位编辑','gcgzsjzjdwxg.jsp','wqxx',550,250);
}

//添加车购税
function tjgcgzsjcgs(){
	var myDate = new Date();
	var y = myDate.getFullYear();
	var m = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
	var d = myDate.getDate();
	tbsj = y+"-"+m+"-"+d;
	tbyf = y+"-"+m;
	if($("#tj_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglgcgzsj.cgsdwzj="+$("#tj_cgsdwzj").val()+"&gcglgcgzsj.tbr="+$.cookie("truename")+"&gcglgcgzsj.tbsj="+tbsj+"&gcglgcgzsj.tbyf="+$("#tj_tbyf").val()+"&gcglgcgzsj.cscyj="+$("#tj_cscyj").val()+"&gcglgcgzsj.stz="+$("#tj_stz").val()
	+"&gcglgcgzsj.jhid="+parent.parent.obj1.id;
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/insertGcgzsjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('该月车购税可能已存在，保存失败！');
			}
		}
	});	
	
}
//修改车购税
function xggcgzsjcgs(){
	if($("#xg_cgsdwzj").val()==''){
		alert("请您填入本月资金");
		return;
	}
	var data="gcglgcgzsj.cgsdwzj="+$("#xg_cgsdwzj").val()
	+"&gcglgcgzsj.jhid="+parent.obj.jhid+"&gcglgcgzsj.id="+parent.obj.id+"&gcglgcgzsj.tbyf="+$("#xg_tbyf").val()+"&gcglgcgzsj.cscyj="+$("#xg_cscyj").val()+"&gcglgcgzsj.stz="+$("#xg_stz").val();
	//alert(data);
	$.ajax({
		type:'post',
		url:'../../../../gcgl/updateGcgzsjCgs.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(Boolean(msg)){
				alert('保存成功！');
				parent.$("#zjgrid").datagrid('reload');
				parent.shezhi();
				closes('wqxx');
			}else{
				alert('保存失败！');
			}
		}
	});	
	
}
function delCgs(index){
	var data1=$("#zjgrid").datagrid('getRows')[index];
	var data="gcglgcgzsj.id="+data1.id;
	if(confirm("确认删除吗？")){
		$.ajax({
			type:'post',
			url:'../../../../gcgl/deleteGcgzsjCgs.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(Boolean(msg)){
					alert('删除成功！');
					$("#zjgrid").datagrid('reload');
					shezhi();
				}else{
					alert('删除失败！');
				}
			}
		});	
	}	
}

function showAll(){
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

	var jgzt='0';
	var kgzt='';
	var xmnf=$("#ddlYear").val();
	var bfyf=$("#ddlMonth").val();
	var lxmc=$("#lxmc").val();
	$('#datagrid').datagrid({    
	    url:'../../../../gcgl/selectGcgzsjjhList1.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:$(window).height()-$(window).height()*0.22,
	    width:$(window).width()-$(window).width()*0.019,
	    queryParams: {
	    	gydw: gydwstr,
	    	kgzt: kgzt,
	    	jgzt:jgzt,
	    	lxmc:lxmc,
	    	ybzt:'',
	    	sfsj:7,
	    	xmnf:xmnf,
	    	bfyf:bfyf,
	    	bfzt:$("#bfzt").val()
		},
	    columns:[[
	         {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
  				return '<a style="text-decoration:none;color:#3399CC;" href="#" onclick="dingwei('+index+')">定位</a>     '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="wqxiangxi('+index+')">详细</a>    '+'<a style="text-decoration:none;color:#3399CC;" href="#" onclick="zjdw('+index+')">资金拨付</a>   ';
  			}},
  			 {field:'jhnf',title:'上报年份',width:80,align:'center'},
 	        {field:'xmmc',title:'项目名称',width:200,align:'center'},
 	        {field:'c5',title:'管养单位',width:200,align:'center',formatter:function(value,row,index){
 		    	return row.plan_lx_gcsjs[0].gydw;
 		    }},
 		  	{field:'jhkgsj',title:'计划开工时间',width:100,align:'center'},
 		  	{field:'jhwgsj',title:'计划完工时间',width:100,align:'center'},
 		    {field:'pftz',title:'批复总投资',width:80,align:'center'},
 		    {field:'jhsybbzje',title:'部补助资金',width:80,align:'center'},
 		    {field:'jhsydfzczj',title:'地方自筹资金',width:80,align:'center'}
	    ]] ,
	    view: detailview,
		detailFormatter:function(index,row){   
	        return '<div style="padding:2px"><table id="table_lx' + index + '"></table></div>';   
	    },
	    onExpandRow: function(index,row){
	    	$('#table_lx'+index).datagrid({
	    		data:row.plan_lx_gcsjs,
    			columns:[[
    			    {field:'gydw',title:'管养单位',width:200,align:'center'},
    			    {field:'xzqhmc',title:'行政区划名称',width:100,align:'center'},
    			    {field:'lxmc',title:'路线名称',width:100,align:'center'},
    			    {field:'lxbm',title:'路线编码',width:100,align:'center'},
    			    {field:'qdzh',title:'起点桩号',width:60,align:'center'},
    			    {field:'zdzh',title:'止点桩号',width:60,align:'center'},
    			    {field:'xmlc',title:'项目里程',width:60,align:'center'}
    			]]
	    	});
	    }
	}); 
}

function showAllZJ(){
	var jhid=parent.obj1.id;
	$('#zjgrid').datagrid({    
		url:'../../../../gcgl/selectGcgzsjCgsList.do',
	    striped:true,
	    pagination:true,
	    rownumbers:true,
	    pageNumber:1,
	    pageSize:10,
	    height:315,
	    queryParams: {
	    	jhid: jhid
		},
	    columns:[[
				{field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
					if(row.sbsj==""||row.sbyf>row.tbyf){
		        		return '<a href="#" onclick="editCgs('+index+')">编辑</a>    '+'<a href="#" onclick="delCgs('+index+')">删除</a>   ';
		        	}
		        	else return '编辑   '+'删除';
				}},
				{field:'tbyf',title:'填报月份 ',width:100,align:'center'},
				{field:'tbsj',title:'填报时间 ',width:120,align:'center'},
				{field:'tbr',title:'填报人 ',width:80,align:'center'},
				{field:'cgsdwzj',title:'拨付车购税(万元)',width:100,align:'center'},
				{field:'stz',title:'省投资(万元)',width:100,align:'center'},
				{field:'cscyj',title:'财审处意见',width:100,align:'center'}
	    ]]    
	}); 
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
		page : '../../upload.jsp?url='+"/jxzhpt/gcgl/uploadGcgzsjFile.do"+'&flag='+'gljsjyhgl%2fgcgzsj%2fgcgzsjxx'+'&type='+str+'&jhid='+parent.obj1.id,
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

//function downFile(str){
//	if($("#xz_"+str).text()=='下载附件'){
//		parent.window.location.href="../../../../gcgl/downGcgzsjFile.do?type="+str+"&jhid="+parent.obj1.id;
//	}
//	else return;
//}
function deleteFile(str){
	if($("#xz_"+str).text()=='暂无附件'){
		return;
	}
	if(confirm("确认删除吗？")){
	var data="jhid="+parent.obj1.id+"&type="+str;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/deleteGcgzsjFile.do',
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
		url:'../../../../gcgl/selectGcgzsjjhFile.do',
		data:data,
		dataType:'json',
		async:false,
		success:function(msg){
			if(msg.sgxkwj!=''){
				$("#xz_sgxkwj").text(msg.sgxkwj);
				$("#xz_sgxkwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_sgxkwj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=sgxkwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgtcwj!=''){
				$("#xz_jgtcwj").text(msg.jgtcwj);
				$("#xz_jgtcwj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgtcwj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=jgtcwj'+"&jhid="+parent.obj1.id);
			}
			if(msg.jgyswj!=''){
				$("#xz_jgyswj").text(msg.jgyswj);
				$("#xz_jgyswj").attr("style",'color: #2C7ED1;cursor:pointer;');
				$("#xz_jgyswj").attr("href",'/jxzhpt/gcgl/downGcgzsjFile.do?type=jgyswj'+"&jhid="+parent.obj1.id);
			}
			}
	});	
}


function shezhi(){
	var data="gcglwqgz.jhid="+parent.obj1.id+"&gcglwqgz.nf="+new Date().getFullYear()+"&gcglwqgz.id="+parent.obj1.id;
	$.ajax({
		type:'post',
		url:'../../../../gcgl/selectWqgzbzzj.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.zbfzj=='')
				$("#zbfzj").text('0');
			else
				$("#zbfzj").text(msg.zbfzj);
			if(msg.nbfzj=='')
				$("#nbfzj").text('0');
			else
				$("#nbfzj").text(msg.nbfzj);
			if(msg.nxdzj=='')
				$("#nxdzj").text('0');
			else
				$("#nxdzj").text(msg.nxdzj);
			if(msg.zxdzj=='')
				$("#jhxdzj").text('0');
			else
				$("#jhxdzj").text(msg.zxdzj);
		}
	});	
}