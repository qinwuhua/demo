function uploadpz(gcid, lcid,num){
	$("#fileupload").uploadify({
	      /*注意前面需要书写path的代码*/
	      'uploader': '../../js/uploader/uploadify.swf',
	      'script': '/hbdtxt/xtgl/insertLcFile.do',
	      'cancelImg': '../../js/uploader/cancel.png',
	      'queueID': 'fileQueue',
	      //和存放队列的DIV的id一致 
	      'fileDataName': 'fileupload',
	      //和以下input的name属性一致 
	      'auto': false,
	      //是否自动开始 
	      'multi': true,
	      //是否支持多文件上传 
	      //'buttonText': 'browse...',
	      'buttonImg': '../../js/uploader/btn_view.png',
	      //按钮上的文字 
	      'simUploadLimit': 100,
	      //一次同步上传的文件数目 
	      'sizeLimit': 200000000000,
	      //设置单个文件大小限制 
	      'queueSizeLimit': 100,
	      //队列中同时存在的文件个数限制 
	      'fileDesc': '支持格式:jpg/JPG/gif/jpeg/png/bmp/doc/xls/ppt/txt/rar.',
	      //如果配置了以下的'fileExt'属性，那么这个属性是必须的 
	      'fileExt': '',
	      //允许的格式   
	      'height':30,
	      'width':92,
	      //另外上传的参数
	      onComplete: function(event, queueID, fileObj, response, data) {
	      	//$('.files').html("");
	          $('<li></li>').appendTo('.files').text(response);
	          $("#fj_list").datagrid('reload');
	          
	      },
	      'scriptData':{'en.projectid':gcid,'en.stateid':lcid,'en.lcxh':num,'att.sfgxfj':0,
	    	  'att.uploader' : $.cookie("username"),
			  'att.visiblerange' : $.cookie("dept")},
	      onError: function(event, queueID, fileObj) {
	          alert("文件:" + fileObj.name + "上传失败");
	          return;
	      },
	      onCancel: function(event, queueID, fileObj) {
	          //alert("取消了" + fileObj.name+"上传");
	      },
	      onQueueFull: function(event, queueSizeLimit) {
	      	alert("最多支持上传文件数为："+queueSizeLimit);
	      
	      }
	  });
	 $("#lhgdig_xbtn .lhgdig_xbtn").click(function(e){
	 		return false;
	 });
	 $("#kssc").hover(function(){
		 $("#kssc").css({"color":"orange"});
	 },function(){
		 $("#kssc").css({"color":"red"});
	 });
	 $("#qxsc").hover(function(){
		 $("#qxsc").css({"color":"orange"});
	 },function(){
		 $("#qxsc").css({"color":"red"});
	 });
}

 function uploadifyUpload() {
     $('#fileupload').uploadifyUpload();
 }
 
 /**
  * 附件列表的加载
  */
 function fj_list(gcid,lcid,num){	
 	$('#fj_list').datagrid({
 		width: $(window).width()-150,			
 		height : 200,	
 		url:'/hbdtxt/xtgl/selAllFileByGlid.do',
 		queryParams : {		
 			'en.projectid':gcid,
 			'en.stateid' : lcid,
 			'en.lcxh' : num
 		},
 		pageNumber : 1,
 		pageSize : 5,
 		pageList:[5,10,20],
 		striped : true,
 		showFooter : false,
 		singleSelect : false,     
 		rownumbers : true,
 		pagination : true,
 		columns:[
 			[
			{field:'filename',title:'文件名称',width:220},
			{field:'uploader',title:'上传人',width:120},
			{field:'uploadtime',title:'上传时间',width:120},
			{field:'sfgxfj',title:'是否共享附件',width:120,
				formatter:function(value,rec,index){
					if(rec.sfgxfj == 1) return '是';
					return '否';
				}},
			{field:'opt',title:'操作',width:100,align:'center',width:220,
				formatter:function(value,rec,index){
					   	   
						sc='<a onclick=deleteEnFj("'+rec.enid+'") href="javascript:void(0)" style=cursor:hand><font color="red">|删除 </font></a>';
					   	  
					 return '<a onclick=downloadfj1("'+rec.id+'") href="javascript:void(0)" style=cursor:hand><font color="red">  下载    </font></a>'+sc ;
				}
			}
 			
 		]],
 		pagination:true,
 		rownumbers:true
 	});
 }

 function deleteEnFj(str){
 	$.ajax({	
 		 type : "post",
 		 url : "/hbdtxt/xtgl/deleteFileByEnId.do",
 	     data : "att.enid="+str,
 		 dataType : 'html',
 		 success: function(msg){
 			 $("#fj_list").datagrid('reload');
 			 }
 		 });
 }