import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'
import BackstageComponent from '../components/backstage/backstage-home.vue'
import MenuComponent from '../components/backstage-menu/menu.vue'
import dishComponent from '../components/showdishes/dish.vue'


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
	},{
		path: '/login',
		name: 'login',
		component: LoginComponent
	},{
		path: '/backstage',
		name: 'backstage',
		component: BackstageComponent,
		children: [{
			path: '/menu',
			name: 'menu',
			component: MenuComponent
		}]
	},{
		path: '/showdishes',
		name: 'dish',
		component: dishComponent
	}]
})


export default router