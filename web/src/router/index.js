import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'
<<<<<<< HEAD
import cook from '../components/cook/cook.vue'
import newIndent from '../components/cook/newIndent.vue'
=======
import BackstageComponent from '../components/backstage/backstage-home.vue'
import MenuComponent from '../components/backstage-menu/menu.vue'


>>>>>>> 3cff849b0782c5b9302d0aa6a5272e965992fd18
Vue.use(VueRouter)

const router = new VueRouter({
	routes: [{
		path: '/',
		name: 'home',
		component: HomeComponent,
		children: [{
			path: '/client',
			name: 'client',
			component: ClientComponent
		}]
	},
	{
		path: '/login',
		name: 'login',
		component: LoginComponent
<<<<<<< HEAD
	},
	{
		path:'/cook',
		component: cook,
	
	},


	]
=======
	},{
		path: '/backstage',
		name: 'backstage',
		component: BackstageComponent,
		redirect: '/menu',
		children: [{
			path: '/menu',
			name: 'menu',
			component: MenuComponent
		}]
	}]
>>>>>>> 3cff849b0782c5b9302d0aa6a5272e965992fd18
})


export default router