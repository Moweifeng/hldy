<template>
    <div>
        <router-link to="#">
            <mt-cell v-for="(item,index) of cinemalist" :key="index">
                <div class="cinematxt">
                    <p class="cinematitle"v-text="item.title" ></p>
                    <p class="cinemaCount" v-text="item.location"></p>
                </div>
                    <span v-text="item.distance" class="cinemaspan"></span>
            </mt-cell>
        </router-link>
    </div>
</template>
<script>
export default {
    data(){
        return {
        }
    },
    props:[
        "cinemalist"
    ],
}
</script>
<style>
    .cinematxt+span{
        position: absolute;
        top:20px;
        right: 10px;
    }
    .cinematxt p{
        margin:10px 0;
        font-size:12px;
    }
    p.cinematitle{
        color:#000;
        font-size:16px;
    }
</style>