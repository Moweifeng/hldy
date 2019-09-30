<template>
    <div>
        <div class="detailBack">
            <img :src="'https://images.weserv.nl/?url='+detailList.images.medium">
        </div>
        <div class="getdetailhead">
            <span class="iconfont icon-zuo"></span>
            <span class="iconfont icon-fenxiang"></span>
        </div>
        <div class="movie">
            <div class="movieImg">
                <img :src="'https://images.weserv.nl/?url='+detailList.images.medium">
            </div>
            <div class="movieTxt">
                <p class="movieTitle" v-text="detailList.title"></p>
                <span v-text="detailList.ratings_count+' 人想看'"></span>
                <span v-text="`${detailList.countries[0]}/${detailList.durations[0]}  ${detailList.genres[0]}`"></span>
                <span v-text="detailList.pubdate.split('-')[0]+'年'+detailList.pubdate.split('-')[1]+'月'+detailList.pubdate.split('-')[2]+'日'"></span>
                <span></span>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            detailList:{},
            movieid:"",
        }
    },
    methods:{
        loadDetail(){
            var mid = this.$route.params.id;
            console.log(mid);
            var url = `http://api.douban.com/v2/movie/subject/${mid}?apikey=0df993c66c0c636e29ecbb5344252a4a`;
            this.$jsonp(url).then(json=>{
                this.detailList = json;
                console.log(this.detailList);
            })
        },
    },
    created() {
        this.loadDetail();
    },
}
</script>
<style scoped>
    .detailBack{
        position: absolute;
        height: 130px;
        width: 100%;
        z-index: -1;
        overflow: hidden;
    }
    .detailBack img{
        opacity: .9;
        filter: blur(20px);
        width: 100%;
        background: url(../../../../assets/shop/2.jpg) no-repeat top;
    }
    .getdetailhead{
        color: #fff;
        display: flex;
        justify-content: space-between;
        padding: 10px;
        margin-bottom: 40px;
    }
    .movie{
        display: flex;
    }
    .movieImg img{
        width: 100px;
    }
    .movieTxt{
        padding: 0 10px;
    }
    .movieTitle{
        color: #fff;
        font-size: 18px;
        padding-bottom: 20px;
    }
    .movieTxt span{
        display: block;
        font-size: 12px;
        color:#777;
    }
</style>