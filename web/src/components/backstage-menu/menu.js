import Vue from 'vue'
import http from '../../utils/HttpClient'
import router from '../../router/index'

const actions = {
	getMenu: (store, data) => {
		store.commit('getMenu')
	},
	delMenu: (store, data) => {
		store.commit('delMenu', data)
	},
	editMenu: (store, data) => {
		store.commit('editMenu', data)
	},
	searchMenu: (store, data) => {
		store.commit('searchMenu', data)
	}
}

const mutations = {
	getMenu: (_state, formData) => {
		http.post('getProducts')
		.then(response => {
			//获取数据
			state.menu = response.data;

			//获取菜单分类，去重
			let category = [];
			state.menu.forEach(item => {
				category.push(item.category)
			})
			let set = new Set(category)
			state.category = Array.from(set)

		})
	},

	delMenu: (_state, formData) => {
		http.post('delMenu', {id: formData.id})
		.then(response => {
			state.menu = response.data;
			formData.cb()
		})
	},

 	editMenu: (_state, data) => {
 		
 		http.post('editMenu', data.data)
 		.then(response => {
			data.callback()
 		})
 	},

 	searchMenu: (_state, data) => {
 		
 		http.post('searchMenu', {keyword: data})
 		.then(response => {
			state.menu = response.data;
 		})
 	}
}

const state = {
	menu: [],
	category: ['沙拉', '小吃','主菜','汤品','主食','甜点','饮品']
}

export default {
	state,
	mutations,
	actions
}