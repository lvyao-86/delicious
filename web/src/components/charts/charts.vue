<template>
  <!--为echarts准备一个具备大小的容器dom-->
  <div id="main" style="width: 600px;height: 400px;"></div>
</template>
<script>
  import echarts from 'echarts'
    export default {
        name: '',
        data () {
            return {
                charts: '',
                
                dataAxis: ['沙拉', '小吃', '主菜', '汤品', '主食', '甜品', '饮品'],
                data: [220, 182, 191, 234, 290, 330, 310],
                yMax: 600
            }
        },
        methods:{
            drawPie(id){
                this.charts = echarts.init(document.getElementById(id))
                this.charts.setOption({
                    title: {  
                        text: '菜品分类单日销量',  
                        subtext: '纯属扯犊子',  
                        x: 'center'  
                    },
                    xAxis: {
                        data: this.dataAxis,
                        axisLabel: {
                            inside: true,
                            textStyle: {
                                color: '#fff'
                            }
                        },
                        axisTick: {
                            show: false
                        },
                        axisLine: {
                            show: false
                        },
                        z: 10
                    },
                    yAxis: {
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        },
                        axisLabel: {
                            textStyle: {
                                color: '#999'
                            }
                        }
                    },
                    dataZoom: [
                        {
                            type: 'inside'
                        }
                    ],
                    series: [
                        {
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#83bff6'},
                                            {offset: 0.5, color: '#188df0'},
                                            {offset: 1, color: '#188df0'}
                                        ]
                                    )
                                },
                                emphasis: {
                                    color: new echarts.graphic.LinearGradient(
                                        0, 0, 0, 1,
                                        [
                                            {offset: 0, color: '#2378f7'},
                                            {offset: 0.7, color: '#2378f7'},
                                            {offset: 1, color: '#83bff6'}
                                        ]
                                    )
                                }
                            },
                            data: this.data
                        }
                    ]
                });

                var zoomSize = 6;
                var _self = this;
                this.charts.on('click', function (params) {
                    this.dispatchAction({
                        type: 'dataZoom',
                        startValue: _self.dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
                        endValue: _self.dataAxis[Math.min(params.dataIndex + zoomSize / 2, _self.data.length - 1)]
                    });
                });
            }
        },
      //调用
        mounted(){
            this.$nextTick(function() {
                this.drawPie('main')
            })
        }
    }
</script>
<style scoped>
    * {
        margin: 0;
        padding: 0;
        list-style: none;
    }
</style>