import Vue from 'vue'
import Router from 'vue-router'
import Login from "./components/Login.vue"
import HelloContainer from "./components/HelloWorld.vue"
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/Login',component:Login},
    {path:'/',component:HelloContainer},
  ]
})
