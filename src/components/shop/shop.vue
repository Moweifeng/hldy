<template>
    <div>
        <div class="shop-header">
            <span>广州欢乐影城万胜围店</span>
            <img src="../../img/icon/center_drop_icon.png" class="shop-icon">
        </div>
    <mt-swipe :auto="2000" class="shop-banner">
        <mt-swipe-item>
            <img src="../../img/5.jpg" class="banner-img">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../img/6.jpg" class="banner-img">
        </mt-swipe-item>
        <mt-swipe-item>
            <img src="../../img/7.jpg" class="banner-img">
        </mt-swipe-item>
    </mt-swipe>
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
        height: 200px;
    }
</style>