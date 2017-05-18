/**
 * 解析URL中的参数
 * @param {Object} item 参数名
 * @return {TypeName} 参数值
 */
Request = {
	QueryString : function(item) {
		var svalue = location.search.match(new RegExp("[\?\&]" + item
				+ "=([^\&]*)(\&?)", "i"));
		return svalue ? svalue[1] : svalue;
	}
}

/**
 * 通过字符串创建日期
 * @param {Object} dateStr 日期字符串，格式(yyyy-MM-DD hh:mm:ss)
 * @return {TypeName} 
 */
function creatDate(dateStr)
{  var md={};
   var md=new myDate(); 
   var dateArr=dateStr.split(" ");
   var dateArr=dateArr[0].split("-");
   md.year=dateArr[0];
   md.month=dateArr[1];
   md.day=dateArr[2];
   var d=new Date(md.year,md.month-1,md.day);
   if(dateArr.length==2)
	  {
          var timeArr=dateArr[1].split(":");
          md.hour=timeArr[0];
          md.minute=timeArr[1];
          md.day=timeArr[2];
          d=new Date(md.year,md.month-1,md.day,md.hour,md.minute,md.second);
      }
   return d;
}
/**
 * 扩展javascript数组包含功能
 * @param {Object} obj
 * @memberOf {TypeName} 
 * @return {TypeName} 
 */
Array.prototype.contains = function(obj) { 
var i = this.length;
while (i--) { 
if (this[i] === obj) { 
return true; 
} 
} 
return false; 
}
/**
 * 检查输入类型，中文、全拼、简拼
 * @param {Object} input
 * @return {TypeName} 
 */
function checkInput(input)
{
var regCh=new RegExp('^[\u4e00-\u9fa5]+$');
    var regEg=new RegExp('^[A-Za-z]+$');
    var checkReuslt;
	var sm=new Array("b","p","m","f","d","t","n","l","g","k","h","j","q","x","r","z","c","s","w","y");
	var ym=new Array("er","ai","ei","ao","ou","an","en","in","on","ia","ie","iu","io","uo","ui","un","ve","va","vn");
	var names = new Array();
    if(regCh.exec(input)){
    	checkReuslt="zw";	
    }
    if(regEg.exec(input)){
    	if(input.length==1)
		{
		   checkReuslt="qp";
		}
		else{
			for(i=0;i<input.length-1;i++)
		    {
				 if(sm.contains(input.charAt(i).toLowerCase()) && sm.contains(input.charAt(i+1).toLowerCase()))
				 {
					checkReuslt="jp";
				 }
				 else if((!sm.contains(input.charAt(i).toLowerCase())) && (!ym.contains(input.charAt(i).toLowerCase()+input.charAt(i+1).toLowerCase()))&&(!ym.contains(input.charAt(i-1).toLowerCase()+input.charAt(i).toLowerCase())))
				 {
					 checkReuslt="jp";
				 }
				 else
				 {
					 checkReuslt="qp";
					 break;
				 }
			 }
		}
    }
    return checkReuslt;
}

function getBmbm(s2,name,nameBm){
	$.ajax({
		type : "POST",
		url : "/hbdtxt/xtgl/getBmbmByName.do",
		dataType : 'json',
		 data :"name="+name,
		success : function(msg) {
			var strs= nameBm.split(","); //字符分割 
			for (var j=0;j<strs.length;j++){
				for ( var i = 0; i < msg[j].length; i++) {
					 $("#"+s2+" "+" select[id="+strs[j]+"]").append(
							'<option value='+msg[j][i]+'>'+ msg[j][i]+ '</option>'
							); 
				}
			
			}
		},
		error : function() {
			alert("请求后台出错！2");
		}
	});
}

function getBmbmTree(s2,name,nameBm){
	$.ajax({
		type : "POST",
		url : "/hbdtxt/xtgl/getBmbmTreeByName.do",
		dataType : 'json',
		 data :"name="+name,
		success : function(msg) {
			var strs= nameBm.split(","); //字符分割 
			for (var j=0;j<strs.length;j++){
				$("#"+strs[j]).combotree('loadData', msg[j]);
			}
			
		},
		error : function() {
			alert("请求后台出错！2");
		}
	});
}


function loadUnit(id,dwbm){
	$('#'+id).combotree({   
	       checkbox: false,   
	       url: '/hbdtxt/xtgl/seldw.do?yhdw='+dwbm,   
	       onBeforeExpand:function(node,param){
	      	 $('#'+id).combotree("tree").tree('options').url = "/hbdtxt/xtgl/seldw2.do?yhdw="+node.id ;
	       } 
	   });
	$('#'+id).combotree('setValue',dwbm);
}
function loadXmlb(id,lbdm){
	lbdm="00"+lbdm;
	$('#'+id).combotree({   
	       checkbox: false,   
	       url: '/hbdtxt/xtgl/sellb.do?lbdm='+lbdm,   
	       onBeforeExpand:function(node,param){
	      	 $('#'+id).combotree("tree").tree('options').url = "/hbdtxt/xtgl/sellb2.do?lbdm="+node.id ;
	       }
	   });
	$('#'+id).combotree('setValue',lbdm);
}
function downloadfj1(a){
	  window.location="/hbdtxt/xtgl/downloadFile.do?att.id="+a;
	}
function takeCityWeather(flag) {
	if(flag=='gsjs'){
		  var weatherDlg = new J.dialog( {
						id : 'id1',
						title : '请选择EXCEL文档！',
						page : '/hbdtxt/page/attachement/upload.jsp?xmlx='+'gsjs',
						width : 450,
						height : 400,
						top : 0,
						rang : true,
						resize : false,
						cover : true
					});
		weatherDlg.ShowDialog();
		return false;
	}else if(flag=='gsyh'){
		var weatherDlg = new J.dialog( {
			id : 'id1',
			title : '请选择EXCEL文档！',
			page : '/hbdtxt/page/attachement/upload.jsp?xmlx='+'gsyh',
			width : 450,
			height : 400,
			top : 0,
			rang : true,
			resize : false,
			cover : true
		});
		weatherDlg.ShowDialog();
		return false;
	}else if(flag=='gxjs'){
		var weatherDlg = new J.dialog( {
			id : 'id1',
			title : '请选择EXCEL文档！',
			page : '/hbdtxt/page/attachement/upload.jsp?xmlx='+'gxjs',
			width : 450,
			height : 400,
			top : 0,
			rang : true,
			resize : false,
			cover : true
		});
		weatherDlg.ShowDialog();
		return false;
	}else if(flag=='gxyh'){
		var weatherDlg = new J.dialog( {
			id : 'id1',
			title : '请选择EXCEL文档！',
			page : '/hbdtxt/page/attachement/upload.jsp?xmlx='+'gxyh',
			width : 450,
			height : 400,
			top : 0,
			rang : true,
			resize : false,
			cover : true
		});
		weatherDlg.ShowDialog();
		return false;
	}else{
		//专项
	}
}
function takeCityWeatherSggl(flag) {
	if(flag=='gsjs'){
		  var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page :"/hbdtxt/page/attachement/sgglupload.jsp?xmlx=gsjs",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
			return false;
	}else if(flag=='gsyh'){
		  var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : "/hbdtxt/page/attachement/sgglupload.jsp?xmlx=gsyh",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
	weatherDlg.ShowDialog();
	return false;
	}else if(flag=='gxjs'){
		  var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : "/hbdtxt/page/attachement/sgglupload.jsp?xmlx=gxjs",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
	weatherDlg.ShowDialog();
	return false;
	}else if(flag=='gxyh'){
		  var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : "/hbdtxt/page/attachement/sgglupload.jsp?xmlx=gxyh",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
	weatherDlg.ShowDialog();
	return false;
	}else if(flag=='ncjs'){
		  var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page : "/hbdtxt/page/attachement/sgglupload.jsp?xmlx=ncjs",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
			return false;
	}else if(flag=='ncyh'){
		  var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择EXCEL文档！',
				page :"/hbdtxt/page/attachement/sgglupload.jsp?xmlx=ncyh",
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
			weatherDlg.ShowDialog();
			return false;
	}else{
		//专项
	}
}
function takeCityWeatherNC() {
	  var weatherDlg = new J.dialog( {
					id : 'id1',
					title : '请选择EXCEL文档！',
					page : '/hbdtxt/page/attachement/nuncunchu.jsp',
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
function takeCityWeatherGxfj() {
	  var weatherDlg = new J.dialog( {
					id : 'id1',
					title : '请选择共享附件！',
					page : '/hbdtxt/page/attachement/gxfjUpload.jsp',
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
function fileUploadmethod(id) {
	YMLib.Var.Gcid=id;
	  var weatherDlg = new J.dialog( {
					id : 'id1',
					title : '请选择共享附件！',
					page : '/hbdtxt/page/attachement/attachmentUpload.jsp',
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
function gs_excel_import(flag){
	if(flag=='gs'){
		 var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择共享附件！',
				page : '/hbdtxt/page/attachement/gs_importXM.jsp',
				width : 450,
				height : 400,
				top : 0,
				rang : true,
				resize : false,
				cover : true
			});
		weatherDlg.ShowDialog();
		return false;
	}else{
		 var weatherDlg = new J.dialog( {
				id : 'id1',
				title : '请选择共享附件！',
				page : '/hbdtxt/page/attachement/gx_importXM.jsp',
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
}


/**
 * 只要是easyui-datebox元素
 * 就可以实现点击输入框就弹出日历的效果
 * */

$(document).ready(function(){
	var array=$(".easyui-datebox");
	$.each(array,function(){
		dateboxEvent($(this));
	});	
	var array1=$(".easyui-datetimebox");
	$.each(array1,function(){
		dateboxEvent($(this));
	});	
	var array2=$(".easyui-combobox");
	$.each(array2,function(){
		dateboxEvent($(this));
	});	
	var array3=$(".easyui-combotree");
	$.each(array3,function(){
		dateboxEvent($(this));
	});	
	var array4=$(".easyui-combo");
	$.each(array4,function(){
		dateboxEvent($(this));
	});	
});
function dateboxEvent(obj){
	var textbox =obj.combo("textbox");   
    var panel =obj.combo("panel");   
	textbox.bind('click.mycombo', function() {   
        if (panel.is(":visible")) {   
            obj.combo('hidePanel');   
        } else {   
            obj.combo('showPanel');   
        }   
    });
}
//获取url中参数
function getParam(paras){ 
	
	var url = location.href; 
			var paraString = url.substring(url.indexOf("?")+1,url.length).split("&"); 
			var paraObj = {} ;
			for (var i=0; j=paraString[i]; i++){ 
			paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length); 
			} 
			var returnValue = paraObj[paras.toLowerCase()]; 
			if(typeof(returnValue)=="undefined"){ 
			return ""; 
			}else{ 
			return returnValue; 
			} 
			}
//校验数字，z值，s小数位数，len最长位数
function chekNum(z,s,len){
	//var z=document.getElementById(id).value;
	if(isNaN(z)){
			alert("请输入数字");
			return false;
	}else if(z.indexOf( '.')!=-1 && (z.length - z.lastIndexOf('.')) > (s+1) || (z.indexOf('.')+1) == z.length || z.indexOf('.')==0){
			if(s!=0){
				alert("数据不合法，小数位数不能超过"+s+"位！");
			}else{
				alert("数字必须是整数！");
			}
			//document.getElementById(id).value="";
			return false;
	}
	if(z.indexOf( '.')!=-1 && z.lastIndexOf('.')>(len-s) ){
			alert("数字整数部分不能超过"+(len-s)+"位！");
			return false;
	}else if(z.indexOf( '.')==-1 && z.length>(len-s)){
		alert("数字位数不能超过"+(len-s)+"位！");
		return false;
	}
	return true;
	}

//隐藏toolbar按钮
$.extend($.fn.datagrid.methods, {
	addToolbarItem : function (jq, items) {
		return jq.each(function () {
			var dpanel = $(this).datagrid('getPanel');
			var toolbar = dpanel.children("div.datagrid-toolbar");
			if (!toolbar.length) {
				toolbar = $("<div class=\"datagrid-toolbar\"><table cellspacing=\"0\" cellpadding=\"0\"><tr></tr></table></div>").prependTo(dpanel);
				$(this).datagrid('resize');
			}
			var tr = toolbar.find("tr");
			for (var i = 0; i < items.length; i++) {
				var btn = items[i];
				if (btn == "-") {
					$("<td><div class=\"datagrid-btn-separator\"></div></td>").appendTo(tr);
				} else {
					var td = $("<td></td>").appendTo(tr);
					var b = $("<a href=\"javascript:void(0)\"></a>").appendTo(td);
					b[0].onclick = eval(btn.handler || function () {});
					b.linkbutton($.extend({}, btn, {
							plain : true
						}));
				}
			}
		});
	},
	removeToolbarItem : function (jq, param) {
		return jq.each(function () {
			var dpanel = $(this).datagrid('getPanel');
			var toolbar = dpanel.children("div.datagrid-toolbar");
			var cbtn = null;
			if (typeof param == "number") {
				cbtn = toolbar.find("td").eq(param).find('span.l-btn-text');
			} else if (typeof param == "string") {
				cbtn = toolbar.find("span.l-btn-text:contains('" + param + "')");
			}
			if (cbtn && cbtn.length > 0) {
				cbtn.closest('td').remove();
				cbtn = null;
			}
		});
	}
});