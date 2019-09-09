<template>
    <div>
        <mt-tab-container v-model="active">
        <mt-tab-container-item id="film">
            <filmheader></filmheader>
            <!-- <mt-cell v-for="n in 10" title="tab-container 1"></mt-cell> -->
        </mt-tab-container-item>
        <mt-tab-container-item id="activity">
            <!-- <mt-cell v-for="n in 5" title="tab-container 2"></mt-cell> -->
        </mt-tab-container-item>
        <mt-tab-container-item id="shop">
            <!-- <mt-cell v-for="n in 7" title="tab-container 3"></mt-cell> -->
        </mt-tab-container-item>
        <mt-tab-container-item id="me">
            <!-- <mt-cell v-for="n in 7" title="tab-container 3"></mt-cell> -->
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
</template>
<script>
import filmHeader from "./filmHeader.vue"
export default {
    components:{
        "filmheader":filmHeader,
    },
    data(){
        return{
            active:"film",
        }
    },
    methods:{
    },
}
</script>
<style scoped>
 .imgstyle{
   width:30px;
   height:30px;
 }
</style>