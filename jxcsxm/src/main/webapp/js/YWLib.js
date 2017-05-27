
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
function openZjdw(xmbm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.xmlx=xmlx;
	openWindow("资金到位详情","/jxcsxm/page/zjdw/zjdw.jsp",900,400);
}
//打开资金拨付页面
function openZjbf(xmbm,xmlx){
	YMLib.Var.xmbm=xmbm;
	YMLib.Var.xmlx=xmlx;
	openWindow("资金拨付详情","/jxcsxm/page/zjbf/zjbf.jsp",900,400);
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
