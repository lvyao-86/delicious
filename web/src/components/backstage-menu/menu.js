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
	editMenu: (store) => {
		store.commit('editMenu')
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

 	editMenu: (_state) => {
 		http.post('editMenu', {id:1, name:'asdasd'})
 		.then(response => {

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
	category: []
}

export default {
	state,
	mutations,
	actions
}