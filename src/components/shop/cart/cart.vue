<template>
    <div>
        <div class="header">
            <div>
            <span class="iconfont icon-zuo" @click="goto"></span>
            <span>购物车</span>
            </div>
            <div>
                <span>清空</span>
            </div>
        </div>
        <div>
            <div>
                
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            cartlists:[],
        }
    },
    methods:{
        goto(){
            this.$router.go(-1);
        },
    },
}
</script>
<style scoped>
    .header{
        background-color: #fff;
        border-bottom:1px solid #ddd;
        display: flex;
        justify-content: space-between;
        padding: 8px 12px; 
        font-size: 14px;
    }
    .header .icon-zuo{
        font-size: 12px;
        margin-right: 10px;
    }
</style>