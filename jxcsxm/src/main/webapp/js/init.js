window.moveTo(0,0);
window.resizeTo(window.screen.width,window.screen.height);
var c1 = true;
var c2 = true;
var c8 = true;
var c3 = true;
var c4 = true;
var c7 = true;
var c5 = true;
var c6 = true;

function edit(){
	YMLib.UI.createWindow('updatePassword', '*  修改密码', 'page/xtgl/updatePassword.jsp','updatePassword', 460,320);
}
function editname(){
	YMLib.UI.createWindow('updateName', '*  修改真实姓名', 'page/xtgl/updatename.jsp','updateName', 360,200);
}

$(function(){
	//selSes();
	$("#index_user").html($.cookie('name'));
	
	
	menuQx();
	
	$("#Menu_1,#Menu_2,#Menu_3,#Menu_4,#Menu_5,#Menu_6,#Menu_7,#Menu_8").click(function(e){
		$("#Menu_1,#Menu_2,#Menu_3,#Menu_4,#Menu_5,#Menu_6,#Menu_7,#Menu_8").removeClass('now');
		$("#"+ this.id).addClass('now');
	});
    
    $("#Menu_1").click(function () {
        $("#c2,#c3,#c4,#c5,#c6,#c7,#c8").hide();
        $("#c1").show();
        if (c1){
            $("#c1f").attr("src", "page/dzdt/dzdt.jsp");
        }
    });

    $("#Menu_2").click(function () {
        $("#c1,#c3,#c4,#c5,#c6,#c7,#c8").hide();
        $("#c2").show();
        if (c2) {
            $("#c2f").attr("src", "page/jhcx/Menu.jsp");
        }
    });
    
    $("#Menu_3").click(function () {
        $("#c1,#c2,#c4,#c5,#c6,#c7,#c8").hide();
        $("#c3").show();
        if (c3) {
            $("#c3f").attr("src", "page/zjdw/Menu.jsp");
        }
    });

    $("#Menu_4").click(function () {
        $("#c1,#c2,#c3,#c5,#c6,#c7,#c8").hide();
        $("#c4").show();
        if (c4) {
            $("#c4f").attr("src", "page/zjbf/Menu.jsp");
        }
    });
    
    $("#Menu_5").click(function () {
        $("#c1,#c2,#c3,#c4,#c6,#c7,#c8").hide();
        $("#c5").show();
        if (c5) {
            $("#c5f").attr("src", "page/zcgl/Menu.jsp");
        }
    });
    
    $("#Menu_6").click(function () {
        $("#c1,#c2,#c3,#c4,#c5,#c7,#c8").hide();
        $("#c6").show();
        if (c6) {
            $("#c6f").attr("src", "page/tjbb/Menu.jsp");
        }
    });
    
    $("#Menu_7").click(function () {
    	
        $("#c1,#c2,#c3,#c4,#c5,#c6,#c8").hide();
        $("#c7").show();
        if (c7) {
            $("#c7f").attr("src", "page/xtgl/Menu.jsp");
        }

    });
    
    $("#Menu_8").click(function () {
    	
        $("#c1,#c2,#c3,#c4,#c5,#c6,#c7").hide();
        $("#c8").show();
        if (c8) {
            $("#c8f").attr("src", "page/zjtj/Menu.jsp");
        }

    });
    
    $(".header_content").css({"width":"100%"});

});

function menuQx(){
	
	
	var qx=getQxfromSession('qx2').split(",");
	
	var flag=false;
	for(var i=0;i<qx.length;i++){
		$("#menu_"+qx[i]).css("display","none");
		if($("#menu_"+qx[i]).html()!=undefined){
			$("#menu_"+qx[i]).show();
			if(flag==false){
				var url="";
				switch(qx[i].substr(qx[i].length-1)){
				case "1": url="page/dzdt/dzdt.jsp";break;
				case "2": url="page/jhcx/Menu.jsp";break;
				case "3": url="page/zjdw/Menu.jsp";break;
				case "4": url="page/zjbf/Menu.jsp";break;
				case "5": url="page/zcgl/Menu.jsp";break;
				case "6": url="page/tjbb/Menu.jsp";break;
				case "7": url="page/xtgl/Menu.jsp";break;
				case "8": url="page/zjtj/Menu.jsp";break;
				}
				$("#Menu_"+qx[i].substr(qx[i].length-1)).addClass('now');
				$("#c1f").attr("src", url);
				flag=true;
			}
		}
	}
}
