<template>
    <div>
        <mt-header class="Pheader" fixed>
            <mt-button slot="left" class="iconfont icon-zuo" @click="seat"></mt-button>
            <mt-button slot="left">选择城市</mt-button>
        </mt-header>
        <div class="Pheader">
            <span class="mintui mintui-search search"></span>
            <input type="text" class="text" placeholder="请输入城市名或拼音">
            <mt-button class="search-btn">搜索</mt-button>
        </div>
        <p>当前定位城市</p>
        <div class="beforeCity">
            <span v-text="beforeCity" @click="Before($event)"></span>
            <img src="./../../assets/icon/renovate.png">
        </div>
        <van-index-bar>
            <van-index-anchor v-for="(items,indexs) of cityList" :key="indexs" :index="items.idx">
                <span class="cityIndex">{{items.idx}}</span>
                <van-cell :title="item.name" v-for="(item,index) of cities[indexs]" :key="index" class="cityName" @click="isBefore(indexs,index)"/>
            </van-index-anchor>
            </van-index-bar>
        </div>
</template>
<script>
import { IndexBar, IndexAnchor,Cell } from 'vant';
export default {
    data(){
        return{
            value:"",
            cityList:[],
            cities:[],
            beforeCity:"北京"
        }
    },
    components:{
        [IndexBar.name]:IndexBar,
        [IndexAnchor.name]:IndexAnchor,
        [Cell.name]:Cell,
    },
    // props:['isPosition'],
    methods:{
        seat() {
            this.$emit('changePosition')
        },
        // isBefore(event){
        //     this.beforeCity = event.currentTarget.value;
        //     console.log(event.currentTarget);
        // },
        isBefore(indexs,index) {
            this.beforeCity = this.cities[indexs][index].name;
            this.$emit('city',this.beforeCity);
            this.$emit('changePosition');
            //console.log(this.cities[indexs][index].name);
        },
        Before(event){
            this.beforeCity = event.target.innerHTML;
            this.$emit('city',this.beforeCity);
            this.$emit('changePosition');
        },
        loadcitylist(){
            var url = "http://127.0.0.1:8080/citylist";
            this.axios.get(url).then(res=>{
                this.cityList = res.data.data;;
                for(var item of this.cityList){
                    var arr =JSON.parse(item.cities);
                    this.cities.push(arr);
                }
            })
        },
    },
    created() {
        this.loadcitylist();
    },
}
</script>
<style scoped>
    p{
        margin: 0;
    }
    .beforeCity{
        position: relative;
        height: 40px;
        line-height: 40px;
        font-size: 14px;
        background: #fff;
        border-top: 1px solid #eee;
        border-bottom: 1px solid #eee;
    }
    .beforeCity span{
        padding-left: 16px;
    }
    .beforeCity img{
        width: 15px;
        position: absolute;
        right: 10px;
        top: 10px;
        z-index: 10;
    }
    .cityName{
        border-bottom: 1px solid #eee;
    }
    .icon-zuo{
        margin-right: 20px;
    }
    .Pheader{
        background: #fff;
        color: #000;
        border-bottom: 1px solid #ddd;
        z-index: 100;
    }
    .Pheader+.Pheader{
        height: 40px;
        position: fixed;
        top:40px;
        width: 100%;
        z-index: 100;
    }
    .Pheader+p{
        margin-top: 40px;
    }
    .search{
        margin-left: 10px;
        color: #ccc;
    }
    .text{
        outline-style:none; 
        border: 0px;
        width: 78%;
        padding:5px; 
    }
    .search-btn{
        background: #dbb177;
        color: #fff;
        height:32px;
        margin: 3px 0;
        width: 50px;
        font-size: 12px;
    }
input::-webkit-input-placeholder,
textarea::-webkit-input-placeholder {
    color: #ccc;
    font-size:15px;
}
.cityIndex{
    padding-left:16px;
}
</style>
<style>
    span.van-index-bar__index{
        padding: 0 12px 4px 16px;
        color: #8a8a8a;
    }
    div.van-index-bar__sidebar{
        padding-top:90px;
    }
    div.van-index-anchor{
        padding:0;
    }
</style>