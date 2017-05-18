Var ECharts={ 
//container:Ϊҳ��Ҫ��Ⱦͼ���������optionΪ�Ѿ���ʼ���õ�ͼ�����͵�option����  
	ChartConfig: function (container, option) { 

        var chart_path = "js"; //����ͼ������·��  
		
    //    var map_path = "/Statics/echarts/echarts-map";//���õ�ͼ������·��  
		
        require.config({//���볣�õ�ͼ�����͵�����  
            paths: {  
  
                echarts: chart_path,  
  
                'echarts/chart/bar': chart_path,  
  
                'echarts/chart/pie': chart_path,  
  
                'echarts/chart/line': chart_path,  
  
                'echarts/chart/k': chart_path,  
  
                'echarts/chart/scatter': chart_path,  
  
                'echarts/chart/radar': chart_path,  
  
                'echarts/chart/chord': chart_path,  
  
                'echarts/chart/force': chart_path,  
  
    //        'echarts/chart/map': map_path  
            }  
        });  
        this.option = { chart: {}, option: option, container: container };  
        return this.option;  
    }  ,
	
	
	ChartDataFormate: {  
	//data�ĸ�ʽ���ϵ�Result1�����ָ�ʽ�����ݣ������ڱ�ͼ����һ������ͼ������Դ  
        FormateNOGroupData: function (data) {
  
            var categories = [];  
  
            var datas = [];  
  
            for (var i = 0; i < data.length; i++) {  
  
                categories.push(data[i].name || "");  
  
                datas.push({ name: data[i].name, value: data[i].value || 0 });  
  
            }  
  
            return { category: categories, data: datas };  
  
        },  
  //data�ĸ�ʽ���ϵ�Result2��typeΪҪ��Ⱦ��ͼ�����ͣ�����Ϊline��bar��is_stack��ʾΪ�Ƿ��Ƕѻ�ͼ�����ָ�ʽ�����ݶ�����չʾ��������ͼ���������ͼ  
        FormateGroupData: function (data, type, is_stack) {
  
            var chart_type = 'line';  
  
            if (type)  
  
                chart_type = type || 'line';  
  
            var xAxis = [];  
  
            var group = [];  
  
            var series = [];  
  
            for (var i = 0; i < data.length; i++) {  
  
                for (var j = 0; j < xAxis.length && xAxis[j] != data[i].name; j++);  
  
                if (j == xAxis.length)  
  
                    xAxis.push(data[i].name);  
  
                for (var k = 0; k < group.length && group[k] != data[i].group; k++);  
  
                if (k == group.length)  
  
                    group.push(data[i].group);  
  
            }  
  
   
  
            for (var i = 0; i < group.length; i++) {  
  
                var temp = [];  
  
                for (var j = 0; j < data.length; j++) {  
  
                    if (group[i] == data[j].group) {  
  
                        if (type == "map")  
  
                            temp.push({ name: data[j].name, value: data[i].value });  
  
                        else  
  
                            temp.push(data[j].value);  
  
                    }  
  
                }  
  
                switch (type) {  
  
                    case 'bar':  
  
                        var series_temp = { name: group[i], data: temp, type: chart_type };  
  
                        if (is_stack)  
  
                            series_temp = $.extend({}, { stack: 'stack' }, series_temp);  
  
                        break;  
  
                    case 'map':  
  
                        var series_temp = {  
  
                            name: group[i], type: chart_type, mapType: 'china', selectedMode: 'single',  
  
                            itemStyle: {  
  
                                normal: { label: { show: true} },  
  
                                emphasis: { label: { show: true} }  
  
                            },  
  
                            data: temp  
  
                        };  
  
                        break;  
  
                    case 'line':  
  
                        var series_temp = { name: group[i], data: temp, type: chart_type };  
  
                        if (is_stack)  
  
                            series_temp = $.extend({}, { stack: 'stack' }, series_temp);  
  
                        break;  
  
                    default:  
  
                        var series_temp = { name: group[i], data: temp, type: chart_type };  
  
                }  
  
                series.push(series_temp);  
  
            }  
  
            return { category: group, xAxis: xAxis, series: series };  
  
        },  

},
//ͼ�����͵����ó�ʼ��
ChartOptionTemplates: {  
  
        CommonOption: {//ͨ�õ�ͼ���������  
  
            tooltip: {  
  
                trigger: 'axis'//tooltip������ʽ:axis��X���ߴ���,item��ÿһ���������  
  
            },  
  
            toolbox: {  
  
                show: true, //�Ƿ���ʾ������  
  
                feature: {  
  
                    mark: true,  
  
                    dataView: { readOnly: false }, //����Ԥ��  
  
                    restore: true, //��ԭ  
  
                    saveAsImage: true //�Ƿ񱣴�ͼƬ  
  
                }  
  
            }  
  
        },  
  
        CommonLineOption: {//ͨ�õ�����ͼ��Ļ�������  
  
            tooltip: {  
  
                trigger: 'axis'  
  
            },  
  
            toolbox: {  
  
                show: true,  
  
                feature: {  
  
                    dataView: { readOnly: false }, //����Ԥ��  
  
                    restore: true, //��ԭ  
  
                    saveAsImage: true, //�Ƿ񱣴�ͼƬ  
  
                    magicType: ['line', 'bar']//֧������ͼ������ͼ���л�  
  
                }  
  
            }  
  
        },  
  
        Pie: function (data, name) {//data:���ݸ�ʽ��{name��xxx,value:xxx}...  
  
            var pie_datas = ECharts.ChartDataFormate.FormateNOGroupData(data);  
  
            var option = {  
  
                tooltip: {  
  
                    trigger: 'item',  
  
                    formatter: '{b} : {c} ({d}/%)',  
  
                    show: true  
  
                },  
  
                legend: {  
  
                    orient: 'vertical',  
  
                    x: 'left',  
  
                    data: pie_datas.category  
  
                },  
  
                series: [  
  
                    {  
  
                        name: name || "",  
  
                        type: 'pie',  
  
                        radius: '65%',  
  
                        center: ['50%', '50%'],  
  
                        data: pie_datas.data  
  
                    }  
  
                ]  
  
            };  
  
            return $.extend({}, ECharts.ChartOptionTemplates.CommonOption, option);  
  
        },  
  
Lines: function (data, name, is_stack) { //data:���ݸ�ʽ��{name��xxx,group:xxx,value:xxx}...  
  
            var stackline_datas = ECharts.ChartDataFormate.FormateGroupData(data, 'line', is_stack);  
  
            var option = {  
  
                legend: {  
  
                    data: stackline_datas.category  
  
                },  
  
                xAxis: [{  
  
                    type: 'category', //X���Ϊcategory��Y���Ϊvalue  
  
                    data: stackline_datas.xAxis,  
  
                    boundaryGap: false//��ֵ�����˵Ŀհײ���  
  
                }],  
  
                yAxis: [{  
  
                    name: name || '',  
  
                    type: 'value',  
  
                    splitArea: { show: true }  
  
                }],  
  
                series: stackline_datas.series  
  
            };  
  
            return $.extend({}, ECharts.ChartOptionTemplates.CommonLineOption, option);  
  
        },  
  
Bars: function (data, name, is_stack) {//data:���ݸ�ʽ��{name��xxx,group:xxx,value:xxx}...  
  
            var bars_dates = ECharts.ChartDataFormate.FormateGroupData(data, 'bar', is_stack);  
  
            var option = {  
  
                legend: bars_dates.category,  
  
                xAxis: [{  
  
                    type: 'category',  
  
                    data: bars_dates.xAxis,  
  
                    axisLabel: {  
  
                        show: true,  
  
                        interval: 'auto',  
  
                        rotate: 0,  
  
                        margion: 8  
  
                    }  
  
                }],  
  
                yAxis: [{  
  
                    type: 'value',  
  
                    name: name || '',  
  
                    splitArea: { show: true }  
  
                }],  
  
                series: bars_dates.series  
  
            };  
  
            return $.extend({}, ECharts.ChartOptionTemplates.CommonLineOption, option);  
  
        },  
  
  //������ͼ�����ã�����ͼ+���ߡ���ͼ  
  

  
   
  
}  ,

//ͼ�ε���Ⱦ
Charts: {  
  
        RenderChart: function (option) {  
  
            require([  
  
                'echarts',  
  
                'echarts/chart/line',  
  
                'echarts/chart/bar',  
  
                'echarts/chart/pie',  
  
                'echarts/chart/k',  
  
                'echarts/chart/scatter',  
  
                'echarts/chart/radar',  
  
                'echarts/chart/chord',  
  
                'echarts/chart/force',  
  
                'echarts/chart/map'  
  
              ],  
  
              function (ec) {  
  
                  echarts = ec;  
  
                  if (option.chart && option.chart.dispose)  
  
                      option.chart.dispose();  
  
                  option.chart = echarts.init(option.container);  
  
                  window.onresize = option.chart.resize;  
  
                  option.chart.setOption(option.option, true);  
  
              });  
  
        },  
  
        //��Ⱦ������ͼ�����ͣ��磺��ͼ  

  
        }
}		
  