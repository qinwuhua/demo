<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目字段选择列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/YWLib.js"></script>
<style type="text/css">
TD {
font-size: 12px;
}
a{
text-decoration:none;
}
</style>
</head>
<body>
<script type="text/javascript">
	$(function(){
		// 全选、不选
		$("#qx").bind("click", function () {
			treeChecked(this,"tt1");
			treeChecked(this,"tt2");
			treeChecked(this,"tt3");
			
        }); 
		createJsontree('tt1','./js/jhzxqkb.json'); 
		createBtTree('tt2','5','jhzxqkb'); 
		createBtTree('tt3','6','jhzxqkb'); 
		
	});
	
	//全选反选  
	//参数:selected:传入this,表示当前点击的组件  
	//treeMenu:要操作的tree的id；如：id="userTree"  
	function treeChecked(selected, treeMenu) {  
	    var roots = $('#' + treeMenu).tree('getRoots');//返回tree的所有根节点数组  
	    if (selected.checked) {  
	        for ( var i = 0; i < roots.length; i++) {  
	            var node = $('#' + treeMenu).tree('find', roots[i].id);//查找节点  
	            $('#' + treeMenu).tree('check', node.target);//将得到的节点选中  
	        }  
	    } else {  
	        for ( var i = 0; i < roots.length; i++) {  
	            var node = $('#' + treeMenu).tree('find', roots[i].id);  
	            $('#' + treeMenu).tree('uncheck', node.target);  
	        }  
	    }  
	}  
	
	
	
	
	
	function search(){
		var obj1=$("#tt1").tree('getChecked');
		var obj2=$("#tt2").tree('getChecked');
		var obj3=$("#tt3").tree('getChecked');
		
		var str="'";var str1="";
		for(var i=0;i<obj1.length;i++){
			if(obj1[i].id.indexOf('v_')!=-1){
				str+=obj1[i].id+"','";
				str1+=obj1[i].id.substring(obj1[i].id.indexOf('v_'))+",";
			}
		}
		for(var i=0;i<obj2.length;i++){
			if(obj2[i].id.indexOf('v_')!=-1){
				str+=obj2[i].id+"','";
				str1+=obj2[i].id.substring(obj2[i].id.indexOf('v_'))+",";
			}
		}
		for(var i=0;i<obj3.length;i++){
			if(obj3[i].id.indexOf('v_')!=-1){
				str+=obj3[i].id+"','";
				str1+=obj3[i].id.substring(obj3[i].id.indexOf('v_'))+",";
			}
		}
		
		
		if(str!="'"){
			str=str.substr(0,str.length-2);
			str1=str1.substr(0,str1.length-1);
		}else{
			alert("请勾选字段");
			return;
		}
		
		parent.str1=str;
		parent.str2=str1;
			$.ajax({
				data:'name='+str+"&ssbb=jhzxqkb",
				type:'post',
				dataType:'json',
				url:'/jxcsxm/tjbb/getZdyBbzd.do',
				success:function(re){
					parent.$("#biaotou").empty();
					parent.$("#biaotou").html(re.col);
					var ss=str1.split(",");
					var w=ss.length*100;
					if(w>1000)
					parent.$("#bbtable").attr('width',w+"px");
					else
					parent.$("#bbtable").attr('width',"99%");
					parent.showBb(str1);
					closeWindow();
				}
			})
		
		
	}
	function close(){
		parent.$('#zdybb').window('destroy');
	}
	
	
	
	
</script>


<center>
<table style="width: 100%; background-color: #aacbf8; font-size: 12px"
			border="0" cellpadding="2" cellspacing="1">
			<tr  style="height: 30px;">
				<td style="background-color: #ffffff;"align="center" >
					<input  type="checkbox" value="qx" name="checkbox" id="qx" style="display: inline-block;vertical-align: middle;margin-bottom: 2.2px; "/>全选/不选
					
				</td>
			</tr>
			<tr>
			<td colspan="6" style="background-color: #ffffff; height: 200px;" >
				<table border="0" style="margin-top: 0">
					<tr>
						<td valign="top">
						<ul id="tt1"></ul>  
						</td>
						<td valign="top">
						<ul id="tt2" style="margin-top: 1px;"></ul>  
						</td>
						<td valign="top">
						<ul id="tt3" style="margin-top: 1px;"></ul>  
						</td>
						
					</tr>
				</table>
			</td>
			</tr>
			
			
			
			<tr>
				<td colspan="6" style="background-color: #ffffff; height: 35px;" align="center">
				<!-- <a href="javascript:void(0)" id="save_button"
					class="easyui-linkbutton" plain="true" iconCls="icon-ok">确认</a> <a
					href="javascript:void(0)" id="qx_window"
					class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a> -->
				<a id='mybuttion1' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:search()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">查询</a>
				<a id='mybuttion2' style="margin-top: 1px;margin-bottom: 1px;" href="javascript:closeWindow()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion2')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion2')"  class="button button-tiny button-rounded button-raised button-primary">取消</a>	
				</td>
			</tr>
			</table>
			</center>
</body>
</html>