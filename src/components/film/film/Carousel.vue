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
    </div>
</template>
<script>
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
                slidesPerView:1,
                loop: true,
            },
        }
    },
    props:['carouselImgs'],
}
</script>
<style scoped>
    .carouselImg{
        width: 100%;
    }
</style>