<template>
    <transition name="Position">
        <div v-if="!isPosition">
            <mt-tab-container v-model="active">
                <mt-tab-container-item id="film">
                    <filmheader :isPosition="isPosition" @changePosition="changePosition"></filmheader>
                </mt-tab-container-item>
                <mt-tab-container-item id="activity">
                    <activity></activity>
                </mt-tab-container-item>
                <mt-tab-container-item id="shop">
                    <shop></shop>
                </mt-tab-container-item>
                <mt-tab-container-item id="me">
                    <memp></memp>
                </mt-tab-container-item>
            </mt-tab-container>
            <mt-tabbar v-model="active" fixed>
                <mt-tab-item id="film">
                    <img :src="active=='film'?require('../assets/tabbar/ic_tabbar_film_selected.png'):require('../assets/tabbar/ic_tabbar_film_normal.png')" class="imgstyle" slot="icon"/>
                    <span :style="active=='film'?'color:#dbb177':'color:#000'">&nbsp;电影</span>
                </mt-tab-item>
                <mt-tab-item id="activity">
                    <img :src="active=='activity'?require('../assets/tabbar/ic_tabbar_activity_selected.png'):require('../assets/tabbar/ic_tabbar_activity_normal.png')" class="imgstyle" slot="icon"/>
                    <span :style="active=='activity'?'color:#dbb177':'color:#000'">&nbsp;活动</span>
                </mt-tab-item>
                <mt-tab-item id="shop">
                    <img :src="active=='shop'?require('../assets/tabbar/ic_tabbar_shop_selected.png'):require('../assets/tabbar/ic_tabbar_shop_normal.png')" class="imgstyle" slot="icon"/>
                    <span :style="active=='shop'?'color:#dbb177':'color:#000'">&nbsp;商城</span>
                </mt-tab-item>
                <mt-tab-item id="me">
                    <img :src="active=='me'?require('../assets/tabbar/ic_tabbar_me_selected.png'):require('../assets/tabbar/ic_tabbar_me_normal.png')" class="imgstyle" slot="icon"/>
                    <span :style="active=='me'?'color:#dbb177':'color:#000'">&nbsp;我</span>
                </mt-tab-item>
            </mt-tabbar>
        </div>
        <div v-else>
            <position @changePosition="changePosition"></position>
        </div>
    </transition>
</template>
<script>
import filmHeader from "./film/filmHeader"
import Position from "./film/position"
import Activity from "./activity/activity"
import Memp from "./me/Memp"
import Shop from "./shop/shop"
export default {
    components:{
        "filmheader":filmHeader,
        "position":Position,
        "activity":Activity,
        "memp":Memp,
        "shop":Shop
    },
    data(){
        return{
            active:"film",
            isPosition:false,
        }
    },
    methods:{
        changePosition() {
            this.isPosition= !this.isPosition;
        }
    },
}
</script>
<style scoped>
 .imgstyle{
   width:30px;
   height:30px;
 }
 .Postion-enter-active, .Postion-leave-ative{
     transition: .5s;
     
 }
.Postion-enter{
     transform: translateX(100%);
 }
.Postion-leave{
     transform: translateX(0%);
 }

</style>