<template>
    <div>
            <mt-cell v-for="(item,index) of lists" :key="index" class="gettingCell">
                <img :src="'http://127.0.0.1:8080/'+item.img_url" class="gettingImg" slot="icon">
                <div class="filmListText">
                    <p v-text="item.title" class="filmListText-title"></p>
                    <p v-if="item.score>8">
                        评分
                        <span v-text="item.score" style="color:#dbb177"></span>
                    </p>
                    <p v-else>
                        <span v-text="item.like" style="color:#dbb177"></span>
                        人想看
                    </p>
                    <p v-text="item.type"></p>
                    <p v-text="item.profile"></p>
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
        this.loadfilmlist();
    },
    methods:{
        loadfilmlist(){
            var url = "filmList";
            this.axios.get(url).then(res=>{
                this.lists = res.data;
                console.log(res.data);
            });
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
        top:55px;
        left:350px;
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