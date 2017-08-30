<template>
  <!--为echarts准备一个具备大小的容器dom-->
  <div id="charts" style="width: 600px;height: 350px;"></div>
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
            drawPie(id, arr1, arr2){
                this.charts = echarts.init(document.getElementById(id))
                this.charts.setOption({
                    title: {
                        text: '菜式销量排行',
                        subtext: 'Sales Example',
                        x: 'center'
                    },
                    tooltip: {},
                     toolbox: {
                        show: true,
                        feature: {
                            restore: {show: true},
                        }
                    },
                    /*legend: {
                        data:['销量']
                    },*/
                    xAxis: {
                        data: arr1,
                        axisLabel: {  
                            interval:0,  
                            formatter: function(value) {  
                                debugger  
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
                    yAxis: {},
                    series: [{
                        name: '销量',
                        type: 'bar',
                        data: arr2,
                        itemStyle: {
                            normal: {
                                color: function (params){
                                    var colorList = ['#C1232B','#B5C334','#FCCE10','#E87C25','#27727B','#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD','#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0','rgb(164,205,238)','rgb(42,170,227)'];
                                    return colorList[params.dataIndex];
                                },
                                
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
                    this.drawPie('charts', arr1, arr2)
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
    #charts{
        /*margin: 0 auto;*/
        margin-top: 20px;
    }
</style>