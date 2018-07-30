<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>index Examples</title>
    <link href="css/Top.css" rel="stylesheet" type="text/css">
    <link href="easyui/themes/insdep/easyui.css" rel="stylesheet" type="text/css">
    <link href="easyui/themes/insdep/easyui_animation.css" rel="stylesheet" type="text/css">
    <link href="easyui/themes/insdep/easyui_plus.css" rel="stylesheet" type="text/css">
	<link href="easyui/themes/insdep/insdep_theme_default.css" rel="stylesheet" type="text/css">
	<link href="easyui/themes/insdep/icon.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/themes/insdep/jquery.insdep-extend.min.js"></script>
	
	    
	<script type="text/javascript">
	
	/* $(function(){
		$('#grid').datagrid({    
		    url:'/demoui/xtgl/selectxmlist.do',
		    striped:true,
		    pagination:true,
		    rownumbers:true,
		    pageNumber:1,
		    pageSize:10,
		    checkOnSelect:true,
		    height:$(window).height()-190,
		   // width:$('#searchField').width()+2,
		   // queryParams: params,
		    columns:[[	{field:'allSel',title:'全选',width:60,align:'center',rowspan:1,checkbox:'true'},
						{field:'cz',title:'操作',width:130,align:'center',
							formatter: function(value,row,index){
								var result='<a style="color:#3399CC;" href="javascript:openXmInfo('+"'"+row.xmbm+"','gs_fwq','zjdw'"+')" >项目详情</a>&nbsp;';
								result+='<a style="color:#3399CC;" href="javascript:openZjdw('+"'"+row.xmbm+"','"+row.gydwdm+"','gs_fwq'"+')" >到位详情</a>';	
								return result;
							}
						},
						{field:'xmnf',title:'项目年份',width:60,align:'center'},
						{field:'xmmc',title:'项目名称',width:270,align:'center'},
						{field:'gydw',title:'管养单位',width:180,align:'center'},
						{field:'xzqh',title:'行政区划',width:100,align:'center'},
						{field:'jhxdwh',title:'计划下达文号',width:250,align:'center'}
		    ]]
		}); 
		
	})	 */
	
	
	</script>
	
	
</head>

<body>

<div id="master-layout" >
        <div data-options="region:'north',border:false,bodyCls:'theme-header-layout'">
        	<div class="theme-navigate ">
                <div class="right">
                    <a href="#" class="easyui-linkbutton font-white" >电子地图</a>
                    <a href="#" class="easyui-linkbutton font-white" >规划管理</a>
                    <a href="#" class="easyui-linkbutton font-white" >前期管理</a>
                    <a href="#" class="easyui-linkbutton font-white" >计划管理</a>
                    <a href="#" class="easyui-linkbutton font-white" >进度管理</a>
                    <a href="#" class="easyui-linkbutton font-white" >数据报表</a>
                    <a href="#" class="easyui-linkbutton font-white" >系统管理</a>


                   <a href="#" class="easyui-menubutton theme-navigate-more-button" data-options="menu:'#more',hasDownArrow:false"></a>
                    <div id="more" class="theme-navigate-more-panel">
                    	<div>个人信息</div>
                        <div>修改密码</div>
                        <div>退出系统</div>
                        <div>关于</div>
                    </div>
                    
                    
                </div>
               
            </div>
        
        </div>

        <!--开始左侧菜单-->
        <div data-options="region:'west',border:false,bodyCls:'theme-left-layout'" style="width:200px;">


            <!--正常菜单--> 
            <div class="theme-left-normal">
                <!--theme-left-switch 如果不需要缩进按钮，删除该对象即可-->    
                <div class="left-control-switch theme-left-switch"><i class="fa fa-chevron-left fa-lg">隐藏</i></div>

                <!--start class="easyui-layout"-->
                <div class="easyui-layout" data-options="border:false,fit:true"> 
                    <!--start region:'north'-->
                    <div data-options="region:'north',border:false" style="height:100px;">
                        <!--start theme-left-user-panel-->
                        <div class="theme-left-user-panel">
                            <dl>
                                <!-- <dt>
                                    <img src="easyui/themes/insdep/images/portrait86x86.png" width="43" height="43">
                                </dt> -->
                                <dd style="padding-left: 20px;">
                                    <b class="badge-prompt">欢迎您</b>
                                    <span style="color: #fff">西安市交通运输局</span>
                                    <!-- <p>安全等级：<i class="text-success">高</i></p> -->
                                </dd>

                            </dl>
                        </div>
                        <!--end theme-left-user-panel-->
                    </div>   
                    <!--end region:'north'-->

                    <!--start region:'center'-->
                    <div data-options="region:'center',border:false">

                        <!--start easyui-accordion--> 
                        <div class="easyui-accordion" data-options="border:false,fit:true">   
                            <div title="国省干线">   
                                <ul class="easyui-datalist" data-options="border:false,fit:true">
                                    <li>新建</li>
                                    <li>改建</li>
                                    <li>路面改造</li>
                                    <li>灾毁恢复</li>
                                </ul>  
                            </div>   
                            <div title="农村公路">   
                                <ul class="easyui-datalist" data-options="border:false,fit:true">
                                    <li>危桥改造</li>
                                    <li>安保工程</li>
                                    <li>灾害防治</li>
                                </ul>      
                            </div>   
                            

                        </div>
                        <!--end easyui-accordion--> 

                    </div>
                    <!--end region:'center'-->
                </div>  
                <!--end class="easyui-layout"-->

            </div>
            <!--最小化菜单--> 
            <div class="theme-left-minimal">
               <!--  <ul class="easyui-datalist" data-options="border:false,fit:true">
                    <li><i class="fa fa-home fa-2x"></i><p>主题</p></li>
                    <li><i class="fa fa-book fa-2x"></i><p>组件</p></li>
                    <li><i class="fa fa-pencil fa-2x"></i><p>编辑</p></li>
                    <li><i class="fa fa-cog fa-2x"></i><p>设置</p></li>
                    <li><div class="left-control-switch theme-left-switch"><i class="fa fa-chevron-left fa-lg"></i></div></li>
                </ul> -->
                <div class="left-control-switch theme-left-switch"><i class="fa fa-chevron-left fa-lg">展开</i></div>
            </div>

        </div>
        <!--结束左侧菜单--> 

        <div data-options="region:'center',border:false,href:'info_1.jsp'"  id="control" style="padding:1px; background:#fff;">
            
        </div>
    </div>



    <script>
    	$(function(){



			
			/*布局部分*/
			$('#master-layout').layout({
				fit:true/*布局框架全屏*/
			});   
			
			 /*右侧菜单控制部分*/

            var left_control_status=true;
            var left_control_panel=$("#master-layout").layout("panel",'west');

            $(".left-control-switch").on("click",function(){
                if(left_control_status){
                    left_control_panel.panel('resize',{width:26});
                    left_control_status=false;
                    $(".theme-left-normal").hide();
                    $(".theme-left-minimal").show();
                }else{
                    left_control_panel.panel('resize',{width:200});
                    left_control_status=true;
                    $(".theme-left-normal").show();
                    $(".theme-left-minimal").hide();
                }
                $("#master-layout").layout('resize', {width:'100%'})
            });

            /*右侧菜单控制结束*/


    	})


    </script>
    

    
</body>
</html>