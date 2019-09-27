import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Home from "./components/Home.vue"
import Cart from "./components/shop/cart/cart"
import Login from "./components/me/Login"
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/Home',component:Home},
    {path:'/Login',component:Login},
    {path:'/Cart',component:Cart},
    {path:'/',component:HelloContainer},
  ]
})
