
/**
 

* 江西省综合前端JavaScript核心脚本库
 */
var YMLib = {
	version : '1.1',
	url : document.location.protocol + "//" + document.location.host
			+ "/jxcsxm/",
	page : document.location.href.split('/')[document.location.href.split('/').length - 1]
			.replace('.jsp', ''),// 获取本页frame的文件名。

	/*
	 * 动态加载JavaScript & CSS
	 */
	using : function(js) {
		YMLib.Tools.loadCss("easyui/themes/insdep/easyui.css");
		YMLib.Tools.loadCss("easyui/themes/insdep/icon.css");
		YMLib.Tools.loadScript("easyui/jquery.min.js");
		YMLib.Tools.loadScript("easyui/jquery.easyui.min.js");
		YMLib.Tools.loadScript("easyui/easyui-lang-zh_CN.js");
		YMLib.Tools.loadScript(js);
	},
	/*
	 * 仅供测试方法。
	 */
	test : {
		/*
		 * 客户端模板插槽替换。
		 */
		sprintf : function(text) {
			var i = 1, args = arguments;
			return text.replace(/%s/g, function() {
				return (i < args.length) ? args[i++] : "";
			});
		}
	},
	Var : {

	},
	UI : {
		/*
		 * 提示模态信息。
		 */
		Show : function(_txt, _time) {
			var _id = YMLib.Tools.createRandomDiv();
			var _lineWidth = _txt.length * 17;
			var _lineHeight = 28;
			var _top = ($(document.body).height() / 2) - 60;
			var _left = ($(document.body).width() / 2 - _lineWidth / 2);
			var _html = "<div id='"
					+ _id
					+ "' style='color:red;font-size:12px;font-weight:bold;z-index:999999;display:none;text-align:center;position : absolute;top:"
					+ _top
					+ "px;left:"
					+ _left
					+ "px;width:"
					+ _lineWidth
					+ "px;height:"
					+ _lineHeight
					+ "px;line-height:"
					+ _lineHeight
					+ "px;border:1px solid #99bbe8;background:#FFDEAD;padding:0px;margin:0px;'>"
					+ _txt + "</div>";
			// 闭包操作关闭提示
			function closeShow() {
				$("#" + _id).fadeOut('slow', function() {
					$("#" + _id).html(null);
					$("#" + _id).remove();
				});
			}
			$(document.body).append(_html);
			$("#" + _id).fadeIn('slow', 'linear', function() {
				setInterval(closeShow, _time);
			});
		},
		layout : function(_id, _method, _region, _iconCls, _width, _title,
				_split, _href) {
			$('#' + _id).layout(_method, {
				region : _region,
				iconCls : _iconCls,
				width : _width,
				title : _title,
				split : _split,
				href : _href
			});
		},
		/*
		 * 添加Tab面板。
		 */
		addTab : function(_id, _title, _src, _icon, _close) {
			if ($("#" + _id).tabs('exists', _title)) {
				$("#" + _id).tabs('select', _title);
			} else {
				$("#" + _id)
						.tabs(
								'add',
								{
									title : _title,
									content : "<iframe id='tabFrame' name='tabFrame' src='"
											+ _src
											+ "' frameborder='0' height='100%' width='100%'></iframe>",
									loadingMessage : '正在加载中……',
									iconCls : _icon,
									closable : _close
								});
			}

		},
		/*
		 * 关闭指定ID的所有Tab
		 */
		closeAllTab : function(_id) {
			var tabs = $("#" + _id).tabs("tabs");
			var length = tabs.length;
			for ( var i = 1; i < length; i++) {
				var onetab = tabs[1];
				var title = onetab.panel('options').title;
				$("#" + _id).tabs("close", title);
			}
		},
		/*
		 * 加载Window窗体来自框架
		 */
		createWindow : function(_id, _title, _href, _icon, _width, _height,
				_onClose) {
			if ($("#" + _id).size() != 0) {// 是否存在
				return;
			}
			YMLib.Tools.createDivById(_id); // 创建div
			$("#" + _id)
					.window(
							{// 渲染window
								title : _title,
								iconCls : _icon,
								content : "<iframe id='"
										+ _id
										+ "_frame' name='"
										+ _id
										+ "_frame' src='"
										+ _href
										+ "' frameborder='0' height='100%' width='100%'></iframe>",
								width : _width,
								height : _height,
								// collapsible: typeof _collapsible ==
								// 'undefined',
								minimizable : false,
								maximizable : false,
								resizable : true,
								modal : false,
								onClose : function() {
								
									var frame = $('iframe', $("#" + _id)); // 释放frame
									if (frame.length > 0) {
										frame[0].contentWindow.document
												.write('');
										frame[0].contentWindow.close();
										frame.remove();
										if ($.browser.msie) {
											CollectGarbage();
										}
									}
									if (typeof _onClose != 'undefined') {
										_onClose();
									}
									$("#" + _id).window('destroy');
									$("#" + _id).remove();
								}
							});

		},
		createWindowFj : function(_id, _title, _href, _icon, _width, _height,
				_onClose) {
			if ($("#" + _id).size() != 0) {// 是否存在
				return;
			}
			YMLib.Tools.createDivById(_id); // 创建div
			$("#" + _id)
					.window(
							{// 渲染window
								title : _title,
								iconCls : _icon,
								content : "<iframe id='"
										+ _id
										+ "_frame' name='"
										+ _id
										+ "_frame' src='"
										+ _href
										+ "' frameborder='0' height='100%' width='100%'></iframe>",
								width : _width,
								height : _height,
								// collapsible: typeof _collapsible ==
								// 'undefined',
								minimizable : false,
								maximizable : false,
								resizable : true,
								modal : false,
								onClose : function() {
								
									var frame = $('iframe', $("#" + _id)); // 释放frame
									if (frame.length > 0) {
										frame[0].contentWindow.document
												.write('');
										frame[0].contentWindow.close();
										frame.remove();
										if ($.browser.msie) {
											CollectGarbage();
										}
									}
									if (typeof _onClose != 'undefined') {
										_onClose();
									}
									$("#" + _id).window('destroy');
									$("#" + _id).remove();
								},
								onBeforeClose:function(){
									deleteFile(YMLib.Var.xmbm,YMLib.Var.xmbm,"fjTable","fid");
								}
							});

		},
		/*
		 * 加载Window窗体来自框架
		 */
		createWindow1 : function(_id, _title, _href, _icon, _width, _height,
				_onDestroy) {
			if ($("#" + _id).size() != 0) {// 是否存在
				return;
			}
			YMLib.Tools.createDivById(_id); // 创建div
			$("#" + _id)
					.window(
							{// 渲染window
								title : _title,
								iconCls : _icon,
								content : "<iframe id='"
										+ _id
										+ "_frame' name='"
										+ _id
										+ "_frame' src='"
										+ _href
										+ "' frameborder='0' height='100%' width='100%'></iframe>",
								width : _width,
								height : _height,
								// collapsible: typeof _collapsible ==
								// 'undefined',
								minimizable : false,
								maximizable : false,
								resizable : true,
								modal : false,
								onClose : function() {
									var frame = $('iframe', $("#" + _id)); // 释放frame
									if (frame.length > 0) {
										frame[0].contentWindow.document
												.write('');
										frame[0].contentWindow.close();
										frame.remove();
										if ($.browser.msie) {
											CollectGarbage();
										}
									}
									if (typeof _onClose != 'undefined') {
										_onClose();
									}
									$("#" + _id).window('destroy');
									$("#" + _id).remove();
								},
								onDestroy : _onDestroy
							});

		}
	}
}
		
/*
 * 加载行政区划
 */

function loadDist1(id, dwbm) {
	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxcsxm/xtgl/selAllXzqh1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValue', dwbm);
				},
				onCheck : function (node){
					$('#' + id).tree('getChecked');
				}
		});
}

function loadUnit1(id, dwbm) {

	$('#' + id).combotree(
			{
				checkbox : true,
				multiple:true,
				async:false,
				url : '/jxcsxm/xtgl/selAllUnit1.do?yhdw=' + dwbm,
				onLoadSuccess : function (node){
					$('#' + id).combotree('setValue', dwbm);
				},
				onCheck : function (node){
					$('#' + id).tree('getChecked');
				}
		});
}




//获取编目编码
function loadBmbms(id, name,str) {
	var arr1=new Array();
	var arr2=new Array();
	var i=0;
	$.ajax({
		type:'post',
		async:false,
		url:'/jxcsxm/xtgl/getBmbmTreeByName2.do',
		data:'yhm='+ encodeURI(encodeURI(name)),
		dataType:'json',
		success:function(msg){
			$('#' + id).combobox({
				data:msg,
				valueField : 'bmid',
				textField : 'name',
				panelHeight:'auto',
				multiple:true,
				editable:false,
				formatter:function(row){
					arr1[i]=row.id;
					arr2[i]=row.bmid;
					i++;
					var opts = $(this).combobox('options');
					return '<input id="'+id+row.id+'" type="checkbox" class="combobox-checkbox">' + row[opts.textField];
				},
				onSelect:function(record){
					var opts = $(this).combobox('options');
					if(record[opts.valueField]==""){
						var values =new Array();
						var datas = $('#' +id).combobox("getData");
						$.each(datas,function(index,item){
							values.push(item.bmid);
							$('#'+id+item.id).attr('checked', true);
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$('#'+id+record.id).attr('checked', true);
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
							if(jQuery.inArray(item.bmid,values)<0){
								$('#'+id+item.id).attr('checked', false);
							}
						});
						$('#' +id).combobox("setValues",values);
					}else{
						$.each(datas,function(index,item){
							$('#'+id+item.id).attr('checked', false);
						});
					}
				}
			});
		}
	});
	if(str!=null && str!=''){
		$('#' + id).combobox('setValue',str);
		$('#'+id+arr1[returnindex(arr2,str)]).attr('checked', true);
	};
	
}

function loadBmbm(id, name,str) {
	$('#' + id).combobox({
		url : '/jxcsxm/xtgl/getBmbmTreeByName.do?yhm='
				+ encodeURI(encodeURI(name)),
		valueField : 'bmid',
		textField : 'name',
		panelHeight:'200',
		multiple:false,
		editable:false
	});
	$('#' + id).combobox('setValue',str);
}


function returnindex(arr,str){
	var j=0;
	for(var i=0;i<arr.length;i++){
		if(arr[i]==str){
		   j=i;
		   break;
		 }
	}
	return j;
}
// 获取url中参数
function getParam(paras) {

	var url = location.href;
	var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
	var paraObj = {};
	for ( var i = 0; j = paraString[i]; i++) {
		paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j
				.indexOf("=") + 1, j.length);
	}
	var returnValue = paraObj[paras.toLowerCase()];
	if (typeof (returnValue) == "undefined") {
		return "";
	} else {
		return returnValue;
	}
}

//qwh创建新目录方法
function createMenunew(id){
	
	$("#tree"+id).tree({
        //data : treeData,
		url:'/jxcsxm/xtgl/createMenu.do?parent='+id,
        lines : true,
        onClick : function (node) {
        	//$.messager.alert('id',node.attributes+"?&id="+node.id);
            if (node.attributes.length!=0) {
                //alert(node.attributes);
            	
                javascript:window.open("/jxcsxm"+node.attributes+"?&id="+node.id,"rightContent");
            }
        }
    });
}



//获取权限
function getQxfromSession(qx){
	var qxstrng='';
	$.ajax({
		data:'qx='+qx,
		type:'post',
		dateType:'json',
		async:false,
		url:'/jxcsxm/xtgl/getQxfromSession.do',
		success:function(msg){
			qxstrng=msg;
		}
	});
	return qxstrng;
}
function getUrlParame(strParame) {
   	var args = new Object( );
   	var query = location.search.substring(1);

   	var pairs = query.split("&"); // Break at ampersand
   	for(var i = 0; i < pairs.length; i++) {
   	var pos = pairs[i].indexOf('=');
   	if (pos == -1) continue;
   	var argname = pairs[i].substring(0,pos);
   	var value = pairs[i].substring(pos+1);
   	value = decodeURIComponent(value);
   	args[argname] = value;
   	}
   	return args[strParame];
   	} 



//两个浮点数求和  
function accAdd(num1,num2){  
   var r1,r2,m;  
   try{r1 = num1.toString().split('.')[1].length;  }catch(e){  r1 = 0;  }  
   try{r2=num2.toString().split(".")[1].length;  }catch(e){ r2=0;}  
   m=Math.pow(10,Math.max(r1,r2));  
   // return (num1*m+num2*m)/m;  
   return Math.round(num1*m+num2*m)/m;  
}  
  
// 两个浮点数相减  
function accSub(num1,num2){  
   var r1,r2,m;  
   try{ r1 = num1.toString().split('.')[1].length; }catch(e){  r1 = 0;  }  
   try{r2=num2.toString().split(".")[1].length;  }catch(e){  r2=0;  }  
   m=Math.pow(10,Math.max(r1,r2));  
   n=(r1>=r2)?r1:r2;  
   return (Math.round(num1*m-num2*m)/m).toFixed(n);  
}  
// 两数相除  
function accDiv(num1,num2){  
   var t1,t2,r1,r2;  
   try{t1 = num1.toString().split('.')[1].length;  }catch(e){  t1 = 0;  }  
   try{ t2=num2.toString().split(".")[1].length;  
   }catch(e){  t2=0; }  
   r1=Number(num1.toString().replace(".",""));  
   r2=Number(num2.toString().replace(".",""));  
   return (r1/r2)*Math.pow(10,t2-t1);  
}  
//两数相乘
function accMul(num1,num2){  
   var m=0,s1=num1.toString(),s2=num2.toString();   
try{m+=s1.split(".")[1].length}catch(e){};  
try{m+=s2.split(".")[1].length}catch(e){};  
return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m);  
}  



//弹出加载层 str为要显示的内容，默认“正在加载中，请稍候。。。”
function loadjzt(str) {  
	var name="正在加载，请稍候。。。";
	if(str!=null&&str!='')
		name=str;
    $("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: "100%", height: $(window).height() }).appendTo("body");  
    $("<div class=\"datagrid-mask-msg\"></div>").html(name).appendTo("body").css({ display: "block", left: ($(document.body).outerWidth(true) - 190) / 2, top: ($(window).height() - 45) / 2 });  
}  
  
//取消加载层  
function disLoadjzt() {  
    $(".datagrid-mask").remove();  
    $(".datagrid-mask-msg").remove();  
}

//显示字符串

function showStr(str){
	alert(str);
}


//qwh验证input
function validateInput(id,type,result){
	if(!result){
		return result;
	}
	if(type=="number"){
		if(isNaN(Number($("#"+id).val()))){  
			//当输入不是数字的时候，Number后返回的值是NaN;然后用isNaN判断。
			alert($('#'+id).parent().prev().html().replace("：",'')+"不是数字！");
	        $('#'+id).val('');
			$('#'+id).focus();
			return false;
	    }else{
	    	return true;
	    }
	}
	if(type=="null"){
		if($("#"+id).val().trim()==""){
			alert($('#'+id).parent().prev().html().replace("：",'')+"不能为空！");
	        $('#'+id).val('');
			$('#'+id).focus();
			return false;
		}else{
			return true;
		}
	}
	return true;
}
