import Vue from 'vue'
import App from './App.vue'
import router from './router/'

import './assets/css/font-awesome.css'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'


Vue.use(ElementUI)

new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
