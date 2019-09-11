<template>
    <div>
            <div class="homeHeader">
                <div class="landmark" @click="seat">
                    <span>广州</span>
                    <img src="../../img/icon/center_drop_icon.png">
                </div>
                <div class="homeNav">
                    <div class="isSelected" @click="selected($event)" id="film">影片</div>
                    <div @click="selected($event)" id="cinema">影院</div>
                </div>
            </div>
        <div>
            <transition name="film">
            <film :carouselImgs="carouselImgs" v-if="isdisplay==true"></film>
            <cinema v-else :cinemalist="cinemalist"></cinema>
            </transition>
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
    props:['isPosition'],
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
        seat(){
            // if(this.isPosition==false){
            //     this.isPosition=true;
            // }else{
            //     this.isPosition=false;
            // }
            this.$emit('changePosition')
            // this.$router.push('/')
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
 .film-enter-active {
    transition: all .5s;
    transform: translateX(100%);
}
.d1-leave-active{
    transition: all .5s;
    transform: translateX(0%);
}
.film-enter{
    transform: translateX(100%);
}
.film-enter-to{
    transform: translateX(0%);
}
.film-leave{
    transform: translateX(100%);
}
.film-leave-to{
    transform: translateX(0%);
}
</style>