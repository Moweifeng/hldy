import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Home from "./components/Home.vue"
import shopCart from "./components/shop/cart/cart"
import Login from "./components/me/Login"
import getDetail from "./components/film/film/getting/getdetail"
import filmCart from "./components/carts"
Vue.use(Router)
export default new Router({
  routes: [
    {path:'/Home',component:Home},
    {path:'/getDetail/:id',name:'getDetail',component:getDetail},
    {path:'/Login',component:Login},
    {path:'/filmCart',component:filmCart},
    {path:'/shopCart',component:shopCart},
    {path:'/',component:HelloContainer},
  ]
})
