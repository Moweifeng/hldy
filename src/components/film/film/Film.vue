<template>
    <div>
        <swiper :options="swiperOption">
        　　<swiper-slide  v-for="(item,index) of carouselImgs" :key="index" >
                <router-link to="#">
                    <img :src="'http://127.0.0.1:8080/'+item.img" class="carouselImg">
                </router-link>
            </swiper-slide>
        　　<div class="swiper-pagination" slot="pagination"></div>
        </swiper>
        <div>
            <div>
                <mt-navbar v-model="selected">
                    <mt-tab-item id="getting">正在热映</mt-tab-item>
                    <mt-tab-item id="upcoming">即将上映</mt-tab-item>
                </mt-navbar>
                <!-- tab-container -->
                <mt-tab-container v-model="selected" swipeable>
                    <mt-tab-container-item id="getting">
                        <getting></getting>
                    </mt-tab-container-item>
                    <mt-tab-container-item id="upcoming">
                        <upcoming></upcoming>
                    </mt-tab-container-item>
                </mt-tab-container>
            </div>
            
        </div>
    </div>
</template>
<script>
import Getting from "./getting/Getting"
import Upcoming from "./upcoming/Upcoming"
export default {
    data(){
        return{
            swiperOption: {
            　　pagination: {
            　　　　 el: '.swiper-pagination',
            　　　　 clickable: true, // 允许点击小圆点跳转
            　　},
            　　autoplay: {
            　　　　delay: 3000,
            　　　　disableOnInteraction: false // 手动切换之后继续自动轮播
            　　},
                loop: true,
                slidesPerView:1,
            },
            selected:"getting",
        }
    },
    props:[
        'carouselImgs'
    ],
    components:{
        "getting":Getting,
        "upcoming":Upcoming
    },
}
</script>
<style scoped>
    .carouselImg{
        width: 100%;
    }
</style>