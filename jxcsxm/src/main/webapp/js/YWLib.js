
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
	openWindow("资金拨付详情","/jxcsxm/page/zjbf/zjbf.jsp",1000,450);
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