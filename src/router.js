import Vue from 'vue'
import Router from 'vue-router'
import Login from "./components/Login.vue"
import HelloContainer from "./components/HelloWorld.vue"
import Memp from "./components/Memp.vue"
import info from "./components/info.vue"
import Home from "./components/Home.vue"
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/Home',component:Home},
    {path:'/info',component:info},
    {path:'/Memp',component:Memp},
    {path:'/Login',component:Login},
    {path:'/',component:HelloContainer},
  ]
})
