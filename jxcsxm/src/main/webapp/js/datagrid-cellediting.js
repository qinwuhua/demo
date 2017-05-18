function formatDate(date) {
var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
+ (date.getMonth() + 1);
return date.getFullYear() + '-' + month + '-' + day;
};


function urlxmnf(id,flag){
	var myDate = new Date();
	var years=[];
	var first;
	years.push({text:'全部',value:''});
	if(flag=='01011201010101'||flag=='0101120101010101'||flag=='0101120101010102'||flag=='0101120101010103'||
	   flag=='0101120101010104'||flag=='0101120101010105'||flag=='0101120101010106'||flag=='01011201010102'||
	   flag=='010112010102'||flag=='010112010105'||flag=='010112020101'||
	   flag=='01011202010101'||flag=='01011202010102'||flag=='01011202010103'||
	   flag=='010112030101'||flag=='01011203010101'||flag=='01011203010102'||flag=='01011203010103'||
	   flag=='010112030103'||flag=='010112040101'||flag=='01011301010101'||flag=='01011301010102'||
	   flag=='010113010102'||flag=='010113010105'||flag=='01011302010101'||flag=='01011302010102'||
	   flag=='010113020102'||flag=='010113020105'||flag=='01011303010101'||flag=='01011303010102'||
	   flag=='010113030102'||flag=='010113030105'||flag=='01011304010101'||
	   flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'||flag=='01011401010101'||
	   flag=='01011401010102'||flag=='010114010102'||flag=='010114010105'||flag=='01011402010101'||
	   flag=='01011402010102'||flag=='010114020102'||flag=='010114020105'||flag=='01011403010101'||
	   flag=='01011403010102'||flag=='010114030102'||flag=='010114030105'||
	   flag=='010114040101'||flag=='010114040102'||flag=='010114040103'||flag=='010114040104'||
	   flag=='010114040105'||flag=='010114040106'||flag=='010114040107'||
	   flag=='01011501010101'||flag=='01011501010102'||flag=='010115010102'||flag=='010115010105'
	){
		/*if(flag=='01011302010101'||flag=='01011302010102'||flag=='010113020102'||flag=='010113020105'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303010101'||flag=='01011303010102'||flag=='010113030102'||flag=='010113030105'){
			$("#astext").html('计划审核');
		}*/
		/*if(flag=='01011304010101'||flag=='01011304010102'||flag=='010113040102'||flag=='010113040105'){
			$("#astext").html('计划下达');
		}*/
		$("#bstext").html('十二五');
		for(var i=0;i<5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2015)
					first=2015;
				if(first<2010)
					first=2010;
			}
			years.push({text:(2010+5-i),value:(2010+5-i)});
		}
	}
	if(flag=='01011201020101'||flag=='0101120102010101'||flag=='0101120102010102'||
		flag=='0101120102010103'||flag=='0101120102010104'||flag=='0101120102010105'||
		flag=='0101120102010106'||flag=='01011201020102'||flag=='010112010202'||
		flag=='010112010205'||flag=='010112020201'||flag=='01011202020101'||
		flag=='01011202020102'||flag=='01011202020103'||flag=='010112030201'||
		flag=='01011203020101'||flag=='01011203020102'||flag=='01011203020103'||
		flag=='010112030203'||flag=='010112040201'||flag=='01011301020101'||
		flag=='01011301020102'||flag=='010113010202'||flag=='010113010206'||
		flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||
		flag=='010113020206'||flag=='01011303020101'||flag=='01011303020102'||
		flag=='010113030202'||flag=='010113030206'||flag=='010113040105'||flag=='01011304020101'||
		flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'||flag=='01011401020101'||
		flag=='01011401020102'||flag=='010114010202'||flag=='010114010206'||flag=='01011402020101'||
		flag=='01011402020102'||flag=='010114020202'||flag=='010114020206'||flag=='01011403020101'||
		flag=='01011403020102'||flag=='010114030202'||flag=='010114030206'||
		flag=='010114040201'||flag=='010114040202'||flag=='010114040203'||flag=='010114040204'||
		flag=='010114040205'||flag=='010114040206'||flag=='010114040207'||flag=='01011501020101'||
		flag=='01011501020102'||flag=='010115010202'||flag=='010115010206'
	){
		/*if(flag=='01011302020101'||flag=='01011302020102'||flag=='010113020202'||flag=='010113020206'){
			$("#astext").html('计划上报');
		}
		if(flag=='01011303020101'||flag=='01011303020102'||flag=='010113030202'||flag=='010113030206'){
			$("#astext").html('计划审核');
		}*/
		/*if(flag=='01011304020101'||flag=='01011304020102'||flag=='010113040202'||flag=='010113040206'){
			$("#astext").html('计划下达');
		}*/
		$("#bstext").html('十三五');
		for(var i=0;i<=5;i++){
			if(i==0){
				first=myDate.getFullYear()-i;
				if(first>2020)
					first=2020;
				if(first<2015)
					first=2015;
			}
			years.push({text:(2015+5-i),value:(2015+5-i)});
		}
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
	$('#'+id).combobox("setValue",first+'');
	$('#id'+first).attr('checked', true);
}


function openWindows(id,title,xmbm,url,width,height){
	YMLib.Var.xmbm=xmbm;
	if(id=="jhxd" || id=="zjzj"){
		//alert(xmbm.substr(10,1)+"    "+xmlx);
		//if(xmlx==null)
			YMLib.Var.xmlx=xmbm.substr(10,1);
		//else
		   // YMLib.Var.xmlx=xmlx;
		
	}
	YMLib.UI.createWindow1(id,title,url,id,width,height,function(){
		if(id=="lmsjedit" || id=="lmsj"){
			queryLmsj();
		}else if(id=="gsdgzbz" || id=="gsdgzbz"){
			queryxmList();
		}else if(id=="lmgzedit" || id=="lmgz"){
			queryLmgz();
		}else if(id=="xjgcedit" || id=="xjgc"){
			queryXj();
		}else if(id=="yhdzxadd" || id=="yhdzxedit" || id=="yhdzx"){
			queryYhdzx();
		}else if(id=="shxmadd" || id=="shxmedit" || id=="shxm"){
			queryShxm();
		}
		if((id=="jhxd" || id=="zjzj") && xmlx==1){
			queryLmsj();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==2){
			queryLmgz();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==3){
			queryXj();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==4){
			queryYhdzx();
		}else if((id=="jhxd" || id=="zjzj") && xmlx==5){
			queryShxm();
		}
	});
}
/**
 * 关闭弹出窗口
 * @param id
 */
function closeWindow(id){
	parent.$('#'+id).window("destroy");
}