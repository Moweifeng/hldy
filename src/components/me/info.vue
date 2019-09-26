<template>
    <div>
        <div class="head">
            <a class="iconfont icon-zuo headGo" @click="headGo"></a>
            <span>消息中心</span>
        </div>
        <mt-cell title="系统消息">
            <img src="../assets/icon/ic_msg_center_system.png" slot="icon">
            <span>暂无新的系统消息</span>
        </mt-cell>
        <mt-cell title="活动广播">
            <img src="../assets/icon/ic_msg_center_activity.png" slot="icon">
            <span>有新的活动广播</span>
        </mt-cell>
        <mt-cell title="用户通知">
            <img src="../assets/icon/ic_msg_center_user.png" slot="icon">
            <span>暂无新的用户通知</span>
        </mt-cell>
    </div>
</template>
<script>
export default {
    data(){
        return{

        }
    },
    methods:{
        headGo(){
            
        },
    }
}
</script>
<style scoped>
    .head{
        background: #fff;
        padding: 10px 0;
        font: 1.7rem sans-serif;
        border-bottom: 1px solid #ddd;
    }
    .head>a{
        color:#000;
        margin: 0 10px;
    }
</style>
<style>
    .mint-cell-text{
        position: relative;
        top:-9px;
        font-size:14px;
    }
    .mint-cell-value{
        position: relative;
        top:10px;
        left: -257px;
        font-size:12px;
        color:#d6d6d6;
    }
    .mint-cell-wrapper{
        border-bottom:1px solid #eee;
    }
</style>