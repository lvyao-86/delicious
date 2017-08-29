<template>
  <!--为echarts准备一个具备大小的容器dom-->
  <div id="charts" style="width: 900px;height: 500px;"></div>
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
                text: '菜式销量排行'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: arr1,
                axisLabel: {  
                    interval:0,  
                    rotate:40    
                   /* formatter:function(value){  
                       return value.split("").join("\n");  
                    }  */  
                }                                                                                   
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: arr2
            }]
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
        margin: 0 auto;
        margin-top: 20px;
    }
</style>