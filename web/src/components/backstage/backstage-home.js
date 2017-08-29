import Vue from 'vue'
import http from '../../utils/HttpClient'
import router from '../../router/index'

const actions = {
	letterBox: (store, data) => {
		store.commit('letterBox')
	},
	getLetterBox: (store) => {
		store.commit('getLetterBox')
	}
}

const mutations = {
	letterBox: (_state) => {
		setInterval(() =>{
			http.get('getLetterBox')
			.then(response => {
				state.letterQty = response.data.length
	 		})
		}, 8000)
	},
	getLetterBox: (_state) => {
		http.get('getLetterBox')
		.then(response => {
			state.letterBox = response.data;
 		})
	}
}

const state = {
	letterBox: [],
	letterQty: 0
}

export default {
	state,
	mutations,
	actions
}