<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<link rel="stylesheet" href="../../HMap/dist/HMap.css" type="text/css">
 <script type="text/javascript" src="../../easyui/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.js"></script>
<script type="text/javascript" src="../../easyui/jscharts.plug.mb.js"></script>
<script type="text/javascript" src="../../widget/anyChart/js/AnyChart.js"></script>
<script type="text/javascript" src="../../js/YMLib.js"></script>
<script type="text/javascript" src="js/Menu.js"></script>
<script type="text/javascript" src="../../js/util/jquery.cookie.js"></script>
<script type="text/javascript" src="../../2.x/OpenLayers.js"></script>
<script type="text/javascript" src="../../framework/jquery.tabletojson.js"></script>
<script type="text/javascript" src="../../HMap/dist/HMap.js"></script>
<script type="text/javascript" src="../../openlayer3/build/ol.js"></script>

<style>
.table_11{background-color:#b8bdc1;font-size:12px;border-collapse: collapse; border:1px solid #b8bdc1; margin:10px;}
.table_11 td{border:1px solid #bedaf5; text-align:center;}
#button li a:link, #button li a:visited {
float:left; 
text-align:center; 
position:relative; 
display:block; 
text-decoration:none; 
color:#000; 
width:50px; 
height:24px; 
line-height:24px; 
border:1px solid #fff; 
border-width:1px 1px 0 0; 
background:#c5dbf2; 
padding-left:10px; 
} 
#button li a:hover { 
color:#fff; 
background:#2687eb; 
}
#button li ul li a:hover { 
color:#fff; 
background:#6b839c; 
} 
#button li ul{ 
display:none; 
position:absolute; 
top:24px; 
left:0; 
margin-top:1px; 
width:50px; 
}  
#button, #button li ul { 
list-style-type:none; 
}
</style>
<script>
        /**
         * DEMO代码主要完成技术突破和技术验证使用，请在理解的基础上按需COPY
         * 代码设计还有待完善
         * */

        /**
         *地图服务地址
         **/
        //var mapServerUrl = "http://192.168.100.118:6080/arcgis/rest/services/JXGS_FOUR/MapServer";
        var mapServerUrl = "http://36.2.11.1:6080/arcgis/rest/services/jiangxi/JXMAP_2017_2/MapServer";
        /**
         * 服务命名空间 不能随便填，请通过hdmapserver服务查看
         **/
        var nameSpace = "jx_2014Query",iQueryNameSpace = "jxmap2014";
        var qlIQueryLayers = ["jx_guoshengtedaqiao", "jx_guoshengzhongxiaoqiao",
            "jx_qlzadaoqiao", "jx_xianxiangtedaqiao", "jx_xianxiangzhongxiaoqiao"];
        var lxIQueryLayes = ["jx_gaosugonglu", "jx_guodao", "jx_shengdao", "jx_xiandao", "jx_xiangdao",
            "jx_cundao", "jx_zhuandao"];
        var qlQueryLayer = "GIS_QL", lxQueryLayer = "GIS_XZQH";

        var pointClick = null, geometry = null;
         jQuery(document).ready(function () {
         	$(".layout-button-right").click();
			xmlxTj();
            OpenLayers.ProxyHost = "../../proxy.jsp?";
            initMap();
            //initDefaultStyle();
            
        });
		
		function test(){
			wfsAttrQuery(lxQueryLaye, "ROADCODE", "X779360823");
			//wfsAttrQuery("jx_2014_lx", "ROADCODE", "S304360423");
		}
		
		
        var map, baseLayers, tolerance, resolution;
        var format = 'image/png';

        //全图视野范围
        var bounds = new OpenLayers.Bounds(113.573, 24.488, 118.482, 30.079);
        /**
         * 初始化默认点、线、面样式
         * */
        var styleMap = null;
        function initDefaultStyle() {
            var sketchSymbolizers = {
                "Point": {
                    pointRadius: 4,
                    graphicName: "square",
                    fillColor: "white",
                    fillOpacity: 1,
                    strokeWidth: 1,
                    strokeOpacity: 1,
                    strokeColor: "#333333",
                    externalGraphic: "../../images/mark.png",
                    graphicWidth: 24,
                    graphicHeight: 24
                },
                "Line": {
                    strokeWidth: 3,
                    strokeOpacity: 1,
                    strokeColor: "#0000FF"
                },
                "Polygon": {
                    strokeWidth: 2,
                    strokeOpacity: 1,
                    strokeColor: "#ffffff",
                    fillColor: "#0000FF",
                    fillOpacity: 0.3
                }
            };
            var style = new OpenLayers.Style();
            style.addRules([new OpenLayers.Rule({
                symbolizer: sketchSymbolizers
            })]);
            styleMap = new OpenLayers.StyleMap({
                "default": style
            });
        }

        /**
         * 初始化地图
         */
       /* function initMap() {
            var options = {
                controls: [],
                maxExtent: bounds,
                maxResolution: 0.02183984375,
                projection: "EPSG:4326",
                units: 'degrees'
            };
            //可选代码 设置地图的宽度、高度
            var w = $(document.body).width();
            var h = $(document.body).height();
            $("#map").css({
                width: w,
                height: h
            });
            //
            map = new OpenLayers.Map('map', options);
            baseLayers = new OpenLayers.Layer.WMS("Geoserver layers - Tiled",
                    mapServerUrl , {
                        LAYERS: 'jx_map',
                        STYLES: '',
                        format: format,
                        tiled: true,
                        tilesOrigin: map.maxExtent.left + ','
                        + map.maxExtent.bottom
                    }, {
                        buffer: 0,
                        displayOutsideMaxExtent: true,
                        isBaseLayer: true,
                        numZoomLevels: 10
                    });
            map.addControl(new OpenLayers.Control.Navigation());
            map.addLayers([baseLayers]);
            map.zoomToExtent(bounds);
            map.addControl(new OpenLayers.Control.PanZoomBar({
                position: new OpenLayers.Pixel(2, 15)
            }));
            map.events.register("click", map, onMapClick);
        }*/
        function initMap() {
        	
      	  var cor = [
      	             {
      	               "level": 0,
      	               "resolution": 0.010986328383069278,
      	               "scale": 4617150
      	             },
      	             {
      	               "level": 1,
      	               "resolution": 0.005493164191534639,
      	               "scale": 2308575
      	             },
      	             {
      	               "level": 2,
      	               "resolution": 0.0027465809060368165,
      	               "scale": 1154287
      	             },
      	             {
      	               "level": 3,
      	               "resolution": 0.0013732916427489112,
      	               "scale": 577144
      	             },
      	             {
      	               "level": 4,
      	               "resolution": 6.866458213744556E-4,
      	               "scale": 288572
      	             },
      	             {
      	               "level": 5,
      	               "resolution": 3.433229106872278E-4,
      	               "scale": 144286
      	             },
      	             {
      	               "level": 6,
      	               "resolution": 1.716614553436139E-4,
      	               "scale": 72143
      	             },
      	             {
      	               "level": 7,
      	               "resolution": 8.582953794130404E-5,
      	               "scale": 36071
      	             },
      	             {
      	               "level": 8,
      	               "resolution": 4.291595870115493E-5,
      	               "scale": 18036
      	             },
      	             {
      	               "level": 9,
      	               "resolution": 2.1457979350577466E-5,
      	               "scale": 9018
      	             },
      	             {
      	               "level": 10,
      	               "resolution": 1.0728989675288733E-5,
      	               "scale": 4509
      	             },
      	             {
      	               "level": 11,
      	               "resolution": 5.363305107141452E-6,
      	               "scale": 2254
      	             },
      	             {
      	               "level": 12,
      	               "resolution": 2.681652553570726E-6,
      	               "scale": 1127
      	             }
      	           ];
      	           var resolutions = [];
      	           for (var i = 0; i < cor.length; i++) {
      	             resolutions.push(cor[i].resolution);
      	           }
      	           map = new HMap.Map();
      	           map.initMap('map', {
      	             interactions: {
      	               altShiftDragRotate: true,
      	               doubleClickZoom: true,
      	               keyboard: true,
      	               mouseWheelZoom: true,
      	               shiftDragZoom: true,
      	               dragPan: true,
      	               pinchRotate: true,
      	               pinchZoom: true,
      	               zoomDelta: 1, // 缩放增量（默认一级）
      	               zoomDuration: 500 // 缩放持续时间
      	             },
      	             controls: {
      	               attribution: true,
      	               attributionOptions: {
      	                 className: 'ol-attribution', // Default
      	                 target: 'attributionTarget',
      	               },
      	               rotate: true,
      	               rotateOptions: {
      	                 className: 'ol-rotate', // Default
      	                 target: 'rotateTarget',
      	               },
      	               zoom: true,
      	               zoomOptions: {
      	                 className: 'ol-zoom', // Default
      	                 target: 'zoomTarget',
      	               },
      	               overViewMapVisible: false,
      	               scaleLineVisible: true
      	             },
      	             view: {
      	               center: [115.92466595234826, 27.428038204473552],
      	               resolutions: resolutions,
      	               fullExtent: [109.72859368643232, 24.010266905347684, 121.13105988819079, 30.76693489432357],
      	               tileSize: 256,
      	               origin: [-400, 399.9999999999998],
      	               // constrainRotation: false, // 旋转角度约束
      	               enableRotation: true, // 是否允许旋转
//      	               extent: [],
//      	               maxResolution: 0, // 非必须参数
//      	               minResolution: 0,
//      	               maxZoom: 19,
//      	               minZoom: 0,
      	               projection: 'EPSG:4326',
      	               rotation: 0,
      	               zoom: 1, // resolution
      	               zoomFactor: 2 // 用于约束分变率的缩放因子（高分辨率设备需要注意）
      	             },
      	             logo: {},
      	             baseLayers: [  // 不传时默认加载OSM地图。
      	               {
      	                 layerName: 'vector',
      	                 isDefault: true,
      	                 layerType: 'TileXYZ',
      	                 opaque: false, //图层是否不透明
      	                 layerUrl: mapServerUrl,
      	               }
      	             ]
      	           });
      	         map.mapTools = {
      	        	      addPoint: false, ljQuery: false,
      	        	      iQuery: false, drawPlot: false,
      	        	      addTextArea: false,
      	        	      toolsType: {
      	        	        addPoint: 'addPoint',
      	        	        ljQuery: 'ljQuery',
      	        	        iQuery: 'iQuery',
      	        	        drawPlot: 'drawPlot',
      	        	        addTextArea: 'addTextArea'
      	        	      }
      	        	    };
      	         map.popupOverlay = null;
      	         map.map.on("click", function (evt) {
      	        	 onMapClick(evt);
       	         })
      	           console.log(map);
      }
        //i查询，生成查询的范围
        function onMapClick(e) {
        	if(map.mapTools.iQuery){
        		document.getElementById("map").style.cursor="default";
        		map.mapTools.iQuery = false;
        		showInfo(e);
           	}
        	else{
        		var feature = map.map.forEachFeatureAtPixel(e.pixel, function (feature) {
    		        return feature;
    		      });
        		console.log(feature);
        		if(feature) {
        			onFeatureSelect(feature);
        		}
        		else {
        			notGetInfo(feature);
        		}
        	}
            /*var resolution = map.getResolution();
            var lonlat = map.getLonLatFromViewPortPx(e.xy);
            alert(lonlat.lon);
            pointClick = new OpenLayers.Geometry.Point(lonlat.lon, lonlat.lat);
            
            geometry = OpenLayers.Geometry.Polygon.createRegularPolygon(pointClick, 5 * resolution, 20, 0);
            alert(lonlat.lon);*/
        }
        /**
         * 属性查询示例
         */
        function attrQuery(_roadcode) {
        	YMLib.Var.bm=_roadcode;
        	//clearGraphics();
            if(_roadcode.length<=10){
            	queryLoad("LX",_roadcode);
            }else{
            	queryLoad("QL",_roadcode);
            }
            
        }
        
        /**
         * 路线桥梁查询定位
         */
        function queryLoad(type,_roadcode){
        	var feature;
        	var lx_code;
        	var xzqhbm;
        	map.removeFeatureByLayerName('resultLayer');
        	if(_roadcode){
        		lx_code=_roadcode.substring(0,_roadcode.length - 6);
        		xzqhbm=_roadcode.substring(_roadcode.length - 6);
        	}
        	var params;
        	if(type=="LX"){
        		params={params:'{"layerName":"GIS_XZQH","filter":"lxdm=\''+lx_code+'\' AND xzqhbm=\''+xzqhbm+'\'","pager":{}}'};
        	} else if(type=="QL"){
        		params={params:'{"layerName":"GIS_QL","filter":"qldm=\''+_roadcode +'\'","pager":{}}'};
        	}
        	        	       	
        	$.ajax({  
                url:"http://36.2.6.21:7001/geoserver-sde/rest/action/search",  
                dataType:'json',  
                data:params,  
                jsonp:'callback',  
                success:function(result) {
                	if(result) {
                		feature=result['data']['features'][0];
                		console.log(feature);
                    	feature['attributes']['style'] = {
    			        		stroke:{
    			        			strokeWidth:4,
    			        			strokeColor:'#EE0033'
    			        		}
    			        };
    			        feature['attributes']['selectStyle'] = {
    			        		stroke:{
    			        			strokeWidth:6,
    			        			strokeColor:'#E52929'
    			        		}
    			        };
    			        var feat;
    			        if(type=="LX") {
    			        	feat = map.addPolyline(feature, {
        			            layerName: 'resultLayer',
        			            selectable: true
        			          });
    			        	var extent = feat.getGeometry().getExtent();
        			        map.zoomToExtent(extent, true);
        			        map.highLightFeature('',feat,'');
    			        }
    			        else if(type=="QL"){
    			        	feat = map.addPoint(feature, {
        			            layerName: 'resultLayer',
        			            selectable: true
        			          });
    			        	map.map.getView().setCenter(feat.getGeometry().getCoordinates());
    			        	map.highLightFeature('',feat,'');
    			        }
    			        
                   	
                	}
                	                    
        	},  
                timeout:3000  
            }); 

        }
        /**
         * I查询
         * */
        var infoControl = null;
        var iQueryType = null
        function IQuery(type) {
        	iQueryType=type;
        	map.mapTools.iQuery=true;
        	document.getElementById("map").style.cursor="pointer";
        	//queryLoad("QL","G35361128L0800");
        }
        /**
         * I查询查询到数据后的处理方法
         */
        var layersConfig = [];
        function showInfo(evt) {
        	var mapZoom = map.map.getView().getZoom();
            var resolution = map.map.getView().getResolution();
            var coordinate = evt.coordinate;
            var point = new ol.geom.Point(coordinate);
            var extent = point.getExtent();
            var buf = ol.extent.buffer(extent, resolution * mapZoom);
            var minx = buf[0], miny = buf[1], maxx = buf[2], maxy = buf[3];
            var wkt = "POLYGON((" + minx + " " + miny + "," + minx + " " + maxy + "," + maxx + " " + maxy + "," + maxx + " " + miny + "," + minx + " " + miny + "))";
            var params = null;
            var layers = null;
            if(iQueryType == "luxian") {
            	layers = "[{\"name\":\"GISDB_2016.GIS_LX\"}]"
            }
            else if(iQueryType == "luduan") {
            	layers = "[{\"name\":\"GISDB_2016.GISROAD_EVENTS\"}]"
            }
            params = {
              resolution: map.map.getView().getResolution(),
              geometry: wkt,
              identityType: "all",
              layers: layers
            };
            map.removeFeatureByLayerName('resultLayer');
            var url="http://36.2.6.21:7001/mapserver/rest/mapserver/mapQuery";
            $.ajax({  
                url:url,  
                dataType:'json',  
                data:params,  
                jsonp:'callback',  
                success:function(result) {
                	if(jQuery.isEmptyObject(result)){
                		alert("未查询到路线");
                	} else
                	{
                		console.log(result);
                		var feature=result[0]['features'][0];
                		console.log(feature);
                    	feature['attributes']['style'] = {
    			        		stroke:{
    			        			strokeWidth:4,
    			        			strokeColor:'#EE0033'
    			        		}
    			        };
    			        feature['attributes']['selectStyle'] = {
    			        		stroke:{
    			        			strokeWidth:6,
    			        			strokeColor:'#E52929'
    			        		}
    			        };
    			        if(iQueryType == "luduan") {
    			        	feature['attributes']['LXDM'] = feature['attributes']['LXBM'];
    			        	feature['attributes']['QDMC'] = feature['attributes']['QDDM'];
    			        	feature['attributes']['QDZH'] = feature['attributes']['ROADSTART'];
    			        	feature['attributes']['ZDMC'] = feature['attributes']['ZDDM'];
    			        	feature['attributes']['ZDZH'] = feature['attributes']['ROADENDS'];
    			        	
    			        }
    			        var feat;
    			        feat = map.addPolyline(feature, {
    			            layerName: 'resultLayer',
    			            selectable: true
    			          });
    			        console.log(feat);
			        	var extent = feat.getGeometry().getExtent();
    			        map.zoomToExtent(extent, true);
    			        map.highLightFeature('',feat,'');
                	}
                	                    
        	},  
                timeout:10000  
            }); 


        }
        /**
         * 调用WFS进行属性查询
         * 注意：这里只封装了单一属性查询，实际上WFS是支持多种属性条件查询和空间查询
         */
        var resultLayer = null;
        function wfsAttrQuery(layerName, keyCol, keyValue) {
            if (resultLayer == null) {
                resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
                    styleMap: styleMap
                });
                map.addLayer(resultLayer);
                //添加数据移动上去显示气泡
                var selectControl = new OpenLayers.Control.SelectFeature(
                        resultLayer, {
                            onSelect: onFeatureSelect,
                            onUnselect: onFeatureUnselect,
                            hover: false
                        });

                map.addControl(selectControl);
                selectControl.activate();
            }


            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: layerName,
                featureNS: nameSpace,//正式环境代码：nameSpace
                /**
                 * 更复杂的逻辑条件请参考OpenLayers的API
                 * */
                filter: new OpenLayers.Filter.Comparison({
                    type: OpenLayers.Filter.Comparison.EQUAL_TO,
                    property: keyCol,
                    value: keyValue
                }),
                maxFeatures: 1000,
                callback: function (req) {
                    var features = req.features;
                    resultLayer.addFeatures(features);
                    if (resultLayer.features && resultLayer.features.length > 0) {
                        map.zoomToExtent(resultLayer.getDataExtent());
                    }
                }
            });
            wfsProtocol.read();
        }


        function spatialQuery(layerName, geo) {
            if (resultLayer == null) {
                resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
                    styleMap: styleMap
                });
                map.addLayer(resultLayer);
                //添加数据移动上去显示气泡
                var selectControl = new OpenLayers.Control.SelectFeature(
                        resultLayer, {
                            onSelect: onFeatureSelect,
                            onUnselect: onFeatureUnselect,
                            hover: false
                        });
                map.addControl(selectControl);
                selectControl.activate();
            }


            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: layerName,
                featureNS: iQueryNameSpace,//正式环境代码：nameSpace
                /**
                 * 更复杂的逻辑条件请参考OpenLayers的API
                 * */
               filter: new OpenLayers.Filter.Spatial({
                    type: OpenLayers.Filter.Spatial.INTERSECTS,
                    value: geo,//
                    projection: 'EPSG:4326'
                }),
                maxFeatures: 1000,
                callback: function (req) {
                    var features = req.features;
                    resultLayer.addFeatures(features);
                    if (resultLayer.features && resultLayer.features.length > 0) {
                        map.zoomToExtent(resultLayer.getDataExtent());
                    }
                }
            });
            wfsProtocol.read();
        }
        function showPopup (obj) {
            var id = '';
            if (map.popupOverlay && !obj['notClear']) {
              map.map.removeOverlay(map.popupOverlay);
              map.popupOverlay = null;
            }
            if (obj['id']) {
              id = obj['id'] + 'overlay';
            } else {
              id = 'overlay' + Math.floor(Math.random() * 1000) + Math.floor(Math.random() * 1000 + 1);
            }
            var m = {
              positioning: 'center-center',
              id: id
            };
            if (offset) {
              m.offset = offset;
            }
            obj = $.extend(obj, m);
            map.popupOverlay = new ol.Overlay.Popup(obj);
            map.map.addOverlay(map.popupOverlay);
            map.popupOverlay.show(obj.coordinate, obj.content);
            map.panIntoView_(map.popupOverlay, obj.coordinate, null)
          };
        /**
         * I查询没有查询到数据的处理方法
         */
        function notGetInfo() {
            ///console.info("没有查询到数据");
        }

        //构造弹出窗口的函数
        var selectedFeature = null;
        function onFeatureSelect(feature) {
        	console.log(feature);
        	if(YMLib.Var.bm==undefined){
        		//if(feature.attributes.ROADBM==undefined) YMLib.Var.bm=feature.attributes.ROADCODE;
        		//else YMLib.Var.bm=feature.attributes.ROADBM;
        		YMLib.Var.bm=feature.getProperties()['LXDM'];
        	}
        	
        	YMLib.Var.feature=feature;
        	//YMLib.Var.bm=parent.YMLib.Var.bm;
        	console.log(YMLib.Var.bm);
        	if(YMLib.Var.bm.length>11) YMLib.UI.createWindow('ql_add','桥梁项目查询','/jxcsxm/page/dzdt/dzdt_ql.jsp','app_add',960,430);
         	else YMLib.UI.createWindow('lx_add','路线项目查询','/jxcsxm/page/dzdt/dzdt_lx.jsp','app_add',960,430);
        }
        //销毁弹出窗口的函数
        function onFeatureUnselect(feature) {
            map.removePopup(feature.popup);
            feature.popup.destroy();
            feature.popup = null;
        }
        //关闭弹出窗口的函数
        function onPopupClose(evt) {
            selectControl.unselect(selectedFeature);
        }


        function getQLFeatures(params) {
            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: qlQueryLayer,
                featureNS: nameSpace,//正式环境代码：nameSpace
                maxFeatures: 2000,
                filter: generatorQLFilter(params),
                callback: function (req) {
                    var features = req.features;
                    if (features && features.length > 0) {
                        addQLGraphicToMap(params, features);
                    }
                }
            });
            wfsProtocol.read();
        }

        //根据查询参数,获取路线图层的要素
        function getLXFeatures(param) {
            var sortAttribute = "ROADSTART";
            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: lxQueryLaye,
                featureNS: nameSpace,//正式环境代码：nameSpace
                maxFeatures: 2000,
                filter: generatorLXFilter(param),
                callback: function (req) {
                    var features = req.features;
                    if (features && features.length > 0) {
                        features = features.sort(
                                function (a, b) {
                                    return a.attributes[sortAttribute] - b.attributes[sortAttribute];
                                }
                        );
                        addLXGraphicToMap(param, features);
                    } else {
                        console.info("没有查询到数据 : " + param.BM);
                    }
                }
            });
            wfsProtocol.read();
        }

        //二分法查找桥梁数据
        function qlBinary(features, obj) {
            var low = 0;
            var high = features.length;
            while (low <= high) {
                var middle = Math.round((low + high) / 2);
                if (obj.value == features[middle].attributes[obj.key]) {
                    return middle;
                } else if (obj.value > features[middle].attributes[obj.key]) {
                    low = middle + 1;
                } else {
                    high = middle - 1;
                }
            }
            return -1;
        }

        function lxPointBinary(features, obj) {
            //features里的点要按照桩号直升序排列
            var lowreturn = 0, high = features.length;
            for (var low = 0; low < high - 1; low++) {
                if (obj.value * 1000000 >= features[low].m * 1000000 && obj.value * 1000000 <= features[low + 1].m * 1000000) {
                    lowreturn = low;
                    break;
                }
            }
            return lowreturn;
        }

        //生成桥梁查询的过滤条件
        function generatorQLFilter(listQueryParams) {
            var len = listQueryParams.length;
            var Filter = new OpenLayers.Filter.Logical({
                type: OpenLayers.Filter.Logical.AND
            });
            var ROADBM = listQueryParams.ROADBM;
            var ROADPOS = listQueryParams.ROADPOS;
            var filterLxbm = new OpenLayers.Filter.Comparison({
                type: OpenLayers.Filter.Comparison.EQUAL_TO,
                property: "ROADBM",
                value: ROADBM
            });
            var filtzh = new OpenLayers.Filter.Comparison({
                type: OpenLayers.Filter.Comparison.EQUAL_TO,
                property: "ROADPOS",
                value: ROADPOS
            });
            Filter.filters.push(filterLxbm);
            Filter.filters.push(filtzh);
            return Filter;
        }

        //生成路线查询的过滤条件
        function generatorLXFilter(listQueryParams) {
            var Filter = new OpenLayers.Filter.Comparison({
                type: OpenLayers.Filter.Comparison.EQUAL_TO,
                property: listQueryParams.queryAttribute,
                value: listQueryParams.BM
            });
            return Filter;
        }

        function addQLGraphicToMap(params, features) {
            if (resultLayer == null) {
                resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
                    styleMap: styleMap
                });
                map.addLayer(resultLayer);
                //添加数据移动上去显示气泡
                var selectControl = new OpenLayers.Control.SelectFeature(
                        resultLayer, {
                            onSelect: onFeatureSelect,
                            onUnselect: onFeatureUnselect,
                            hover: false
                        });
                map.addControl(selectControl);
                selectControl.activate();
            }
            resultLayer.addFeatures(features);
            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
            }
        }


        function addLXGraphicToMap(param, features) {
            var points = generateM(features);
            var lineStrings = generateLine(points, param);
            if (resultLayer == null) {
                resultLayer = new OpenLayers.Layer.Vector("resultLayer", {
                    styleMap: styleMap
                });
                map.addLayer(resultLayer);
                //添加数据移动上去显示气泡
                var selectControl = new OpenLayers.Control.SelectFeature(
                        resultLayer, {
                            onSelect: onFeatureSelect,
                            onUnselect: onFeatureUnselect,
                            hover: false
                        });
                map.addControl(selectControl);
                selectControl.activate();
            }

            resultLayer.addFeatures(new OpenLayers.Feature.Vector(lineStrings, {
                "路线编码": param.BM,
                "起点桩号": param.ROADSTART,
                "止点桩号": param.ROADENDS
            }));

            if (resultLayer.features && resultLayer.features.length > 0) {
                map.zoomToExtent(resultLayer.getDataExtent());
            }
        }

        function generateM(features) {
            var points = [], startZH = 0, endZH = 0;
            var len = features.length;
            startZH = features[0].attributes.ROADSTART;
            endZH = features[len - 1].attributes.ROADENDS;
            startZH = new Number(startZH);
            endZH = new Number(endZH);

            for (var i = 0; i < len; i++) {
                var components = features[i].geometry.components[0].components;
                var comLen = components.length;
                for (var k = 0; k < comLen; k++) {
                    points.push(components[k]);
                }
            }

            var p1, p2, length = 0.0, pointsLen = points.length;

            for (var m = 0; m < pointsLen - 1; m++) {
                p1 = points[m];
                p2 = points[m + 1];
                p1.m = length;
                length += Math.sqrt(Math.pow(p1.x - p2.x, 2) + Math.pow(p1.y - p2.y, 2));
                p2.m = length;
            }

            //计算比例因子
            var factor = (endZH - startZH) / length;
            for (var n = 0; n < pointsLen; n++) {
                var p = points[n];
                p.m = startZH + p.m * factor
            }
            if (points[0].m > points[1].m) {
                //按照升序排列点
                points = points.sort(function (pp1, pp2) {
                    return pp1.m - pp2.m;
                });
            }
            return points;
        }

        function getDistance(p1, p2) {
            return Math.sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
        }

        function generateLine(pnts, param) {
            var finalPoints = [];
            var startIndex = lxPointBinary(pnts, {
                value: param.ROADSTART
            });
            var endIndex = lxPointBinary(pnts, {
                value: param.ROADENDS
            });
            if (startIndex > endIndex) {
                var temp = startIndex;
                startIndex = endIndex;
                endIndex = temp;
            }
            var len = pnts.length;
            var point = null;
            for (var m = startIndex; m < endIndex; m++) {
                point = pnts[m];
                finalPoints.push(point);
            }
            var lineStrings = new OpenLayers.Geometry.LineString(finalPoints);
            return lineStrings;
        }

        //测试桥梁查询
        function testQueryQLByLXMBZH() {
            var listQueryParams = [
                {
                    ROADBM: "G60360681L0160",
                    ROADPOS: 602.7
                },
                {
                    ROADBM: "CJ55361128L0010",
                    ROADPOS: 1.262
                },
                {
                    ROADBM: "Y252361128L0030",
                    ROADPOS: 7.025
                },
                {
                    ROADBM: "G72360735L0100",
                    ROADPOS: 356.034
                }
            ];
            var len = listQueryParams.length;
            for (var i = 0; i < len; i++) {
                var param = listQueryParams[i];
                getQLFeatures(param);
            }
        }

        function testQueryByLXBMZH() {
            //S40的起止点桩号是1.677到191.59
            var listQueryParams = [
                {
                    "BM": "S40",
                    "ROADSTART": 2.5678,
                    "ROADENDS": 91.59
                },
                {
                    "BM": "G56",
                    "ROADSTART": 272.147,
                    "ROADENDS": 257.969
                },
                {
                    "BM": "G56",
                    "ROADSTART": 477.869,
                    "ROADENDS": 478.247
                },
                {
                    "BM": "S26361130",
                    "ROADSTART": 31.828,
                    "ROADENDS": 32.503
                },
                {
                    "BM": "X308360521",
                    "ROADSTART": 0,
                    "ROADENDS": 1.143
                },
                {
                    "BM": "C388360502",
                    "ROADSTART": 0.751,
                    "ROADENDS": 1.021
                }
            ];
            var len = listQueryParams.length;
            var queryAttribute = "BM";
            for (var i = 0; i < len; i++) {
                var param = listQueryParams[i];
                if (param.BM.length > 7) {
                    queryAttribute = "ROADCODE";
                }
                param.queryAttribute = queryAttribute;
                var layerName = lxQueryLaye;
                getLXFeatures(param);
            }
        }


        function addTempLayer(layerName) {

        }

        //根据路线编码和桩号查询桥梁信息
        function queryQLByLXBMZH(queryParams, layerName) {
            var wfsProtocol = new OpenLayers.Protocol.WFS({
                url: mapServerUrl + "/wfs",//正式环境代码：mapServerUrl+"/wfs",
                featureType: layerName,
                featureNS: nameSpace,//正式环境代码：nameSpace
                /**
                 * 更复杂的逻辑条件请参考OpenLayers的API
                 * */
                filter: generatorQLFilter(queryParams),
                maxFeatures: 2000,
                callback: function (req) {
                    var features = req.features;
                    resultLayer.addFeatures(features);
                    if (resultLayer.features && resultLayer.features.length > 0) {
                        map.zoomToExtent(resultLayer.getDataExtent());
                    }
                }
            });
            wfsProtocol.read();
        }

 		function clearGraphics() {
            //根据图层名字来得到图层，图层的名字在创建的时候设定了
            map.removeFeatureByLayerName('resultLayer');
            //console.info("点击清楚按钮");
        }
        
        //带基础数据的弹出方法
		function onFeatureSelect2(feature) {
            selectedFeature = feature;
            var html = [];
            for (var o in feature.attributes) {
                //此处可过滤需要显示的属性字段，并且翻译字段名称等
                html.push("<b>" + o + "</b>：" + feature.attributes[o]);
            }
            var popup = new OpenLayers.Popup.FramedCloud("chicken", feature.geometry
                            .getBounds().getCenterLonLat(), null,
                    "<div style='font-size:.8em'>" + html.join("<br/>") + "</div>",
                    null, true, onPopupClose);
            popup.autoSize = true;
            feature.popup = popup;
            map.addPopup(popup);
        }
		function displaySubMenu(li) { 
			var subMenu = li.getElementsByTagName("ul")[0]; 
			subMenu.style.display = "block"; 
		} 
		function hideSubMenu(li) { 
			var subMenu = li.getElementsByTagName("ul")[0]; 
			subMenu.style.display = "none"; 
		} 
</script>
</head>
<body class="easyui-layout" style="background:#fafafa;" scroll="no">
    <div region="center" style="padding:0px;background:#eee;">
    	<div class="easyui-layout" fit="true">
			<!-- 地图区域开始 -->
		    <div region="center" style="padding:0px;" border="false">
				<div id="mainTab" border="false" class="easyui-tabs" fit="true">

					 <div title="地图" style="overflow: hidden;" iconCls="icon-note">
						 
						 <!--<div style="position: absolute;top: 35px;right:80px;z-index: 9999">
							<a href="#" onclick="IQuery()"><img src="../../images/iSearch.png"/></a>
						</div>
						<div style="position: absolute;top: 35px;right:20px;z-index: 9999">
							<a href="#" onclick="clearGraphics()"><img src="../../images/delete.png"/></a>
						</div>-->
						<ur id="button">
						<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)" style="position: absolute;top: 35px;right:80px;z-index: 9999">
							<a href="#" >I查询</a>	
							<ul> 
								<li><a href="#" value="luxian" onclick='IQuery("luxian")'>路线</a></li> 
								<li><a href="#" value="luduan" onclick='IQuery("luduan")'>路段</a></li> 
							</ul>
						</li>
						<li style="position: absolute;top: 35px;right:20px;z-index: 9999">
							<a href="#" onclick="clearGraphics()" >清空</a>
						</li>

						</ur>
						
						<div id="map" style="width:100%;height:100%;"></div>
					</div>
				</div>
		    </div>
		    <!-- 地图区域结束 -->
		</div>
    </div>
    
    <div id="lay_east" data-options="region:'east',title:'提醒信息',split:true, iconCls: 'icon-west'"  style="width:420px;">
	    	<table class="table_11"  id="xmlxTj_table" width="398" border="1" align="center" cellpadding="0" cellspacing="0" >
	    	</table>
	    	<div id="anychart_div" style="width:350px;height:300px;margin:10px;">
				<div>
					<param name="wmode" value="transparent" />
				</div>
			</div>
			
	</div>
</body>
</html>
