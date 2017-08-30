import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'

import cook from '../components/cook/cook.vue'
import newIndent from '../components/cook/newIndent.vue'

import BackstageComponent from '../components/backstage/backstage-home.vue'
import MenuComponent from '../components/backstage-menu/menu.vue'

import dishComponent from '../components/showdishes/dish.vue'
import LetterBoxComponent from '../components/letterbox/letterbox.vue'
import chartsComponent from '../components/charts/charts.vue'
import menuShow from '../components/menuShow/menuShow.vue'
import AddMenuComponent from '../components/addmenu/addmenu.vue'
import DinnerTableComponent from '../components/dinner-table/dinner-table.vue'



Vue.use(VueRouter)

const router = new VueRouter({
	routes: [
	{
		path: '/',
		name: 'home',
		component: HomeComponent,
	},
	{
		path: '/login',
		name: 'login',
		component: LoginComponent

	},
	{
		path:'/cook',
		component: cook,
	
	},
	{
		path: '/backstage',
		name: 'backstage',
		component: BackstageComponent,
		children: [{
			path: '/menu',
			name: 'menu',
			component: MenuComponent
		},{
			path: '/addmenu',
			name: 'addmenu',
			component: AddMenuComponent
		},{
			path: '/dinnerTable',
			name: 'dinnerTable',
			component: DinnerTableComponent
		},{
			path: '/charts',
			name: 'charts',
			component: chartsComponent
		},{
			path: '/letterbox',
			name: 'letterbox',
			component: LetterBoxComponent
		}]
		},{
		path: '/showdishes',
		name: 'dish',
		component: dishComponent

		},{
			path: '/client',
			name: 'client',
			component: ClientComponent,
			children:[{
				path: '/menuShow',
				name: 'menuShow',
				component: menuShow
				}]
		}
		]





})


export default router