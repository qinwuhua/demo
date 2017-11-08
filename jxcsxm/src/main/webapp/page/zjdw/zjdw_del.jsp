<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>资金到位</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/buttons.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YMLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWLib.js"></script>
<style type="text/css">.table{border: 1px solid #FFE7BA;} .table tr{border: 1px solid #FFE7BA;} .table tr td{border: 1px solid #FFE7BA;}</style>
<script type="text/javascript">
$(function(){
	var col=[[{field:'allSel',title:'全选',width:100,align:'center',rowspan:1,checkbox:'true'},
		{field:'tbsj',title:'填报时间',width:295,align:'center'}
	]]
	$('#tbsjgrid').datagrid({    
	    url:'/jxcsxm/zjdw/queryzjdwtbsj.do',
	    striped:true,
	    rownumbers:true,
	    checkOnSelect:true,
	    height:$(window).height()-82,
	    queryParams: parent.YMLib.Var.params,
	    fitColumns:false,
	    columns:col
	}); 
	
})


function delzjdwqb(){
	if(confirm("您确认删除吗？"))
		//return;
		var rows=$('#tbsjgrid').datagrid('getSelections');
		if(rows.length==0) {
			alert("请勾选记录！");
			return;
		}
		var tbsj=rows[0].tbsj;
		for(var i=1;i<rows.length;i++){
			tbsj+=","+rows[i].tbsj;
		}
		
		$.ajax({
			type:'post',
			url:'/jxcsxm/zjdw/delzjdwqb.do',
			data:parent.YMLib.Var.data+"&xmjbxx.tbsj="+tbsj,
			dataType:'json',
			success:function(msg){
				if(msg){
					alert("删除成功");
					parent.loadTj();
					parent.$("#grid").datagrid('reload');
					closeWindow();
				}else{
					alert("删除失败");
				}
				
			}
		});
}


</script>
</head>
<body>
<script type="text/javascript">

</script>
<table class='table' style="width: 100%; background-color: #FFE7BA; font-size: 12px"
			border="0" cellpadding="3" cellspacing="1">
			
			<tr style="height: 35px;">
				<td style="background-color: #ffffff; height: 20px;" align="left">
					<table id='tbsjgrid'></table>	
				
				</td>
					
				
				
			</tr>
			<tr style="height: 35px;">
				<td colspan="4" style="background-color: #ffffff;"align="center">
				<a id='mybuttion1' style="margin-left: 5px;margin-bottom: 1px;" href="javascript:delzjdwqb()" onmouseover="szgq('button button-tiny button-glow button-rounded button-raised button-primary','mybuttion1')" onmouseout="szgq('button button-tiny button-rounded button-raised button-primary','mybuttion1')"  class="button button-tiny button-rounded button-raised button-primary">删除</a>
			
			</tr>
		</table>
</body>
</html>