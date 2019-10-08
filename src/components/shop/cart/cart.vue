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
        <div class="cartlist">
            <div class="cartlistImg">
                <img src="../../../assets/icon/ic_coupon_gift.png">
            </div>
            <div class="cartlistTxt">
                <h5>开学季套餐B</h5>
                <p>git 使用教训：在平时工作中，如果要提交代码，首先先pull一下，如果直接commit，然后push，基本上都会失败，我的错误更离谱，结果让同事的代码覆盖没了，幸好可以恢复。这件事对于我来说是一件好事，假如每天犯一次错误，一年差不多也就达到高级程序员了，哈哈</p>
                <img src="../../../assets/icon/sxp_icon.png">
                <span>￥69</span>
                <div class="cartBtn">
                    <img src="../../../assets/icon/btn_reduce.png">
                    <span>1</span>
                    <img src="../../../assets/icon/btn_add.png">
                </div>
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
        position: fixed;
        top: 0;
        width: 100%;
        background-color: #fff;
        border-bottom:1px solid #ddd;
        display: flex;
        justify-content: space-between;
        padding: 10px 12px; 
        font-size: 14px;
    }
    .header .icon-zuo{
        font-size: 12px;
        margin-right: 10px;
    }
    .cartlist{
        display: flex;
        background-color: #fff;
        padding-top:10px;
    }
    .cartlist .cartlistImg{
        height: 130px;
        line-height: 180px;
    }
    .cartlist img{
        width: 100px;

    }
    .cartlist h5{
        color: #000;
    }
    .cartlist p{
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        font-size: 10px;
        margin: 5px 0;
    }
    .cartlistTxt{
        padding: 0 10px;
        position: relative;
    }
    .cartlistTxt img{
        width: 40px;
    }
    .cartlistTxt span{
        display: block;
        color: #dbb177;
        padding: 5px 0;
    }
    .cartBtn{
        position: absolute;
        right: 10px;
        bottom: 21px;
    }
    .cartBtn span{
        display: inline-block;
        width: 30px;
        text-align: center;
        color: #000;
    }
    .cartBtn img{
        width: 28px;
        vertical-align: middle;
    }
</style>