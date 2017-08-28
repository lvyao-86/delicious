import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'


import cook from '../components/cook/cook.vue'
import newIndent from '../components/cook/newIndent.vue'

import BackstageComponent from '../components/backstage/backstage-home.vue'
import MenuComponent from '../components/backstage-menu/menu.vue'

import AddMenuComponent from '../components/addmenu/addmenu.vue'

import dishComponent from '../components/showdishes/dish.vue'

import OrderComponent from '../components/orderlist/orderlist.vue'

import menuShow from '../components/menuShow/menuShow.vue'

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
			path:'/cook',
			component: cook
		},{
		path: '/backstage',
		name: 'backstage',
		component: BackstageComponent,
		redirect: '/menu',
		children: [{
			path: '/menu',
			name: 'menu',
			component: MenuComponent
		},{
			path: '/addmenu',
			name: 'addmenu',
			component: AddMenuComponent
		}]
		},{
		path: '/showdishes',
		name: 'dish',
		component: dishComponent
		},{
		path: '/menuShow',
		name: 'menuShow',
		component: menuShow
		}
	]

})


export default router