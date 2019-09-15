<template>
    <div class="activity">
        <div class="activityHeader">活动</div>
        <div class="navTabs">
            <div class="navTab">
                <img src="../../assets/activity/activity-icon1.png" class="navImg">
            <span>拼手气</span>
            </div>
            <div class="navTab">
                <img src="../../assets/activity/activity-icon2.png" class="navImg">
            <span>拼实力</span>
            </div>
            <div class="navTab">
                <img src="../../assets/activity/activity-icon3.png" class="navImg">
            <span>影游互动</span>
            </div>
        </div>
        <mt-cell v-for="(item,index) of activityList" :key="index">
            <router-link :to="item.url">
                <img :src="item.img">
                <p v-text="item.title"></p>
                <div class="srcTxt">
                <span v-text="oddTime>7?oddTime+'天后结束':'仅剩'+oddTime+'天'" class="iconfont icon-time"></span>
                <span v-text="item.Pnumber+'人关注'" class="iconfont iocn-yanjing">123</span>
                </div>
            </router-link>
        </mt-cell>
    </div>
</template>
<script>
export default {
    data(){
        return{
            oddTime:Math.ceil(parseInt(new Date(item.endTime)-new Date()/(1000*60*60*24))),
            activityList:[
                {title:"周二会员日 四大福利集结等你",img:"../../assets/activity/activity/1.jpg",Pnumber:47206,endTime:"2020-3-31",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
            ],
        }
    },
}
</script>
<style>
.activity{
    background: #fff;
}
    .activityHeader{
        position: fixed;
        top:0;
        left:0;
        width: 100%;
        padding: 9px 20px;
         background: #fff;
        border-bottom: 1px solid #ddd;
    }
    .navTabs{
        display: flex;
        justify-content:space-around;
        padding:15px 0;
    }
    .navTab{
        width: 20%;
        text-align: center;
        font-size: 16px;
    }
</style>