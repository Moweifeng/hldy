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
    </div>
</template>
<script>
export default {
    data(){
        return{
            value:"",
        }
    },
    // props:['isPosition'],
    methods:{
        seat() {
            this.$emit('changePosition')
        },
    },
}
</script>
<style scoped>
    .icon-zuo{
        margin-right: 20px;
    }
    .Pheader{
        background: #fff;
        color: #000;
        border-bottom: 1px solid #ddd;
    }
    .Pheader+.Pheader{
        height: 40px;
    }
    .search{
        position: absolute;
        top:50px;
        left:7px;
        color: #ccc;
    }
    .text{
        outline-style:none; 
        border: 0px;
        width: 81%;
        margin-left: 20px;
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
</style>