
function selectTSDQ(lxbm,qdzh,zdzh){
	$("#tsdq").text("");
	var data="lxbm="+lxbm+"&qdzh="+qdzh+"&zdzh="+zdzh;
	$.ajax({
		type:'post',
		url:'/jxcsxm/xmjck/selectTSDQ.do',
		data:data,
		dataType:'json',
		success:function(msg){
			if(msg.length>0){
				var tsdqstr="";
				for(var i=0;i<msg.length;i++){
					tsdqstr=tsdqstr+msg[i]+"、";
				}
				tsdqstr=tsdqstr.substr(0,tsdqstr.length-1);
				$("#tsdq").text(tsdqstr);
			}
		}
	});	
}
function xmnf0(id,xmlx){
	var myDate = new Date();
	var years=[];
	var first='';
	for(var i=0;i<=10;i++){
		if(i==0)
			first=myDate.getFullYear()-i;
		years.push({text:(myDate.getFullYear()+5-i),value:(myDate.getFullYear()+5-i)});
	}
	$('#'+id).combobox({
	    data:years,
	    valueField:'value',
	    textField:'text',
	    onSelect:function(rec){
	    	xmbm('xmbm',$.cookie("dist"),rec.value,xmlx);
	    }
	});
	$('#'+id).combobox("setValue",first);
}
function xmbm(id,xzqh,nf,xmlx){
	var data='xmsq.xmlx='+xmlx+'&xmsq.xzqhdm='+$.cookie('dist')+'&xmsq.xmnf='+nf;
	$("#"+id).val('');
	$.ajax({
		type:'post',
		url:'/jxcsxm/qqgl/queryNextXmbm.do',
		data:data,
		dataType:'json',
		success:function(msg){
			$("#xmbm").val(nf+$.cookie('dist')+msg.xmbm);
		},
		error : function(){
		 YMLib.Tools.Show('生成项目编码错误！error code = 404',3000);
	 }
	});	
}

 