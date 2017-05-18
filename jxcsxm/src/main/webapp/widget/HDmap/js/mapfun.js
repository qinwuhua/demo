var swf={};
//修改map
var intset = 0;
if (navigator.appName.indexOf("Microsoft") != -1) {
	swf = document.getElementById("Main");

	if (swf == undefined||swf ==null) {
		intset = setInterval(function() {
			swf = document["Main"];
			if (swf) {
				clearInterval(intset);
			}
		}, 1000);
	}
} else {
	swf = document["Main"];
	

	if (swf == undefined||swf ==null) {
		intset = setInterval(function() {
			swf = document["Main"];
			if (swf) {
				clearInterval(intset);
			}
		}, 1000);
	}
}

function drawLines(str,issf){
//alert("ssssssssssssss"+str);
//var swf=swfobj("Main");
//alert(swf);
//swf.drawLine(str,issf);
try{	
	swf.drawLine(str,issf);
}catch(e){

	setTimeout(function() {
		if (swf) {
			drawLines(str,issf);
		}
	}, 1000);
}
}

function setMapzoom(i){
	try{	
		swf.setMapzoom(i);
		
}catch(e){
		setTimeout(function() {
			if (swf) {
				setMapzoom(i);
			}
		}, 1000);
}
}
function drawPoints(str,issf){
	//drawPoints("110,38,<p><font color='#190707' size='15' face='宋体'>顺康旅社</font><a href='#'><font color='#0000FF' size='12' face='宋体'>[详情]</font></a><img src='images/Penguins.jpg' width='106' height='86' align='left ' id='testimage'><br><font color='#0000FF' size='12' face='宋体'>联系电话：</font>15846845<br><font color='#0000FF' size='12' face='宋体'>地址：</font>海淀区中坞<br><font color='#0000FF' size='12' face='宋体'>介绍：</font>分啊嘎1法feagawgfawgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg尔阿哥噶个阿哥啊嘎嘎嘎噶额外嘎嘎个歌啊噶为噶尔噶嘎哈啊哈人哈哈噶我光哇嘎,fun,param,name,1,0",false,true);
	try{	
		swf.drawPoints(str,issf);
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				drawPoints(str,issf);
			}
		}, 1000);
}

	
	
}

//起点
function qidian(str){
	try{
		alert(str);
		swf.qidian(str);
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				qidian(str);
			}
		}, 1000);
}

	
	
}
//止点
function zhidian(str){
	try{	
		swf.zhidian(str);
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				zhidian(str);
			}
		}, 1000);
}

	
	
}

function showPoint(str){
	//drawPoints("110,38,<p><font color='#190707' size='15' face='宋体'>顺康旅社</font><a href='#'><font color='#0000FF' size='12' face='宋体'>[详情]</font></a><img src='images/Penguins.jpg' width='106' height='86' align='left ' id='testimage'><br><font color='#0000FF' size='12' face='宋体'>联系电话：</font>15846845<br><font color='#0000FF' size='12' face='宋体'>地址：</font>海淀区中坞<br><font color='#0000FF' size='12' face='宋体'>介绍：</font>分啊嘎1法feagawgfawgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg尔阿哥噶个阿哥啊嘎嘎嘎噶额外嘎嘎个歌啊噶为噶尔噶嘎哈啊哈人哈哈噶我光哇嘎,fun,param,name,1,0",false,true);
	try{	
		swf.showPoint(str);
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				showPoint(str);
			}
		}, 1000);
}
}
function hidePoint(str){
	//drawPoints("110,38,<p><font color='#190707' size='15' face='宋体'>顺康旅社</font><a href='#'><font color='#0000FF' size='12' face='宋体'>[详情]</font></a><img src='images/Penguins.jpg' width='106' height='86' align='left ' id='testimage'><br><font color='#0000FF' size='12' face='宋体'>联系电话：</font>15846845<br><font color='#0000FF' size='12' face='宋体'>地址：</font>海淀区中坞<br><font color='#0000FF' size='12' face='宋体'>介绍：</font>分啊嘎1法feagawgfawgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg尔阿哥噶个阿哥啊嘎嘎嘎噶额外嘎嘎个歌啊噶为噶尔噶嘎哈啊哈人哈哈噶我光哇嘎,fun,param,name,1,0",false,true);
	try{	
		swf.hidePoint(str);
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				hidePoint(str);
			}
		}, 1000);
}

	}

function clearPoints(str,issf){
	//drawPoints("110,38,<p><font color='#190707' size='15' face='宋体'>顺康旅社</font><a href='#'><font color='#0000FF' size='12' face='宋体'>[详情]</font></a><img src='images/Penguins.jpg' width='106' height='86' align='left ' id='testimage'><br><font color='#0000FF' size='12' face='宋体'>联系电话：</font>15846845<br><font color='#0000FF' size='12' face='宋体'>地址：</font>海淀区中坞<br><font color='#0000FF' size='12' face='宋体'>介绍：</font>分啊嘎1法feagawgfawgggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg尔阿哥噶个阿哥啊嘎嘎嘎噶额外嘎嘎个歌啊噶为噶尔噶嘎哈啊哈人哈哈噶我光哇嘎,fun,param,name,1,0",false,true);
	try{	
		swf.clearPoints();
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				clearPoints();
			}
		}, 1000);
}

	
	
}
function moveCenterTo(str){
	try{	
		swf.moveCenterTo(str);
		
}catch(e){
	
		setTimeout(function() {
			if (swf) {
				moveCenterTo(str);
			}
		}, 1000);
}

	
	
}

function WeatherType(){
	//alert("aaaa")
	
}
function loadMapEnd(str){
	//alert(str)
}
function clickPop(str){
	
	//alert(str)
}
function toHere(str){
	
	//alert(str)
}
function mapCenter(str){
	
	//alert(str)
}