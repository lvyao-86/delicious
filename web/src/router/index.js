import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'

import OrderComponent from '../components/orderlist/orderlist.vue'

Vue.use(VueRouter)

const router = new VueRouter({
	routes: [{
		path: '/',
		name: 'home',
		component: HomeComponent,
		children: []
	},{
		path: '/login',
		name: 'login',
		component: LoginComponent
	},{
			path: '/client',
			name: 'client',
			component: ClientComponent
		}]
})


export default router