import Vue from 'vue'
import App from './App.vue'
import router from './router/'

<<<<<<< HEAD


=======
import './assets/css/font-awesome.css'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-default/index.css'


Vue.use(ElementUI)

>>>>>>> 3cff849b0782c5b9302d0aa6a5272e965992fd18
new Vue({
  el: '#app',
  router,
  render: h => h(App)
})
