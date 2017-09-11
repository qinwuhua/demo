//登录专用js
var bl = false;
var name;
var password;
function checkText(){
	name = $("#name").val();
	password = $("#password").val();
	if(name == ""){
		alert(' 用户名不能为空！');
		$("#name").focus();
		return;
	}else if(password == ""){
		alert(' 密码不能为空！');
		$("#password").focus();
		return;
	}
	bl = true;
}

//点击登录按钮时
function login(){
	checkText();//检查文本框是否输入
	if(bl){
		$.ajax({
			type : "POST",
			url : "xtgl/login.do",
			dataType : 'json',
			data :"master.truename="+name+"&master.password="+password,
			success : function(msg){
				if(msg){
		     		if(msg.NAME!=null)
		     		$.cookie("name",msg.NAME, {expires: 1});//将用户名放入cookie中
		     		else
		     			$.cookie("name","", {expires: 1});//将用户名放入cookie中
					$.cookie("truename",msg.TRUENAME, {expires: 1});//将用户名放入cookie中
		     		
		     		$.cookie("unit",msg.UNIT, {expires: 1});
		     		var unit2=msg.UNIT;
		     		if(unit2.substr(unit2.length-2,unit2.length)=="00") unit2=unit2.substr(0,unit2.length-2);
		     		if(unit2.substr(unit2.length-2,unit2.length)=="00") unit2=unit2.substr(0,unit2.length-2);
		     		if(msg.UNIT=="36") $.cookie("unit2","_____36", {expires: 1});
		     			else $.cookie("unit2",unit2, {expires: 1});
		     		
		     		if(msg.UNIT=="36") $.cookie("dist","360000", {expires: 1});
		     		else $.cookie("dist",msg.UNIT.substr(msg.UNIT.length-6,msg.UNIT.length), {expires: 1});
		     		
		     		var dist2=msg.UNIT.substr(msg.UNIT.length-6,msg.UNIT.length);
		     		if(dist2.substr(dist2.length-2,dist2.length)=="00") dist2=dist2.substr(0,dist2.length-2);
		     		if(dist2.substr(dist2.length-2,dist2.length)=="00") dist2=dist2.substr(0,dist2.length-2);		     		
		     		$.cookie("dist2",dist2, {expires: 1});
		     		$.cookie("zgx",msg.ZGX, {expires: 1});
		     		
		     		$.cookie("roleid",msg.ROLEID, {expires: 1});
		     		selQxByUser1(msg.ROLEID);
		    		
		     		
		     		
		     		//$('#index_layout').css('visibility', 'visible');
		     	 }
		     	 else{
		     		alert("用户名或密码不正确！！");
		     	 }
			 },
			 error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
	}
	
}

function selQxByUser1(roleid){
	$.ajax({
		type : "POST",
		url : "xtgl/selQxByUser.do",
		dataType : 'json',
		data :"param.roleid="+roleid,
		success : function(msg){
			if(msg){
				document.location.href="./jhgl_index.jsp";
				selSes();
				var qx1= new Array();
				var qx2= new Array();
				var qx3= new Array();
				var qx4= new Array();
				var qx5= new Array();
				var qx6= new Array();
				var qx7= new Array();
				for(var i=0;i<msg.length;i++){
					//第一层
					if(msg[i].id.length==4) qx1.push(msg[i].id);
					//第2层
					if(msg[i].id.length==6) qx2. push(msg[i].id);
					//第3层
					if(msg[i].id.length==8) qx3. push(msg[i].id);
					//第4层
					if(msg[i].id.length==10) qx4. push(msg[i].id);
// 					if(msg[i].id.length==12) qx5. push(msg[i].id);
// 					if(msg[i].id.length==14) qx6. push(msg[i].id);
// 					if(msg[i].id.length==16) qx7. push(msg[i].id);
				}
				YMLib.Var.qx1=qx1;
				YMLib.Var.qx2=qx2;
				YMLib.Var.qx3=qx3;
				YMLib.Var.qx4=qx4;
// 				YMLib.Var.qx5=qx5;
// 				YMLib.Var.qx6=qx6;
// 				YMLib.Var.qx7=qx7;
				//$.cookie("qx1",qx1, {expires: 1});
	     		$.cookie("qx2",qx2, {expires: 1});
	     		$.cookie("qx3",qx3, {expires: 1});
	     		$.cookie("qx4",qx4, {expires: 1});
// 	     		$.cookie("qx5",qx5, {expires: 1});
// 	     		$.cookie("qx6",qx6, {expires: 1});
// 	     		$.cookie("qx7",qx7, {expires: 1});
	     	 }
		 }
	});
}


function selQxByUser(){
	$.ajax({
		type : "POST",
		url : "xtgl/selQxByUser.do",
		dataType : 'json',
		data :"param.roleid="+$.cookie("roleid"),
		success : function(msg){
			if(msg){
				
				var qx1= new Array();
				var qx2= new Array();
				var qx3= new Array();
				var qx4= new Array();
				var qx5= new Array();
				var qx6= new Array();
				var qx7= new Array();
				for(var i=0;i<msg.length;i++){
					//第一层
					if(msg[i].id.length==4) qx1.push(msg[i].id);
					//第2层
					if(msg[i].id.length==6) qx2. push(msg[i].id);
					//第3层
					if(msg[i].id.length==8) qx3. push(msg[i].id);
					//第4层
					if(msg[i].id.length==10) qx4. push(msg[i].id);
// 					if(msg[i].id.length==12) qx5. push(msg[i].id);
// 					if(msg[i].id.length==14) qx6. push(msg[i].id);
// 					if(msg[i].id.length==16) qx7. push(msg[i].id);
				}
				YMLib.Var.qx1=qx1;
				YMLib.Var.qx2=qx2;
				YMLib.Var.qx3=qx3;
				YMLib.Var.qx4=qx4;
// 				YMLib.Var.qx5=qx5;
// 				YMLib.Var.qx6=qx6;
// 				YMLib.Var.qx7=qx7;
				//$.cookie("qx1",qx1, {expires: 1});
	     		$.cookie("qx2",qx2, {expires: 1});
	     		$.cookie("qx3",qx3, {expires: 1});
	     		$.cookie("qx4",qx4, {expires: 1});
// 	     		$.cookie("qx5",qx5, {expires: 1});
// 	     		$.cookie("qx6",qx6, {expires: 1});
// 	     		$.cookie("qx7",qx7, {expires: 1});
	     	 }
		 }
	});
}




function loginCheck(name){
		$.ajax({
			type : "POST",
			url : "xtgl/loginCheck.do",
			dataType : 'json',
			data :"master.truename="+name,
			success : function(msg){
				if(msg){
		     		$.cookie("truename",msg.TRUENAME, {expires: 1});//将用户名放入cookie中
		     		$.cookie("unit",msg.UNIT, {expires: 1});
		     		var unit2=msg.UNIT;
		     		if(unit2.substr(unit2.length-2,unit2.length)=="00") unit2=unit2.substr(0,unit2.length-2);
		     		if(unit2.substr(unit2.length-2,unit2.length)=="00") unit2=unit2.substr(0,unit2.length-2);
		     		if(msg.UNIT=="36") $.cookie("unit2","_____36", {expires: 1});
		     			else $.cookie("unit2",unit2, {expires: 1});
		     		
		     		if(msg.UNIT=="36") $.cookie("dist","360000", {expires: 1});
		     		else $.cookie("dist",msg.UNIT.substr(msg.UNIT.length-6,msg.UNIT.length), {expires: 1});
		     		
		     		var dist2=msg.UNIT.substr(msg.UNIT.length-6,msg.UNIT.length);
		     		if(dist2.substr(dist2.length-2,dist2.length)=="00") dist2=dist2.substr(0,dist2.length-2);
		     		if(dist2.substr(dist2.length-2,dist2.length)=="00") dist2=dist2.substr(0,dist2.length-2);		     		
		     		$.cookie("dist2",dist2, {expires: 1});
		     		
		     		$.cookie("roleid",msg.ROLEID, {expires: 1});
		     		selQxByUser();
		     	 }
			 },error : function(){
				 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
			 }
		});
}

function selSes(type){
	$.ajax({
		 type : "POST",
		 url : "xtgl/selQx.do",
		 dataType : 'json',
		 ansync:false,
	     success : function(msg){
	    	 if(msg){
	    		 //var qx = ","+msg.resourceid+",";
	    		//$.cookie("QX",qx, {expires: 1});//设置权限
	    		// loadMenu(qx);
	    	 }else{
	    		 if(type!=null&&type!="") document.location.href="login.jsp";//w
	    		 else document.location.href="login.jsp";
		     	 alert("session失效，请重新登录！！");
	     	 }
		  },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}
/**
 * 退出系统时清除session
 */
function clearSession(){
	$.ajax({
		 type : "POST",
		 url : "xtgl/clearSession.do",
		 dataType : 'json',
	     success : function(msg){
	    	 document.location.href="login.jsp";
		  },
		 error : function(){
			 YMLib.Tools.Show('服务器请求无响应！error code = 404',3000);
		 }
	});
}
