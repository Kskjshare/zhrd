
   
   
    
    function echart1(value,value2_parameter) {
        let obj = []; //定义新数组，传入echart图表所需要的数据格式 和字段
        obj.push({product:"汽车及装备制造业","待处理":1,"处理中":2,"已完成":3})
        obj.push({product:"电子信息工业","待处理":1,"处理中":2,"已完成":3})
 console.log("____________ value=",value)
 console.log("____________ value2_parameter=",value2_parameter)

        
        var month=[ "2010年", "2011年", "2012年", "2013年", "2014年", "2015年", "2016年", "2017年", "2018年","2019年", "2020年", "2021年"];                 
        var datasss = [];
        var cnt = 0 ;
        for( var i = 0 ; i < value.length ;i ++ ) {

           // datasss.push( value[i]);
            datasss.push( month[i]);
            
            cnt ++ ;
            if ( cnt > 11 )
                break;
        }
        
        
        var value2 = [];
        cnt = 0 ;
        for( var i = 0 ; i < value2_parameter.length ;i ++ ) {

            value2.push( value2_parameter[i]);
            cnt ++ ;
            if ( cnt > 11 )
                break;
        }
    
        
        var myChart1 = echarts.init(document.getElementById('main'));
        option = {
            backgroundColor: '#FFFFFF',
            
            title: {
                text: '近年学习培训统计分析表',
                // subtext: '数据来自网络',
                textStyle: {
//                    color: "#fff"
                    color: "#000"
                    
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }

            },
            
            legend: {
                orient: 'vertical',
                right: '10',
                top:"10",
                data: [
                    '汝州市水利局',
                    '汝州市粮食局',
                    '汝州市交通局',                    
                    '汝州市规划局',
                ],
                textStyle: {
//                    color: "#fff",
                    color: "#000"
                    
                }
            },
            dataset: {
                dimensions: ['product', '待处理', '处理中', '已完成'],
                source: obj
            },
            
            grid: {
                left: '4%',
                right: '10%',
                bottom: '3%',
                containLabel: true

            },
            xAxis: [
                {
                    type: 'category',
                    data: datasss,
                    textStyle:{
                        
                    },
                    axisTick: {
                        alignWithLabel: true,
                        barBorderRadius: [0, 0, 0, 0]
                    },
                    axisLine: {
                        lineStyle: {
//                            color: "#fff"
                             color: "#000"
                           
                        }
                    },
                    axisLabel:{
                         interval:0,//横轴信息全部显示
                         rotate:45,//度角倾斜显示
                         formatter:function(datasss){//只显示五个字 其余省略号
//                             return datasss.length > 4?datasss.substring(0,6)+'...':datasss;
                             return datasss.length > 4?datasss.substring(0,6):datasss;

                         }
                     }
                }
            ],
            yAxis: [
                { 
                    // min:0, //y轴的最小值
                    // max:number, //y轴最大值
                    interval:10, //值之间的间隔
                    type: 'value',
                    axisLine: {
                        lineStyle: {
//                            color: "#fff"
                            color: "#000"

                        }
                    }
                }
            ],
            // color:"rgb(0,227,255)",
            series: [
                {
                    name: '数量',
                    type: 'bar',
                    barWidth: '20',
                    barBorderRadius: 0,
                    data: value2,
                    
                    center: [
                        '45%', '50%'
                    ],
                    itemStyle: {
                        normal: { // 柱形图圆角，初始化效果
                            barBorderRadius: [0, 0, 0, 0],
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                            {
                                offset: 0,
                                color: 'rgb(4,233,255)'
//                                color: 'rgb(0,0,0)'
                                

                            },
                            {
                                offset: 0.5,
                                color: 'rgb(255,54,254)'
//                                color: 'rgb(0,0,0)'
                                

                            },
                            {
                                offset: 0.5,
                                color: 'rgb(255,54,254)'
//                                color: 'rgb(0,0,0)'
                                

                            },
                            {
                                offset: 1,
                                color: 'rgb(2,132,254)'
//                                color: 'rgb(0,0,0)'
                                
                            }
                         ]),
                        },
                       
                    },
                }
            ]
        };
        myChart1.setOption(option);
        window.addEventListener("resize",function(){
            myChart1.resize();
        });
        myChart1.on('click', function (params) {
            console.log(params);
        });

    }
    
    function echartStatute( statuteData ) {

      
        var statute = echarts.init(document.getElementById('statute'));
        
           
        option = {
    color: ['#298DFF', ' #37CCCC', '#4ECC74', '#FBD438', '#EBA676', '#F2647C', '#9860E5', '#2F32CE', '#192761'],
    backgroundColor: '#FFFFFF',
    barWidth: 8,
    title: {
                text: '法律法规统计',
                left: 'left',
                textStyle: {
                    //color: "#fff"
                    color: "#000"

                }
            },
    tooltip: {
        axisPointer: {
            type: 'shadow'
        },
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c} ({d}%)'
    },
    legend: {
//        icon: 'circle',
        type: 'scroll',
        // type: 'plain',
        orient: 'vertical',
        right: 20,
        top: '20%',
        // bottom: 0,
        data: ['宪法', '国家法律', '相关法规']
    },
    
    
    
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    series: [
        {
            name: '',
            type: 'pie',
            radius: [ '0%', '70%'],
            center: ["50%", "50%"],
            itemStyle: {
                borderWidth: 1,
                borderColor: '#fff'
            },
            emphasis: {
                itemStyle: {
                    borderWidth: 0,
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            },
            labelLine:{
                        normal:{
                            length:30,  //视觉引导线长度
                            length2:70
                        }
                    },
                    center: [
                        '50%', '50%'
                    ],
                    label:{   //文本样式处理
                          formatter: "{d}%,{b|{b}}\n\n",
                            borderWidth: 1,
                            borderRadius: 4,
                            padding: [0, -70],
                            // borderColor:'#fff',  // label border
                            rich: {
                                b: {
                                color: "#fff",
                                fontSize: 12,
                                // lineHeight: 33
                                },
                            }
                    },
            data: statuteData
        }
    ]
}
        

        statute.setOption(option);
        window.addEventListener("resize",function(){
            statute.resize();
        });
       
    }
    

    function echartCourse( datasss ) {


        var myChart3 = echarts.init(document.getElementById('main3'));
        option = {
            backgroundColor: '#FFFFFF',
            title: {
                text: '学习课件类型统计',
                // subtext: '纯属虚构',
                left: 'left',
                textStyle: {
                    //color: "#fff"
                    color: "#000",
 
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c}件 ({d}%)'
            },
            color: [
               'rgb(255,219,91)',
                'rgb(159,230,180)',
                'rgb(255,114,147)',
                'rgb(130,120,223)',
//                'rgb(47,197,223)',
//                'rgb(255,159,120)',
//                'rgb(231,188,242)',
//                'rgb(71,96,255)',
            ],
            legend: {
                orient: 'vertical',
                right: '10',
                top:"10",
                data: [
                    '党建',
                    '履职',
                    '法律法规',                    
                    '经济',
                ],
                textStyle: {
//                    color: "#fff",
                    color: "#000",

                }
            },
            series: [
                {
                    name: '具体数据',
                    type: 'pie',
                    radius: [
                        '35%', '70%'
                    ],
                    labelLine:{
                        normal:{
                            length:30,  //视觉引导线长度
                            length2:70
                        }
                    },
                    center: [
                        '50%', '50%'
                    ],
                    label:{   //文本样式处理
                          formatter: "{d}%,{b|{b}}\n\n",
                            borderWidth: 1,
                            borderRadius: 4,
                            padding: [0, -70],
                            // borderColor:'#fff',  // label border
                            rich: {
                                b: {
                                //color: "#fff",
                                color: "#000",

                                fontSize: 12,
                                // lineHeight: 33
                                },
                            }
                    },
                    data: datasss,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };

        myChart3.setOption(option);
        window.addEventListener("resize",function(){
            myChart3.resize();
        });
        myChart3.on('click', function (params) {
            console.log(params );          
        })

    }
    function echart4(dangpai) {
        var myChart4 = echarts.init(document.getElementById('main4'));

        option = {
            title: {
                text: '代表党派构成分析',
                left: 'left',
                textStyle: {
                    color: "#fff"
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                right: '10',
                top:"10",
                data: [
                    '群众',
                    '共青团',
                    '无党派',
                    '民主党',
                    '中国共产党'
                ],
                textStyle: {
                    color: "#fff"
                }
            },
            color: [
                'rgba(255,219,91,.8)',
                'rgba(159,230,180,.8)',
                'rgba(255,114,147,.8)',
                'rgba(130,120,223,.8)',
                'rgba(47,197,223,.8)',
                'rgba(255,159,120,.8)',
                'rgb(231,188,242)',
                'rgb(71,96,255)',
            ],
            series: [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: [
                        '50%', '60%'
                    ],
                    center: [
                        '35%', '55%'
                    ],
                    data:dangpai,
                     
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };

        myChart4.setOption(option);
        window.addEventListener("resize",function(){
            myChart4.resize();
        });
    }

  

    function echart_main_1(  ) { 
   
    }
    
    function echart_main_2( datasss ) { 
    var main_2 = echarts.init(document.getElementById('main_2'));
     
        option = {
            backgroundColor: '#FFFFFF',
            title: {
                text: '机关案件分类统计表-人民法院',
                // subtext: '纯属虚构',
                left: 'left',
                textStyle: {
                    //color: "#fff"
                    color: "#000",
 
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            color: [
               'rgb(255,219,91)',
                'rgb(159,230,180)',
                'rgb(255,114,147)',
                'rgb(130,120,223)',
//                'rgb(47,197,223)',
//                'rgb(255,159,120)',
//                'rgb(231,188,242)',
//                'rgb(71,96,255)',
            ],
            legend: {
                orient: 'vertical',
                right: '10',
                top:"10",
                data: [
                    '刑事',
                    '民事',
                    '行政',                    
                    '执行',
                ],
                textStyle: {
//                    color: "#fff",
                    color: "#000",

                }
            },
            series: [
                {
                    name: '案件数量',
                    type: 'pie',
                    radius: [
                        '0%', '70%'
                    ],
                    labelLine:{
                        normal:{
                            length:30,  //视觉引导线长度
                            length2:70
                        }
                    },
                    center: [
                        '45%', '50%'
                    ],
                    label:{   //文本样式处理
                          formatter: "{d}%,{b|{b}}\n\n",
                            borderWidth: 1,
                            borderRadius: 4,
                            padding: [0, -70],
                            // borderColor:'#fff',  // label border
                            rich: {
                                b: {
                                //color: "#fff",
                                color: "#000",

                                fontSize: 12,
                                // lineHeight: 33
                                },
                            }
                    },
                    data: datasss,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };


        main_2.setOption(option);
        window.addEventListener("resize",function(){
            main_2.resize();
        });

    }
      
      
     function echart_main_3(  ) { 
    var main_3 = echarts.init(document.getElementById('main_3'));
        option = {
            backgroundColor: '#FFFFFF',
            
            title: {
                text: '机关案件分类统计表-监察委',
                left: 'left',
                textStyle: {
                    color: "#000"
                   
                }
            },
//            color:['rgb(155,0,255)','rgb(31,121,213)','rgb(251,1,100)','rgb(1,0,250)','rgb(255,0,250)','rgb(253,145,23)'],
            color:['rgb(155,0,255)','rgb(251,1,100)','rgb(253,145,23)','rgb(255,0,250)'],

            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                right: '10',
                top: 30,
                data: [
                    '刑事',
                    '民事',
                    '行政',
                    '执行',
                ],
                textStyle: {
                    color: "#000"
                    
                }
            },
            toolbox: {
                show: false,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: false,
                        readOnly: false
                    },
                    magicType: {
                        show: false,
                        type: ['pie', 'funnel']
                    },
                    restore: {
                        show: false
                    },
                    saveAsImage: {
                        show: false
                    }
                }
            },
            series: [
                {
                    name: '案件类型',
                    type: 'pie',
                    radius: [
                        0, 120
                    ],
                    center: [
                        '50%', '50%'
                    ],
                    
                  labelLine:{
                        normal:{
                            length:30,  //视觉引导线长度
                            length2:70
                        }
                    },
                    label:{   //文本样式处理
                          formatter: "{d}%,{b|{b}}\n\n",
                            borderWidth: 1,
                            borderRadius: 4,
                            padding: [0, -70],
                            // borderColor:'#fff',  // label border
                            rich: {
                                b: {
                                //color: "#fff",
                                color: "#000",

                                fontSize: 12,
                                // lineHeight: 33
                                },
                            }
                    },    
                    
                    roseType: 'area',
                    data: [
                        {
                            value: 5,
                            name: '刑事'
                        },
                        {
                            value: 15,
                            name: '民事'
                        },
                        {
                            value: 25,
                            name: '行政'
                        }, {
                            value: 20,
                            name: '执行'
                        }, 

                    ]
                }
            ]
        };


        main_3.setOption(option);
        window.addEventListener("resize",function(){
            main_3.resize();
        });

    }
    
    
    
    function echart_main_4( datasss ) { 
    var main_4 = echarts.init(document.getElementById('main_4'));
     
        option = {
            backgroundColor: '#FFFFFF',
            title: {
                text: '机关案件分类统计表-公安局',
                left: 'left',
                textStyle: {
                    color: "#000",
 
                }
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            color: [
//               'rgb(255,219,91)',
//                'rgb(159,230,180)',
//                'rgb(255,114,147)',
//                'rgb(130,120,223)',
                'rgb(47,197,223)',
                'rgb(255,159,120)',
                'rgb(231,188,242)',
                'rgb(71,96,255)',
            ],
            legend: {
                orient: 'vertical',
                right: '10',
                top:"10",
                data: [
                    '刑事',
                    '民事',
                    '行政',                    
                    '执行',
                ],
                textStyle: {
                    color: "#000",

                }
            },
            series: [
                {
                    name: '案件数量',
                    type: 'pie',
                    radius: [
                        '0%', '70%'
                    ],
                    labelLine:{
                        normal:{
                            length:30,  //视觉引导线长度
                            length2:70
                        }
                    },
                    center: [
                        '45%', '50%'
                    ],
                    label:{   //文本样式处理
                          formatter: "{d}%,{b|{b}}\n\n",
                            borderWidth: 1,
                            borderRadius: 4,
                            padding: [0, -70],
                            // borderColor:'#fff',  // label border
                            rich: {
                                b: {
                                //color: "#fff",
                                color: "#000",

                                fontSize: 12,
                                // lineHeight: 33
                                },
                            }
                    },
                    data: datasss,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
  };
 
        main_4.setOption(option);
        window.addEventListener("resize",function(){
            main_4.resize();
        });

    }
      
   function echart_main_5( datasss ) { 
 var main_5 = echarts.init(document.getElementById('main_5'));
  

 }
      
    
    function echartLectureMode1( lectureModeData ) {
        var lectureModeData = echarts.init(document.getElementById('lecturemode'));
        option = {
            backgroundColor: '#FFFFFF',
            
            title: {
                text: '专题讲座方式统计',

                // subtext: '纯属虚构',
                left: 'left',
                textStyle: {
                    color: "#000"
                   
                }
            },
            color:['rgb(155,0,255)','rgb(251,1,100)','rgb(253,145,23)','rgb(255,0,250)'],

            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                right: '10',
                top: 30,
                data: [
                    '公开讲座',
                    '视频讲座',
                    '其他',
                ],
                textStyle: {
                    color: "#000"
                    
                }
            },
            toolbox: {
                show: false,
                feature: {
                    mark: {
                        show: true
                    },
                    dataView: {
                        show: false,
                        readOnly: false
                    },
                    magicType: {
                        show: false,
                        type: ['pie', 'funnel']
                    },
                    restore: {
                        show: false
                    },
                    saveAsImage: {
                        show: false
                    }
                }
            },
            series: [
                {
                    name: '讲座类方式',
                    type: 'pie',
                    radius: [
                        60, 120
                    ],
                    center: [
                        '50%', '50%'
                    ],
                    roseType: 'area',
                    data: lectureModeData
                }
            ]
        };


        lectureModeData.setOption(option);
        window.addEventListener("resize",function(){
            lectureModeData.resize();
        });

    }



function echartLectureMode( lectureTypeData ) {


    var lecturemode = echarts.init(document.getElementById('lecturemode'));
    option = {
        backgroundColor: '#FFFFFF',
        title: {
            text: '专题讲座类型统计',
            // subtext: '纯属虚构',
            left: 'left',
            textStyle: {
                //color: "#fff"
                color: "#000",

            }
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}件 ({d}%)'
        },
        color: [
           'rgb(255,219,91)',
            'rgb(159,230,180)',
            'rgb(255,114,147)',
            'rgb(130,120,223)',
//                'rgb(47,197,223)',
//                'rgb(255,159,120)',
//                'rgb(231,188,242)',
//                'rgb(71,96,255)',
        ],
        legend: {
            orient: 'vertical',
            right: '10',
            top:"10",
            data: [
                '公开讲座',
                '视频讲座',
                '其他讲座',                    
            ],
            textStyle: {
//                    color: "#fff",
                color: "#000",

            }
        },
        series: [
            {
                name: '具体数据',
                type: 'pie',
                radius: [
                    '35%', '70%'
                ],
                labelLine:{
                    normal:{
                        length:30,  //视觉引导线长度
                        length2:70
                    }
                },
                center: [
                    '50%', '50%'
                ],
                label:{   //文本样式处理
                      formatter: "{d}%,{b|{b}}\n\n",
                        borderWidth: 1,
                        borderRadius: 4,
                        padding: [0, -70],
                        // borderColor:'#fff',  // label border
                        rich: {
                            b: {
                            //color: "#fff",
                            color: "#000",

                            fontSize: 12,
                            // lineHeight: 33
                            },
                        }
                },
                data: lectureTypeData,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    lecturemode.setOption(option);
    window.addEventListener("resize",function(){
        lecturemode.resize();
    });
       
    }



function echartLecture( lectureTypeData ) {


    var lecturetype = echarts.init(document.getElementById('lecturetype'));
    option = {
        backgroundColor: '#FFFFFF',
        title: {
            text: '专题讲座类型统计',
            // subtext: '纯属虚构',
            left: 'left',
            textStyle: {
                //color: "#fff"
                color: "#000",

            }
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c}件 ({d}%)'
        },
        color: [
           'rgb(255,219,91)',
            'rgb(159,230,180)',
            'rgb(255,114,147)',
            'rgb(130,120,223)',
//                'rgb(47,197,223)',
//                'rgb(255,159,120)',
//                'rgb(231,188,242)',
//                'rgb(71,96,255)',
        ],
        legend: {
            orient: 'vertical',
            right: '10',
            top:"10",
            data: [
                '法规讲座',
                '规范讲座',
                '其他讲座',                    
            ],
            textStyle: {
//                    color: "#fff",
                color: "#000",

            }
        },
        series: [
            {
                name: '具体数据',
                type: 'pie',
                radius: [
                    '35%', '70%'
                ],
                labelLine:{
                    normal:{
                        length:30,  //视觉引导线长度
                        length2:70
                    }
                },
                center: [
                    '50%', '50%'
                ],
                label:{   //文本样式处理
                      formatter: "{d}%,{b|{b}}\n\n",
                        borderWidth: 1,
                        borderRadius: 4,
                        padding: [0, -70],
                        // borderColor:'#fff',  // label border
                        rich: {
                            b: {
                            //color: "#fff",
                            color: "#000",

                            fontSize: 12,
                            // lineHeight: 33
                            },
                        }
                },
                data: lectureTypeData,
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    lecturetype.setOption(option);
    window.addEventListener("resize",function(){
        lecturetype.resize();
    });
       
    }





    
    function footerOne() {
     
    }
    function footerTwo(obj) {
       
    }
    function footerTree(number,number2,maleFormate,femaleFormate) {
        var myChart7 = echarts.init(document.getElementById('footerTree'));
        option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data: ['男', '女'],
                top:"2%",
                right:"5%",
                textStyle:{
                    color:"#fff"
                }
            },
            title:{
                text:   `男女分析表\n\n\n\n                    ${number}人                 ${number}人\n\n\n\n\n`,
                subtext:`                 ${maleFormate}%            ${femaleFormate}%`,
                top:"0%",
                left:"5%",
                textStyle:{
                    color:"#fff"
                },
                subtextStyle:{
                    lineHeight:50,
                    height:100,
                    color:"rgb(21,170,228)",
                    fontSize:"20",
                    // textBorderColor:"rgba(218, 33, 33, 1)"
                },
            },
            grid: {
                left: '10%',
                right: '4%',
                top: '50%',
                height:"60",
                containLabel: true
            },
            label:{
                offset:"100"
            },
            xAxis: {
                 show:false,
                type: 'value',
                splitLine:{
                    show:false,
                }
            },
            yAxis: {
                show:false,
                type: 'category',
                data: ['数量'],
                axisTick:{
                    show:false,
                },
                axisLine:{
                    show: false,
                    lineStyle:{
                        height:"20",
                        color:"rgb(21,170,228)"
                    }
                }
            },
            series: [
                {
                    name: '男',
                    type: 'bar',
                    stack: '总量', // bar 堆叠放置
                     barWidth: '20', // 
                    label: {
                        show: true,
                        position: 'insideRight'
                    },
                    data: [number],
                    // borderRadius:"50%",
                    itemStyle:{
                        normal: {
                        color:"rgb(21,170,228)",
                        barBorderRadius: [10, 0, 0, 10],
                            label: {
                                show: false, //开启显示
                            }
                        }

                    }
                },
                {
                    name: '女',
                    type: 'bar',
                    stack: '总量',
                    label: {
                        show: true,
                        position: 'insideRight'
                    },
                    data: [number2],
                    itemStyle:{
                        normal: {
                        color:"rgb(255,119,119)",
                        barBorderRadius: [0, 10, 10, 0],
                            label: {
                                show: false, //开启显示
                            }
                        }
                    }
                }
            ]
        };
        // option = {
        //     tooltip: {
        //         formatter: '男女比例: {c}%'
        //     },
        //     title: {
        //         text: '建议性别分析',
        //         subtext: '男                                                                  女',
        //         subtextStyle: {
        //             color: "white",
        //             fontSize:16,
        //         },
        //         textStyle: {
        //             color: "white",
        //         },
        //         left: "center"
        //     },
        //     toolbox: {
        //         feature: {
        //             restore: {
        //                 show: false
        //             },
        //             saveAsImage: {
        //                 show: false
        //             }
        //         }
        //     },
        //     series: [
        //         {
        //             name: '',
        //             type: 'gauge',
        //             radius:"90%",
        //             pointer: { //指针粗细
		// 	width: 5,
                       
        //             },
        //             itemStyle:{
                            
        //                 color:"rgb(130)",
        //                 },
        //             detail: {
        //                 formatter: '{value}%',
        //                 color:"#fff",
        //             },
        //             data: [
        //                 {
        //                     value: a
        //                     // name: '男女比例'
        //                 }
        //             ],
        //             center: [
        //                 '50%', '60%'
        //             ],
        //             title: {               //设置仪表盘中间显示文字样式
        //                 textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
        //                     fontWeight: 'bolder',
        //                     fontSize: 10,
        //                     fontStyle: 'italic',
        //                     color:"white"
        //                 }
        //             },
        //             axisLabel : { //文字样式（及“10”、“20”等文字样式）
        //                 color : "#ddd",
        //                 distance : 5 //文字离表盘的距离
        //             },
        //             axisLine: {      //仪表盘轴线相关配置
        //                 show:true,
        //                 lineStyle: {
        //                     color: [  //仪表盘背景颜色渐变
        //                         [1,new echarts.graphic.LinearGradient(0, 0, 1, 0, [
        //                               {
        //                                 offset: 0.1,
        //                                 color: "rgba(21,168,229)"
        //                               },
        //                               {
        //                                 offset: 0.6,
        //                                 color: "rgba(255,119,119)"
        //                               },
        //                         ])
        //                       ]
        //                     ],
        //                     width:20,  //轴线宽度
        //                 },
                        
      
        //             }
        //         }
        //     ]
        // };

        myChart7.setOption(option);
        window.addEventListener("resize",function(){
            myChart7.resize();
        });
    }
    function footerFlour(name,value) {
        return;
        var myChart8 = echarts.init(document.getElementById('footerFlour'));
        option = {
            title: {
                text: '履职活动分析表',
                textStyle: {
                    color: "#fff"
                }
            },
            color:["rgba(21,69,125)"],
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: {
                show:true,
                data: ['活动次数'],
                textStyle: {
                    color: "#fff"
                },
                left:"right"
            },
            toolbox: {
                feature: {
                    saveAsImage: {
                        show: false
                    }
                }
            },
            grid: {
                left: '3%',
                right: '10%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: name,
                    axisLine: {
                        lineStyle: {
                            color: "#fff"
                        }
                    }
                }
            ],
            yAxis: [

                {   
                    type: 'value',
                    axisLine: {
                        lineStyle: {
                            color: "#fff"
                        }
                    }
                },


            ],
            series: [
                {   
                    name: '活动次数',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: value
                }
            ]
        };

        myChart8.setOption(option);
        window.addEventListener("resize",function(){
            myChart8.resize();
        });
    }

    function footerTwoooo() {
        var myChart6 = echarts.init(document.getElementById('footerTwo'));

        option2 = {
            color: ['#3398DB'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '直接访问',
                    type: 'bar',
                    barWidth: '60%',
                    data: [10, 52, 200, 334, 390, 330, 220]
                }
            ]
        };
        
        myChart6.setOption(option2);
        window.addEventListener("resize",function(){
            myChart6.resize();
        });
    }

