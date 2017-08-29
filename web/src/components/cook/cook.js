import Vue from 'vue'
import http from '../../utils/HttpClient.js'
const  state ={
	indentData:[],
	messData:[]
}

const actions ={

			getCookData:function(stores,mode){
					console.log(mode)
					//获取订单数据
					http.get('indent').then(res=>{

						stores.commit('observeData',{data:res.data,mode:mode})
					})
			},
			removeMessTo:function(stores){

				stores.commit('removeMess')
			}



}

const mutations = {
	//观察数据
	observeData:function(state,datas){
		console.log(state,datas)
		//云 与 本地数据不一致
		if(datas.data.length > state.indentData.length){
						
						//转换菜单列表为对象（默认是json字符串）
						datas.data.forEach(function(item,idx){
								item.list = JSON.parse(item.list);	
						})

						//更新信箱数量及内容传给邮箱组件(不是首次进入页面)
						if(state.indentData.length != 0 ){
							//得出 最新内容长度和 原有内容长度差值
							var cha = datas.data.length - state.indentData.length;
							
							//新的内容 合并 原有内容，更新邮箱组件data 

							state.messData = state.messData.concat(datas.data.slice(-cha));

							console.log('cook邮箱已更新')
							

						}
						//更新订单数据
						state.indentData = datas.data;
						
					}
					
					//如果模式为渲染请求
					if(datas.mode == 'once'){
						//转换菜单列表为对象（默认是json字符串）
						datas.data.forEach(function(item,idx){
								item.list = JSON.parse(item.list);	
						})

						state.indentData = datas.data;


					}
	},

	removeMess:function(state){

			state.messData = [];

	}

	
}


export default {
	state,
	actions,
	mutations
}