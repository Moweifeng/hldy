<template>
    <div>
        <mt-cell v-for="(item,index) of lists" :key="index" class="gettingCell">
            <img :src="'https://images.weserv.nl/?url='+item.images.medium" class="gettingImg" slot="icon">
            <div class="filmListText">
                <p v-text="item.title" class="filmListText-title"></p>
                <p v-if="item.rating.average>6.5">
                    评分
                    <span v-text="item.rating.average" style="color:#dbb177"></span>
                </p>
                <p v-else>
                    <span v-text="item.collect_count" style="color:#dbb177"></span>
                    人想看
                </p>
                <p v-text="item.genres"></p>
                <p v-text="item.original_title"></p>
                <div class="film-type-icon">
                <p :class="Math.random()<0.4?'icon-2d'
                    :Math.random()<0.8?'icon-3d':'icon-2d icon-3d'" class="iconfont"></p>
                <p :class="Math.random()<0.3?'icon-imax'
                    :Math.random<0.6?'icon-jumu'
                    :Math.random()<0.9?'ico-imax icon-jumu':''" class="iconfont"></p>
                </div>
                <mt-button class="getfilm" :disabled="Math.random()<0.2?disabled=true:disabled=false" v-text="disabled?'预售':'购票'" ></mt-button>
            </div>
        </mt-cell>
    </div>
</template>
<script>
export default {
    data(){
        return{
            selected:1,
            lists:[],
        }
    },
    created(){
        this.$nextTick(
             this.loadfilmlist()
        )
       
    },
    methods:{
        loadfilmlist(){
            this.pno++; //页码+1 
            var count = 10;
            var start = (this.pno-1)*count;
            var url = `http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=${start}&count=${count}`;
            // console.log(url);
            var obj = {start:start,count:count};
            this.$jsonp(url).then(json => {
                // Success.
                this.lists =json.subjects;
            }).catch(err => {
                // Failed.
                this.$toast({
                    message:'加载失败',
                    duration:5000
                })
            })
        }
    },
}
</script>
<style scoped>
    .gettingImg{
        width: 80px;
        margin: 20px 0;
    }
    div.filmListText{
        width: 150px;
        margin-left: 10px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        word-break: break-all;
    }
    .filmListText p{
        font-size:11px;
    }
    p.filmListText-title{
        font-size:14px;
        color:#000;
    }
    div.film-type-icon{
        display: flex;
        height: 20px;
    }
    p.iconfont{
        font-size:18px;
        margin-bottom:0; 
    }
    .getfilm{
        position: absolute;
        height: 30px;
        background: #dbb177;
        top:40%;
        right: 5%;
        font-size:11px;
        color:#fff;
        border-radius: 30px;
    }
    .getfilm:disabled{
        background: #8997c2;
    }
</style>
<style>
div.mint-cell-title{
    flex:0;
}
div.mint-cell-wrapper{
    border-bottom: 1px solid #eee;
}
</style>