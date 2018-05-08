
//下达文号多选
function loadjhxdwh(id,xmlx){
	$.ajax({
		data:'type='+xmlx,
		type:'post',
		dataType:'json',
		async:false,
		url:'/jxcsxm/xtgl/getjhxdwh.do',
		success:function(msg){
			
			//开始
			var years=[];
			years.push({text:'全部',value:''});
			if(msg!=null)
			for ( var i = 0; i < msg.length; i++) {
				years.push({text:msg[i].text,value:i+1});
			}
			
			$('#'+id).combobox({
			    data:years,
			    valueField:'value',
			    textField:'text',
			    multiple:true,
			    editable:false,
			    formatter:function(row){
					var opts = $(this).combobox('options');
					return '<input id="id'+row.value+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.value);
							$('#id'+item.value).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#id'+record.value).attr('checked', true);
					}
				},
				onUnselect:function(record){
					var opts = $(this).combobox('options');
					var datas = $('#' +id).combobox("getData");
					var values = $('#' +id).combobox("getValues");
					$('#' +id).combobox("clear");
					if(record[opts.valueField]!=""){
						if(jQuery.inArray("",values)>=0){
							values.splice(jQuery.inArray("",values),1);
						}
						$.each(datas,function(index,item){
							if(jQuery.inArray(""+item.value,values)<0){
								$('#id'+item.value).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#id'+item.value).attr('checked', false);
						});
					}
				}
			});
			
			
			//$('#'+id).combobox("setText",'全部');
			//$('#id全部').attr('checked', true);
		}
		
	});
}

/**
 * 绑定easy-ui的datagrid表格
 * @param grid datagrid配置对象
 */
function gridBind(grid){
	gridObj = $('#'+grid.id).datagrid({
	    url:grid.url,
	    queryParams:grid.queryParams,
	    striped:grid.striped,
	    pagination:grid.pagination,
	    rownumbers:grid.rownumbers,
	    pageNumber:grid.pageNumber,
	    pageSize:grid.pageSize,
	    height:grid.height,
	    width:grid.width,
	    columns:grid.columns,
	    onSelect:Data.onSelect,
	    onSelectAll:Data.onSelectAll,
	    onUnselect:Data.onUnselect,
	    onClickRow:Data.onClickRow,
	    onLoadSuccess:Data.onLoadSuccess,
	    view:grid.view
	   
	 
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.98});
}

var gridObj;//datagrid 对象
var Data={
		onLoadSuccess:function(data){
		},
		onClickRow:function(rowIndex, rowData){
		},
		onSelect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.push(rowData.xmbm);
		},
		onSelectAll:function(rows){
			if(selArray.length<rows.length){
				selArray.splice(0,selArray.length);
				$.each(rows,function(index,item){
					selArray.push(item.xmbm);
				});
			}else if(selArray.length==rows.length){
				selArray.splice(0,selArray.length);
			}
		},
		onUnselect:function(rowIndex, rowData){
			xmbm=rowData.xmbm;
			selArray.pop(rowData.xmbm);
		}
		
	};

//打开资金到位页面
function openZjdw(xmbm,gydwdm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.xmlx=xmlx;
	YMLib.Var.gydwdm=gydwdm;
	openWindow("资金到位详情","/jxcsxm/page/zjdw/zjdw.jsp",1000,450);
}
//打开资金拨付页面
function openZjbf(xmbm,gydwdm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.xmlx=xmlx;
	YMLib.Var.gydwdm=gydwdm;
	openWindow("资金拨付详情","/jxcsxm/page/zjbf/zjbf.jsp",1050,450);
}

//打开调剂拨付
function openTjBf(xmbm,trxmbm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.trxmbm=trxmbm;
	YMLib.Var.xmlx=xmlx;
	YMLib.UI.createWindow('mywin','关联计划','/jxcsxm/page/zjtj/zjbf/zjbf.jsp','mywin',1000,450);	
}

//打开资金调剂页面
function openZjtj(xmbm,gydwdm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.xmlx=xmlx;
	YMLib.Var.gydwdm=gydwdm;
	openWindow("资金调剂详情","/jxcsxm/page/zjtj/xmzjtj/zjtjxq.jsp",1050,450);
}

//打开查看项目详情页面
function openXmInfo(xmbm,xmlx,xmjd){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.xmlx=xmlx;
	
	if(xmjd=='jhcx')
	openWindow("项目详情","/jxcsxm/page/jhcx/gs/xmInfo.jsp",1000,360);
	if(xmjd=='zjdw')
	openWindow("项目详情","/jxcsxm/page/jhcx/gs/xmInfodw.jsp",1000,420);
	if(xmjd=='zjbf')
	openWindow("项目详情","/jxcsxm/page/jhcx/gs/xmInfobf.jsp",1000,420);
	if(xmjd=='zjtj')
	openWindow("项目详情","/jxcsxm/page/jhcx/gs/xmInfotj.jsp",1000,420);
}
//打开查看项目详情页面
function openXmInfoDt(xmbm,xmlx,xmjd){
	parent.YMLib.Var.xmbm=xmbm;
	parent.YMLib.Var.xmlx=xmlx;
	if(xmjd=='jhcx')
	openWindowDt("项目详情","/jxcsxm/page/jhcx/gs/xmInfo.jsp",1000,450);
	if(xmjd=='zjdw')
	openWindowDt("项目详情","/jxcsxm/page/jhcx/gs/xmInfodw.jsp",1000,450);
	if(xmjd=='zjbf')
	openWindowDt("项目详情","/jxcsxm/page/jhcx/gs/xmInfobf.jsp",1000,450);
}
function openWindowDt(title,jsp,width,height){
	parent.YMLib.UI.createWindow('mywin',title,jsp,'mywin',width,height);	
}
function openWindow(title,jsp,width,height){
	YMLib.UI.createWindow('mywin',title,jsp,'mywin',width,height);	
}
function closeWindow(){
	parent.$('#mywin').window('destroy');
}

//打开关联计划
function openGljh(xmbm,trxmbm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.trxmbm=trxmbm;
	YMLib.Var.xmlx=xmlx;
	YMLib.UI.createWindow('mywin','关联计划','/jxcsxm/page/zjtj/gljh/gljh.jsp','mywin',1000,450);	
}


//创建表头tree
function createBtTree(id,treeno,ssbb){

	$('#'+id).tree({    
	    url: '/jxcsxm/tjbb/createBtTree.do?treeno='+treeno+'&ssbb='+ssbb, 
	    checkbox: true, 
	    loadFilter: function(data){    
	        if (data.d){    
	            return data.d;    
	        } else {    
	            return data;    
	        }    
	    }    
	});  

}
//创建表头tree通过json地址
function createJsontree(id,url){
	$('#'+id).tree({    
	    url: url, 
	    checkbox: true, 
	    loadFilter: function(data){    
	        if (data.d){    
	            return data.d;    
	        } else {    
	            return data;    
	        }    
	    }
	});  

}

function getValuesById(id){
	var value=$("#"+id).combo("getValues").join(",");
	if(value.substr(0,1)==',')
		value=value.substr(1,value.length);
	return value;
}

//批量审核到位
function plshdw(){
	var rows;var _id="";
	rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请勾选记录！");
		return;
	}
	
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt<=0){
			alert('请勾选未审核的记录！');
			return;
		}
	}
	_id=rows[0].xmbm;
	for(var i=1;i<rows.length;i++){
		_id+=","+rows[i].xmbm;
	}
	var data="shzt=已审核&xmbm="+_id;
	if(confirm("您确认批量审核吗？"))
		//return;
		$.ajax({
			type:'post',
			url:'/jxcsxm/zjdw/plshdw.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("审核成功");
					loadTj();
					$("#grid").datagrid('reload');
				}else{
					alert("审核失败");
				}
				
			}
		});
	
	
}

//批量上报到位县级
function plsbdwxj(){
	var rows;var isMore=false;var _id="";
	rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请勾选记录！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].xsbzt>0){
			_id+=","+rows[i].xmbm;
		}else{
			alert("所选项目资金到位必须为未上报");
			return;
		}
		
	}
	if($.cookie('zgx').indexOf(rows[0].gydwdm)!=-1)
	data="xsbzt=已上报&ssbzt=已上报&sbthcd=7&sfth=否&thyy=&id="+_id.substr(1,_id.length);	
	else
	data="xsbzt=已上报&sbthcd=9&sfth=否&thyy=&id="+_id.substr(1,_id.length);
	
	if(confirm("您确认上报吗？"))
		
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjdw/plsbdwxj.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("上报成功");
				$("#grid").datagrid('reload');
				loadTj();
			}else{
				alert("上报失败");
			}
			
		}
	});
	
	
}

//批量上报到位市级
function plsbdwsj(){
	var rows;var isMore=false;var _id="";
	rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请勾选记录！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].ssbzt>0){
			_id+=","+rows[i].xmbm;
		}else{
			alert("所选项目资金到位必须为未上报");
			return;
		}
		
	}
	
	data="xsbzt=已上报&ssbzt=已上报&sbthcd=7&sfth=否&thyy=&id="+_id.substr(1,_id.length);	
	
	if(confirm("您确认上报吗？"))
		
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjdw/plsbdwsj.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("上报成功");
				$("#grid").datagrid('reload');
				loadTj();
			}else{
				alert("上报失败");
			}
			
		}
	});
	
	
}

//批量审核拨付
function plshbf(){
	var rows;var _id="";
	rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请勾选记录！");
		return;
	}
	
	for(var i=0;i<rows.length;i++){
		if(rows[i].shzt<=0){
			alert('请勾选未审核的记录！');
			return;
		}
	}
	_id=rows[0].xmbm;
	for(var i=1;i<rows.length;i++){
		_id+=","+rows[i].xmbm;
	}
	var data="shzt=已审核&xmbm="+_id;
	if(confirm("您确认批量审核吗？"))
		//return;
		$.ajax({
			type:'post',
			url:'/jxcsxm/zjbf/plshbf.do',
			data:data,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("审核成功");
					loadTj();
					$("#grid").datagrid('reload');
				}else{
					alert("审核失败");
				}
				
			}
		});
}



//批量上报拨付县级
function plsbbfxj(){
	var rows;var isMore=false;var _id="";
	rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请勾选记录！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].xsbzt>0){
			_id+=","+rows[i].xmbm;
		}else{
			alert("所选项目资金拨付必须为未上报");
			return;
		}
		
	}
	if($.cookie('zgx').indexOf(rows[0].gydwdm)!=-1)
	data="xsbzt=已上报&ssbzt=已上报&sbthcd=7&sfth=否&thyy=&id="+_id.substr(1,_id.length);	
	else
	data="xsbzt=已上报&sbthcd=9&sfth=否&thyy=&id="+_id.substr(1,_id.length);
	
	if(confirm("您确认上报吗？"))
		
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjbf/plsbbfxj.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("上报成功");
				$("#grid").datagrid('reload');
				loadTj();
			}else{
				alert("上报失败");
			}
			
		}
	});
	
	
}

//批量上报拨付市级
function plsbbfsj(){
	var rows;var isMore=false;var _id="";
	rows=$('#grid').datagrid('getSelections');
	if(rows.length==0) {
		alert("请勾选记录！");
		return;
	}
	for(var i=0;i<rows.length;i++){
		if(rows[i].ssbzt>0){
			_id+=","+rows[i].xmbm;
		}else{
			alert("所选项目资金拨付必须为未上报");
			return;
		}
		
	}
	
	data="xsbzt=已上报&ssbzt=已上报&sbthcd=7&sfth=否&thyy=&id="+_id.substr(1,_id.length);	
	
	if(confirm("您确认上报吗？"))
		
	$.ajax({
		type:'post',
		url:'/jxcsxm/zjbf/plsbbfsj.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg){
				alert("上报成功");
				$("#grid").datagrid('reload');
				loadTj();
			}else{
				alert("上报失败");
			}
			
		}
	});
	
	
}







function newGuid()
{
    var guid = "";
    for (var i = 1; i <= 32; i++){
      var n = Math.floor(Math.random()*16.0).toString(16);
      guid +=   n;
    }
    return guid;    
}

//显示文件带删除的。
function fileShowdsc(fid,tableTyple){
	$.ajax({
		type:'post',
		url:'/jxcsxm/zcgl/queryFjByfid.do',
		dataType:'json',
		data:'myFile.fid='+fid,
		success:function(data){
			$("#"+tableTyple).empty();
			for ( var i = 0; i < data.length; i++) {
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a>  |  <a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=deleteFile('"+data[i].id+"','"+fid+"','"+tableTyple+"','id"+"')>删除</a></td></tr>";
					$("#"+tableTyple).append(tr);
			}
		}
	});
}

//显示文件不带删除的。
function fileShowbdsc(fid,tableTyple){
	$.ajax({
		type:'post',
		url:'/jxcsxm/zcgl/queryFjByfid.do',
		dataType:'json',
		data:'myFile.fid='+fid,
		success:function(data){
			$("#"+tableTyple).empty();
			for ( var i = 0; i < data.length; i++) {
					var tr = "<tr><td style='background-color: #ffffff; height: 25px;' align='left'>" + data[i].filename +"</td><td style='background-color: #ffffff; height: 25px;' align='left'><a href='javascript:void(0)'style='text-decoration:none;color:#3399CC; ' onclick=downFile('"+data[i].id+"')>下载</a></td></tr>";
					$("#"+tableTyple).append(tr);
			}
		}
	});
}

//下载文件
function downFile(id){
	parent.window.location.href="/jxcsxm/zcgl/downFile.do?myFile.id="+id;
}


//删除文件

function deleteFile(id,fid,tableTyple,flag){
	var da='myFile.fid='+id+'&myFile.flag='+flag
	$.ajax({
		type:'post',
		url:'/jxcsxm/zcgl/deleteFjByfidorid.do',
		dataType:'json',
		data:da,
		success:function(msg){
			if(msg){
				if(flag=='id'){
					alert("删除成功");
					fileShowdsc(fid,tableTyple);
				}
			}
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert("后台错误，请联系系统管理员"); 
			}
	});
}

//通过id获取权限

function getxqxbyid(id){
	var da='param.id='+id+'&param.name='+$.cookie('roleid');
	var str="";
	$.ajax({
		type:'post',
		url:'/jxcsxm/xtgl/getxqxbyid.do',
		dataType:'json',
		data:da,
		async: false,
		success:function(msg){
			if(msg)
			str=msg.name;
			else
				str="";
		},
		error: function(XMLHttpRequest, textStatus, errorThrown) { 
			alert("后台错误，请联系系统管理员"); 
			}
	});
	
	return str;
}


/*===================post请求下载文件
 * options:{
 * url:'',  //下载地址
 * data:{name:value}, //要发送的数据
 * method:'post'
 * }
 */
var postDownLoadFile = function (options) {
    var config = $.extend(true, { method: 'post' }, options);
    var $iframe = $('<iframe id="down-file-iframe" />');
    var $form = $('<form target="down-file-iframe" method="' + config.method + '" />');
    $form.attr('action', config.url);
    for (var key in config.data) {
        $form.append('<input type="hidden" name="' + key + '" value="' + config.data[key] + '" />');
    }
    $iframe.append($form);
    $(document.body).append($iframe);
    $form[0].submit();
    $iframe.remove();
}

function importSj(url,flag){
	var weatherDlg = new J.dialog( {
		id : 'ids',
		title : '请选择EXCEL文档！',
		page : '/jxcsxm/js/uploader/upload.jsp?url='+url+'&flag='+flag,
		width : 450,
		height : 400,
		top : 0,
		rang : true,
		resize : false,
		cover : true
	});
	
	weatherDlg.ShowDialog();
	
	//return false;
}

function locationXm(xmbm,jdbs){
	$.ajax({
		type:'post',
		url:'/jxcsxm/xtgl/selectlxbyxmid.do',
		data:"lxsh.xmbm="+xmbm,
		dataType:'json',
		success:function(msg){
			var lxbm="";
			var qdzh="";
			var zdzh="";
			for(var i=0;i<msg.length;i++){
				if(i==msg.length-1){
					lxbm=lxbm+msg[i].ghlxbm;
					qdzh=qdzh+msg[i].ghqdzh;
					zdzh=zdzh+msg[i].ghzdzh;
				}else{
					lxbm=lxbm+msg[i].ghlxbm+"-";
					qdzh=qdzh+msg[i].ghqdzh+"-";
					zdzh=zdzh+msg[i].ghzdzh+"-";
				}
			}
			console.log(msg);
			locationXm1(lxbm,qdzh,zdzh);
		},
		error : function(){
		 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
	 }
});	
}
//项目定位
function locationXm1(_roadcode,_roadstart,_roadends){
//	_roadcode="S201361121-S225360828";
//	_roadstart="179.59-42.514";
//	_roadends="190.643-84.903";
	//locationXm("S201361121-S225360828","179.59-42.514","190.643-84.903","1");
	YMLib.Var.xmbm=_roadcode+$.cookie("dist");
	var data=new Array();
	var jsonStr="";
	var type="lxsh";
	if(_roadcode.substring(0,4)=="wnjh") {
		type="wnjh";
		_roadcode=_roadcode.substring(4);
	}
	if(_roadcode.lastIndexOf("-")>-1){
		var arr1=_roadcode.split("-");
		var arr2=_roadstart.split("-");
		var arr3=_roadends.split("-");
		for(var i=0;i<arr1.length;i++){
			jsonStr={"BM": arr1[i],"ROADSTART": arr2[i],"ROADENDS": arr3[i],"TYPE":type};
			data.push(jsonStr);
		}
	}else{
		jsonStr={"BM": _roadcode,"ROADSTART": _roadstart,"ROADENDS": _roadends,"TYPE":type};
		data.push(jsonStr);
	}
	YMLib.Var.bm=data;
	YMLib.Var.type="1";
	YMLib.UI.createWindow('locationXm','项目定位','/jxcsxm/openlayers.html','app_add',800,380);
}
 


