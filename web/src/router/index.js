import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'
import cook from '../components/cook/cook.vue'
import newIndent from '../components/cook/newIndent.vue'
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
	},
	{
		path:'/cook',
		component: cook,
	
	},


	]
})


export default router