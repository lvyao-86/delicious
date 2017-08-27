import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeComponent from '../components/home/home.vue'
import LoginComponent from '../components/login/login.vue'
import ClientComponent from '../components/client/client.vue'
import BackstageComponent from '../components/backstage/backstage-home.vue'
import MenuComponent from '../components/backstage-menu/menu.vue'
import AddMenuComponent from '../components/addmenu/addmenu.vue'

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
	}]
})


export default router