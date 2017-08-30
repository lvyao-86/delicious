<template>
    <div>
        <div id="charts" style="width: 700px;height: 400px;"></div>
        <div id="top10" style="width: 700px;height: 400px;"></div>
    </div>
</template>
<script>
    import echarts from 'echarts'
    import http from '../../utils/HttpClient'

    export default {
        name: 'sale',
        data () {
            return {
                charts: '',
                dataAxis: ['沙拉', '小吃', '主菜', '汤品', '主食', '甜品', '饮品'],
                data: [220, 182, 191, 234, 290, 330, 310],
                yMax: 600
            }
        },
        methods:{
            drawPie(options){
                this.charts = echarts.init(document.getElementById(options.ele))
                this.charts.setOption({
                    title: {
                        text: options.title,
                        subtext: options.subtext,
                        x: 'center'
                    },
                    tooltip: {},
                     toolbox: {
                        show: true,
                        feature: {
                            dataView: {show: true, readOnly: false},
                        }
                    },
                    /*legend: {
                        data:['销量']
                    },*/
                    xAxis: {
                        data: options.xAxisData,
                        axisLabel: {  
                            interval:0,  
                            formatter: function(value) {  
                                
                                var ret = "";//拼接加\n返回的类目项  
                                var maxLength = 2;//每项显示文字个数  
                                var valLength = value.length;//X轴类目项的文字个数  
                                var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数  
                                if (rowN > 1)//如果类目项的文字大于3,  
                                {  
                                    for (var i = 0; i < rowN; i++) {  
                                        var temp = "";//每次截取的字符串  
                                        var start = i * maxLength;//开始截取的位置  
                                        var end = start + maxLength;//结束截取的位置  
                                        temp = value.substring(start, end) + "\n";  
                                        ret += temp; //凭借最终的字符串  
                                    }  
                                    return ret;  
                                }  
                                else {  
                                    return value;  
                                }  
                            },
                            textStyle: {
                               fontSize: 10
                            }  
                        }                                                                                   
                    }, 
                    yAxis: {
                        data: options.yAxisData,
                    },
                    series: [{
                        name: '销量',
                        type: 'bar',
                        data: options.seriesData,
                        itemStyle: {
                            normal: {
                                color: function (params){
                                    var colorList = ['#C1232B','#B5C334','#FCCE10','#E87C25','#27727B','#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD','#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0','rgb(164,205,238)','rgb(42,170,227)'];
                                    return colorList[params.dataIndex];
                                },
                                label: function(){
                                    if(options.yAxisData){
                                        return  {
                                            show: true,
                                            position: 'right',
                                            formatter: '{c}'
                                        }
                                    }
                                }()
                            }
                        }
                    }],
                });
            }
        },
      //调用
        mounted(){
            /*this.$nextTick(function() {
                this.drawPie('main')
            })*/
            this.$nextTick(function() {
                
                var arr1 = []; var arr2 = []
                http.get('sales')
                .then( response => {
                    var chartsData = response.data;
                    chartsData.forEach( item => {
                        arr1.push(item.name)
                        arr2.push(Number(item.qty))
                    })
                    //销量TOP5
                    ;(() => {
                        var qtyArr = [];
                        var yAxisData = [];
                        var seriesData = []
                        var salesRank = chartsData.sort( (a,b) => {
                            return b.qty - a.qty
                        })

                        salesRank.forEach( item => {
                            if(qtyArr.length < 5 && qtyArr.indexOf(item.qty) < 0){
                                qtyArr.push(item.qty)
                            }
                        })
                        
                        salesRank = salesRank.filter((item) => {
                            return item.qty >= qtyArr[qtyArr.length - 1]
                        })
                        
                        salesRank.forEach( item => {
                            yAxisData.unshift(item.name)
                            seriesData.unshift(Number(item.qty))
                        })
                        var top10 = {ele: 'top10',title: '销量TOP5', subtext: 'Sales Example', yAxisData: yAxisData, seriesData: seriesData}
                        this.drawPie(top10)
                    })(chartsData);

                    var allSales = {ele: 'charts',title: '菜式销量', subtext: 'Sales Example', xAxisData: arr1, seriesData: arr2}
                    this.drawPie(allSales)
                   
                })
            })
        },
        beforeCreate(){
        }
    }
</script>
<style scoped>
    * {
        margin: 0;
        padding: 0;
        list-style: none;
    }
    #charts, #top10{
        margin: 0 auto;
        margin-top: 10px;
    }
</style>