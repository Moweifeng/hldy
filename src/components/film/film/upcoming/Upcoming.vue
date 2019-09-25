<template>
    <div>
        <div class="upcoming">
        <p>人气榜单</p>
            <div class="rowfilmlist" ref="tab">
              <div>
                <div v-for="(item,index) of uplists" :key="index" class="rowfilm">
                  <span v-text="'预售'" class="rowfilmSpan"></span>
                  <span v-text="item.collect_count+' 人想看'"></span>
                  <img :src="'https://images.weserv.nl/?url='+item.images.medium" class="upcoming-img">
                  <p v-text="item.title"></p>
                  <div class="rowfilmContent">
                    <span v-text="item.mainland_pubdate.split('-')[1]+'月'+item.mainland_pubdate.split('-')[2]+'日'"></span>
                    <span class="iconfont icon-nolove" @click="islike($event)"></span>
                  </div>
                </div>
              </div>
            </div>
            <mt-cell v-for="(item,index) of uplists" :key="index" class="gettingCell">
            <img :src="'https://images.weserv.nl/?url='+item.images.medium" class="gettingImg" slot="icon">
            <div class="filmListText">
                <p v-text="item.title" class="filmListText-title"></p>
                <p v-if="item.rating.average>6.5">
                    评分
                    <span v-text="item.rating.average" style="color:#dbb177"></span>
                </p>
                <p v-else>
                    <span v-text="item.collect_count" style="color:#dbb177"></span>
                    人想看
                </p>
                <p v-text="item.genres"></p>
                <p v-text="item.original_title"></p>
                <div class="film-type-icon">
                <p :class="Math.random()<0.4?'icon-2d'
                    :Math.random()<0.8?'icon-3d':'icon-2d icon-3d'" class="iconfont"></p>
                <p :class="Math.random()<0.3?'icon-imax'
                    :Math.random<0.6?'icon-jumu'
                    :Math.random()<0.9?'ico-imax icon-jumu':''" class="iconfont"></p>
                </div>
                <mt-button class="getfilm" :disabled="Math.random()<0.2?disabled=true:disabled=false" v-text="disabled?'预售':'购票'" ></mt-button>
            </div>
        </mt-cell>

        </div>
    </div>
</template>
<script>
//import Vue from 'vue'
// import BScroll from 'better-scroll'
// Vue.prototype.BScroll = BScroll;
  export default {
    data() {
      return {
        uplists:[],
        islove:false,
      }
    },
    created() {
      this.loaduplist();
      this.$nextTick(() => {
        this._initScroll();
      });
    },
    methods:{
      islike(event){
        var $class = event.target.className;
        if($class=="iconfont icon-nolove"){
          event.target.className="iconfont icon-love";
          this.islove = true;
        }else{
          event.target.className="iconfont icon-nolove";
          this.islove = false;
        }
      },
      _initScroll() {
        var BScroll =this.BScroll;
        this.tab = new BScroll(this.$refs.tab,{
            click:true,
            scrollX:true,
            scrollY:false
        })
      },
      loaduplist(){
        var pno=0;
        this.pno++;
        var count = 10;
        var start = (pno-1)*count;
        var url = `https://api.douban.com/v2/movie/coming_soon?apikey=0df993c66c0c636e29ecbb5344252a4a&start=${start}&count=${count}`;
        console.log(url);
        var obj = {start:start,count:count};
        this.$jsonp(url).then(json => {
            // Success.
            this.uplists =json.subjects;
            console.log(this.uplists);
        }).catch(err => {
            // Failed.
            this.$toast({
                message:'加载失败',
                duration:5000
            })
        })
      },
    },
  }
</script>
<style scoped>
  .upcoming{
    background-color: #fff;
  }
  .upcoming>p{
    color:#000;
    font-size: 16px;
    padding:10px; 
    border-top:1px solid #e1e1e1;
  }
  .rowfilmlist{
    width: 100%;
    overflow: hidden;
    padding-bottom: 20px;
  }
  .rowfilmlist>div{
    display: flex;
    width: 300%;
  }
  .rowfilm{
    width: 80px;
    margin-left: 10px;
    position: relative;
  }
    .rowfilmSpan{
    position: absolute;
    background-color:rgba(255, 255, 255, 0.3);
    padding: 0 2px;
    font-size:11px;
    top: 0;
    left: 0;
  }
  .rowfilm>span+span{
    position: absolute;
    color:#fff;
    font-size:10px;
    top: 97px;
    width: 80px;
    padding-left: 3px;
    background: rgba(0,0,0,0.3);
    height: 15px;
    line-height: 15px;
  }
  .rowfilm>p{
    color: #000;
    font-size: 12px;
    margin: 0;
    padding-top: 2px;
    height: 20px;
  }
  .rowfilmContent{
    display: flex;
    justify-content: space-between;
    height: 20px;
    line-height: 17px;
  }
  .rowfilmContent>span{
    font-size: 11px;
    color: #c1c1c1;
    padding-right:3px;
  }
  .upcoming-img{
    width: 80px;
  }
  .iconfont.icon-love{
    color:#f00;
  }
      .gettingImg{
        width: 80px;
        margin: 20px 0;
    }
    div.filmListText{
        width: 150px;
        margin-left: 10px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        word-break: break-all;
    }
    .filmListText p{
        font-size:11px;
    }
    p.filmListText-title{
        font-size:14px;
        color:#000;
    }
    div.film-type-icon{
        display: flex;
        height: 20px;
    }
    p.iconfont{
        font-size:18px;
        margin-bottom:0; 
    }
    .getfilm{
        position: absolute;
        height: 30px;
        background: #dbb177;
        top:40%;
        right: 5%;
        font-size:11px;
        color:#fff;
        border-radius: 30px;
    }
    .getfilm:disabled{
        background: #8997c2;
    }
</style>