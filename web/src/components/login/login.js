import Vue from 'vue'
import router from '../../router/index'

const state = {
}

const mutations = {
	login: (data, formData) => {
		console.log('mutations')
	}
}

const actions = {
	login: (events, formData) => {
		events.commit('login', formData)
	}
}

export default {
	state,
	mutations,
	actions
}