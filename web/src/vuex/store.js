import Vue from 'vue'
import Vuex from 'vuex'
import login from '../components/login/login'
import backstageMenu from '../components/backstage-menu/menu.js'
import backstageHome from '../components/backstage/backstage-home.js'

Vue.use(Vuex)

export default new Vuex.Store({
    modules: {
        login,
        backstageMenu,
        backstageHome
    }
})