<template>
    <div>
        <div class="swiper">
            <mt-swipe :auto="3000">
                <mt-swipe-item v-for="(item,index) of carouselImgs" :key="index">
                    <img :src="'http://127.0.0.1:8080/'+item.img" class="carouselImg">
                </mt-swipe-item>
            </mt-swipe>
        </div>
        <div>
            <div>
                <mt-navbar v-model="selected" class="indexFilmList">
                    <mt-tab-item id="getting">
                        <mt-button>正在热映</mt-button>
                        </mt-tab-item>
                    <mt-tab-item id="upcoming">
                        <mt-button>即将上映</mt-button>
                        </mt-tab-item>
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
    .swiper{
        height: 200px;
    }
</style>
<style>
    .indexFilmList .mint-button--normal{
        width: 100%;
    }
</style>