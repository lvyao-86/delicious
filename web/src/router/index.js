import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'

import cook from '../components/cook/cook.vue'
import newIndent from '../components/cook/newIndent.vue'

import BackstageComponent from '../components/backstage/backstage-home.vue'
import MenuComponent from '../components/backstage-menu/menu.vue'

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
		},
		{
			path:'/cook',
			component: cook
		},{
			path: '/backstage',
			name: 'backstage',
			component: BackstageComponent,
			children: [{
				path: '/menu',
				name: 'menu',
				component: MenuComponent
			}]
		}]
})


export default router