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
            <div class="setMealTitle">
                <p>卖品套餐</p>
                <p>查看全部 <span class="iconfont icon-right"></span></p>
            </div>
            <div class="setMealList">
                <div  v-for="item in 3">
                    <div class="setMeal">
                        <img src="./../../assets/shop/17.jpg">
                        <div>
                            <span>￥49</span>
                            <img src="./../../assets/icon/ic_add_to_cart.png">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
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
    .setMealTitle{
        display: flex;
        justify-content: space-between;
        padding:10px;
    }
    .setMealTitle p{
        font-size: 16px;
    }
    .setMealList{
        display: flex;
        padding: 0 5%;
        background: #fff;
    }
    .setMeal>img{
        width: 100%;
    }
    .setMeal{
        margin: 0 10%;
    }
    .setMeal>div{
        display: flex;
        justify-content: space-between;
    }
</style>