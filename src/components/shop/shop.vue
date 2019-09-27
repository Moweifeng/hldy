<template>
    <div>
        <div class="shop-header">
            <span>广州欢乐影城万胜围店</span>
            <img src="../../assets/icon/center_drop_icon.png" class="shop-icon">
        </div>
    <mt-swipe :auto="3000" class="shop-banner">
        <mt-swipe-item>
            <img src="../../assets/shop/5.jpg" class="banner-img">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../assets/shop/6.jpg" class="banner-img">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../assets/shop/7.jpg" class="banner-img">
        </mt-swipe-item>
    </mt-swipe>
        <div class="setMeals">
            <div class="shopTitle">
                <span>卖品套餐</span>
                <p>查看全部 <span class="iconfont icon-right"></span></p>
            </div>
            <div class="setMealList">
                <div  v-for="item in 3">
                    <div class="setMeal">
                        <img src="./../../assets/shop/17.jpg">
                        <span>国庆套餐-A</span>
                        <div>
                            <span>￥49</span>
                            <img src="./../../assets/icon/ic_add_to_cart.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="shopUser">
            <div class="shopTitle">
                <span>会员卡</span>
                <router-link to="/Cart">
                <p>查看全部 <span class="iconfont icon-right"></span></p>
                </router-link>
            </div>
            <div class="shopUsercontent">
                <img src="../../assets/shop/userCard.png">
                <div>
                <h3>贵宾卡(全球通用)</h3>
                <h4><span>储值卡</span>￥300<span>起</span></h4>
                </div>
            </div>
        </div>
        <div class="integralShop">
            <div>
                <p>积分商城</p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
    p{
        margin: 0;
    }
    .shop-header{
        position: fixed;
        top: 0;
        background: #fff;
        padding: 10px 0;
        width: 100%;
        text-align: center;
        font-size: 16px;
    }
    .shop-icon{
        width:8px;
        margin: 3px 5px;
    }
    .shop-banner{
        height: 200px;
    }
    .banner-img{
        width: 100%;
        height: 100%;
    }
    .setMeals{
        background: #fff;
        margin-bottom: 20px;
        padding-bottom: 20px;
    }
    .shopTitle{
        display: flex;
        justify-content: space-between;
        padding:10px;
    }
    .shopTitle span{
        font-size: 18px;
        color:#8f8f94;
    }
    .setMealList{
        display: flex;
        padding: 0 5%;
    }
    .setMeal>img{
        width: 100%;
    }
    .setMeal{
        margin: 0 10%;
        text-align: center;
    }
    .setMeal>span{
        font-size: 13px;
    }
    .setMeal>div{
        display: flex;
        justify-content:space-between;
        height: 30px;
    }
    .setMeal>div span{
        height: 30px;
        line-height: 30px;
        color: #dbb177;
    }
    .setMeal>div img{
        width: 30px;
    }
    .shopUser{
        background: #fff;
        margin-bottom: 20px;
    }
    .shopUsercontent{
        padding: 10px;
        width: 60%;
    }
    .shopUsercontent>div{
        padding-left: 10px;
    }
    .shopUsercontent img{
        width: 100%;
    }
    .shopUsercontent h3{
        font-size: 20px;
    }
    .shopUsercontent h4{
        padding: 5px 0;
        color: #dbb177;
        padding: 25px 0 5px;
        font-size: 18px;
    }
    .shopUsercontent span{
        font-size: 14px;
        padding-right: 5px;
        color: #8f8f94;
        padding-left: 3px;
    }
    .integralShop{
        background: #fff;
        padding:3% 3% 0 3%;
    }
    .integralShop>div{
        background: url(../../assets/shop/integralShop.png) no-repeat;
        background-size: 100%;
        overflow: hidden;
        padding: 20px;
        height: 100px;
        text-align: center;
    }
    .integralShop p{
        font-size: 24px;
        color: #fff;
    }
</style>