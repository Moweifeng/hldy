<template>
    <div>
        <div>
        <p>人气榜单</p>
            <md-card>
                <md-card-media>
                <!-- swiper -->
                <swiper :options="swiperOption">
                    <swiper-slide v-for="(item,index) of uplists" :key="index">
                      <span v-text="'预售'"></span>
                      <img :src="'http://127.0.0.1:8080/'+item.img" class="upconming-img">
                      <span v-text="item.like+'人想看'"></span>
                    </swiper-slide>
                    <div class="swiper-pagination" slot="pagination"></div>
                </swiper>
                </md-card-media>
            </md-card>
        </div>
    </div>
</template>
<script>
  export default {
    data() {
      return {
        swiperOption: {
          slidesPerView: 3,
          spaceBetween: 30,
          pagination: {
            el: '.swiper-pagination',
            clickable: true
          }
        },
        uplists:[],
      }
    },
    created(){
      //this.loaduplist()
    },
    methods:{
      loaduplist(){
        var url = "upcoming"
        this.axios.get(url).then(res=>{
            this.uplists = res.data;
        });
      },
    },
  }
</script>
<style scoped>
  .upconming-img{
    width: 80px;
  }
</style>
<style>
  div.swiper-slide{
    width: 24%;
  }
</style>