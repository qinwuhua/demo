var gridObj;//列表对象
var oldIndex=-1;//之前选中的
var selRow=new Array();//已选择的行号
function querySumYhdzx(){
	$.ajax({
		type:'post',
		url:'../../../jhgl/querySumYhdzx.do',
		dataType:'json',
		success:function(data){
			$('#lblCount').html(data.id);
			$('#lblZLC').html(data.plan_lx_yhdzxs[0].qzlc);
			$('#lblHDLC').html(data.plan_lx_yhdzxs[0].hdlc);
			$('#lblZTZ').html(data.totalinvest);
			$('#lblZBZZJ').html(data.totalsubsidyfund);
		}
	});
}
function sbnf(id){
	var myDate = new Date();
	var years=[];
	for(var i=0;i<=10;i++){
		years.push({text:(myDate.getFullYear()-i)});
	}
	$('#'+id).combobox({    
	    data:years,
	    valueField:'text',    
	    textField:'text'   
	});
}
function yhdzxxm(jh,lx){
	var params={'lx.gydwmc':lx.gydwmc,'lx.gydwdm':lx.gydwdm,'lx.xzqhmc':lx.xzqhmc,
			'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../jhkxx/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../edit/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	  var id="'"+row.id+"'";
		        	  result+='<a href="javascript:dropYhdzx('+id+')" style="text-decoration:none;color:#3399CC;">删除</a>';
		        	  return result;
			      }},
			      {field:'lxbm',title:'路线编码',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxbm;
			    	  }
			      },
			      {field:'lxmc',title:'路线名称',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxmc;
			    	  }
			      },
			      {field:'gydw',title:'管养单位',width:150,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].gydwmc;
			    	  }
			      },
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].xzqhmc;
			    	  }
			      },
			      {field:'qdzh',title:'起点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qdzh;
			    	  }
			      },
			      {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].zdzh;
			    	  }
			      },
			      {field:'lc',title:'起止里程',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qzlc;
			    	  }
			      },
			      {field:'hdlc',title:'核对里程',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].hdlc;
			    	  }
			      },
			      {field:'jsdj',title:'技术等级',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].yjsdj;
			    	  }
			      },
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmkd;
			    	  }
			      },
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmlx;
			    	  }
			      },
			      {field:'gcfl',title:'工程分类',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.classify;
			    	  }
			      },
			      {field:'ztz',title:'总投资',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalinvest;
			    	  }
			      },
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalsubsidyfund;
			    	  }
			      }
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function yhdzxxm_sb(jh,lx){
	var params={'lx.gydwmc':lx.gydwmc,'lx.gydwdm':lx.gydwdm,'lx.xzqhmc':lx.xzqhmc,
			'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../jhkxx/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../edit/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	  return result;
			      }},
			      {field:'sbzt',title:'上报状态',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  var result="";
			    		  var xian1=new RegExp("^[0-9]{9}[0-9][1-9]$");
			    		  var xian2=new RegExp("^[0-9]{9}[1-9][0-9]$");
			    		  if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit")) && row.jh_sbthcd==2){
			    			  result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>   |    ';
			    			  result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
			    		  }else if(!xian1.test($.cookie("unit")) && !xian2.test($.cookie("unit")) && row.jh_sbthcd==4){
			    			  result='<a style="text-decoration:none;">已上报</a>';
			    		  }
									
			    		  if((xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))) && row.jh_sbthcd==0){
			    			  result='<a href="javascript:sb('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">上报</a>';
			    		  }else if((xian1.test($.cookie("unit")) || xian2.test($.cookie("unit"))) && row.jh_sbthcd==2){
			    			  result='<a style="text-decoration:none;">已上报</a>';
			    		  }
			    		  return result;
			    	  }
			      },
			      {field:'lxbm',title:'路线编码',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxbm;
			    	  }
			      },
			      {field:'lxmc',title:'路线名称',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxmc;
			    	  }
			      },
			      {field:'gydw',title:'管养单位',width:150,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].gydwmc;
			    	  }
			      },
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].xzqhmc;
			    	  }
			      },
			      {field:'qdzh',title:'起点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qdzh;
			    	  }
			      },
			      {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].zdzh;
			    	  }
			      },
			      {field:'lc',title:'起止里程',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qzlc;
			    	  }
			      },
			      {field:'hdlc',title:'核对里程',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].hdlc;
			    	  }
			      },
			      {field:'jsdj',title:'技术等级',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].yjsdj;
			    	  }
			      },
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmkd;
			    	  }
			      },
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmlx;
			    	  }
			      },
			      {field:'gcfl',title:'工程分类',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.classify;
			    	  }
			      },
			      {field:'ztz',title:'总投资',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalinvest;
			    	  }
			      },
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalsubsidyfund;
			    	  }
			      }
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function yhdzxxm_sp(jh,lx){
	var params={'lx.gydwmc':lx.gydwmc,'lx.gydwdm':lx.gydwdm,'lx.xzqhmc':lx.xzqhmc,
			'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../jhkxx/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>    ';
		        	  result+='<a href="javascript:openDialog('+"'yhdzx_xx','养护大中修项目计划详情','../edit/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">编辑</a>    ';
		        	  return result;
			      }},
			      {field:'sbzt',title:'上报状态',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  var result="";
			    		  if(row.spzt=='0' && row.sbzt=='1'){
			    			  result='<a href="javascript:sp('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">审批</a>   |    ';
			    			  result+='<a href="javascript:tuihui('+"'"+row.id+"'"+','+row.jh_sbthcd+')" style="text-decoration:none;color:#3399CC;">退回</a>';
			    		  }else{
			    			  result='<a style="text-decoration:none;">已审批</a>';
			    		  }
			    		  return result;
			    	  }
			      },
			      {field:'lxbm',title:'路线编码',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxbm;
			    	  }
			      },
			      {field:'lxmc',title:'路线名称',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxmc;
			    	  }
			      },
			      {field:'gydw',title:'管养单位',width:150,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].gydwmc;
			    	  }
			      },
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].xzqhmc;
			    	  }
			      },
			      {field:'qdzh',title:'起点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qdzh;
			    	  }
			      },
			      {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].zdzh;
			    	  }
			      },
			      {field:'lc',title:'起止里程',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qzlc;
			    	  }
			      },
			      {field:'hdlc',title:'核对里程',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].hdlc;
			    	  }
			      },
			      {field:'jsdj',title:'技术等级',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].yjsdj;
			    	  }
			      },
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmkd;
			    	  }
			      },
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmlx;
			    	  }
			      },
			      {field:'gcfl',title:'工程分类',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.classify;
			    	  }
			      },
			      {field:'ztz',title:'总投资',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalinvest;
			    	  }
			      },
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalsubsidyfund;
			    	  }
			      }
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
function yhdzxxm_zjxd(jh,lx){
	var params={'lx.gydwmc':lx.gydwmc,'lx.gydwdm':lx.gydwdm,'lx.xzqhmc':lx.xzqhmc,
			'lx.xzqhdm':lx.xzqhdm,'lx.lxmc':lx.lxmc,'lx.yjsdj':lx.yjsdj,'lx.lxbm':lx.lxbm,
			'jh.sbzt':jh.sbzt,'jh.spzt':jh.spzt,'jh.sbnf':jh.sbnf,'jh.jh_sbthcd':jh.jh_sbthcd};
	var grid={id:'grid',url:'../../../jhgl/queryYhdzxList.do',pagination:true,rownumbers:false,
		pageNumber:1,pageSize:10,height:325,width:990,queryParams:params,
		columns:[[
		          {field:'ck',checkbox:true},
		          {field:'c',title:'操作',width:150,align:'center',formatter:function(value,row,index){
		        	  var result='<a style="text-decoration:none;color:#3399CC;">定位<a>    ';
		        	  result+='<a href="javascript:openDialog('+"'zjxd_yhdzx','养护大中修项目计划详情','../jhkxx/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">详细</a>';
		        	  return result;
			      }},
			      {field:'zjxf',title:'资金下发',width:60,align:'center',
			    	  formatter:function(value,row,index){
				    	return '<a href="javascript:openDialog('+"'zjxd_yhdzx','养护大中修项目资金下达','../zjxd/yhdzx.jsp'"+')" style="text-decoration:none;color:#3399CC;">资金下发</a>';
			    	  }
			      },
			      {field:'lxbm',title:'路线编码',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxbm;
			    	  }
			      },
			      {field:'lxmc',title:'路线名称',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].lxmc;
			    	  }
			      },
			      {field:'gydw',title:'管养单位',width:150,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].gydwmc;
			    	  }
			      },
			      {field:'xzqhmc',title:'行政区划名称',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].xzqhmc;
			    	  }
			      },
			      {field:'qdzh',title:'起点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qdzh;
			    	  }
			      },
			      {field:'zdzh',title:'止点桩号',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].zdzh;
			    	  }
			      },
			      {field:'lc',title:'起止里程',width:60,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].qzlc;
			    	  }
			      },
			      {field:'hdlc',title:'核对里程',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].hdlc;
			    	  }
			      },
			      {field:'jsdj',title:'技术等级',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].yjsdj;
			    	  }
			      },
			      {field:'ylmkd',title:'原路面宽度',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmkd;
			    	  }
			      },
			      {field:'ylmlx',title:'原路面类型',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.plan_lx_yhdzxs[0].ylmlx;
			    	  }
			      },
			      {field:'gcfl',title:'工程分类',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.classify;
			    	  }
			      },
			      {field:'ztz',title:'总投资',width:80,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalinvest;
			    	  }
			      },
			      {field:'zbzzj',title:'总补助资金',width:100,align:'center',
			    	  formatter:function(value,row,index){
			    		  return row.totalsubsidyfund;
			    	  }
			      }
		]],
		onClickRow:function(rowIndex,rowDate){
			if(oldIndex!=-1){
				gridObj.datagrid("unselectRow",oldIndex);
			}
			selRow.push(rowIndex);
			gridObj.datagrid("selectRow",rowIndex);
			oldIndex=rowIndex;
		}
	};
	gridBind(grid);
}
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
	    onSelect:grid.onSelect,
	    onClickRow:grid.onClickRow
	});
	$('#'+grid.id).datagrid('resize',{width:$("body").width()*0.97});
}
function queryYhdzxById(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/queryYhdzxById.do',
		dataType:'json',
		data:'jh.id='+id,
		success:function(data){
			$('#lblYear').html(data.sbnf);
			$('#lblLXMC').html(data.plan_lx_yhdzxs[0].lxmc);
			$('#lblLXBM').html(data.plan_lx_yhdzxs[0].lxbm);
			$('#lblGYDWMC').html(data.plan_lx_yhdzxs[0].gydwmc);
			$('#lblQDZH').html(data.plan_lx_yhdzxs[0].qdzh);
			$('#lblZDZH').html(data.plan_lx_yhdzxs[0].zdzh);
			$('#lblLC').html(data.plan_lx_yhdzxs[0].qzlc);
			$('#lblHDLC').html(data.plan_lx_yhdzxs[0].hdlc);
			$('#lblXZQHMC').html(data.plan_lx_yhdzxs[0].xzqhmc);
			$('#lblJSDJ').html(data.plan_lx_yhdzxs[0].yjsdj);
			$('#lblYLMKD').html(data.plan_lx_yhdzxs[0].ylmkd);
			$('#lblYLMLX').html(data.plan_lx_yhdzxs[0].ylmlx);
			$('#lblGCFL').html(data.classify);
			$('#lblSBJF').html(data.reportingfee);
			$('#lblHSJF').html(data.fee);
			$('#lblSDJF').html(data.newfee);
			$('#lblZTZ').html(data.totalinvest);
			$('#lblDFPTZTZ').html(data.totalplacefund);
			$('#lblZBZZJ').html(data.totalsubsidyfund);
			$('#lblLJBZZJ').html(data.accumulativesubsidyfund);
			$('#lblBNBZZJ').html(data.nowyearsubsidyfund);
			$('#lblDC').html(data.dianceng);
			$('#lblJC').html(data.jiceng);
			$('#lblMC').html(data.surface);
			$('#lblXJBS').html(data.mark);
			$('#lblPQI').html(data.pqi);
			$('#lblJTL').html(data.aadt);
			$('#lblSGTWH').html(data.constructnumber);
			$('#lblGKPFWH').html(data.replynumber);
			$('#lblSJPFWH').html(data.devisenumber);
			$('#lblJHXDWH').html(data.plandownnumber);
			$('#lblYLMHD').html(data.plan_lx_yhdzxs[0].ylmhd);
			$('#lblJSCZMS').html(data.description);
			$('#lblXCHSQK').html(data.xchsqk);
			$('#lblSTCBZ').html(data.remarks);
			$('#lblQTBZ').html(data.qtbz);
			data.classify;
		}
	});
}
function dropYhdzx(id){
	$.ajax({
		type:'post',
		url:'../../../jhgl/dropYhdzxById.do',
		dataType:'json',
		data:'jh.id='+id,
		success:function(data){
			if(data.result){
				alert("删除成功！");
				searchYhdzx();
			}
		}
	});
}
function dropYhdzxs(){
	var grid =$('#grid').datagrid('getSelections');
	var a=true;
	$.each(grid,function(index,item){
		if(!a){
			return false;
		}else{
			$.ajax({
				type:'post',
				url:'../../../jhgl/dropYhdzxById.do',
				dataType:'json',
				data:'jh.id='+item.id,
				async:false,
				success:function(data){
					if(data.result=="false"){
						a=false;
					}
				}
			});
		}
		if(a){
			alert("删除成功！");
			searchYhdzx();
		}
	});
	
}
function editStatus(jh){
	var result;
	$.ajax({
		type:'post',
		url:'../../../jhgl/editYhdzxStatus.do',
		dataType:'json',
		data:jh,
		async:false,
		success:function(data){
			if(data.result){
				result = true;
			}else{
				result = false;
			}
		},
		error:function(){
			result=false;
		}
	});
	return result;
}
function exportYh(filename){
	window.location.href="/jxzhpt/xtgl/getModule_jhfeiLw.do?moduleName="+filename;
}