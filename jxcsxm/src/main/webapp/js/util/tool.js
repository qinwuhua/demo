var $j=function(id){return document.getElementById(id);};
		var getMouseP=function (e){
		//获取鼠标坐标 请传递evnet参数
		e = e || window.event;
		var m=(e.pageX || e.pageY)?{ x:e.pageX, y:e.pageY } : 
		{ x:e.clientX + document.body.scrollLeft - document.body.clientLeft, y:e.clientY + document.body.scrollTop  - document.body.clientTop };
		return m;
		};
		    
		move=function(o,t){
			o=$j(o);
			t=$j(t);
			o.onmousedown=function(ev){
				var mxy=getMouseP(ev);//获取当前鼠标坐标
				var by={x:mxy.x-(t.offsetLeft),y:mxy.y-(t.offsetTop)};
				o.style.cursor="move";
				document.onmousemove=function(ev){
					var mxy=getMouseP(ev);
					t.style.left=mxy.x-by.x+"px";
					t.style.top=mxy.y-by.y+"px";
				};
				document.onmouseup=function(){
					window.getSelection ? window.getSelection().removeAllRanges() : document.selection.empty();
					this.onmousemove=null;
				};
			};
		};