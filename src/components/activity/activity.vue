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
        <div>
            <mt-cell v-for="(item,index) of activityList" :key="index" class="activitylist">
                <router-link :to="item.url">
                    <img :src="item.img">
                    <p v-text="item.title"></p>
                    <div class="srcTxt">
                        <span v-text="Math.ceil(parseInt((new Date(item.endTime)-new Date())/(1000*60*60*24)))>7
                        ?' '+Math.ceil(parseInt((new Date(item.endTime)-new Date())/(1000*60*60*24)))+'天后结束'
                        :' 仅剩'+Math.ceil(parseInt((new Date(item.endTime)-new Date())/(1000*60*60*24)))+'天'" class="iconfont icon-time"></span>
                        <span v-text="' '+item.Pnumber+'人关注'" class="iconfont icon-yanjing"></span>
                    </div>
                </router-link>
            </mt-cell>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            //oddTime:Math.ceil(parseInt((new Date(item.endTime)-new Date())/(1000*60*60*24))),
            oddTime:6,
            activityList:[],
        }
    },
    created(){
        this.loadActivity();
    },
    methods:{
        loadActivity(){
            this.activityList = [
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/1.jpg",Pnumber:47206,endTime:"2019-10-31",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/2.jpg",Pnumber:47206,endTime:"2019-9-31",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/3.jpg",Pnumber:47206,endTime:"2019-11-31",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/4.jpg",Pnumber:47206,endTime:"2019-10-11",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/5.jpg",Pnumber:47206,endTime:"2019-10-07",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/6.jpg",Pnumber:47206,endTime:"2019-10-01",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/7.jpg",Pnumber:47206,endTime:"2019-11-01",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/8.jpg",Pnumber:47206,endTime:"2019-10-21",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
                {title:"周二会员日 四大福利集结等你",img:"http://127.0.0.1:8080/activity/1.jpg",Pnumber:47206,endTime:"2019-10-31",url:"https://act-routine-web-prd-mx.wandacinemas.com/static/?activityid=624"},
            ]
            console.log(Math.ceil(parseInt(new Date(this.activityList[0].endTime)-new Date()/(1000*60*60*24))));
            console.log(Math.ceil(parseInt((new Date(this.activityList[0].endTime)-new Date())/(1000*60*60*24))));
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
        z-index: 10;
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
    .activitylist>div{
        padding: 0;
    }
    .activitylist img{
        width: 100%;
    }
    .activitylist p{
        color: #000;
        padding: 10px 8px;
        font-size: 13px;
        margin: 0;
    }
    .srcTxt{
        display: flex;
        justify-content: space-between;
        padding:0 5px;
        margin-bottom: 10px;
    }
    .srcTxt span{
        font-size: 10px;
        color: #e2b87f;
    }
    .srcTxt .icon-yanjing{
        color: #b1b1c1;
    }
</style>