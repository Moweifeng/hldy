<template>
    <div>
            <div class="homeHeader">
                <div class="landmark">
                    <span>广州</span>
                    <img src="../../img/icon/center_drop_icon.png">
                </div>
                <div class="homeNav">
                    <div class="isSelected" @click="selected($event)" id="film">影片</div>
                    <div @click="selected($event)" id="cinema">影院</div>
                </div>
            </div>
        <div>
            <film :carouselImgs="carouselImgs" v-if="isdisplay==true"></film>
            <cinema v-else :cinemalist="cinemalist"></cinema>
        </div>
    </div>
</template>
<script>
import Film from "./film/Film"
import Cinema from "./cinema/Cinema"
export default {
    data() {
        return {
            carouselImgs:[],
            cinemalist:[],
            isdisplay:true,
        }
    },
    components:{
        "film":Film,
        "cinema":Cinema,
    },
        created(){
        this.loadCarousel();
        this.loadCinema();
    },
    methods:{
        loadCarousel(){
            var url = "carousel";
            this.axios.get(url).then(res=>{
                this.carouselImgs = res.data;
            });
        },
        loadCinema(){
            var url = "cinemalist";
            this.axios.get(url).then(res=>{
                this.cinemalist = res.data;
            });
        },
        selected(e){
            var film = document.getElementById("film");
            var cinema = document.getElementById("cinema");
                e.target.className = "isSelected";
            if(e.target==film){
                cinema.className = "";
                this.isdisplay=true;
            }else{
                film.className ="";
                this.isdisplay=false;
            }
        },
    },
}
</script>
<style scoped>
     .homeHeader{
        display: fixed;
        font-size:14px;
        background: #fff;
        padding-bottom:10px; 
    }
 .landmark{
     margin-left:12px; 
     position: absolute;
     top:3px;
 }
 .homeNav{
     display: flex;
     justify-content: center;
 }
 .homeNav>div{
     width: 60px;
     height: 25px;
     color: #dbb177;
     line-height: 25px; 
     text-align: center;
     border:1px solid #dbb177;
 }
 .landmark img{
     width: 6px;
     margin-left:5px; 
    margin-bottom:3px; 
 }
 div.isSelected{
     background: #dbb177;
     color: #fff;
 }
 div.isdisplay{
     display:none;
 }
</style>