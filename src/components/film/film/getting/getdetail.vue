<template>
    <div v-if="detailList!==undefined">
        <div class="detailBack">
            <img :src="'https://images.weserv.nl/?url='+detailList.images.medium">
        </div>
        <div class="getdetailhead">
            <span class="iconfont icon-zuo" @click="comeBack"></span>
            <span class="iconfont icon-fenxiang"></span>
        </div>
        <div class="moviebackground"></div>
        <div class="movie">
            <div class="movieImg">
                <img :src="'https://images.weserv.nl/?url='+detailList.images.medium">
            </div>
            <div class="movieTxt">
                <p class="movieTitle" v-text="detailList.title"></p>
                <span v-text="detailList.ratings_count+' 人想看'"></span>
                <span v-text="`${detailList.countries[0]}/${detailList.durations[0]}  ${detailList.genres[0]}`"></span>
                <span v-text="detailList.pubdate.split('-')[0]+'年'+detailList.pubdate.split('-')[1]+'月'+detailList.pubdate.split('-')[2]+'日'"></span>
                <div>
                    <span v-text="'主演：'" class="casts"></span>
                    <span v-for="(item,index) of casts" :key="index" v-text="item.name" class="casts"></span>
                </div>
            </div>
        </div>
        <div class="likeScore">
            <div :class="like?'like':''" @click="islike">
                <span class="iconfont icon-xkdy" v-text="like?'已想看':'想看'"></span>
            </div>
            <div>
                <span class="iconfont icon-pingfen">评分</span>
            </div>
        </div>
        <div class="summary">
            <h5 v-text="'剧情'"></h5>
            <p v-text="detailList.summary" class="summarytxt" id="summarytxt"></p>
            <p class="develop" v-if="!isopen" @click="openSummary">展开<span class="iconfont icon-down"></span></p>
            <p class="develop" v-else @click="openSummary">收起<span class="iconfont icon-shang"></span></p>
        </div>
        <div class="videoandpic">
            <div class="video">
                <h5>
                    <span v-text="detailList.blooper_urls.length+'个视频'"></span>
                    <span class="iconfont icon-right" @click="Allvideo"></span>
                </h5>
                <div>
                    <div>
                        <a :href="detailList.blooper_urls[0]">
                            <img :src="detailList.bloopers.length!=0?detailList.bloopers[0].small:require('../../../../assets/icon/novideo.jpg')" />
                            <img src="../../../../assets/icon/img_play.png" class="imgPlay">
                        </a>
                    </div>
                </div>
            </div>
            <div class="pic">
                <h5>
                    <span v-text="detailList.photos.length+'张图片'"></span>
                    <span class="iconfont icon-right" @click="Allphoto"></span>
                </h5>
                <div>
                    <img :src="detailList.photos.length!=0?'https://images.weserv.nl/?url='+detailList.photos[0].cover:'../../../../assets/icon/nopic.jpg'" />
                    <img :src="detailList.photos.length>1?'https://images.weserv.nl/?url='+detailList.photos[1].cover:'../../../../assets/icon/nopic.jpg'" />
                </div>
            </div>
        </div>
        <div class="related">
            <div class="director">
                <p>导演</p>
                <img :src="detailList.directors.length!=0?'https://images.weserv.nl/?url='+detailList.directors[0].avatars.small:'../../../../assets/icon/nopic.jpg'">
                <span v-text="detailList.directors[0].name"></span>
                <span v-text="detailList.directors[0].name_en"></span>
            </div>
            <div class="casts">
                <p>主演</p>
                <div ref="tab123" class="castlist">
                    <div :style="'width:'+scrollWidth+'px'">
                        <div v-for="(item,index) of casts" :key="index">
                            <img :src="item.avatars.small!=undefined?'https://images.weserv.nl/?url='+item.avatars.small:'../../../../assets/icon/nopic.jpg'">
                            <span v-text="item.name"></span>
                            <span v-text="item.name_en"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <mt-button class="btn" @click="getCart">选座购票</mt-button>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            detailList:undefined,
            casts:[],
            movieid:"",
            like:false,
            scrollWidth:100,
            isopen:false,
        }
    },
    methods:{
        loadDetail(){
            var mid = this.$route.params.id;
            console.log(mid);
            var url = `http://api.douban.com/v2/movie/subject/${mid}?apikey=0df993c66c0c636e29ecbb5344252a4a`;
            this.$jsonp(url).then(json=>{
                this.detailList = json;
                console.log(this.detailList)
                for(var key of this.detailList.casts){
                    this.casts.push(key);
                }
                this.scrollWidth = this.casts.length*100+20;
                console.log(this.casts);
            })
        },
        comeBack(){
            console.log(1);
            this.$router.go(-1);
        },
        islike(){
            this.like=!this.like;
        },
        _initScroll() {
            var BScroll =this.BScroll;
            this.tab = new BScroll(this.$refs.tab123,{
                click:true,
                scrollX:true,
                scrollY:false,
                stopPropagation:true,
            })
        },
        openvideo(){
            this.$router.push(this.detailList.blooper_urls[0]);
        },
        Allvideo(){
            console.log(2);
        },
        Allphoto(){
            console.log(1);
        },
        openSummary(){
            var txt = document.getElementById("summarytxt");
            if(txt.className =="summarytxt"){
                txt.className = "";
            }else{
                txt.className = "summarytxt";
            }
            this.isopen = !this.isopen;
        },
        getCart(){
            this.$router.push("/filmCart");
        },
    },
    created() {
        this.$nextTick(()=>{
        this.loadDetail();
            this._initScroll();
        })
    },
    mounted(){
        this._initScroll();
    }
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
    .moviebackground{
        position: absolute;
        background-color: #fff;
        height: 160px;
        width: 100%;
        z-index: -11;
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
    .movieTxt .casts{
        display: inline;
    }
    .movieTxt .casts+.casts{
        padding-right:5px;
    }
    .likeScore{
        display: flex;
        text-align: center;
        color: #777;
        background-color:#fff;
        margin-bottom: 5px;
    }
    .likeScore>div{
        width: 50%;
        height: 40px;
        line-height: 40px;
        border: 1px solid #eee;
    }
    .likeScore>div>span{
        font-size: 14px;
    }
    .like{
        color: #dbb177;
    }
    .summary{
        background-color: #fff;
        padding: 8px;
        margin-bottom:10px; 
    }
    .summarytxt{
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
        overflow: hidden;
    }
    .summary h5{
        padding: 5px 0;
    }
    .develop{
        text-align: right;
        padding: 0 10px;
    }
    .videoandpic{
        display: flex;
        background-color: #fff;
        padding: 10px;
        margin-bottom: 10px;
    }
    .video{
        width: 33%;
        padding-right: 10px;
    }
    .video>div>div{
        position: relative;
    }
    .videoandpic h5{
        display: flex;
        justify-content: space-between;
    }
    .video img{
        width:100%;
    }
    .pic{
        width:66%;
        padding-left: 10px;
        border-left: 1px solid #ddd;
    }
    .videoandpic>div{
        position: relative;
    }
    .pic img{
        max-width: 50%;
        padding-right:8px;
    }
    img.imgPlay{
        position: absolute;
        width: 24px;
        margin: -12px; 
        top:50%;
        left: 50%;
    }
    .related{
        display: flex;
        padding: 20px;
        background-color: #fff;
    }
    .director,.castlist>div>div{
        width: 80px;
    }
    .casts{
        width: 100%;
    }
    .castlist>div>div{
        margin-left: 20px;
    }
    .castlist>div{
        display: flex;
    }
    .castlist{
    width: 100%;
    overflow: hidden;
    }
    .casts>p{
        margin-left: 20px;
    }
    .related img{
        width: 80px;
    }
    .related span{
        display: block;
        text-align: center;
        font-size: 12px;
    }
    .btn{
        width: 100%;
        position: fixed;
        bottom: 0;
        background-color:#dbb177;
    }
</style>