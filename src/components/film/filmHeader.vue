<template>
    <div>
        <div class="homeHeader">
            <div class="landmark">
                <span>广州</span>
                <img src="../img/icon/center_drop_icon.png">
            </div>
            <div class="homeNav">
                <div>影片</div>
                <div>影院</div>
            </div>
        </div>
        <div>
            <carousel :carouselImgs="carouselImgs"></carousel>
        </div>
    </div>
</template>
<script>
import Carousel from "./Carousel.vue"
export default {
    data() {
        return {
            carouselImgs:[]
        }
    },
    components:{
        "carousel":Carousel,
    },
        created(){
        this.loadCarousel();
    },
    methods:{
        loadCarousel(){
            var url = "carousel";
            this.axios.get(url).then(res=>{
                this.carouselImgs = res.data;
                console.log(res.data);
            });
        },
    },
}
</script>
<style scoped>
     .homeHeader{
     font-size:14px;
 }
 .landmark{
     margin-left:12px; 
     position: absolute;
     top:3px;
 }
 .homeNav{
     display: flex;
     justify-content: center;
 }
 .homeNav>div{
     width: 60px;
     height: 25px;
     color: #dbb177;
     line-height: 25px; 
     text-align: center;
     border:1px solid #dbb177;
 }
 .landmark img{
     width: 6px;
     margin-left:5px; 
    margin-bottom:3px; 
 }

</style>